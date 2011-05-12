Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKPnC-0007tm-Tb
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 06:54:40 +0000
Received: by yic15 with SMTP id 15so501626yic.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 May 2011 23:54:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110511183322.da0739c9.akpm@linux-foundation.org>
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
	<20110511183322.da0739c9.akpm@linux-foundation.org>
Date: Thu, 12 May 2011 01:54:37 -0500
Message-ID: <BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>
Subject: Re: Bug in MTD NAND ONFI chipsize detection
From: Nitin Garg <nitingarg98@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary=001e680f0fa89b90ba04a30ea9d4
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001e680f0fa89b90ba04a30ea9d4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Here is the tested patch, pls apply.

Regards,
Nitin Garg

>From 1a73f1c3d066a491d0c806883788ab9abdc736f3 Mon Sep 17 00:00:00 2001
From: Nitin Garg <nitingarg98@gmail.com>
Date: Thu, 12 May 2011 01:31:53 -0500
Subject: [PATCH] Fix ONFI NAND flash size detection by using number of
Logical Units in device


Signed-off-by: Nitin Garg <nitingarg98@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..cdf6015 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
mtd_info *mtd, struct nand_chip *chip,
 	mtd->writesize =3D le32_to_cpu(p->byte_per_page);
 	mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->writesize;
 	mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
-	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erases=
ize;
+	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
le32_to_cpu(p->lun_count) * mtd->erasesize;
 	busw =3D 0;
 	if (le16_to_cpu(p->features) & 1)
 		busw =3D NAND_BUSWIDTH_16;
--=20
1.5.5.6



On Wed, May 11, 2011 at 8:33 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Wed, 11 May 2011 11:25:22 -0500 Nitin Garg <nitingarg98@gmail.com> wro=
te:
>
>> Hi All,
>>
>> The nand_flash_detect_onfi function in mtd/nand detects the NAND flash
>> device size using the ONFI parameters:
>> =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) =
* mtd->erasesize;
>>
>> The lun_count is not taken into consideration due to which we detect
>> wrong size for Micron MT29F8G08ADADAH4 as it has 2 logical units.
>>
>> We should change the chipsize calculation to:
>> =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) =
*
>> (uint64_t)le32_to_cpu(p->lun_count) * mtd->erasesize;
>>
>> Pls suggest.
>>
>
> Please send a tested, changelogged patch to fix it. =A0Be sure to cc the
> relevant maintainer and mailing list.
>
> Thanks.
>

--001e680f0fa89b90ba04a30ea9d4
Content-Type: application/octet-stream;
	name="0001-Fix-ONFI-NAND-flash-size-detection-by-using-number-o.patch"
Content-Disposition: attachment;
	filename="0001-Fix-ONFI-NAND-flash-size-detection-by-using-number-o.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gnlcek4j0

RnJvbSAxYTczZjFjM2QwNjZhNDkxZDBjODA2ODgzNzg4YWI5YWJkYzczNmYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaXRpbiBHYXJnIDxuaXRpbmdhcmc5OEBnbWFpbC5jb20+CkRh
dGU6IFRodSwgMTIgTWF5IDIwMTEgMDE6MzE6NTMgLTA1MDAKU3ViamVjdDogW1BBVENIXSBGaXgg
T05GSSBOQU5EIGZsYXNoIHNpemUgZGV0ZWN0aW9uIGJ5IHVzaW5nIG51bWJlciBvZiBMb2dpY2Fs
IFVuaXRzIGluIGRldmljZQoKClNpZ25lZC1vZmYtYnk6IE5pdGluIEdhcmcgPG5pdGluZ2FyZzk4
QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jIHwgICAgMiArLQog
MSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvbmFu
ZF9iYXNlLmMKaW5kZXggYzU0YTRjYi4uY2RmNjAxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9uYW5kX2Jhc2UuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jCkBAIC0y
ODkyLDcgKzI4OTIsNyBAQCBzdGF0aWMgaW50IG5hbmRfZmxhc2hfZGV0ZWN0X29uZmkoc3RydWN0
IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAJbXRkLT53cml0ZXNpemUg
PSBsZTMyX3RvX2NwdShwLT5ieXRlX3Blcl9wYWdlKTsKIAltdGQtPmVyYXNlc2l6ZSA9IGxlMzJf
dG9fY3B1KHAtPnBhZ2VzX3Blcl9ibG9jaykgKiBtdGQtPndyaXRlc2l6ZTsKIAltdGQtPm9vYnNp
emUgPSBsZTE2X3RvX2NwdShwLT5zcGFyZV9ieXRlc19wZXJfcGFnZSk7Ci0JY2hpcC0+Y2hpcHNp
emUgPSAodWludDY0X3QpbGUzMl90b19jcHUocC0+YmxvY2tzX3Blcl9sdW4pICogbXRkLT5lcmFz
ZXNpemU7CisJY2hpcC0+Y2hpcHNpemUgPSAodWludDY0X3QpbGUzMl90b19jcHUocC0+YmxvY2tz
X3Blcl9sdW4pICogbGUzMl90b19jcHUocC0+bHVuX2NvdW50KSAqIG10ZC0+ZXJhc2VzaXplOwog
CWJ1c3cgPSAwOwogCWlmIChsZTE2X3RvX2NwdShwLT5mZWF0dXJlcykgJiAxKQogCQlidXN3ID0g
TkFORF9CVVNXSURUSF8xNjsKLS0gCjEuNS41LjYKCg==
--001e680f0fa89b90ba04a30ea9d4--
