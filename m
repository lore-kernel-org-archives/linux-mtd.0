Received: from mail14.messagelabs.com ([212.125.75.19])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAm7M-0007Iq-QG
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 04:44:10 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Mar 2005 09:45:08 -0000
Message-ID: <F38DEABE0E171746B133C1ABBD142D9703691AAF@radmail.Radstone.Local>
From: "Chris Elston" <chris.elston@radstone.co.uk>
To: <linux-mtd@lists.infradead.org>
Cc: dwmw2@redhat.com
Subject: [PATCH] RE: Autodetection problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph=20Siemsen=20wrote:

>With=20mostly=20default=20options=20to=20the=20kernel,=20the=20MTD=20auto=
detection=20logic=20
>performs=20two=20calls=20to=20do_cfi_probe()=20at=20offset=200x000000=20a=
nd=200x2000000,=20
>and=20then=20proclaims,=20erroneously:
>=20=20=20=20Found=201=20x32=20devices=20at=200x0=20in=2032-bit=20bank
>Attempts=20to=20use=20the=20flash=20in=20this=20state=20fail=20miserably=20=
(tons=20of=20block=20
>bitmap=20errors,=20cannot=20access=20beyond=2032MiB,=20etc).
>
>Though=20I'd=20mention=20this=20in=20case=20anyone=20encounters=20similar=
=20situation.=20
>I'm=20not=20sure=20if=20the=20autodetection=20code=20is=20meant=20to=20wo=
rk=20in=20my
situation...

I=20encountered=20exactly=20the=20same=20problem=20last=20Thursday,=20and=20=
I=20managed=20to
track=20it=20down=20to=20drivers/mtd/chips/gen_probe.c.

The=20code=20attempts=20to=20work=20out=20how=20many=20chips=20are=20inter=
leaved=20in=20the
bank.=20=20It=20does=20this=20by=20assuming=20that=20we=20have=20min_chips=
=20in=20the=20bank,=20and
working=20it's=20way=20up=20to=20max_chips=20(i.e.:=20assume=201=20chip=20=
and=20work=20upwards
stoping=20once=20the=20"cp->probe_chip"=20succeeds,=20or=20we=20reach=20ma=
x_chips).

In=20drivers/mtd/chips/cfi_probe.c,=20(function=20cfi_probe_chip)=20the=20=
CFI
query=20sequence=20is=20written=20to=20the=20flash=20to=20put=20the=20devi=
ce=20into=20'query'
mode.=20=20Then=20a=20call=20to=20qry_present=20is=20made=20to=20check=20i=
f=20the=20query=20sequence
has=20really=20appeared=20in=20Flash.=20=20This=20checks=20for=20the=20pre=
sence=20of=20'Q',=20'R',
and=20'Y'=20in=20the=20appropriate=20place=20in=20each=20interleaved=20ban=
k.=20So=20for=20a=201
chip=20bank=20it=20looks=20for=200x00000051=20('Q'),=202=20chip=20bank=200=
x00510051=20etc...

What's=20been=20happening=20for=20me=20(and=20I=20suspect=20Ralph=20too)=20=
is=20that,=20when=20the
code=20tests=20for=20a=20single-chip=20bank=20it=20looks=20for=200x0000005=
1=20-=20since=20only
one=20of=20the=202=20devices=20in=20my=20bank=20has=20been=20set=20into=20=
query=20mode,=20and=20the
other=20bank=20HAPPENS=20TO=20CONTAIN=200x0000=20AS=20IT'S=20DATA=20-=20th=
is=20test=20succeeds
and=20genprobe_new_chip=20thinks=20it's=20found=20a=201=20x32=20bank,=20an=
d=20never=20goes=20on
to=20test=20for=20a=202=20x16=20bank.

I've=20managed=20to=20fix=20it=20for=20me=20by=20reversing=20the=20directi=
on=20of=20the=20loop=20in
genprobe_new_chip=20-=20i.e.:=20assume=20the=20bank=20has=20max_chips=20an=
d=20work=20down.
I=20think=20this=20is=20the=20safer=20way=20to=20do=20it,=20but=20I'm=20no=
t=20sure,=20and=20I'd=20like
someone=20to=20look=20at=20this=20and=20confirm=20it=20for=20me.

Patch:
---=20drivers/mtd/chips/gen_probe.orig=20=20=20=202005-03-14=2009:28:55.58=
7881888
+0000
+++=20drivers/mtd/chips/gen_probe.c=20=20=20=20=20=20=202005-03-14=2009:29=
:05.474378912
+0000
@@=20-162,7=20+162,7=20@@
=20=20=20=20=20=20=20=20int=20max_chips=20=3D=20map_bankwidth(map);=20/*=20=
And=20minimum=201=20*/
=20=20=20=20=20=20=20=20int=20nr_chips,=20type;
=20
-=20=20=20=20=20=20=20for=20(nr_chips=20=3D=20min_chips;=20nr_chips=20<=3D=
=20max_chips;=20nr_chips=20<<=3D
1)=20{
+=20=20=20=20=20=20=20for=20(nr_chips=20=3D=20max_chips;=20nr_chips=20>=3D=
=20min_chips;=20nr_chips=20>>=3D
1)=20{
=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20if=20(!cfi_interleave_supp=
orted(nr_chips))
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20continue;

Ralph,=20let=20me=20know=20if=20this=20fixes=20your=20case.

Thanks,

Chris.



________________________________________________________________________
This=20e-mail=20has=20been=20scanned=20for=20all=20viruses=20by=20Star.=20=
The
service=20is=20powered=20by=20MessageLabs.=20For=20more=20information=20on=
=20a=20proactive
anti-virus=20service=20working=20around=20the=20clock,=20around=20the=20gl=
obe,=20visit:
http://www.star.net.uk
________________________________________________________________________
