(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-7cad6a1d"],{"0c2f":function(r,e,t){"use strict";t("e27f")},a55b:function(r,e,t){"use strict";t.r(e);var s=function(){var r=this,e=r.$createElement,t=r._self._c||e;return t("div",{attrs:{id:"form"}},[t("h1",[r._v(" 欢 迎 登 录 ")]),t("br"),t("hr"),t("br"),t("br"),t("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:r.ruleForm,"status-icon":"",rules:r.rules,"label-width":"80px"}},[t("el-form-item",{attrs:{label:"用户名",prop:"username"}},[t("el-input",{attrs:{type:"text",autocomplete:"off"},model:{value:r.ruleForm.username,callback:function(e){r.$set(r.ruleForm,"username",e)},expression:"ruleForm.username"}})],1),t("br"),t("el-form-item",{attrs:{label:"密码",prop:"pass"}},[t("el-input",{attrs:{type:"password",autocomplete:"off"},model:{value:r.ruleForm.pass,callback:function(e){r.$set(r.ruleForm,"pass",e)},expression:"ruleForm.pass"}})],1),t("br"),t("el-form-item",{staticStyle:{float:"right"}},[t("el-button",{attrs:{type:"primary"},on:{click:function(e){return r.submitForm("ruleForm")}}},[r._v("登录")]),t("el-button",{on:{click:function(e){return r.resetForm("ruleForm")}}},[r._v("重置")])],1)],1)],1)},o=[],l={data:function(){var r=this,e=function(e,t,s){""===t?s(new Error("请输入用户名")):(""!==r.ruleForm.username&&r.$refs.ruleForm.validateField("username"),s())},t=function(e,t,s){""===t?s(new Error("请输入密码")):(""!==r.ruleForm.pass&&r.$refs.ruleForm.validateField("pass"),s())};return{ruleForm:{username:"",pass:""},rules:{username:[{validator:e,trigger:"blur"}],pass:[{validator:t,trigger:"blur"}]}}},methods:{submitForm:function(r){this.$refs[r].validate((function(r){if(!r)return console.log("error submit!!"),!1;alert("submit!")}))},resetForm:function(r){this.$refs[r].resetFields()}}},u=l,a=(t("0c2f"),t("2877")),n=Object(a["a"])(u,s,o,!1,null,"59bdb766",null);e["default"]=n.exports},e27f:function(r,e,t){}}]);
//# sourceMappingURL=chunk-7cad6a1d.bd9fdc39.js.map