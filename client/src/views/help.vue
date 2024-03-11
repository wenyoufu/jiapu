<template lang="pug">
    .mine.help
        .nav_tabs
            .tab(v-for="(it,ind) in tabArr" @click="toLink(ind)", :class="{active:tabInd==ind}")
                b {{it}}
        .wrap
            .mdview(v-if="tabInd==0" v-html="about")
            .mdview(v-if="tabInd==1" v-html="help")
            .mdview(v-if="tabInd==2" v-html="terms")




</template>

<script>

    import marked from 'marked';
    export default {
        components:{
        },
        data () {
            return {
                tabAr1: ["about"],
                tabArr: ["关于我"],
                tabInd: this.$route.query.tab||0,
                about: 
`温有福，生于1991年1月。拥有多年的丰富工作经验。
## 教育背景
- 北京交通大学
  - 计算机科学与技术（硕士） 

## 聚焦领域和能力项
- **专业聚焦**:
  - 数据库内核低成本及数据库中间件高可用的设计和研发
- **技能概述**:
  1. 容器化云原生及云化数据库经验（docker, k8s, vitess等）
  2. 扎实的计算机基础（数据结构、算法、网络、常用设计模式等）
  3. 上手学习、沟通协调能力

## 自我介绍
- 拥有丰富的数据库内核改造和数据库中间件方案设计及研发经验
- 熟悉常用数据库高可用和高性能架构设计
- 具备部署及云原生经验（docker, k8s）
- 精通c/c++, go语言编程；熟练掌握python脚本编程

## 个人技能
- 软著：《coraldb存算分离数据库》(2022)
- 荣誉：coraldb存算分离创新项目奖(2021), 海思破飞机奖(2019), 云通讯产品线总裁奖(2018)
- 教育：研究生优秀毕业论文奖(2017), 省数学竞赛三等奖(2013), CET6英语水平(2012)
- 学校荣誉：院级三好学生(2012)

## 工作经历
- **京东数据库研发部** (2021.01 - 至今)
  - 负责数据库中间件及内核高可用低成本设计及研发工作

- **华为海思balong解决方案软件开发部** (2017.05 - 2020.12)
  - 主要从事海思balong基带协议栈(lte-rrc、nr-rrc)的开发和代码重构

## 项目经历
- **数据库中间件高可用建设** (2021.08 - 至今)
  - 设计研发owner，负责云原生数据库中间件高可用方案的实现

- **数据库内核存储低成本建设** (2021.01 - 2021.08)
  - 参与核心设计研发，在主从存算分离架构下进行内核模块设计及研发

- **4G/5G通信协议栈RRC研发** (2017.05 - 2020.12)
  - 主导海思balong基带协议栈(lte-rrc、nr-rrc)的开发和代码重构工作

通过以上两段工作经历，我在云原生、数据库内核、数据库中间件、微服务框架、服务高可用高性能、网络通讯协议栈等领域积累了深刻的理解和应用能力。
http://81.70.63.232/category/zi-wo-jie-shao.html`,
            }
        },
        mounted(){
        },
        computed: {
        },
        created(){
            this.about = this.about.replace(/\n/g, '<br>');
        },
        methods:{
            toLink(ind){
                this.$router.push(this.tabAr1[ind])
                this.tabInd=ind
            },
            getData(){
                this.$get('cdn/document/about.md?' + Date.now()).then((res) =>{
                    if(res){
                        this.about = res?marked(res):null
                    }
                }).catch(err => {
                });
                this.$get('cdn/document/help.md?' + Date.now()).then((res) =>{
                    if(res){
                        this.help = res?marked(res):null
                    }
                }).catch(err => {
                });
                this.$get('cdn/document/terms.md?' + Date.now()).then((res) =>{
                    if(res){
                        this.terms = res?marked(res):null
                    }
                }).catch(err => {
                });
            },

        },
        watch: {

        },
        activated(){
            const Pas = this.$route.path
            if(Pas==='/about'){
                this.tabInd = 0
            }else if(Pas==='/terms'){
                this.tabInd = 2
            }else {
                this.tabInd = 1
            }
            this.getData()
        },
        deactivated(){

        }
    }
</script>
