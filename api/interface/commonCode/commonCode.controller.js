const models = require('../../model/commonCode/CommonCode');
const systemMessage = require('../../../config/systemMessage');

/** 코드 리스트 조회 */
exports.list = (req,res) => {
  return models.CommonCode.findAll({
    where : {

    }, order: [['groupId', 'ASC'], ['codeOrder', 'ASC']]
  }).then(codeList => {
    return res.json(codeList)
  }).catch( function(err) {
    console.log(err);
  });
}
exports.index = (req,res) => {
  const groupId = req.params.groupId || '';
  const codeOption = req.params.codeOption || '';

  return models.CommonCode.findAll({
    where: {
      groupId: groupId
    }  ,order: [['codeOrder', 'ASC']]
  }).then(commonCodes => {
    let codeList = [];

    if(codeOption == 'S'){
      code = {value:"",text:"선택"}
      codeList.push(code);
    }else if(codeOption == 'A'){
      code = {value:"",text:"전체"}
      codeList.push(code);
    }

    for(var i=0; i<commonCodes.length; i++){
      code = {
        value:commonCodes[i].codeName,
        text:commonCodes[i].codeValue
      }
      codeList.push(code);
    }

    return res.json(codeList)
  })
  .catch(function (err) {
      console.log(err);
      return res.status(500).json(err)
  });
};

/** 코드 업데이트 */
exports.update = (req,res) => {
  const codeName = req.params.codeName || '';
  const codeValue = req.body.codeValue || '';

  if(!codeName.length){
    return res.status(400).json({error:systemMessage.search.incorrectKey + "codeName" , req:codeName});
  }
  if(!codeValue.length){
    return res.status(400).json({error:systemMessage.search.incorrectKey + "codeValue" , req:codeValue});
  }

  return models.CommonCode.update({
      codeValue: codeValue
    },{
        where : { codeName: codeName }
    }).then( () => {
        return res.status(200).json("수정이 완료되었습니다.");
      }
    ).catch((err) => {
      console.log(err);
      return res.status(500).json(err)
    })

}
