Received: from smtpout4.mclink.it ([195.110.128.205])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFo6h-0002Rf-6y
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 14:24:01 +0000
Received: from smtpoutgw2.mclink.it (smtpoutgw2.mclink.it [77.43.30.42])
	by smtpout4.mclink.it (8.13.6/8.13.6) with ESMTP id p9HENrO6047082
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 16:23:53 +0200 (CEST)
	(envelope-from c.gianni@resi.it)
From: "c.gianni" <c.gianni@resi.it>
To: <linux-mtd@lists.infradead.org>
Subject: gpio nand help!
Date: Mon, 17 Oct 2011 16:22:43 +0200
Message-ID: <001601cc8cd8$3c8d4ea0$b5a7ebe0$@resi.it>
MIME-Version: 1.0
Content-Type: multipart/related;
	boundary="----=_NextPart_000_0017_01CC8CE9.001C6030"
Content-Language: it
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multipart message in MIME format.

------=_NextPart_000_0017_01CC8CE9.001C6030
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0018_01CC8CE9.001C6030"


------=_NextPart_001_0018_01CC8CE9.001C6030
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, I designed a custom board with Xilinx Virtex 5 FX130T (FPGA) on it, =
this
FPGA comes with a ppc440 processor. Now on this board I also have a =
Micron
DDR2 chip and a Micron NAND Flash chip (MT29F2G08ABAEA). I managed to =
get
linux (2.6.37) working on this board by running it on a ramdisk on the =
DDR2
chip.=20

Now I need to interface linux with the Micron NAND onboard. I=92m trying =
to
understand how, but I can=92t find documentation. I think that all I =
have to
do is to link the GPIO interface of the PPC440 to the NAND pins but I =
don=92t
know how, could you help me??

=20

=20

Carmine Giann=EC

Hardware Design Engineer

INNOVATION LAB


=20

RESI Informatica S.p.A.
S.S. Pontina Km 44,044=20
04011 Aprilia (LT) =96 Italy
Tel: +39 06.92710.275
Email:  <mailto:r.pizzo@resi.it> c.gianni@resi.it

Web:  <http://www.resi.it/> www.resi.it

=20

=20


