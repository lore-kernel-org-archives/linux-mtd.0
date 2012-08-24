Received: from analyzer4.backbonesystems.ca ([74.221.130.53]
 helo=bbanalyzer4.backbone.local)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4zo4-0007ql-SX
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 19:44:37 +0000
Received: from bbanalyzer4.backbone.local (127.0.0.1) id h6vcq80171sd for
 <linux-mtd@lists.infradead.org>;
 Fri, 24 Aug 2012 12:39:07 -0700 (envelope-from <dclark@tantalus.com>)
From: David Clark <dclark@tantalus.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 24 Aug 2012 12:39:06 -0700
Subject: FW: UBIFS tools and latest 2.6.33 kernel from
 http://git.infradead.org/users/dedekind/ubifs-v2.6.33.git
Message-ID: <886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8@BBMBX.backbone.local>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8BBMBXbackbone_"
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_000_886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8BBMBXbackbone_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Artem,



Thanks for the help on upgrading out linux 2.6.33 kernel with the latest UB=
IFS updates.  I managed to merge the UBI/UBIFS specific code from the link =
you gave me (I took the latest and greatest) and I have a kernel that now c=
ompiles successfully.  Now we get the following error when the UBIFS file s=
ystem is mounted:



UBI: attaching mtd18 to ubi0

UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit

ubiattach: error!: cannot attach mtd18

           error 22 (Invalid argument)

UBIFS error (pid 916): ubifs_get_sb: cannot open "ubi0:tntvar", error -19

mount: mounting ubi0:tntvar on /usr/local/tntvar failed: No such device



We are suspecting now that this may be because we need to update the ubifs =
tools (or create the ubifs with different cmd args) so that they are in syn=
c with the latest kernel.  If you have any ideas on this it would be great =
- right now I will be researching if our hypothesis is true and how to reso=
lve it.



Thanks Dave


--_000_886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8BBMBXbackbone_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:Consolas;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoPlainText>Artem,<o:p></=
o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainTex=
t>Thanks for the help on upgrading out linux 2.6.33 kernel with the latest =
UBIFS updates.&nbsp; I managed to merge the UBI/UBIFS specific code from th=
e link you gave me (I took the latest and greatest) and I have a kernel tha=
t now compiles successfully.&nbsp; Now we get the following error when the =
UBIFS file system is mounted:<o:p></o:p></p><p class=3DMsoPlainText><o:p>&n=
bsp;</o:p></p><p class=3DMsoPlainText>UBI: attaching mtd18 to ubi0<o:p></o:=
p></p><p class=3DMsoPlainText>UBI error: io_init: bad write buffer size 0 f=
or 1 min. I/O unit<o:p></o:p></p><p class=3DMsoPlainText>ubiattach: error!:=
 cannot attach mtd18<o:p></o:p></p><p class=3DMsoPlainText>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error 22 (Invalid argument)<o:=
p></o:p></p><p class=3DMsoPlainText>UBIFS error (pid 916): ubifs_get_sb: ca=
nnot open &quot;ubi0:tntvar&quot;, error -19<o:p></o:p></p><p class=3DMsoPl=
ainText>mount: mounting ubi0:tntvar on /usr/local/tntvar failed: No such de=
vice<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3D=
MsoPlainText>We are suspecting now that this may be because we need to upda=
te the ubifs tools (or create the ubifs with different cmd args) so that th=
ey are in sync with the latest kernel.&nbsp; If you have any ideas on this =
it would be great - right now I will be researching if our hypothesis is tr=
ue and how to resolve it.<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;=
</o:p></p><p class=3DMsoPlainText>Thanks Dave<o:p></o:p></p><p class=3DMsoN=
ormal><o:p>&nbsp;</o:p></p></div></body></html>=

--_000_886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8BBMBXbackbone_--
