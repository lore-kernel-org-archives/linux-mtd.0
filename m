Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAJBe-0002fb-D2
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 09:17:53 +0000
Received: by qyk32 with SMTP id 32so1359614qyk.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 02:17:46 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <AANLkTinRiF4rnrhKDO79Cp9L=3=oS8-fsw6Y-f+x9N9-@mail.gmail.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154030.11097.40767.stgit@dev.siriade.com>
	<AANLkTinTpHtLRU_cXYsvc0EmBCcxDG+e1i9bY1Es7=fp@mail.gmail.com>
	<AANLkTi=s1AbuKGALhb6zjbo5KTRaTVY8B2P3-PwnZvsm@mail.gmail.com>
	<AANLkTinRiF4rnrhKDO79Cp9L=3=oS8-fsw6Y-f+x9N9-@mail.gmail.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 25 Oct 2010 11:17:25 +0200
Message-ID: <AANLkTinyoLrwmu63USS6OQXEuF3YXob95v30hggvvuKx@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: cfi_cmdset_0002: add CFI detection for SST
	38VF640x chips
To: yidong zhang <zhangyd6@gmail.com>
Content-Type: multipart/mixed; boundary=00163646d6a819d0a504936d77b8
Cc: fggs@terra.com.br, linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--00163646d6a819d0a504936d77b8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/10/25 yidong zhang <zhangyd6@gmail.com>:
> Oh, sorry, my mistake. I tested the patch right now. But it didn't
> work, please the logs below.
>
> Amd/Fujitsu Extended Query Table at 0x0040
> =C2=A0Unknown Amd/Fujitsu Extended Query version =C2=A0. =C2=A0(0xff/0xff=
).

This chip does not have a valid Major/MinorVersion.
Could you please try the attached patch ?

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org

--00163646d6a819d0a504936d77b8
Content-Type: application/octet-stream; name="03-sst38vf640x.patch"
Content-Disposition: attachment; filename="03-sst38vf640x.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gfp4uf7p0

