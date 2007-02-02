Received: from cpe.atm2-0-71355.0x535a1b8e.virnxx16.customer.tele.dk
	([83.90.27.142] helo=bes01.blokken.lan)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HD0rW-0003X0-Oc
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 11:02:11 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C746E3.AE024DFF"
Subject: chip_ready patch for SST39VF640xB
Date: Fri, 2 Feb 2007 17:03:29 +0100
Message-ID: <4F576438CB468649B9FD55650B93FA238DB4A1@bes01.blokken.lan>
From: "Niels Gram Jeppesen" <ngj@danelec-marine.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C746E3.AE024DFF
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,

In cfi_cmdset_0002.c, chip_ready seems to be unreliable on the =
SST39VF640xB chip. The attached patch add two extra reads to chip_ready =
in accordance with the chip data sheet (page 3, "Write Operation Status =
Detection"). This seems to make the write cycle completion detection =
reliable. I have not tested the patch on any other chips but I would =
think that it would be harmless on chips that do not need the extra =
reads.

Best regards; hope this helps,

Niels



------_=_NextPart_001_01C746E3.AE024DFF
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002.c.patch"
Content-Transfer-Encoding: base64
Content-Description: cfi_cmdset_0002.c.patch
Content-Disposition: attachment;
	filename="cfi_cmdset_0002.c.patch"

LS0tIGRvd25sb2FkL2xpbnV4LTIuNi4xOS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAw
MDIuYwkyMDA2LTExLTI5IDIyOjU3OjM3LjAwMDAwMDAwMCArMDEwMAorKysgbGludXgtMi42LjE5
LWtzODY5NS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwkyMDA3LTAyLTAyIDE2
OjI2OjU1LjAwMDAwMDAwMCArMDEwMApAQCAtNDUyLDYgKzQ1MiwxNCBAQAogCWQgPSBtYXBfcmVh
ZChtYXAsIGFkZHIpOwogCXQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwogCisJLyogRG8gdHdvIGV4
dHJhIHJlYWRzIHRvIGVuc3VyZSB0aGF0IHN0YXR1cyBkZXRlY3Rpb24gd29ya3MKKwkgKiBvbiB0
aGUgU1NUMzlWRjY0MHhCCisJICovCisJaWYgKG1hcF93b3JkX2VxdWFsKG1hcCwgZCwgdCkpCisJ
ICB0ID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKKwlpZiAobWFwX3dvcmRfZXF1YWwobWFwLCBkLCB0
KSkKKwkgIHQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOworCiAJcmV0dXJuIG1hcF93b3JkX2VxdWFs
KG1hcCwgZCwgdCk7CiB9Cg==

------_=_NextPart_001_01C746E3.AE024DFF--
