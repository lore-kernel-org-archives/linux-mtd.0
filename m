Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HGh1r-0004uw-Rs
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 14:40:02 -0500
Received: by ug-out-1314.google.com with SMTP id m2so39243uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Feb 2007 11:39:55 -0800 (PST)
Message-ID: <f383264b0702121139w7b5dc50ds8bdd96b708c1336d@mail.gmail.com>
Date: Mon, 12 Feb 2007 11:39:55 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: PATCH: calculate s3c2410 NAND timing values more accurately
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_88425_28413590.1171309195341"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_88425_28413590.1171309195341
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Calculate NAND timing values more accurately on S3C2410, 2412, and
2440, whose registers differ slightly:

Enforce the TACLS max value as 3 on 2440 but 7 on 2410/2412.

Also, make it possible to specify a value of 0 on 2412/2440.

Signed-off-by: Matt Reimer <mreimer@vpop.net>

------=_Part_88425_28413590.1171309195341
Content-Type: application/octet-stream; name=calc-rate.patch2
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ey3b2apr
Content-Disposition: attachment; filename="calc-rate.patch2"

LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zM2MyNDEwLmMJVHVlIEphbiAzMCAxMjo1NDo0MyAyMDA3
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvczNjMjQxMC5jCVR1ZSBKYW4gMzAgMTI6NTQ6NDMgMjAw
NwpAQCAtMTY4LDkgKzE2OSw2IEBAIHN0YXRpYyBpbnQgczNjX25hbmRfY2FsY19yYXRlKGludCB3
YW50ZWQKIAkJcmV0dXJuIC0xOwogCX0KIAotCWlmIChyZXN1bHQgPCAxKQotCQlyZXN1bHQgPSAx
OwotCiAJcmV0dXJuIHJlc3VsdDsKIH0KIApAQCAtMTgzLDcgKzE4MSw3IEBAIHN0YXRpYyBpbnQg
czNjMjQxMF9uYW5kX2luaXRodyhzdHJ1Y3QgczMKIHsKIAlzdHJ1Y3QgczNjMjQxMF9wbGF0Zm9y
bV9uYW5kICpwbGF0ID0gdG9fbmFuZF9wbGF0KHBkZXYpOwogCXVuc2lnbmVkIGxvbmcgY2xrcmF0
ZSA9IGNsa19nZXRfcmF0ZShpbmZvLT5jbGspOwotCWludCB0YWNsc19tYXggPSAoaW5mby0+Y3B1
X3R5cGUgPT0gVFlQRV9TM0MyNDEyKSA/IDggOiA0OworCWludCB0YWNsc19tYXggPSAoaW5mby0+
Y3B1X3R5cGUgPT0gVFlQRV9TM0MyNDQwKSA/IDQgOiA4OwogCWludCB0YWNscywgdHdycGgwLCB0
d3JwaDE7CiAJdW5zaWduZWQgbG9uZyBjZmcgPSAwOwogCkBAIC0yMDcsMjYgKzIwNSwzNCBAQCBz
dGF0aWMgaW50IHMzYzI0MTBfbmFuZF9pbml0aHcoc3RydWN0IHMzCiAJCXJldHVybiAtRUlOVkFM
OwogCX0KIAotCWRldl9pbmZvKGluZm8tPmRldmljZSwgIlRhY2xzPSVkLCAlZG5zIFR3cnBoMD0l
ZCAlZG5zLCBUd3JwaDE9JWQgJWRuc1xuIiwKLQkgICAgICAgdGFjbHMsIHRvX25zKHRhY2xzLCBj
bGtyYXRlKSwgdHdycGgwLCB0b19ucyh0d3JwaDAsIGNsa3JhdGUpLCB0d3JwaDEsIHRvX25zKHR3
cnBoMSwgY2xrcmF0ZSkpOwotCiAgCXN3aXRjaCAoaW5mby0+Y3B1X3R5cGUpIHsKICAJY2FzZSBU
WVBFX1MzQzI0MTA6CiAJCWNmZyA9IFMzQzI0MTBfTkZDT05GX0VOOwogCQljZmcgfD0gUzNDMjQx
MF9ORkNPTkZfVEFDTFModGFjbHMgLSAxKTsKIAkJY2ZnIHw9IFMzQzI0MTBfTkZDT05GX1RXUlBI
MCh0d3JwaDAgLSAxKTsKIAkJY2ZnIHw9IFMzQzI0MTBfTkZDT05GX1RXUlBIMSh0d3JwaDEgLSAx
KTsKKworCQlkZXZfaW5mbyhpbmZvLT5kZXZpY2UsICJUYWNscz0lZCwgJWRucyBUd3JwaDA9JWQg
JWRucywgVHdycGgxPSVkICVkbnNcbiIsCisJCQkgdGFjbHMgLSAxLCB0b19ucyh0YWNscywgY2xr
cmF0ZSksCisJCQkgdHdycGgwIC0gMSwgdG9fbnModHdycGgwLCBjbGtyYXRlKSwKKwkJCSB0d3Jw
aDEgLSAxLCB0b19ucyh0d3JwaDEsIGNsa3JhdGUpKTsKKwogCQlicmVhazsKIAogIAljYXNlIFRZ
UEVfUzNDMjQ0MDoKICAJY2FzZSBUWVBFX1MzQzI0MTI6Ci0JCWNmZyA9IFMzQzI0NDBfTkZDT05G
X1RBQ0xTKHRhY2xzIC0gMSk7CisJCWNmZyA9IFMzQzI0NDBfTkZDT05GX1RBQ0xTKHRhY2xzKTsK
IAkJY2ZnIHw9IFMzQzI0NDBfTkZDT05GX1RXUlBIMCh0d3JwaDAgLSAxKTsKIAkJY2ZnIHw9IFMz
QzI0NDBfTkZDT05GX1RXUlBIMSh0d3JwaDEgLSAxKTsKIAogCQkvKiBlbmFibGUgdGhlIGNvbnRy
b2xsZXIgYW5kIGRlLWFzc2VydCBuRkNFICovCiAKIAkJd3JpdGVsKFMzQzI0NDBfTkZDT05UX0VO
QUJMRSwgaW5mby0+cmVncyArIFMzQzI0NDBfTkZDT05UKTsKKworCQlkZXZfaW5mbyhpbmZvLT5k
ZXZpY2UsICJUYWNscz0lZCwgJWRucyBUd3JwaDA9JWQgJWRucywgVHdycGgxPSVkICVkbnNcbiIs
CisJCQkgdGFjbHMsIHRvX25zKHRhY2xzLCBjbGtyYXRlKSwKKwkJCSB0d3JwaDAgLSAxLCB0b19u
cyh0d3JwaDAsIGNsa3JhdGUpLAorCQkJIHR3cnBoMSAtIDEsIHRvX25zKHR3cnBoMSwgY2xrcmF0
ZSkpOwogCX0KIAogCWRldl9kYmcoaW5mby0+ZGV2aWNlLCAiTkZfQ09ORiBpcyAweCVseFxuIiwg
Y2ZnKTsK
------=_Part_88425_28413590.1171309195341--
