Received: from mail14.messagelabs.com ([212.125.75.19])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGzQF-0004Rs-Mj
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 08:09:20 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2005 14:10:23 +0100
Message-ID: <F38DEABE0E171746B133C1ABBD142D9703691ADB@radmail.Radstone.Local>
From: "Chris Elston" <chris.elston@radstone.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: 256MB Flash and 512MB SDRAM - out of vmalloc space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've=20encountered=20a=20fairly=20fundamental=20problem=20with=20my=20Flas=
h=20mapping=20driver,
and=20I=20was=20hoping=20that=20someone=20could=20check=20my=20proposed=20=
solution=20for=20sanity:

Problem:

I=20have=20a=20board=20with=20512MB=20SDRAM=20and=20256MB=20of=20Flash.=20=
=20The=20SDRAM=20eats=20up=20a=20
big=20chunk=20of=20kernel=20virtual=20addresses=20and=20therefore=20mappin=
g=20the=20Flash=20with
ioremap=20fails=20because=20I've=20run=20out=20of=20contiguous=20virtual=20=
address=20space.=20
I=20can't=20reserve=20more=20space=20with=20a=20"vmem=3Dxxx"=20commandline=
=20because=20I'm=20on=20ppc
not=20x86.=20=20I=20don't=20really=20want=20to=20go=20down=20that=20route=20=
anyway,=20because=20my=20
company=20will=20eventually=20produce=20boards=20with=201GB=20SDRAM,=20whi=
ch=20will=20only=20make
things=20worse.

Solution:

My=20proposed=20solution=20is=20to=20use=20the=20read/write=20and=20copy_f=
rom/copy_to=20hooks=20in
the=20map_info=20struct=20to=20provide=20access=20to=20the=20device=20thro=
ugh=20a=20window.=20=20This
would=20obviously=20only=20apply=20to=20my=20board,=20but=20I'm=20thinking=
=20that=20as=20memory
sizes=20and=20Flash=20sizes=20increase=20this=20problem=20will=20become=20=
more=20common.=20=20Should
I=20implement=20this=20in=20the=20main=20MTD=20code?=20=20If=20so,=20has=20=
anyone=20any=20preferences
for=20how=20I=20do=20it?

Alternatively,=20I've=20completely=20missed=20the=20point=20and=20there's=20=
already=20a=20way=20to
do=20this,=20but=20I=20couldn't=20see=20anything=20in=20any=20of=20the=20o=
ther=20mapping=20drivers.

Thanks,

Chris.

PS:=20David,=20I've=20submitted=20a=20request=20to=20our=20IT=20dept=20for=
=20IMAP=20access=20to=20our
<spit>=20exchange=20server=20</spit>=20so=20I=20can=20use=20a=20less=20pro=
prietary=20mail=20client.

Chris=20Elston
Principal=20Software=20Engineer,=20Processor=20Group
Radstone=20Digital=20Processing
Tove=20Valley=20Business=20Park
Towcester
Northants
NN12=206PF
United=20Kingdom=20
Tel:=20=A0=A0=20=A0=A0=A0=A0=A0+44-(0)1327-359444
Fax:=20=A0=A0=20=A0=A0=A0=A0=A0+44-(0)1327-322817
Direct=20Line:=20+44-(0)1327-322876

mailto:chris.elston@radstone.com
http://www.radstone.com/=20


________________________________________________________________________
This=20e-mail=20has=20been=20scanned=20for=20all=20viruses=20by=20Star.=20=
The
service=20is=20powered=20by=20MessageLabs.=20For=20more=20information=20on=
=20a=20proactive
anti-virus=20service=20working=20around=20the=20clock,=20around=20the=20gl=
obe,=20visit:
http://www.star.net.uk
________________________________________________________________________
