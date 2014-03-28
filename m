Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTSfx-0005vO-C2
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 09:02:10 +0000
Received: by mail-qg0-f42.google.com with SMTP id q107so4071393qgd.15
 for <linux-mtd@lists.infradead.org>; Fri, 28 Mar 2014 02:01:38 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 Mar 2014 10:01:38 +0100
Message-ID: <CAGL2vdwia5vmAgqkJBWKPYNMJiS2dn627t9a8jsjht2G=mqG1Q@mail.gmail.com>
Subject: jffs2dump endian convert does not convert major/minor numbers
From: Norbert Nemeth <nyonhar@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=089e013cba9816747a04f5a6f306
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--089e013cba9816747a04f5a6f306
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Using jffs2dump endian convert feature would leave the major and minor
numbers untouched, so they will be "swapped" in the resulting image.

Looking into mkfs.jffs2.c, major/minor data is written by
write_special_file as a byte each into the data section.  There is no
special handling for this in jffs2dump.c / do_endianconvert.

The attached patch is a possible solution for this issue.

One way to reproduce it:
$ ls -l test
total 0
brw-r--r-- 1 root root 1, 2 Mar 28 09:32 myblockdev
crw-r--r-- 1 root root 1, 2 Mar 28 09:32 mychardev
$ mkfs.jffs2 -d test -b -o testfs.big.jffs2
$ jffs2dump -b -e testfs.little.jffs2 testfs.big.jffs2
$ xxd testfs.big.jffs2 | grep 0102
0000080: ecd7 187b 0102 ffff 1985 e001 0000 0031  ...{...........1
0000100: 0102 ffff                                ....
$ xxd testfs.little.jffs2 | grep 0102
0000080: d848 a9f0 0102 ffff 8519 01e0 3100 0000  .H..........1...
0000100: 0102 ffff
$ xxd testfs.little.jffs2 | grep 0201
$

BR,
N.

--089e013cba9816747a04f5a6f306
Content-Type: text/x-patch; charset=US-ASCII; name="jffs2dump.c.patch"
Content-Disposition: attachment; filename="jffs2dump.c.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_htb8qn400

ZGlmZiAtLWdpdCBhL2pmZnMyZHVtcC5jIGIvamZmczJkdW1wLmMKaW5kZXggOWUxM2U5OC4uNjNi
Mzc1MyAxMDA2NDQKLS0tIGEvamZmczJkdW1wLmMKKysrIGIvamZmczJkdW1wLmMKQEAgLTQ2MCw3
ICs0NjAsOSBAQCB2b2lkIGRvX2VuZGlhbmNvbnZlcnQgKHZvaWQpCiAKIAkJc3dpdGNoKGplMTZf
dG9fY3B1KG5vZGUtPnUubm9kZXR5cGUpKSB7CiAKLQkJCWNhc2UgSkZGUzJfTk9ERVRZUEVfSU5P
REU6CisJCQljYXNlIEpGRlMyX05PREVUWVBFX0lOT0RFOnsKKwkJCQlqaW50MTZfdCBrZGV2WzJd
OyAKKwkJCQl1aW50MzJfdCBpc19kZXY7IAogCiAJCQkJbmV3bm9kZS5pLm1hZ2ljID0gY252X2Ux
NiAobm9kZS0+aS5tYWdpYyk7CiAJCQkJbmV3bm9kZS5pLm5vZGV0eXBlID0gY252X2UxNiAobm9k
ZS0+aS5ub2RldHlwZSk7CkBAIC00ODMsMTkgKzQ4NSwzOSBAQCB2b2lkIGRvX2VuZGlhbmNvbnZl
cnQgKHZvaWQpCiAJCQkJbmV3bm9kZS5pLmNvbXByID0gbm9kZS0+aS5jb21wcjsKIAkJCQluZXdu
b2RlLmkudXNlcmNvbXByID0gbm9kZS0+aS51c2VyY29tcHI7CiAJCQkJbmV3bm9kZS5pLmZsYWdz
ID0gY252X2UxNiAobm9kZS0+aS5mbGFncyk7CisJCQkJCisJCQkJaXNfZGV2ID0gU19JU0NIUihq
ZW1vZGVfdG9fY3B1KG5vZGUtPmkubW9kZSkpIHx8IFNfSVNCTEsoamVtb2RlX3RvX2NwdShub2Rl
LT5pLm1vZGUpKTsKKwkJCQlpZiAoaXNfZGV2KXsKKwkJCQkJLyogcmVhZCBtYWpvciwgbWlub3Ig
YW5kIHBhZGRpbmcgKi8KKwkJCQkJbWVtY3B5IChrZGV2LCBwICsgc2l6ZW9mIChzdHJ1Y3QgamZm
czJfcmF3X2lub2RlKSwgc2l6ZW9mIChrZGV2KSk7CisJCQkJCS8qc3dhcCBtYWpvciBhbmQgbWlu
b3IsIHRvIGJlIGluIHRoZSByaWdodCBvcmRlciovCisJCQkJCWtkZXZbMF09Y252X2UxNihrZGV2
WzBdKTsKKwkJCQkJaWYoIXJlY2FsY2NyYykKKwkJCQkJCXByaW50ZigiUmVjYWxjIGNyYyBpcyBk
aXNhYmxlZCwgZGF0YSBjcmMgb2YgZGV2aWNlIGZpbGVzIHdpbGwgYmUgY29ycnVwdCEhIVxuIik7
CisJCQkJfQorCisKIAkJCQlpZiAocmVjYWxjY3JjKSB7CiAJCQkJCWxlbiA9IGplMzJfdG9fY3B1
KG5vZGUtPmkuY3NpemUpOwotCQkJCQluZXdub2RlLmkuZGF0YV9jcmMgPSBjcHVfdG9fZTMyICgg
bXRkX2NyYzMyKDAsIHAgKyBzaXplb2YgKHN0cnVjdCBqZmZzMl9yYXdfaW5vZGUpLCBsZW4pKTsK
KwkJCQkJaWYgKGlzX2RldikKKwkJCQkJCW5ld25vZGUuaS5kYXRhX2NyYyA9IGNwdV90b19lMzIg
KCBtdGRfY3JjMzIoMCwga2RldiwgbGVuKSk7CisJCQkJCWVsc2UKKwkJCQkJCW5ld25vZGUuaS5k
YXRhX2NyYyA9IGNwdV90b19lMzIgKCBtdGRfY3JjMzIoMCwgcCArIHNpemVvZiAoc3RydWN0IGpm
ZnMyX3Jhd19pbm9kZSksIGxlbikpOwogCQkJCX0gZWxzZQogCQkJCQluZXdub2RlLmkuZGF0YV9j
cmMgPSBjbnZfZTMyIChub2RlLT5pLmRhdGFfY3JjKTsKIAogCQkJCW5ld25vZGUuaS5ub2RlX2Ny
YyA9IGNwdV90b19lMzIgKG10ZF9jcmMzMiAoMCwgJm5ld25vZGUsIHNpemVvZiAoc3RydWN0IGpm
ZnMyX3Jhd19pbm9kZSkgLSA4KSk7CiAKIAkJCQl3cml0ZSAoZmQsICZuZXdub2RlLCBzaXplb2Yg
KHN0cnVjdCBqZmZzMl9yYXdfaW5vZGUpKTsKLQkJCQl3cml0ZSAoZmQsIHAgKyBzaXplb2YgKHN0
cnVjdCBqZmZzMl9yYXdfaW5vZGUpLCBQQUQgKGplMzJfdG9fY3B1IChub2RlLT5pLnRvdGxlbikg
LSAgc2l6ZW9mIChzdHJ1Y3QgamZmczJfcmF3X2lub2RlKSkpOworCisJCQkJaWYgKGlzX2RldikK
KwkJCQkJd3JpdGUgKGZkLCBrZGV2LCBzaXplb2YgKGtkZXYpKTsKKwkJCQllbHNlCisJCQkJCXdy
aXRlIChmZCwgcCArIHNpemVvZiAoc3RydWN0IGpmZnMyX3Jhd19pbm9kZSksIFBBRCAoamUzMl90
b19jcHUgKG5vZGUtPmkudG90bGVuKSAtICBzaXplb2YgKHN0cnVjdCBqZmZzMl9yYXdfaW5vZGUp
KSk7CiAKIAkJCQlwICs9IFBBRChqZTMyX3RvX2NwdSAobm9kZS0+aS50b3RsZW4pKTsKIAkJCQli
cmVhazsKKwkJCX0KIAogCQkJY2FzZSBKRkZTMl9OT0RFVFlQRV9ESVJFTlQ6CiAJCQkJbmV3bm9k
ZS5kLm1hZ2ljID0gY252X2UxNiAobm9kZS0+ZC5tYWdpYyk7Cg==
--089e013cba9816747a04f5a6f306--
