Received: from smtp.innovsys.com ([66.115.232.196] helo=mail.innovsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DG32H-0001a6-JZ
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2005 17:48:42 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C533E8.4A439191"
Date: Mon, 28 Mar 2005 16:48:42 -0600
Message-ID: <DCEAAC0833DD314AB0B58112AD99B93B85931E@ismail.innsys.innovsys.com>
From: "Rune Torgersen" <runet@innovsys.com>
To: <linux-mtd@lists.infradead.org>
Subject: AMD flash problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C533E8.4A439191
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I have a AMD 29LV640 flash (16bit) that behaves incorrectly with mtd.

When doing erase or programming, the cfi mtd functions return too early.

I can especially see this when usiong flash_eraseall -j /dev/mtd5

The erase returns too quicly, so that every other sector is erased.

I tracked it down to the chiplevel, where it seems that this particular
AMD chip doesn't always toggle the toggle bits, causion chip_ready() to
retturn true, and the erase (or program_onw_word) functions to think
they are ready.

Only way I could get it to work correctly, was to add an extra read when
chip_ready() returns, to see if the data is what it should be (all FF's
on erase or actual data when programming one word)

This is what I did (and I think this should be done for all chips, adds
an extra check that everything went ok)

--- tmp/drivers/mtd/chips/cfi_cmdset_0002.c     2005-03-28
16:41:30.438298024 -0600
+++ linux-innsys/drivers/mtd/chips/cfi_cmdset_0002.c    2005-03-28
16:45:21.000000000 -0600
@@ -764,7 +764,7 @@ static int do_write_oneword(struct map_i
                        continue;
                }

-               if (chip_ready(map, adr))
+               if (chip_ready(map, adr) && map_word_equal(map, datum,
map_read(map, adr)))
                        goto op_done;

                if (time_after(jiffies, timeo))
@@ -1220,8 +1220,11 @@ static inline int do_erase_oneblock(stru
 {
        struct cfi_private *cfi =3D map->fldrv_priv;
        unsigned long timeo =3D jiffies + HZ;
+       map_word all_ones;
        DECLARE_WAITQUEUE(wait, current);
-       int ret =3D 0;
+       int ret =3D 0;
+
+       memset(all_ones.x, 0xff, map->bankwidth);

        adr +=3D chip->start;

@@ -1271,7 +1274,7 @@ static inline int do_erase_oneblock(stru
                        chip->erase_suspended =3D 0;
                }

-               if (chip_ready(map, adr))
+               if (chip_ready(map, adr) && map_word_equal(map,
all_ones, map_read(map,adr)))
                        goto op_done;

                if (time_after(jiffies, timeo))


Rune Torgersen
System Developer
Innovative Systems LLC
1000 Innovative Drive
Mitchell, SD 57301
Ph: 605-995-6120
www.innovsys.com

------_=_NextPart_001_01C533E8.4A439191
Content-Type: application/octet-stream;
	name="amd_flash_patch"
Content-Transfer-Encoding: base64
Content-Description: amd_flash_patch
Content-Disposition: attachment;
	filename="amd_flash_patch"

LS0tIHRtcC9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwkyMDA1LTAzLTI4IDE2
OjQxOjMwLjQzODI5ODAyNCAtMDYwMAorKysgbGludXgtaW5uc3lzL2RyaXZlcnMvbXRkL2NoaXBz
L2NmaV9jbWRzZXRfMDAwMi5jCTIwMDUtMDMtMjggMTY6NDU6MjEuMDAwMDAwMDAwIC0wNjAwCkBA
IC03NjQsNyArNzY0LDcgQEAgc3RhdGljIGludCBkb193cml0ZV9vbmV3b3JkKHN0cnVjdCBtYXBf
aQogCQkJY29udGludWU7CiAJCX0KIAotCQlpZiAoY2hpcF9yZWFkeShtYXAsIGFkcikpCisJCWlm
IChjaGlwX3JlYWR5KG1hcCwgYWRyKSAmJiBtYXBfd29yZF9lcXVhbChtYXAsIGRhdHVtLCBtYXBf
cmVhZChtYXAsIGFkcikpKQogCQkJZ290byBvcF9kb25lOwogCiAJCWlmICh0aW1lX2FmdGVyKGpp
ZmZpZXMsIHRpbWVvKSkKQEAgLTEyMjAsOCArMTIyMCwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBk
b19lcmFzZV9vbmVibG9jayhzdHJ1CiB7CiAJc3RydWN0IGNmaV9wcml2YXRlICpjZmkgPSBtYXAt
PmZsZHJ2X3ByaXY7CiAJdW5zaWduZWQgbG9uZyB0aW1lbyA9IGppZmZpZXMgKyBIWjsKKwltYXBf
d29yZCBhbGxfb25lczsKIAlERUNMQVJFX1dBSVRRVUVVRSh3YWl0LCBjdXJyZW50KTsKLQlpbnQg
cmV0ID0gMDsKKwlpbnQgcmV0ID0gMDsNCisNCisJbWVtc2V0KGFsbF9vbmVzLngsIDB4ZmYsIG1h
cC0+YmFua3dpZHRoKTsKIAogCWFkciArPSBjaGlwLT5zdGFydDsKIApAQCAtMTI3MSw3ICsxMjc0
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgZG9fZXJhc2Vfb25lYmxvY2soc3RydQogCQkJY2hpcC0+
ZXJhc2Vfc3VzcGVuZGVkID0gMDsKIAkJfQogCi0JCWlmIChjaGlwX3JlYWR5KG1hcCwgYWRyKSkK
KwkJaWYgKGNoaXBfcmVhZHkobWFwLCBhZHIpICYmIG1hcF93b3JkX2VxdWFsKG1hcCwgYWxsX29u
ZXMsIG1hcF9yZWFkKG1hcCxhZHIpKSkKIAkJCWdvdG8gb3BfZG9uZTsKIAogCQlpZiAodGltZV9h
ZnRlcihqaWZmaWVzLCB0aW1lbykpCg==

------_=_NextPart_001_01C533E8.4A439191--
