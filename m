Received: from auriga.auriga.ru ([80.240.102.100])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pkgf-0007JT-LK
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 09:20:53 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 21 Aug 2003 12:20:27 +0400
Message-ID: <5B439D84E6653F4AA2E14A5D8898A7E163D75E@auriga.auriga.ru>
From: "Eugeny Mints" <eugeny.mints@auriga.ru>
To: <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C367BD.13E047A7"
Subject: Corrupt my NAND flash device, proposed patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C367BD.13E047A7
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Eugeny Mints wrote:

>Problem 2.

>My board falls in the infinite loop at (!(this->read_byte(mtd) &
0x40)); >even with the latest snapshot 18.08.2003 on RESET command.
Interesting, >that it happens not from the very begging but just when
write_oob has >executed (during eraseall) for about a half of the flash.


>I found that insertion of udelay() before issuing STATUS command helps.
Any >suggestions?

Please, find proposed patch for mtd snapshot 20030818 attached.=20

>>=20
>>=20
>> >However  after applying new MTD release the 2-nd problem still
>> remained.
>> >Then I comment out erase abort in nand_get_chip (as you suggested)
>> >and
>> it
>> >fixes my second problem!
>> >Could you remove this erase abort from MTD source? I think it will
>> >not affect much on efficiency.

>Possibly second Alex's problem may be solved by udelay() also? And
there is >no need to comment out erase abort?=20

>>=20
>> My second problem is that system hangs if the device is filled once
>> and an attempt to re-use previously used sectors is made. Comment out

>> erase abort in nand_get_chip fixes my second problem too.
>>=20

Regards,
 		Eugeny

------_=_NextPart_001_01C367BD.13E047A7
Content-Type: application/octet-stream;
	name="mtd20030818.patch"
Content-Transfer-Encoding: base64
Content-Description: mtd20030818.patch
Content-Disposition: attachment;
	filename="mtd20030818.patch"

ZGlmZiAtdU5yIG10ZC9kcml2ZXJzL210ZC9tdGRjaGFyLmMgbXRkLW5ldy9kcml2ZXJzL210ZC9t
dGRjaGFyLmMKLS0tIG10ZC9kcml2ZXJzL210ZC9tdGRjaGFyLmMJU2F0IE1heSAyNCAwMjowMDox
NCAyMDAzCisrKyBtdGQtbmV3L2RyaXZlcnMvbXRkL210ZGNoYXIuYwlUdWUgQXVnIDE5IDIxOjQ2
OjUzIDIwMDMKQEAgLTYyLDcgKzYyLDcgQEAKIAogc3RhdGljIGludCBtdGRfb3BlbihzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKIHsKLQlpbnQgbWlub3IgPSBtaW5vcihp
bm9kZS0+aV9yZGV2KTsKKwlpbnQgbWlub3IgPSBNSU5PUihpbm9kZS0+aV9yZGV2KTsKIAlpbnQg
ZGV2bnVtID0gbWlub3IgPj4gMTsKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZDsKCmRpZmYgLXVOciBt
dGQvZHJpdmVycy9tdGQvbmFuZC9uYW5kLmMgbXRkLW5ldy9kcml2ZXJzL210ZC9uYW5kL25hbmQu
YwotLS0gbXRkL2RyaXZlcnMvbXRkL25hbmQvbmFuZC5jCVRodSBKdWwgMjQgMDI6MDA6MzQgMjAw
MworKysgbXRkLW5ldy9kcml2ZXJzL210ZC9uYW5kL25hbmQuYwlXZWQgQXVnIDIwIDIxOjI4OjQx
IDIwMDMKQEAgLTMxMCw2ICszMTAsNyBAQAogCWNhc2UgTkFORF9DTURfUkVTRVQ6CiAJCWlmICh0
aGlzLT5kZXZfcmVhZHkpCQogCQkJYnJlYWs7CisJCXVkZWxheSh0aGlzLT5jaGlwX2RlbGF5KTsK
IAkJdGhpcy0+aHdjb250cm9sKG10ZCwgTkFORF9DVExfU0VUQ0xFKTsKIAkJdGhpcy0+d3JpdGVf
Ynl0ZShtdGQsIE5BTkRfQ01EX1NUQVRVUyk7CiAJCXRoaXMtPmh3Y29udHJvbChtdGQsIE5BTkRf
Q1RMX0NMUkNMRSk7CkBAIC05OTgsNiArOTk5LDggQEAKIAkqcmV0bGVuID0gbGVuOwogCiAjaWZk
ZWYgQ09ORklHX01URF9OQU5EX1ZFUklGWV9XUklURQorCXsKKwl1bnNpZ25lZCBpbnQgaTsJCiAJ
LyogU2VuZCBjb21tYW5kIHRvIHJlYWQgYmFjayB0aGUgZGF0YSAqLwogCXRoaXMtPmNtZGZ1bmMg
KG10ZCwgTkFORF9DTURfUkVBRE9PQiwgY29sdW1uLCBwYWdlKTsKIApAQCAtMTAwOSw2ICsxMDEy
LDcgQEAKIAkJCWdvdG8gb3V0OwogCQl9CiAJfQorCX0KICNlbmRpZgogCiBvdXQ6Cg==

------_=_NextPart_001_01C367BD.13E047A7--
