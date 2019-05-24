const models = require('../../model/recruitNotice/RecruitNotice');
const querySequelize = require('../../model/models.js');
const systemMessage = require('../../../config/systemMessage');
const commonUtil = require('../common/commonUtil');

exports.index = (req,res) => {
  return models.RecruitNotice.findAll()
  .then(recruitNotices => res.json(recruitNotices))
  .catch(function (err) {
      console.log(err);
      return res.status(500).json(err);
  });
};

exports.show = (req,res) => {
  const serialNumber = req.params.serialNumber || '';

  if(!serialNumber.length){
    return res.status(400).json({error:systemMessage.search.incorrectKey + "serialNumber" , req:serialNumber});
  }


  return models.RecruitNotice.findOne({
    where: {
      serialNumber: serialNumber
    }
  }).then(recruitNotice => {
      if (!recruitNotice){
        return res.status(404).json({error:systemMessage.search.targetMissing});
      }
      return res.json(recruitNotice);
    }).catch(function (err) {
        console.log(err);
        return res.status(500).json(err);
    });
};