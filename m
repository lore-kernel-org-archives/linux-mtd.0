Received: from outbound.mse14.exchange.ms ([216.52.164.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OI74q-0003K4-N4
	for linux-mtd@lists.infradead.org; Fri, 28 May 2010 21:26:54 +0000
Date: Fri, 28 May 2010 17:26:43 -0400
Subject: Mtd_debug patch
From: Stephen Beaver <beavers@anx.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <C825AD54.2A59A%beavers@anx.com>
Mime-version: 1.0
Content-type: multipart/mixed;
	boundary="B_3357912405_73358387"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3357912405_73358387
Content-type: multipart/alternative;
	boundary="B_3357912405_73392762"


--B_3357912405_73392762
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

The attached patch to the current version of mtd_debug (grabbed on5/28/2010)
adds two new capabilities:

usage: mtd_debug info   <device>
       mtd_debug read   <device> <offset> <len> <dest-filename>
       mtd_debug write  <device> <offset> <len> <source-filename>
       mtd_debug verify <device> <offset> <cmp-filename>
       mtd_debug erase  <device> <offset> <len>
       mtd_debug blank  <device> <offset> <len>

mtd_debug blank ... checks that an area of flash memory if blank (all 0xFFs)
ie it verifies that an erase succeeded.
mtd_debug verify ... checks that the contents of the flash memory match the
specified file. Ie it verifies that a write succeeded.

These functions allow things like:

#!/bin/sh

mtd_debug erase /dev/mtd1 0 0x200000
mtd_debug write /dev/mtd1 0 0x150000 uImage
if ( mtd_debug verifiy /dev/mtd1 0 uImage ) ; then
   reboot
else
   # Better try again, or we will die
fi



Both have been tested on NOR and NAND flash, and are just simple
modifications to the existing file_from_flash() function.

Steve
-- 
Stephen Beaver | ANXeBusiness | Engineering |219  232-8371 | www.anx.com |
beavers@anx.com
Think Green...do you really need to print this email?  Reduce, reuse,
recycle!


--B_3357912405_73392762
Content-type: text/html;
	charset="US-ASCII"
Content-transfer-encoding: quoted-printable

<HTML>
<HEAD>
<TITLE>Mtd_debug patch</TITLE>
</HEAD>
<BODY>
<FONT FACE=3D"Calibri, Verdana, Helvetica, Arial"><SPAN STYLE=3D'font-size:11pt=
'>The attached patch to the current version of mtd_debug (grabbed on5/28/201=
0) adds two new capabilities:<BR>
<BR>
</SPAN></FONT><FONT SIZE=3D"2"><FONT FACE=3D"Consolas, Courier New, Courier"><S=
PAN STYLE=3D'font-size:10pt'>usage: mtd_debug info &nbsp;&nbsp;&lt;device&gt;<=
BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtd_debug read &nbsp;&nbsp;&lt;de=
vice&gt; &lt;offset&gt; &lt;len&gt; &lt;dest-filename&gt;<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtd_debug write &nbsp;&lt;device&=
gt; &lt;offset&gt; &lt;len&gt; &lt;source-filename&gt;<BR>
<FONT COLOR=3D"#0000FF"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtd_debug verify=
 &lt;device&gt; &lt;offset&gt; &lt;cmp-filename&gt;<BR>
</FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtd_debug erase &nbsp;&lt;devic=
e&gt; &lt;offset&gt; &lt;len&gt;<BR>
<FONT COLOR=3D"#0000FF"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtd_debug blank =
&nbsp;&lt;device&gt; &lt;offset&gt; &lt;len&gt;<BR>
</FONT></SPAN></FONT></FONT><FONT FACE=3D"Calibri, Verdana, Helvetica, Arial"=
><SPAN STYLE=3D'font-size:11pt'><BR>
mtd_debug blank ... checks that an area of flash memory if blank (all 0xFFs=
) ie it verifies that an erase succeeded.<BR>
mtd_debug verify ... checks that the contents of the flash memory match the=
 specified file. Ie it verifies that a write succeeded.<BR>
<BR>
These functions allow things like:<BR>
<BR>
</SPAN></FONT><FONT SIZE=3D"2"><FONT FACE=3D"Consolas, Courier New, Courier"><S=
PAN STYLE=3D'font-size:10pt'>#!/bin/sh<BR>
<BR>
mtd_debug erase /dev/mtd1 0 0x200000<BR>
mtd_debug write /dev/mtd1 0 0x150000 uImage<BR>
if ( mtd_debug verifiy /dev/mtd1 0 uImage ) ; then<BR>
&nbsp;&nbsp;&nbsp;reboot<BR>
else<BR>
&nbsp;&nbsp;&nbsp;# Better try again, or we will die<BR>
fi<BR>
</SPAN></FONT></FONT><FONT FACE=3D"Calibri, Verdana, Helvetica, Arial"><SPAN =
STYLE=3D'font-size:11pt'><BR>
<BR>
<BR>
Both have been tested on NOR and NAND flash, and are just simple modificati=
ons to the existing file_from_flash() function.<BR>
<BR>
Steve<BR>
-- <BR>
<B>Stephen Beaver </B>| <FONT COLOR=3D"#003F7F"><B>ANXeBusiness</B></FONT> | =
Engineering |219 &nbsp;232-8371<B> </B>| www.anx.com | <a href=3D"beavers@anx.=
com">beavers@anx.com</a><BR>
</SPAN></FONT><FONT COLOR=3D"#007D00"><FONT SIZE=3D"1"><FONT FACE=3D"Tahoma, Verd=
ana, Helvetica, Arial"><SPAN STYLE=3D'font-size:8pt'><B>Think Green...do you r=
eally need to print this email? &nbsp;Reduce, reuse, recycle!</B></SPAN></FO=
NT></FONT></FONT><FONT FACE=3D"Calibri, Verdana, Helvetica, Arial"><SPAN STYLE=
=3D'font-size:11pt'><BR>
</SPAN></FONT>
</BODY>
</HTML>


--B_3357912405_73392762--


--B_3357912405_73358387
Content-type: video/x-flv; name="verify-blank.patch"
Content-disposition: attachment;
	filename="verify-blank.patch"
Content-transfer-encoding: base64


LS0tIG10ZC0yMDA2MTAwNy5vcmlnL210ZF9kZWJ1Zy5jCTIwMDYtMTAtMDcgMTE6MzM6Mzcu
MDAwMDAwMDAwIC0wNDAwCisrKyBtdGQtMjAwNjEwMDcvbXRkX2RlYnVnLmMJMjAxMC0wNS0y
OCAxNzowMjowOS4wMDAwMDAwMDAgLTA0MDAKQEAgLTMwLDYgKzMwLDEwIEBACiAgKiBPRiBU
SElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNV
Q0ggREFNQUdFLgogICovCiAKKy8qCisgKiBBZGRlZCBibGFuayBjaGVjayBhbmQgdmVyaWZ5
IGZ1bmN0aW9ucywgTWF5IDIwMTAgLSBTdGV2ZSBCZWF2ZXIsIEFOWCBlYnVzaW5lc3MgQ29y
cAorICovCisgCiAjaW5jbHVkZSA8c3RkaW8uaD4KICNpbmNsdWRlIDxzdGRsaWIuaD4KICNp
bmNsdWRlIDxlcnJuby5oPgpAQCAtMTczLDYgKzE3NywxOTIgQEAKICAgIHJldHVybiAoMSk7
CiB9CiAKKyNkZWZpbmUgQlVGX1NJWkUJKDY0ICogMTAyNCAqIHNpemVvZiAodV9pbnQ4X3Qp
KQorCitpbnQgZmxhc2hfY21wX2ZpbGUgKGludCBmZCwgdV9pbnQzMl90IG9mZnNldCwgY29u
c3QgY2hhciAqZmlsZW5hbWUpCit7CisgICB1X2ludDhfdCAqYnVmID0gTlVMTCwgKmZpbGVi
dWYgPSBOVUxMOworICAgaW50IGVycjsKKyAgIEZJTEUgKmZwOworICAgaW50IHNpemUgPSBC
VUZfU0laRTsKKyAgIGludCBuLCBpOyAKKyAgIHVuc2lnbmVkIGxvbmcgbGVuID0gMEw7Cisg
ICAKKyAgIGlmIChvZmZzZXQgIT0gbHNlZWsgKGZkLG9mZnNldCxTRUVLX1NFVCkpCisJIHsK
KwkJcGVycm9yICgibHNlZWsoKSIpOworCQlnb3RvIGVycjA7CisJIH0KKworICAgaWYgKChm
cCA9IGZvcGVuIChmaWxlbmFtZSwiciIpKSA9PSBOVUxMKQorCSB7CisJCXBlcnJvciAoImZv
cGVuKCkiKTsKKwkJZ290byBlcnIxOworCSB9CisKK3JldHJ5OgorICAgaWYgKChidWYgPSAo
dV9pbnQ4X3QgKikgbWFsbG9jIChzaXplKSkgPT0gTlVMTCkKKwkgeworCisJCWZwcmludGYg
KHN0ZGVyciwgIiVzOiBtYWxsb2MoJSN4KVxuIiwgX19GVU5DVElPTl9fLCBzaXplKTsKKwkJ
aWYgKHNpemUgIT0gQlVGX1NJWkUpIHsKKwkJCXNpemUgPSBCVUZfU0laRTsKKwkJCWZwcmlu
dGYgKHN0ZGVyciwgIiVzOiB0cnlpbmcgYnVmZmVyIHNpemUgJSN4XG4iLCBfX0ZVTkNUSU9O
X18sIHNpemUpOworCQkJZ290byByZXRyeTsKKwkJfQorCQlwZXJyb3IgKCJtYWxsb2MoKSIp
OworCQlnb3RvIGVycjA7CisJIH0KKwkgCisJIC8vIG1ha2Ugb3Vyc2VsdmVzIGEgYnVmZmVy
IGZvciB0aGUgY29tcGFyZSBmaWxlCisJIAorICAgaWYgKChmaWxlYnVmID0gKHVfaW50OF90
ICopIG1hbGxvYyAoc2l6ZSkpID09IE5VTEwpCisJIHsKKwkJZnByaW50ZiAoc3RkZXJyLCAi
JXM6IG1hbGxvYyglI3gpXG4iLCBfX0ZVTkNUSU9OX18sIHNpemUpOworCQlpZiAoc2l6ZSAh
PSBCVUZfU0laRSkgeworCQkJc2l6ZSA9IEJVRl9TSVpFOworCQkJZnByaW50ZiAoc3RkZXJy
LCAiJXM6IHRyeWluZyBmaWxlIGJ1ZmZlciBzaXplICUjeFxuIiwgX19GVU5DVElPTl9fLCBz
aXplKTsKKwkJCWdvdG8gcmV0cnk7CisJCX0KKwkJcGVycm9yICgibWFsbG9jKCkiKTsKKwkJ
Z290byBlcnIwOworCSB9CSAKKworIGRvIHsKKyAgIGVyciA9IGZyZWFkKGZpbGVidWYsMSwg
c2l6ZSwgZnApOworICAgbiA9IGVycjsKKyAgIGxlbiArPSAobG9uZyluOworICAgCisgICBp
ZiAoZXJyIDwgMCkKKwkgeworCQlmcHJpbnRmIChzdGRlcnIsICIlczogd3JpdGUsIHNpemUg
JSN4LCBuICUjeFxuIiwgX19GVU5DVElPTl9fLCBzaXplLCBuKTsKKwkJcGVycm9yICgiZnJl
YWQoKSIpOworCQlnb3RvIGVycjI7CisJIH0KKwkgCSAgIAorICAgZXJyID0gcmVhZCAoZmQs
YnVmLG4pOworICAgaWYgKGVyciA8IDApCisJIHsKKwkJZnByaW50ZiAoc3RkZXJyLCAiJXM6
IHJlYWQsIHNpemUgJSN4LCBuICUjeFxuIiwgX19GVU5DVElPTl9fLCBzaXplLCBuKTsKKwkJ
cGVycm9yICgicmVhZCgpIik7CisJCWdvdG8gZXJyMjsKKwkgfQorCSAgICAgIAorCWlmKG1l
bWNtcChidWYsIGZpbGVidWYsIG4pICE9IDApCisJICAgZ290byBlcnIzOyAgIAorCisgICB9
IHdoaWxlIChuID09IHNpemUpOworCisgICBpZiAoYnVmICE9IE5VTEwpCisgICBmcmVlIChi
dWYpOworICAgaWYgKGZpbGVidWYgIT0gTlVMTCkKKyAgIGZyZWUgKGZpbGVidWYpOworICAg
ZmNsb3NlIChmcCk7CisgICBwcmludGYgKCIweCUuOGx4IGJ5dGVzIGZyb20gYWRkcmVzcyAw
eCUuOHggdmVyaWZpZWRcbiIsbGVuLG9mZnNldCk7CisgICByZXR1cm4gKDApOworCitlcnIz
OgorICAgZm9yKGk9MDtpPG47aSsrKQorICAgICAgaWYoYnVmW2ldICE9IGZpbGVidWZbaV0p
CisgICAgICAgICBicmVhazsKKworICAgCisgICBwcmludGYgKCJWZXJpZnkgZmFpbGVkIGF0
IGJ5dGUgMHglLjhseCBmcm9tIG9mZnNldCAweCUuOHhcbiIsIChsZW4tbikraSwgb2Zmc2V0
KTsKKyAgIGVycjI6CisgICBmY2xvc2UgKGZwKTsKKyAgIGVycjE6CisgICBpZiAoYnVmICE9
IE5VTEwpCisgICBmcmVlIChidWYpOworICAgaWYgKGZpbGVidWYgIT0gTlVMTCkKKyAgIGZy
ZWUgKGZpbGVidWYpOworICAgZXJyMDoKKyAgIHJldHVybiAoMSk7Cit9CisKK2ludCBmbGFz
aF9ibGFuayAoaW50IGZkLCB1X2ludDMyX3Qgb2Zmc2V0LCBzaXplX3QgbGVuKQoreworICAg
dV9pbnQ4X3QgKmJ1ZiA9IE5VTEwsICpibGFua2J1ZiA9IE5VTEw7CisgICBpbnQgZXJyOwor
ICAgaW50IHNpemUgPSBsZW4gKiBzaXplb2YgKHVfaW50OF90KTsKKyAgIGludCBuID0gbGVu
OworICAgCisgICBpZiAob2Zmc2V0ICE9IGxzZWVrIChmZCxvZmZzZXQsU0VFS19TRVQpKQor
CSB7CisJCXBlcnJvciAoImxzZWVrKCkiKTsKKwkJZ290byBlcnIwOworCSB9CisKK3JldHJ5
OgorICAgaWYgKChidWYgPSAodV9pbnQ4X3QgKikgbWFsbG9jIChzaXplKSkgPT0gTlVMTCkK
KwkgeworI2RlZmluZSBCVUZfU0laRQkoNjQgKiAxMDI0ICogc2l6ZW9mICh1X2ludDhfdCkp
CisJCWZwcmludGYgKHN0ZGVyciwgIiVzOiBtYWxsb2MoJSN4KVxuIiwgX19GVU5DVElPTl9f
LCBzaXplKTsKKwkJaWYgKHNpemUgIT0gQlVGX1NJWkUpIHsKKwkJCXNpemUgPSBCVUZfU0la
RTsKKwkJCWZwcmludGYgKHN0ZGVyciwgIiVzOiB0cnlpbmcgYnVmZmVyIHNpemUgJSN4XG4i
LCBfX0ZVTkNUSU9OX18sIHNpemUpOworCQkJZ290byByZXRyeTsKKwkJfQorCQlwZXJyb3Ig
KCJtYWxsb2MoKSIpOworCQlnb3RvIGVycjA7CisJIH0KKwkgCisJIC8vIG1ha2Ugb3Vyc2Vs
dmVzIGEgYnVmZmVyIGZ1bGwgb2YgMHhmZgorCSAKKyAgIGlmICgoYmxhbmtidWYgPSAodV9p
bnQ4X3QgKikgbWFsbG9jIChzaXplKSkgPT0gTlVMTCkKKwkgeworCQlmcHJpbnRmIChzdGRl
cnIsICIlczogbWFsbG9jKCUjeClcbiIsIF9fRlVOQ1RJT05fXywgc2l6ZSk7CisJCWlmIChz
aXplICE9IEJVRl9TSVpFKSB7CisJCQlzaXplID0gQlVGX1NJWkU7CisJCQlmcHJpbnRmIChz
dGRlcnIsICIlczogdHJ5aW5nIGJsYW5rIGJ1ZmZlciBzaXplICUjeFxuIiwgX19GVU5DVElP
Tl9fLCBzaXplKTsKKwkJCWdvdG8gcmV0cnk7CisJCX0KKwkJcGVycm9yICgibWFsbG9jKCki
KTsKKwkJZ290byBlcnIwOworCSB9CisJIAorCW1lbXNldChibGFua2J1ZiwgMHhmZiwgc2l6
ZSk7CisJIAorIGRvIHsKKyAgIGlmIChuIDw9IHNpemUpCisJICAgc2l6ZSA9IG47CisJICAg
CisgICBlcnIgPSByZWFkIChmZCxidWYsc2l6ZSk7CisKKyAgIGlmIChlcnIgPCAwKQorCSB7
CisJCWZwcmludGYgKHN0ZGVyciwgIiVzOiByZWFkLCBzaXplICUjeCwgbiAlI3hcbiIsIF9f
RlVOQ1RJT05fXywgc2l6ZSwgbik7CisJCXBlcnJvciAoInJlYWQoKSIpOworCQlnb3RvIGVy
cjI7CisJIH0KKworCWlmKCBtZW1jbXAoYnVmLCBibGFua2J1Ziwgc2l6ZSkgIT0gMCkKKwkg
ICBnb3RvIGVycjM7CisJICAgIAorICAgbiAtPSBzaXplOworICAgfSB3aGlsZSAobiA+IDAp
OworCisgICBpZiAoYnVmICE9IE5VTEwpCisgICBmcmVlIChidWYpOworCisgICBpZiAoYmxh
bmtidWYgIT0gTlVMTCkKKyAgIGZyZWUgKGJsYW5rYnVmKTsKKyAgIHByaW50ZiAoIiVkIGJ5
dGVzIGZyb20gb2Zmc2V0IDB4JS44eCBpbiBmbGFzaCB3ZXJlIGJsYW5rXG4iLGxlbiwgb2Zm
c2V0KTsKKyAgIHJldHVybiAoMCk7CisKKwllcnIzOgorCQorCXByaW50ZigiTm9uLWJsYW5r
IGJ5dGUocykgZm91bmRcbiIpOworCQorICAgZXJyMjoKKworICAgaWYgKGJ1ZiAhPSBOVUxM
KQorICAgIGZyZWUgKGJ1Zik7CisgICBpZiAoYmxhbmtidWYgIT0gTlVMTCkKKyAgICBmcmVl
KGJsYW5rYnVmKTsKKyAgIGVycjA6CisgICByZXR1cm4gKDEpOworfQorCiBpbnQgZmlsZV90
b19mbGFzaCAoaW50IGZkLHVfaW50MzJfdCBvZmZzZXQsdV9pbnQzMl90IGxlbixjb25zdCBj
aGFyICpmaWxlbmFtZSkKIHsKICAgIHVfaW50OF90ICpidWYgPSBOVUxMOwpAQCAtMjA3LDcg
KzM5Nyw3IEBACiAgZG8gewogICAgaWYgKG4gPD0gc2l6ZSkKIAkgICBzaXplID0gbjsKLSAg
IGlmIChmcmVhZCAoYnVmLHNpemUsMSxmcCkgIT0gMSB8fCBmZXJyb3IgKGZwKSkKKyAgIGlm
IChmcmVhZCAoYnVmLCBzaXplLDEsIGZwKSA9PSAtMSB8fCBmZXJyb3IgKGZwKSkKIAkgewog
CQlmcHJpbnRmIChzdGRlcnIsICIlczogZnJlYWQsIHNpemUgJSN4LCBuICUjeFxuIiwgX19G
VU5DVElPTl9fLCBzaXplLCBuKTsKIAkJcGVycm9yICgiZnJlYWQoKSIpOwpAQCAtMzU5LDIx
ICs1NDksMjcgQEAKIHZvaWQgc2hvd3VzYWdlIChjb25zdCBjaGFyICpwcm9nbmFtZSkKIHsK
ICAgIGZwcmludGYgKHN0ZGVyciwKLQkJCSJ1c2FnZTogJXMgaW5mbyA8ZGV2aWNlPlxuIgot
CQkJIiAgICAgICAlcyByZWFkIDxkZXZpY2U+IDxvZmZzZXQ+IDxsZW4+IDxkZXN0LWZpbGVu
YW1lPlxuIgotCQkJIiAgICAgICAlcyB3cml0ZSA8ZGV2aWNlPiA8b2Zmc2V0PiA8bGVuPiA8
c291cmNlLWZpbGVuYW1lPlxuIgotCQkJIiAgICAgICAlcyBlcmFzZSA8ZGV2aWNlPiA8b2Zm
c2V0PiA8bGVuPlxuIiwKKwkJCSJ1c2FnZTogJXMgaW5mbyAgIDxkZXZpY2U+XG4iCisJCQki
ICAgICAgICVzIHJlYWQgICA8ZGV2aWNlPiA8b2Zmc2V0PiA8bGVuPiA8ZGVzdC1maWxlbmFt
ZT5cbiIKKwkJCSIgICAgICAgJXMgd3JpdGUgIDxkZXZpY2U+IDxvZmZzZXQ+IDxsZW4+IDxz
b3VyY2UtZmlsZW5hbWU+XG4iCisJCQkiICAgICAgICVzIHZlcmlmeSA8ZGV2aWNlPiA8b2Zm
c2V0PiA8Y21wLWZpbGVuYW1lPlxuIgorCQkJIiAgICAgICAlcyBlcmFzZSAgPGRldmljZT4g
PG9mZnNldD4gPGxlbj5cbiIKKyAgICAgICAgICIgICAgICAgJXMgYmxhbmsgIDxkZXZpY2U+
IDxvZmZzZXQ+IDxsZW4+XG4iLAorCQkJcHJvZ25hbWUsCiAJCQlwcm9nbmFtZSwKIAkJCXBy
b2duYW1lLAogCQkJcHJvZ25hbWUsCisJCQlwcm9nbmFtZSwgICAgICAgICAgICAgICAgICAK
IAkJCXByb2duYW1lKTsKICAgIGV4aXQgKDEpOwogfQogCi0jZGVmaW5lIE9QVF9JTkZPCTEK
LSNkZWZpbmUgT1BUX1JFQUQJMgotI2RlZmluZSBPUFRfV1JJVEUJMwotI2RlZmluZSBPUFRf
RVJBU0UJNAorI2RlZmluZSBPUFRfSU5GTwkgMQorI2RlZmluZSBPUFRfUkVBRAkgMgorI2Rl
ZmluZSBPUFRfV1JJVEUJIDMKKyNkZWZpbmUgT1BUX0VSQVNFCSA0CisjZGVmaW5lIE9QVF9W
RVJJRlkgNQorI2RlZmluZSBPUFRfQkxBTksgIDYKIAogaW50IG1haW4gKGludCBhcmdjLGNo
YXIgKmFyZ3ZbXSkKIHsKQEAgLTM5MSwxMSArNTg3LDE1IEBACiAJIG9wdGlvbiA9IE9QVF9X
UklURTsKICAgIGVsc2UgaWYgKGFyZ2MgPT0gNSAmJiAhc3RyY21wIChhcmd2WzFdLCJlcmFz
ZSIpKQogCSBvcHRpb24gPSBPUFRfRVJBU0U7CisJZWxzZSBpZiAoYXJnYyA9PSAgNSAmJiAh
c3RyY21wIChhcmd2WzFdLCAidmVyaWZ5IikpCisJIG9wdGlvbiA9IE9QVF9WRVJJRlk7CisJ
ZWxzZSBpZiAoYXJnYyA9PSAgNSAmJiAhc3RyY21wIChhcmd2WzFdLCAiYmxhbmsiKSkKKwkg
b3B0aW9uID0gT1BUX0JMQU5LOyAKICAgIGVsc2UKIAkgc2hvd3VzYWdlIChwcm9nbmFtZSk7
CiAKICAgIC8qIG9wZW4gZGV2aWNlICovCi0gICBvcGVuX2ZsYWcgPSAob3B0aW9uPT1PUFRf
SU5GTyB8fCBvcHRpb249PU9QVF9SRUFEKSA/IE9fUkRPTkxZIDogT19SRFdSOworICAgb3Bl
bl9mbGFnID0gKG9wdGlvbj09T1BUX0lORk8gfHwgb3B0aW9uPT1PUFRfUkVBRCB8fCBvcHRp
b24gPT0gT1BUX0JMQU5LIHx8IG9wdGlvbiA9PSBPUFRfVkVSSUZZKSA/IE9fUkRPTkxZIDog
T19SRFdSOwogICAgaWYgKChmZCA9IG9wZW4gKGFyZ3ZbMl0sT19TWU5DIHwgb3Blbl9mbGFn
KSkgPCAwKQogCSB7CiAJCXBlcnJvciAoIm9wZW4oKSIpOwpAQCAtNDE2LDYgKzYxNiwxMiBA
QAogCSAgY2FzZSBPUFRfRVJBU0U6CiAJCWVyciA9IGVyYXNlX2ZsYXNoIChmZCxzdHJ0b2wg
KGFyZ3ZbM10sTlVMTCwwKSxzdHJ0b2wgKGFyZ3ZbNF0sTlVMTCwwKSk7CiAJCWJyZWFrOwor
CSAgY2FzZSBPUFRfVkVSSUZZOgorCSAgIGVyciA9IGZsYXNoX2NtcF9maWxlKGZkLCBzdHJ0
b2woYXJndlszXSxOVUxMLDApLCBhcmd2WzRdKTsKKyAgICAgIGJyZWFrOworCSAgY2FzZSBP
UFRfQkxBTks6CisJICAgZXJyID0gZmxhc2hfYmxhbmsoZmQsIHN0cnRvbChhcmd2WzNdLE5V
TEwsMCksIHN0cnRvbChhcmd2WzRdLE5VTEwsMCkpOyAgICAgIAorICAgICAgYnJlYWs7CiAJ
IH0KIAogICAgLyogY2xvc2UgZGV2aWNlICovCg==
--B_3357912405_73358387--
