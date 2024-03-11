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
                tabArr: ["关于"],
                tabInd: this.$route.query.tab||0,
                about: `<a target="_blank" href="http://81.70.63.232/category/zi-wo-jie-shao.html" style="font-size: 1.2em; text-decoration: underline; color: blue;">站长简介</a>`
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