bXRkOiBjZmlfY21kc2V0XzAwMDI6IGFkZCBDRkkgZGV0ZWN0aW9uIGZvciBTU1QgMzhWRjY0MHgg
Y2hpcHMKCkZyb206IEd1aWxsYXVtZSBMRUNFUkYgPGdsZWNlcmZAZ21haWwuY29tPgoKQWRkIHN1
cHBvcnQgZm9yIFNTVDM4VkY2NDB4IGNoaXBzIGluIENGSSBtb2RlLgoKU2lnbmVkLW9mZi1ieTog
R3VpbGxhdW1lIExFQ0VSRiA8Z2xlY2VyZkBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IHlpZG9u
ZyB6aGFuZyA8emhhbmd5ZDZAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMi5jIHwgICAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlcyBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAyLmMKaW5kZXggYTM1OTk2Ny4uMWJkNTY4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAyLmMKQEAgLTI5Niw2ICsyOTYsMjEgQEAgc3RhdGljIHZvaWQgZml4dXBfc3N0Mzl2
Zl9yZXZfYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdm9pZCAqcGFyYW0pCiAJc2VjdG9yX2VyYXNl
X2NtZCA9IENNRCgweDUwKTsKIH0KIAorc3RhdGljIHZvaWQgZml4dXBfc3N0Mzh2ZjY0MHhfc2Vj
dG9yc2l6ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdm9pZCAqcGFyYW0pCit7CisJc3RydWN0IG1h
cF9pbmZvICptYXAgPSBtdGQtPnByaXY7CisJc3RydWN0IGNmaV9wcml2YXRlICpjZmkgPSBtYXAt
PmZsZHJ2X3ByaXY7CisKKwlmaXh1cF9zc3QzOXZmX3Jldl9iKG10ZCwgcGFyYW0pOworCisJLyoK
KwkgKiBDRkkgcmVwb3J0cyAxMDI0IHNlY3RvcnMgKDB4MDNmZiArMSkgb2YgNjRLQnl0ZXMgKDB4
MDEwMCAqMjU2KSB3aGVyZQorCSAqIGl0IHNob3VsZCByZXBvcnQgYSBzaXplIG9mIDhLQnl0ZXMg
KDB4MDAyMCAqMjU2KS4KKwkgKi8KKwljZmktPmNmaXEtPkVyYXNlUmVnaW9uSW5mb1swXSA9IDB4
MDAyMDAzZmY7CisJcHJfd2FybmluZygiJXM6IEJhZCAzOFZGNjQweCBDRkkgZGF0YSwgYWRqdXN0
IHNlY3RvciBzaXplIGZyb20gNjQgdG8gOEtCeXRlc1xuIiwgbXRkLT5uYW1lKTsKK30KKwogc3Rh
dGljIHZvaWQgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMoc3RydWN0IG10ZF9pbmZvICptdGQsIHZv
aWQgKnBhcmFtKQogewogCXN0cnVjdCBtYXBfaW5mbyAqbWFwID0gbXRkLT5wcml2OwpAQCAtMzQ3
LDYgKzM2MiwxMCBAQCBzdGF0aWMgc3RydWN0IGNmaV9maXh1cCBjZmlfZml4dXBfdGFibGVbXSA9
IHsKIAl7IENGSV9NRlJfQU1ELCAweDEzMDEsIGZpeHVwX3MyOWdsMDY0bl9zZWN0b3JzLCBOVUxM
LCB9LAogCXsgQ0ZJX01GUl9BTUQsIDB4MWEwMCwgZml4dXBfczI5Z2wwMzJuX3NlY3RvcnMsIE5V
TEwsIH0sCiAJeyBDRklfTUZSX0FNRCwgMHgxYTAxLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycywg
TlVMTCwgfSwKKwl7IENGSV9NRlJfU1NULCAweDUzNkEsIGZpeHVwX3NzdDM4dmY2NDB4X3NlY3Rv
cnNpemUsIE5VTEwsIH0sIC8qIFNTVDM4VkY2NDAyICovCisJeyBDRklfTUZSX1NTVCwgMHg1MzZC
LCBmaXh1cF9zc3QzOHZmNjQweF9zZWN0b3JzaXplLCBOVUxMLCB9LCAvKiBTU1QzOFZGNjQwMSAq
LworCXsgQ0ZJX01GUl9TU1QsIDB4NTM2QywgZml4dXBfc3N0Mzh2ZjY0MHhfc2VjdG9yc2l6ZSwg
TlVMTCwgfSwgLyogU1NUMzhWRjY0MDQgKi8KKwl7IENGSV9NRlJfU1NULCAweDUzNkQsIGZpeHVw
X3NzdDM4dmY2NDB4X3NlY3RvcnNpemUsIE5VTEwsIH0sIC8qIFNTVDM4VkY2NDAzICovCiAjaWYg
IUZPUkNFX1dPUkRfV1JJVEUKIAl7IENGSV9NRlJfQU5ZLCBDRklfSURfQU5ZLCBmaXh1cF91c2Vf
d3JpdGVfYnVmZmVycywgTlVMTCwgfSwKICNlbmRpZgpAQCAtMzc3LDYgKzM5NiwxMCBAQCBzdGF0
aWMgdm9pZCBjZmlfZml4dXBfbWFqb3JfbWlub3Ioc3RydWN0IGNmaV9wcml2YXRlICpjZmksCiAJ
aWYgKGNmaS0+bWZyID09IENGSV9NRlJfU0FNU1VORyAmJiBjZmktPmlkID09IDB4MjU3ZSAmJgog
CSAgICBleHRwLT5NYWpvclZlcnNpb24gPT0gJzAnKQogCQlleHRwLT5NYWpvclZlcnNpb24gPSAn
MSc7CisJaWYgKGNmaS0+bWZyID09IENGSV9NRlJfU1NUICYmIChjZmktPmlkID4+IDQpID09IDB4
MDUzNikgeworCQlleHRwLT5NYWpvclZlcnNpb24gPSAnMSc7CisJCWV4dHAtPk1pbm9yVmVyc2lv
biA9ICcwJzsKKwl9CiB9CiAKIHN0cnVjdCBtdGRfaW5mbyAqY2ZpX2NtZHNldF8wMDAyKHN0cnVj
dCBtYXBfaW5mbyAqbWFwLCBpbnQgcHJpbWFyeSkK
--00163646d6a819d0a504936d77b8--
