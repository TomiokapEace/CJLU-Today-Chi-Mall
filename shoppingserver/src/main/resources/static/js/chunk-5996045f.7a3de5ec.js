(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-5996045f"],{"0fa5":function(t,s,a){"use strict";a.r(s);var o=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("div",{attrs:{id:"shop"}},[a("h2",[t._v("欢迎光临 "+t._s(t.shopName))]),a("div",{staticClass:"block"},[a("el-row",t._l(t.productList,(function(t){return a("el-col",{key:t.productId,attrs:{lg:6,md:8,sm:12,xs:24}},[a("Card",{attrs:{data:t}})],1)})),1)],1)])},e=[],n=a("b85c"),c=a("ae8d"),i={name:"Shop",components:{Card:c["a"]},data:function(){return{shopName:null,productList:[]}},methods:{getProducts:function(){var t=this;this.$http.get("/shop/list",{shopID:this.$route.params.id}).then((function(s){1e4===s.code?(t.productList=s.data,t.$http.get("shop/listshops").then((function(s){if(1e4===s.code){var a,o=Object(n["a"])(s.data);try{for(o.s();!(a=o.n()).done;){var e=a.value;e.shopID===t.$route.params.id&&(t.shopName=e.shopName)}}catch(c){o.e(c)}finally{o.f()}}}))):t.$message.error("获取店铺信息失败")}))}},created:function(){this.getProducts()}},d=i,r=(a("bd49"),a("2877")),u=Object(r["a"])(d,o,e,!1,null,"c89c0092",null);s["default"]=u.exports},ae8d:function(t,s,a){"use strict";var o=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("el-card",{staticClass:"card",attrs:{"body-style":{padding:"15px"}}},[a("img",{staticClass:"image",attrs:{src:t.goodsData.imgs&&0!==t.goodsData.imgs.length?t.goodsData.imgs[0].url:null,onerror:"this.src = '//iconfont.alicdn.com/s/210a299f-edad-4fc5-8396-9f743633f209_origin.svg'",alt:""},on:{click:function(s){return t.showDetail(t.goodsData.productId)}}}),a("div",{staticStyle:{padding:"14px","text-align":"left"}},[a("p",{staticStyle:{height:"30px"}},[t._v(t._s(t.goodsData.productName?t.goodsData.productName:"加载失败"))]),a("p",{staticClass:"description"},[t._v(t._s(t.goodsData.content))]),a("div",{staticClass:"bottom clearfix"},[a("span",{staticClass:"price"},[t._v("￥"+t._s(t.goodsData.skus&&0!==t.goodsData.skus.length?t.goodsData.skus[0].sellPrice:"加载失败"))]),a("el-button",{attrs:{type:"text"},on:{click:function(s){return t.showDetail(t.goodsData.goodsId)}}},[t._v("查看详情")])],1)])])},e=[],n={name:"Card",props:["data"],data:function(){return{goodsData:{}}},methods:{showDetail:function(){this.$router.push("/goods/"+this.goodsData.productId)}},mounted:function(){this.goodsData=this.data}},c=n,i=(a("cb1d"),a("2877")),d=Object(i["a"])(c,o,e,!1,null,"1d582f12",null);s["a"]=d.exports},bd49:function(t,s,a){"use strict";a("d6ef")},cb1d:function(t,s,a){"use strict";a("e650")},d6ef:function(t,s,a){},e650:function(t,s,a){}}]);
//# sourceMappingURL=chunk-5996045f.7a3de5ec.js.map