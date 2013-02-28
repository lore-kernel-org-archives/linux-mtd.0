Received: from mx.mcc-med.de ([213.148.153.242])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB2sA-00075n-SZ
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 12:46:08 +0000
From: "Velykokhatko, Sergey" <Sergey.Velykokhatko@mcc-med.de>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Date: Thu, 28 Feb 2013 13:30:45 +0100
Subject: Bug in mtd_get_device_size()?
Message-ID: <BAF0C2081321BA469F9ADF648F97D9B04C78FA6069@MCC023.weinmann.com>
Content-Language: de-DE
Content-Type: multipart/mixed;
 boundary="_004_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_"
MIME-Version: 1.0
Cc: "'artem.bityutskiy@linux.intel.com'" <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_004_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_
Content-Type: multipart/alternative;
	boundary="_000_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_"

--_000_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,



I got today such case:

      * Kernel 3.8

      * We are using M29F2G16 NAND chip with 4096 blocks, each has 128k

      * Configured with CONFIG_MTD_UBI_BEB_LIMIT=3D100

      * Our rootfs partition contains 640 EBs

      * At system start comes following error message:



Feb 28 09:23:09 (none) kern.notice kernel: [    0.375000] Creating 6 MTD pa=
rtitions on "atmel_nand":

Feb 28 09:23:09 (none) kern.notice kernel: [    0.375000] 0x000000000000-0x=
000000020000 : "obsolete_bootstrap"

Feb 28 09:23:09 (none) kern.notice kernel: [    0.381000] 0x000000020000-0x=
000000320000 : "kernel_a"

Feb 28 09:23:09 (none) kern.notice kernel: [    0.386000] 0x000000320000-0x=
000000620000 : "kernel_b"

Feb 28 09:23:09 (none) kern.notice kernel: [    0.392000] 0x000000620000-0x=
000005620000 : "rootfs_a"

Feb 28 09:23:09 (none) kern.notice kernel: [    0.399000] 0x000005620000-0x=
00000a620000 : "rootfs_b"

Feb 28 09:23:09 (none) kern.notice kernel: [    0.406000] 0x00000a620000-0x=
000020000000 : "config_data"

...



Feb 28 09:23:10 (none) kern.info kernel: [    0.546000] NET: Registered pro=
tocol family 17

Feb 28 09:23:10 (none) kern.notice kernel: [    0.557000] UBI: attaching mt=
d3 to ubi0

Feb 28 09:23:10 (none) kern.info kernel: [    0.748000] usb 1-2: new high-s=
peed USB device number 2 using atmel-ehci

Feb 28 09:23:10 (none) kern.notice kernel: [    0.810000] UBI: scanning is =
finished

Feb 28 09:23:10 (none) kern.warn kernel: [    0.821000] UBI warning: print_=
rsvd_warning: cannot reserve enough PEBs for bad PEB handling, reserved 115=
, need 400

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: attached mtd=
3 (name "rootfs_a", size 80 MiB) to ubi0

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: PEB size: 13=
1072 bytes (128 KiB), LEB size: 129024 bytes

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: min./max. I/=
O unit sizes: 2048/2048, sub-page size 512

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: VID header o=
ffset: 512 (aligned 512), data offset: 2048

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: good PEBs: 6=
40, bad PEBs: 0, corrupted PEBs: 0

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: user volume:=
 1, internal volumes: 1, max. volumes count: 128

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: max/mean era=
se counter: 399/202, WL threshold: 4096, image sequence number: 548304255

Feb 28 09:23:10 (none) kern.notice kernel: [    0.826000] UBI: available PE=
Bs: 0, total reserved PEBs: 640, PEBs reserved for bad PEB handling: 115

Feb 28 09:23:10 (none) kern.notice kernel: [    0.827000] UBI: background t=
hread "ubi_bgt0d" started, PID 288





UBI wanted to reserve 400 blocks on MTD with 640. Hm... During debugging I =
found that mtd_get_device_size() gives the size of whole flash memory back =
(4096 blocks * 128kB). I guess that I found small error. With micro patch t=
he problem seems to be corrected for my case





Thanks a lot,

Best regards

Sergey



--_000_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_
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
	{margin:0cm;
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
	mso-style-link:"Nur Text Zchn";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:Consolas;}