------=_NextPart_001_0018_01CC8CE9.001C6030
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1"><meta name=3DGenerator content=3D"Microsoft Word =
14 (filtered medium)"><!--[if !mso]><style>v\:* =
{behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Testo fumetto Carattere";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-language:EN-US;}
span.StileMessaggioDiPostaElettronica17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.TestofumettoCarattere
	{mso-style-name:"Testo fumetto Carattere";
	mso-style-priority:99;
	mso-style-link:"Testo fumetto";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DIT link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US>Hi, I designed a custom board with Xilinx Virtex 5 FX130T =
(FPGA) on it, this FPGA comes with a ppc440 processor. Now on this board =
I also have a Micron DDR2 chip and a Micron NAND Flash chip =
(MT29F2G08ABAEA). I managed to get linux (2.6.37) working on this board =
by running it on a ramdisk on the DDR2 chip. <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Now I need to interface linux with =
the Micron NAND onboard. I&#8217;m trying to understand how, but I =
can&#8217;t find documentation. I think that all I have to do is to link =
the GPIO interface of the PPC440 to the NAND pins but I don&#8217;t know =
how, could you help me??<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif";color:#003366;=
mso-fareast-language:IT'>Carmine Giann=EC<o:p></o:p></span></b></p><p =
class=3DMsoNormal><i><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#984806;m=
so-fareast-language:IT'>Hardware Design =
Engineer<o:p></o:p></span></i></p><p class=3DMsoNormal><i><span =
style=3D'font-size:8.0pt;font-family:"Arial","sans-serif";color:maroon;ms=
o-fareast-language:IT'>INNOVATION LAB<o:p></o:p></span></i></p><p =
class=3DMsoNormal><span =
style=3D'color:silver;mso-fareast-language:IT'><br><img width=3D160 =
height=3D38 id=3D"Immagine_x0020_1" =
src=3D"cid:image001.gif@01CC8CE8.FFB253C0" alt=3D"Descrizione: =
cid:image001.gif@01C9DEE1.143AB750"><br><br></span><b><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#003366;m=
so-fareast-language:IT'>RESI Informatica S.p.A.</span></b><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#003366;m=
so-fareast-language:IT'><br>S.S. Pontina Km 44,044 <br>04011 Aprilia =
(LT) &#8211; Italy<br><b>Tel:</b></span><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#333333;m=
so-fareast-language:IT'> +39 06.92710.275<br></span><b><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#003366;m=
so-fareast-language:IT'>Email:</span></b><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#333333;m=
so-fareast-language:IT'> </span><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-lan=
guage:IT'><a href=3D"mailto:r.pizzo@resi.it"><span =
style=3D'color:blue'>c.gianni@resi.it</span></a><o:p></o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#003366;m=
so-fareast-language:IT'>Web:</span></b><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";color:#333333;m=
so-fareast-language:IT'> <a href=3D"http://www.resi.it/"><span =
style=3D'color:blue'>www.resi.it</span></a></span><span =
style=3D'font-size:9.0pt;font-family:"Arial","sans-serif";mso-fareast-lan=
guage:IT'><o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_001_0018_01CC8CE9.001C6030--

------=_NextPart_000_0017_01CC8CE9.001C6030
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01CC8CE8.FFB253C0>

R0lGODlhoAAmAPcAAL7o+JLB3+71+n3R8TiNxVTD7bXl97Ld8eH0/MXq+Xax16nh9v7+/+b2/LLY
7Mjg70CSx3Ku1pLY817G7UaVya7i9uz4/abM5T6Qxnmy2CB+vJnE4WGl0Z3T7GnK7/T5/KzU6i2H
wiic07rn97HX7LXV6drq9HXO8Ojy+PL6/vD2+7nX6/D6/ZnS7Pj9/h5+vWm64M/j8ZfZ80yZy8rs
+S6f1CKAvq/j9uXw99Xw+tTw+q3Q59Tm8p/I43y02Znb9Pn7/ZXC4Lfg8lqgz6Xf9VOczbLT6MDp
+G3L75na87jm95rI5DqOxWDH7YjV8obU8uDu9tDu+l2j0EiWyUqu24zW8jCIwvT7/i2e06vP553U
7GfJ7kit2+75/cPd7Y6+3p/d9IrW8oLT8aza7tLv+jSLxObx+CiEwOLv96HW7W6s1Y7X85/L5TeM
xJ3c9DKKw4K42tjx+2yr1GXI7rDS6KHJ4z2Pxoq83d3z+zCf1Geo0yCAvoe63IW524G32mW44EqY
ysff75bD4L/b7Pv8/lPC7Pb6/Cqe1FXE7Suf1R1+vZXZ8xt9vGe64HPN8EKTyNfo8/z9/vv9/lCb
zJTZ8/z+/73Z7HbO8Ov4/cXe7vP4/JfD4ff6/Rx9vbPk97zn+L7a7KPe9cvh8Pv+/9/t9v3+/9/0
+/L3+6He9cDb7YTT8dbn8yeEwMLp+Jfa9CuGwa7R58bf7kyv3IrV8uDt9qzi9vb8/mqq05zJ5Orz
+f3+/tvy+yqFwSSCv/r8/W/M78/k8en3/bXf8iqf1DmOxfn9/pzG4sjr+ZC/3k+azMzi8J3K5ev0
+dDk8dHl8tPm8t7s9dLl8pDY81623r7h8lifzlOdzafS6t3r9cDj85XR67fW6qfg9TKj1pXa8zqN
xaPK5KTL5C6Hwh59u8be7nnQ8ESUyJTF4vL4+0as2oi73E6w3KnQ6K/W67DW63DM7x5/vZXP6mPI
7qfN5anO5iec05TY8pTY85XY8s7u+tzu96Dd9Jba81zF7f///xp8vCH5BAAAAAAALAAAAACgACYA
AAj/AP0JHEiwoEAGETYIzDZGYJcEBiNKnDiQWSZQgzJq3MgxlQkGEUlxHElykCUoBoHEwFhyJKhU
AgZCM9ajh7EVFHNOVPCPER193Q4d8Pek0A2dSAtq4sPrn9OnUKNC9VHwgwJ4UrNmBRSJILMiWsM6
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

------=_NextPart_000_0017_01CC8CE9.001C6030--
