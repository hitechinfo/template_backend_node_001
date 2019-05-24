const models = require('../../model/user/User');
const systemMessage = require('../../../config/systemMessage');
const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const commonUtil = require('../common/commonUtil');

const redis = require("redis");
const client    = redis.createClient({
    port      : 6379,
    host      : process.env.redishost,
    password  : process.env.redispassword
    }
  );
  
client.select(3);

exports.login = (req,res) => {
  const userId = req.body.userId || '';
  const userPassword = req.body.userPassword || '';

  if(!userId.length){
    return res.status(400).json({error:systemMessage.search.incorrectKey + "userId" , req:userId});
  }

  if(!userPassword.length){
    return res.status(400).json({error:systemMessage.search.incorrectKey + "userPassword" , req:userPassword});
  }

  return models.User.findOne({
            where: {
                userId: req.body.userId,
                userPassword: commonUtil.passwordEncrypt(req.body.userPassword)//req.body.userPassword
            }
        })
        .then((user, err) => {
            if (err) {
              return res.json({
                'error': err
              });
            }
            else if (!user){ // user 값이 잘못된 값이면 바로 401 에러 뱉음
              return res.status(401).json({error:systemMessage.login.invalidInfo});
            } else {

              let url = "http://localhost:3006/tokenF/create";

              const data = {
                "userId": user.userId,
                "userType": user.userType
              };

              return commonUtil.postResultFromRest(url, data, function(err, result, status){
                if(!err && (status == "ok")){
                  res.set("newtoken", result);
                  res.set("userid", user.userId);
                  res.set("usertype", user.userType);
                  return res.status(200).json("토큰발급 성공");
                }else{
                  if(err){
                    return res.status(500).json(err);
                  }else{
                    return res.status(500).json(result);
                  }
                }
              });
            }
        });
};

// refresh 토큰 발급
exports.refresh = (req, res, next) => {
    let token = req.headers['x-access-token'];
    if (!token || token == "null") {
      return res.status(999).json({error:systemMessage.token.tokenRequired});
    }else {
        jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
          return models.User.findOne({
                where: {
                    userId: decoded.userId
                }
          })
          .then((user, err) => {
            if (err) {
                return res.json({
                  'error': err
                });
              } else {

                let url = "http://localhost:3006/tokenF/refresh";

                const data = {
                  "userId": user.userId,
                  "userType": user.userType,
                  "token": token
                };

                return commonUtil.postRefreshToken(url, data, function(err, result, status){
                  if(!err && (status == "ok")){
                    res.set("newtoken", result);
                    res.set("userid", user.userId);
                    res.set("usertype", user.userType);
                    next();
                  }else{
                    if(err){
                      return res.status(500).json(err);
                    }else{
                      return res.status(500).json(result);
                    }
                  }
                });
              }
          });
      });
    }
};

// logout 시 토큰 삭제
exports.delete = (req,res) => {
  return models.User.findOne({
      where: {
          userId: req.body.userId
      }
  })
  .then((user, err) => {
      if (err) {
        return res.json({'error': err});
      } else {
        
        let url = "http://localhost:3006/tokenF/delete";
        const data = {
          "userId": user.userId,
          "userType": user.userType
        };

        return commonUtil.postResultFromRest(url, data, function(err, result, status){
          if(!err && (status == "ok")){
            return res.status(200).json("토큰삭제 성공");
          }else{
            if(err){
              return res.status(500).json(err);
            }else{
              return res.status(500).json(result);
            }
          }
        });
      }
  });
};