span.E-MailFormatvorlage17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.NurTextZchn
	{mso-style-name:"Nur Text Zchn";
	mso-style-priority:99;
	mso-style-link:"Nur Text";
	font-family:Consolas;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DDE link=3Dblue vlink=
=3Dpurple><div class=3DWordSection1><p class=3DMsoPlainText><span lang=3DEN=
-US>Hi guys,<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-U=
S><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>I =
got today such case:<o:p></o:p></span></p><p class=3DMsoPlainText><span lan=
g=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Kernel 3.8<o:p></o:p></span></p>=
<p class=3DMsoPlainText><span lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
 We are using M29F2G16 NAND chip with 4096 blocks, each has 128k <o:p></o:p=
></span></p><p class=3DMsoPlainText><span lang=3DEN-US>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * Configured with CONFIG_MTD_UBI_BEB_LIMIT=3D100<o:p></o:p></spa=
n></p><p class=3DMsoPlainText><span lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; * Our rootfs partition contains 640 EBs<o:p></o:p></span></p><p class=
=3DMsoPlainText><span lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * At syst=
em start comes following error message:<o:p></o:p></span></p><p class=3DMso=
PlainText><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlai=
nText><span lang=3DEN-US>Feb 28 09:23:09 (none) kern.notice kernel: [&nbsp;=
&nbsp;&nbsp; 0.375000] Creating 6 MTD partitions on &quot;atmel_nand&quot;:=
 <o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09=
:23:09 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.375000] 0x000000000=
000-0x000000020000 : &quot;obsolete_bootstrap&quot;<o:p></o:p></span></p><p=
 class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:09 (none) kern.notice=
 kernel: [&nbsp;&nbsp;&nbsp; 0.381000] 0x000000020000-0x000000320000 : &quo=
t;kernel_a&quot;<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3D=
EN-US>Feb 28 09:23:09 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.3860=
00] 0x000000320000-0x000000620000 : &quot;kernel_b&quot;<o:p></o:p></span><=
/p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:09 (none) kern.n=
otice kernel: [&nbsp;&nbsp;&nbsp; 0.392000] 0x000000620000-0x000005620000 :=
 &quot;rootfs_a&quot;<o:p></o:p></span></p><p class=3DMsoPlainText><span la=
ng=3DEN-US>Feb 28 09:23:09 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0=
.399000] 0x000005620000-0x00000a620000 : &quot;rootfs_b&quot;<o:p></o:p></s=
pan></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:09 (none) k=
ern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.406000] 0x00000a620000-0x000020000=
000 : &quot;config_data&quot;<o:p></o:p></span></p><p class=3DMsoPlainText>=
<span lang=3DEN-US>...<o:p></o:p></span></p><p class=3DMsoPlainText><span l=
ang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlainText><span lang=
=3DEN-US>Feb 28 09:23:10 (none) kern.info kernel: [&nbsp;&nbsp;&nbsp; 0.546=
000] NET: Registered protocol family 17<o:p></o:p></span></p><p class=3DMso=
PlainText><span lang=3DEN-US>Feb 28 09:23:10 (none) kern.notice kernel: [&n=
bsp;&nbsp;&nbsp; 0.557000] UBI: attaching mtd3 to ubi0<o:p></o:p></span></p=
><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:10 (none) kern.inf=
o kernel: [&nbsp;&nbsp;&nbsp; 0.748000] usb 1-2: new high-speed USB device =
number 2 using atmel-ehci<o:p></o:p></span></p><p class=3DMsoPlainText><spa=
n lang=3DEN-US>Feb 28 09:23:10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbs=
p; 0.810000] UBI: scanning is finished<o:p></o:p></span></p><p class=3DMsoP=
lainText><b><span lang=3DEN-US style=3D'color:red'>Feb 28 09:23:10 (none) k=
ern.warn kernel: [&nbsp;&nbsp;&nbsp; 0.821000] UBI warning: print_rsvd_warn=
ing: cannot reserve enough PEBs for bad PEB handling, reserved 115, need 40=
0<o:p></o:p></span></b></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 2=
8 09:23:10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.826000] UBI: at=
tached mtd3 (name &quot;rootfs_a&quot;, size 80 MiB) to ubi0<o:p></o:p></sp=
an></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:10 (none) ke=
rn.notice kernel: [&nbsp;&nbsp;&nbsp; 0.826000] UBI: PEB size: 131072 bytes=
 (128 KiB), LEB size: 129024 bytes<o:p></o:p></span></p><p class=3DMsoPlain=
