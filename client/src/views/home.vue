<template lang="pug">
    .home
        .wrap
            //p 寻根问祖是很多人的心结，以前笔耕墨耘时代，家谱誊录仅存于相对殷实的大户人家，又因一些历史的原因，许多家族的家谱丢失损毁，只能靠邻里、亲友间的口口相传，这就导致查阅追溯困难重重。如今电子信息飞速发展，是否可以借助互联网完成这些信息的构建与共享呢？
            //p 不知大家是否有相似经历：参加亲友宴席时发现座中很多人面生，又或虽算相识却讶于其间错综复杂的血缘关系，许多村子同宗同源，你却不知和邻居到底是哪一辈的共同祖先。
            p
            //    | 寻遍全网，家谱类网站细细看了六七家，其中
            //    b.hover(onclick="window.open('https://familysearch.org')") familysearch
            //    | 尤其可算数据庞大且不可谓不专业，然而总感觉这些离我等普通人太远，没有家谱/人物数据共享更没有直观易用的家谱成员树编辑功能。于是趁着近来略有闲暇，抓紧做了这个自认为还算简单易用的家谱工具。
            //p 在这里，你可以轻松创建自己的家谱，也可以邀请同族兄弟姐妹一起在线编辑共同完善，甚至可以和旁系姻亲家谱建立直观的链接。只要你愿意，还可以在这里为你每一个家谱成员书写他们的故事。
            //p 我相信，每个人都有着独一无二的人生故事，
            //.poetry
            //    .li 千古兴亡多少事，
            //    .li 几人垂名青史间？
            //    .li 故今筹建家谱网，
            //    .li 只愿众声永流传。
            p 自古雲云，温氏族自长而远，岁月漫长，家族光彩熠熠。祖训之下，「克勤克俭、忠孝仁爱」，代代相传，日臻兴盛。

            p 温氏族家谱，载先辈名姓、事迹，凝聚世代智慧与家族精神。家谱中一字一名，身负着家族尊荣与责任，且寄托对后人的殷殷期望和美好祝愿。

            p 思家谱之馨香，可窥探温氏族的起源、兴衰沿革及家族子民之勤劳奋斗。冀每一位览者，得以感受温氏族团结互助、传统文化传承之伟力，坚定家族归属和骄傲情怀。

            p 固珍此家谱，传承家族优良风范，续写温氏族的辉煌篇章，俾我后代子孙继续德业有成，传承家族之灿烂光辉，共铸家族永恒传承！
            
            p                                                                                                 --温有福做续于北京 2024.3

        .ICP
            a.li(target="_blank" href="http://beian.miit.gov.cn/") 京ICP备2024051534号
            .li © 2024 家谱网

</template>

<script>

    import marked from 'marked';
    export default {
        components:{
        },
        data () {
            return {
                tabArr: ["关于我"],
                tabInd: this.$route.query.tab || 0,
                about: null,
            }
        },
        mounted(){

        },
        computed: {
        },
        created(){

        },
        methods:{

            getData(){
                this.$get('cdn/document/about.md').then((res) =>{
                    if(res){
                        this.about = res?marked(res):null
                    }
                }).catch(err => {
                });
                this.$get('cdn/document/help.md').then((res) =>{
                    if(res){
                        this.help = res?marked(res):null
                    }
                }).catch(err => {
                });
                this.$get('cdn/document/terms.md').then((res) =>{
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
            this.tabInd = this.$route.query.tab||1;
            this.getData()
        },
        deactivated(){

        }
    }
</script>
