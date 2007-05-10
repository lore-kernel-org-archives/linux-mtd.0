Received: from mail.ipcas.de ([83.236.147.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hm5e2-0006mT-5w
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 06:13:13 -0400
Date: Thu, 10 May 2007 12:13:05 +0200
From: =?UTF-8?Q?Michael_K=C3=B6nig?= <Michael.Koenig@ipcas.de>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
Message-ID: <EA3F0F32C26AA132D54202A0@franken3>
In-Reply-To: <20070510102703.04a398ee@dhcp-252-105.norway.atmel.com>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<B2FC9E5F094119A0F71B96EF@franken3>
	<1178718379.11554.34.camel@localhost.localdomain>
	<AFDBC52C05E4EA53B68C61AD@franken3>
	<1178781348.11554.52.camel@localhost.localdomain>
	<20070510102703.04a398ee@dhcp-252-105.norway.atmel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="==========4A6F770A5FAC4A1DBF11=========="
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--==========4A6F770A5FAC4A1DBF11==========
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> So if you have the patch available, now would probably be a good time
> to post it ;-)

Unfortunately I don't have any experience with GIT and also don't have the=20
time to set it up right now, but I'm attaching a "diff -p" for the changes=20
to the latest cfi_cmdset_0002.c in the repository.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen
Best regards
Michael K=C3=B6nig

ipcas GmbH
Wetterkreuz 17
91058 Erlangen, Germany
Tel.: +49 9131 7677-31
Fax: +49 9131 7677-78
mailto:Michael.Koenig@ipcas.de

Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. S. Sutiono
Sitz der Gesellschaft: Erlangen
Registergericht: F=C3=BCrth, HBR 3676
WEEE-Reg.-Nr. DE 77202473

Hinweis: Diese E-Mail und etwaige Anlagen k=C3=B6nnen Betriebs- oder
Gesch=C3=A4ftsgeheimnisse, dem Anwaltsgeheimnis unterliegen oder sonstige
vertrauliche Informationen enthalten. Sollten Sie diese E-Mail
irrt=C3=BCmlich erhalten haben, ist Ihnen der Status dieser E-Mail bekannt.
Bitte benachrichtigen Sie uns in diesem Fall sofort durch Antwort-Mail
und l=C3=B6schen Sie diese E-Mail nebst etwaigen Anlagen von Ihrem System.
Ebenso d=C3=BCrfen Sie diese E-Mail oder seine Anlagen
nicht kopieren oder an Dritte weitergeben. Vielen Dank.

--==========4A6F770A5FAC4A1DBF11==========
Content-Type: application/octet-stream; name="cfi_cmdset_0002.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="cfi_cmdset_0002.diff"; size=1381

KioqIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMJMjAwNy0wNS0xMCAwNDow
Njo1OC4wMDAwMDAwMDAgLTA0MDAKLS0tIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8w
MDAyLmMJMjAwNy0wNS0xMCAwNDo1MzowMy4wMDAwMDAwMDAgLTA0MDAKKioqKioqKioqKioqKioq
IHN0YXRpYyB2b2lkIGZpeHVwX2NvbnZlcnRfYXRtZWxfcHJpKHN0cnUKKioqIDE4NSwxOTAgKioq
KgotLS0gMTg1LDE5NCAtLS0tCiAgCQlleHRwLT5Ub3BCb3R0b20gPSAyOwogIAllbHNlCiAgCQll
eHRwLT5Ub3BCb3R0b20gPSAzOworIAorIAkvKiBidXJzdCB3cml0ZSBtb2RlIG5vdCBzdXBwb3J0
ZWQgKi8KKyAJY2ZpLT5jZmlxLT5CdWZXcml0ZVRpbWVvdXRUeXAgPSAwOworIAljZmktPmNmaXEt
PkJ1ZldyaXRlVGltZW91dE1heCA9IDA7CiAgfQogIAogIHN0YXRpYyB2b2lkIGZpeHVwX3VzZV9z
ZWNzaShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdm9pZCAqcGFyYW0pCioqKioqKioqKioqKioqKiBz
dGF0aWMgc3RydWN0IGNmaV9maXh1cCBjZmlfZml4dXBfdGFibGVbCioqKiAyMjYsMjM1ICoqKioK
ICAJeyBDRklfTUZSX0FNRCwgMHgwMDU2LCBmaXh1cF91c2Vfc2Vjc2ksIE5VTEwsIH0sCiAgCXsg
Q0ZJX01GUl9BTUQsIDB4MDA1QywgZml4dXBfdXNlX3NlY3NpLCBOVUxMLCB9LAogIAl7IENGSV9N
RlJfQU1ELCAweDAwNUYsIGZpeHVwX3VzZV9zZWNzaSwgTlVMTCwgfSwKICAjaWYgIUZPUkNFX1dP
UkRfV1JJVEUKICAJeyBDRklfTUZSX0FOWSwgQ0ZJX0lEX0FOWSwgZml4dXBfdXNlX3dyaXRlX2J1
ZmZlcnMsIE5VTEwsIH0sCiAgI2VuZGlmCi0gCXsgQ0ZJX01GUl9BVE1FTCwgQ0ZJX0lEX0FOWSwg
Zml4dXBfY29udmVydF9hdG1lbF9wcmksIE5VTEwgfSwKICAJeyAwLCAwLCBOVUxMLCBOVUxMIH0K
ICB9OwogIHN0YXRpYyBzdHJ1Y3QgY2ZpX2ZpeHVwIGplZGVjX2ZpeHVwX3RhYmxlW10gPSB7Ci0t
LSAyMzAsMjM5IC0tLS0KICAJeyBDRklfTUZSX0FNRCwgMHgwMDU2LCBmaXh1cF91c2Vfc2Vjc2ks
IE5VTEwsIH0sCiAgCXsgQ0ZJX01GUl9BTUQsIDB4MDA1QywgZml4dXBfdXNlX3NlY3NpLCBOVUxM
LCB9LAogIAl7IENGSV9NRlJfQU1ELCAweDAwNUYsIGZpeHVwX3VzZV9zZWNzaSwgTlVMTCwgfSwK
KyAJeyBDRklfTUZSX0FUTUVMLCBDRklfSURfQU5ZLCBmaXh1cF9jb252ZXJ0X2F0bWVsX3ByaSwg
TlVMTCB9LAogICNpZiAhRk9SQ0VfV09SRF9XUklURQogIAl7IENGSV9NRlJfQU5ZLCBDRklfSURf
QU5ZLCBmaXh1cF91c2Vfd3JpdGVfYnVmZmVycywgTlVMTCwgfSwKICAjZW5kaWYKICAJeyAwLCAw
LCBOVUxMLCBOVUxMIH0KICB9OwogIHN0YXRpYyBzdHJ1Y3QgY2ZpX2ZpeHVwIGplZGVjX2ZpeHVw
X3RhYmxlW10gPSB7Cg==

--==========4A6F770A5FAC4A1DBF11==========--