Text><span lang=3DEN-US>Feb 28 09:23:10 (none) kern.notice kernel: [&nbsp;&=
nbsp;&nbsp; 0.826000] UBI: min./max. I/O unit sizes: 2048/2048, sub-page si=
ze 512<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb =
28 09:23:10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.826000] UBI: V=
ID header offset: 512 (aligned 512), data offset: 2048<o:p></o:p></span></p=
><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:10 (none) kern.not=
ice kernel: [&nbsp;&nbsp;&nbsp; 0.826000] UBI: good PEBs: 640, bad PEBs: 0,=
 corrupted PEBs: 0<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=
=3DEN-US>Feb 28 09:23:10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.8=
26000] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128<o:=
p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:23:=
10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.826000] UBI: max/mean e=
rase counter: 399/202, WL threshold: 4096, image sequence number: 548304255=
<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 09:=
23:10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.826000] UBI: availab=
le PEBs: 0, total reserved PEBs: 640, PEBs reserved for bad PEB handling: 1=
15<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Feb 28 0=
9:23:10 (none) kern.notice kernel: [&nbsp;&nbsp;&nbsp; 0.827000] UBI: backg=
round thread &quot;ubi_bgt0d&quot; started, PID 288<o:p></o:p></span></p><p=
 class=3DMsoPlainText><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p cla=
ss=3DMsoPlainText><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoPlainText><span lang=3DEN-US>UBI wanted to reserve 400 blocks on MTD =
with 640. Hm... During debugging I found that mtd_get_device_size() gives t=
he size of whole flash memory back (4096 blocks * 128kB). I guess that I fo=
und small error. With micro patch the problem seems to be corrected for my =
case<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US><o:p>&=
nbsp;</o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US><o:p>&nbsp=
;</o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Thanks a lot,<=
o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Best regard=
s<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US>Sergey<o:=
p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US><o:p>&nbsp;</=
o:p></span></p></div></body></html>=

--_000_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_--

--_004_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_
Content-Type: application/octet-stream;
	name="0001-Instead-of-giving-the-size-of-requested-MTD-partitio.patch"
Content-Description: 0001-Instead-of-giving-the-size-of-requested-MTD-partitio.patch
Content-Disposition: attachment;
	filename="0001-Instead-of-giving-the-size-of-requested-MTD-partitio.patch";
	size=880; creation-date="Thu, 28 Feb 2013 12:16:50 GMT";
	modification-date="Thu, 28 Feb 2013 12:08:48 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMDhjODUyNTE0ZGRkZTBkOTVkM2MwMDJjMTk1YTdiZjZjMmVjYjMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWZWx5a29raGF0a28gU2VyZ2V5IDxzdmVAbWNjLW1lZC5kZT4K
RGF0ZTogVGh1LCAyOCBGZWIgMjAxMyAxMzowMTozMCArMDEwMApTdWJqZWN0OiBbUEFUQ0ggMS8x
XSBJbnN0ZWFkIG9mIGdpdmluZyB0aGUgc2l6ZSBvZiByZXF1ZXN0ZWQgTVREIHBhcnRpdGlvbgog
bXRkX2dldF9kZXZpY2Vfc2l6ZSgpIHJldHVybmVkIHRoZSBzaXplIG9mIHdob2xlIGZsYXNoCiBt
ZW1vcnkuIEZpeCBpdAoKClNpZ25lZC1vZmYtYnk6IFZlbHlrb2toYXRrbyBTZXJnZXkgPHN2ZUBt
Y2MtbWVkLmRlPgotLS0KIGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8ICAgIDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwppbmRleCA3MGZhNzBhLi41
ZDYyOGVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKKysrIGIvZHJpdmVycy9t
dGQvbXRkcGFydC5jCkBAIC03NjcsNyArNzY3LDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwobXRkX2lz
X3BhcnRpdGlvbik7CiAvKiBSZXR1cm5zIHRoZSBzaXplIG9mIHRoZSBlbnRpcmUgZmxhc2ggY2hp
cCAqLwogdWludDY0X3QgbXRkX2dldF9kZXZpY2Vfc2l6ZShjb25zdCBzdHJ1Y3QgbXRkX2luZm8g
Km10ZCkKIHsKLQlpZiAoIW10ZF9pc19wYXJ0aXRpb24obXRkKSkKKwlpZiAobXRkX2lzX3BhcnRp
dGlvbihtdGQpKQogCQlyZXR1cm4gbXRkLT5zaXplOwogCiAJcmV0dXJuIFBBUlQobXRkKS0+bWFz
dGVyLT5zaXplOwotLSAKMS43LjEwLjQKCg==

--_004_BAF0C2081321BA469F9ADF648F97D9B04C78FA6069MCC023weinman_--
