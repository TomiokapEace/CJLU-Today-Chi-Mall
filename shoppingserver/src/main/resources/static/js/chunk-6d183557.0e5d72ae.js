(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-6d183557"],{"07be":function(e,t,s){"use strict";s.r(t);var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{attrs:{id:"seller"}},[s("el-tabs",{attrs:{type:"card"},model:{value:e.activeName,callback:function(t){e.activeName=t},expression:"activeName"}},[s("el-tab-pane",{attrs:{label:"店铺审核",name:"first"}},[s("el-table",{staticStyle:{width:"100%","font-size":"16px","border-radius":"10px","box-shadow":"0 2px 12px 0 rgba(0, 0, 0, 0.3)"},attrs:{data:e.checkingShops,border:"",stripe:"","empty-text":"暂无数据"}},[s("el-table-column",{attrs:{label:"店铺名称",prop:"shopName",width:"200"}}),s("el-table-column",{attrs:{label:"店主姓名",prop:"shopKeeperName",width:"200"}}),s("el-table-column",{attrs:{label:"店铺描述",prop:"shopDescription"}}),s("el-table-column",{attrs:{label:"操作",width:"200",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("el-button",{attrs:{type:"success",round:""},on:{click:function(s){return e.pass(t.row.shopID)}}},[e._v("通过")]),s("el-button",{attrs:{type:"danger",round:""},on:{click:function(s){return e.reject(t.row.shopID)}}},[e._v("拒绝")])]}}])})],1)],1),s("el-tab-pane",{attrs:{label:"店铺管理",name:"second"}},[s("el-table",{staticStyle:{width:"100%","font-size":"16px","border-radius":"10px","box-shadow":"0 2px 12px 0 rgba(0, 0, 0, 0.3)"},attrs:{data:e.passedShops,border:"",stripe:"","empty-text":"暂无数据"}},[s("el-table-column",{attrs:{label:"店铺名称",prop:"shopName",width:"200"}}),s("el-table-column",{attrs:{label:"店主姓名",prop:"shopKeeperName",width:"200"}}),s("el-table-column",{attrs:{label:"店铺描述",prop:"shopDescription"}}),s("el-table-column",{attrs:{label:"操作",width:"200",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("el-button",{attrs:{type:"danger",round:""},on:{click:function(s){return e.reject(t.row.shopID)}}},[e._v("删除")])]}}])})],1)],1)],1)],1)},o=[],r={name:"SystemSeller",data:function(){return{activeName:"first",checkingShops:[],passedShops:[]}},methods:{pass:function(e){var t=this;this.$http.post("/shop/pass?ID="+e).then((function(e){1e4===e.code?(t.getShops(),t.$message.success("操作成功！")):t.$message.error(e.msg)}))},reject:function(e){var t=this;16==e?this.$message.error("管理员店铺，无法删除"):this.$http.post("/shop/delete?shopID="+e).then((function(e){1e4===e.code?(t.getShops(),t.$message.success("操作成功！")):t.$message.error(e.msg)}))},getShops:function(){var e=this;this.$http.get("/shop/listcheckingshops").then((function(t){1e4===t.code?(e.checkingShops=t.data,e.$http.get("/shop/listshops").then((function(t){1e4===t.code?e.passedShops=t.data:e.$message.error(t.msg)}))):e.$message.error(t.msg)}))}},created:function(){this.getShops()}},n=r,l=(s("91f1"),s("2877")),c=Object(l["a"])(n,a,o,!1,null,null,null);t["default"]=c.exports},"91f1":function(e,t,s){"use strict";s("9c3d")},"9c3d":function(e,t,s){}}]);
//# sourceMappingURL=chunk-6d183557.0e5d72ae.js.map