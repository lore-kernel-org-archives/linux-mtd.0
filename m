Received: from mx5.zte.com.cn ([63.217.80.70] helo=zte.com.cn)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6yDn-0006Ys-UF
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:31:53 +0000
From: "Wang Haitao" <wang.haitao1@zte.com.cn>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH]mtd: map: fixed bug in 64-bit systems
Date: Wed, 7 Aug 2013 15:34:20 +0800
Message-ID: <001f01ce9340$8880b750$998225f0$@haitao1@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="utf-8"
Content-Language: zh-cn
Cc: artem.bityutskiy@linux.intel.com, dwmw2@infradead.org,
 wang.haitao1@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hardware=EF=BC=9A
=20=20=20=20=20=20=20=20=20CPU=EF=BC=9AXLP832,the=2064-bit=20OS
=20=20=20=20=20=20=20=20=20NOR=20Flash:S29GL128S=20128M
Software:
=20=20=20=20=20=20=20=20=20Kernel:2.6.32.41
=20=20=20=20=20=20=20=20=20Filesystem:JFFS2

When=20writing=20files,=20errors=20appear:
=20=20=20=20=20=20=20=20=20Write=20len=20182=20=20but=20return=20retlen=20=
180=20
=20=20=20=20=20=20=20=20=20Write=20of=20182=20bytes=20at=200x072c815c=20f=
ailed.=20returned=20-5,=20retlen=20180
=20=20=20=20=20=20=20=20=20Write=20len=20186=20=20but=20return=20retlen=20=
184=20
=20=20=20=20=20=20=20=20=20Write=20of=20186=20bytes=20at=200x072caff4=20f=
ailed.=20returned=20-5,=20retlen=20184=20
These=20errors=20exist=20only=20in=2064-bit=20systems,not=20in=2032-bit=20=
systems.=20After=20analysis,=20we=20found=20that=20the=20left=20shift=20o=
peration=20is=20wrong=20in=20map_word_load_partial.=20For=20instance=EF=BC=
=9A
=20=20=20=20=20=20=20=20=20unsigned=20char=20buf[3]=20=3D{0x9e,0x3a,0xea}=
;
=20=20=20=20=20=20=20=20=20map_bankwidth(map)=20is=204;

=20=20=20=20=20=20=20=20=20for=20(i=3D0;=20i=20<=203;=20i++)=20{
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20int=20bitpos;
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20bitpos=20=3D=20(=
map_bankwidth(map)-1-i)*8;
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20orig.x[0]=20&=3D=
=20~(0xff=20<<=20bitpos);
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20orig.x[0]=20|=3D=
=20buf[i]=20<<=20bitpos;
=20=20=20=20=20=20=20=20=20}

The=20value=20of=20orig.x[0]=20is=20expected=20to=20be=200x9e3aeaff,=20bu=
t=20in=20this=20situation(64-bit=20System)=20we'll=20get=20the=20wrong=20=
value=20of=200xffffffff9e3aeaff=20due=20to=20the=2064-bit=20sign=20extens=
ion:=20
buf[i]=20is=20defined=20as=20"unsigned=20char"=20and=20the=20left-shift=20=
operation=20will=20convert=20it=20to=20the=20type=20of=20"signed=20int",=20=
so=20when=20left-shift=20buf[i]=20by=2024=20bits,=20the=20final=20result=20=
will=20get=20the=20wrong=20value:=200xffffffff9e3aeaff.

If=20the=20left-shift=20bits=20are=20less=20than=2024,=20then=20sign=20ex=
tension=20will=20not=20occur.=20Whereas=20the=20bankwidth=20of=20the=20no=
r=20flash=20we=20used=20is=204,=20therefore=20this=20BUG=20emerges.

Signed-off-by:Pang=20Xunlei=20<pang.xunlei@zte.com.cn>
Signed-off-by:=20Zhang=20Yi=20<zhang.yi20@zte.com.cn>
Signed-off-by:Lu=20Zhongjun=20<lu.zhongjun@zte.com.cn>
Reviewed-by:=20Jiang=20Biao=20<jiang.biao2@zte.com.cn>
Tested-by:=20Ma=20Chenggong=20<ma.chenggong@zte.com.cn>

diff=20--git=20a/include/linux/mtd/map.h=20b/include/linux/mtd/map.h
index=20aa30244..18ee717
---=20a/include/linux/mtd/map.h
+++=20b/include/linux/mtd/map.h
@@=20-342,7=20+342,7=20@@=20static=20inline=20map_word=20map_word_load_pa=
rtial(struct=20map_info=20*map,=20map_word=20orig
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20bitpos=20=3D=20(map_bankwidth(map)-1-i)*8;=20=20#endif
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20orig.x[0]=20&=3D=20~(0xff=20<<=20bitpos);
-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20orig.x[0]=20|=3D=20buf[i-start]=20<<=20bitpos;
+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20orig.x[0]=20|=3D=20(unsigned=20long)buf[i-start]=20<<=20bitpos;
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20}
=20=20=20=20=20=20=20}
=20=20=20=20=20=20=20return=20orig;
@@=20-361,7=20+361,7=20@@=20static=20inline=20map_word=20map_word_ff(stru=
ct=20map_info=20*map)

=20=20=20=20=20=20=20=20if=20(map_bankwidth(map)=20<=20MAP_FF_LIMIT)=20{
=

=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20int=20bw=20=3D=20=
8=20*=20map_bankwidth(map);
-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20r.x[0]=20=3D=20(1=20<=
<=20bw)=20-=201;
+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20r.x[0]=20=3D=20(1UL=20<<=
=20bw)=20-=201;
=20=20=20=20=20=20=20}=20else=20{
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20for=20(i=3D0;=20i<map_=
words(map);=20i++)
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20r.x[i]=20=3D=20~0UL;


--------------------------------------------------------
ZTE=20Information=20Security=20Notice:=20The=20information=20contained=20=
in=20this=20mail=20(and=20any=20attachment=20transmitted=20herewith)=20is=
=20privileged=20and=20confidential=20and=20is=20intended=20for=20the=20ex=
clusive=20use=20of=20the=20addressee(s).=20=20If=20you=20are=20not=20an=20=
intended=20recipient,=20any=20disclosure,=20reproduction,=20distribution=20=
or=20other=20dissemination=20or=20use=20of=20the=20information=20containe=
d=20is=20strictly=20prohibited.=20=20If=20you=20have=20received=20this=20=
mail=20in=20error,=20please=20delete=20it=20and=20notify=20us=20immediate=
ly.
