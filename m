Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G9Wsc-0002UW-24
	for linux-mtd@lists.infradead.org; Sat, 05 Aug 2006 20:52:40 -0400
Received: from [127.0.0.1] (j069218.ppp.asahi-net.or.jp [61.213.69.218])
	by www346.sakura.ne.jp (8.12.11-p1/8.12.11) with ESMTP id
	k760qGRg012167 for <linux-mtd@lists.infradead.org>;
	Sun, 6 Aug 2006 09:52:17 +0900 (JST)
	(envelope-from kaigai@kaigai.gr.jp)
Message-ID: <44D53DAE.5020803@kaigai.gr.jp>
Date: Sun, 06 Aug 2006 09:54:06 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add the latest xattr support on mtd-utils
Content-Type: multipart/mixed; boundary="------------000601000403020303070303"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000601000403020303070303
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

This patch enables to pack xattr informations for _recent_ xattr
implementation.

When I posted a patch which enables to operate xattr on NAND
flash by using delete marker at Jun, the format of xref node
was a bit changed.
As 'xseqno' was added into struct jffs2_raw_xref, I ought to
post a patch to modify it. But I left for posting.

Please apply it, Thanks.
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>

--------------000601000403020303070303
Content-Type: text/plain;
	name="jffs2-xattr-v6.2-04-add-xseqno-on-mtdutils.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
	filename="jffs2-xattr-v6.2-04-add-xseqno-on-mtdutils.patch"

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvamZmczIuaCBiL2luY2x1ZGUvbGludXgvamZm
czIuaAppbmRleCAyY2FjNjBlLi44ZmM5OWU1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2pmZnMyLmgKKysrIGIvaW5jbHVkZS9saW51eC9qZmZzMi5oCkBAIC0xODYsNiArMTg2LDcg
QEAgc3RydWN0IGpmZnMyX3Jhd194cmVmCiAJamludDMyX3QgaGRyX2NyYzsKIAlqaW50MzJf
dCBpbm87CQkvKiBpbm9kZSBudW1iZXIgKi8KIAlqaW50MzJfdCB4aWQ7CQkvKiBYQVRUUiBp
ZGVudGlmaWVyIG51bWJlciAqLworCWppbnQzMl90IHhzZXFubzsJLyogeHJlZiBzZXF1ZW5j
aWFsIG51bWJlciAqLwogCWppbnQzMl90IG5vZGVfY3JjOwogfSBfX2F0dHJpYnV0ZV9fKChw
YWNrZWQpKTsKIApkaWZmIC0tZ2l0IGEvbWtmcy5qZmZzMi5jIGIvbWtmcy5qZmZzMi5jCmlu
ZGV4IGZhNGE1ZjMuLmM0NjBhN2IgMTAwNjQ0Ci0tLSBhL21rZnMuamZmczIuYworKysgYi9t
a2ZzLmpmZnMyLmMKQEAgLTEwMzgsNiArMTAzOCw3IEBAIHR5cGVkZWYgc3RydWN0IHhhdHRy
X2VudHJ5IHsKICNkZWZpbmUgWEFUVFJfQlVGRkVSX1NJWkUJCSg2NCAqIDEwMjQpCS8qIDY0
S0IgKi8KIHN0YXRpYyB1aW50MzJfdCBlbmFibGVfeGF0dHIgPSAwOwogc3RhdGljIHVpbnQz
Ml90IGhpZ2hlc3RfeGlkID0gMDsKK3N0YXRpYyB1aW50MzJfdCBoaWdoZXN0X3hzZXFubyA9
IDA7CiAKIHN0YXRpYyBzdHJ1Y3QgewogCWludCB4cHJlZml4OwpAQCAtMTI0NCw2ICsxMjQ1
LDcgQEAgc3RhdGljIHZvaWQgd3JpdGVfeGF0dHJfZW50cnkoc3RydWN0IGZpbAogCQlyZWYu
aGRyX2NyYyA9IGNwdV90b19qZTMyKGNyYzMyKDAsICZyZWYsIHNpemVvZihzdHJ1Y3QgamZm
czJfdW5rbm93bl9ub2RlKSAtIDQpKTsKIAkJcmVmLmlubyA9IGNwdV90b19qZTMyKGUtPnNi
LnN0X2lubyk7CiAJCXJlZi54aWQgPSBjcHVfdG9famUzMih4ZS0+eGlkKTsKKwkJcmVmLnhz
ZXFubyA9IGNwdV90b19qZTMyKGhpZ2hlc3RfeHNlcW5vICs9IDIpOwogCQlyZWYubm9kZV9j
cmMgPSBjcHVfdG9famUzMihjcmMzMigwLCAmcmVmLCBzaXplb2YocmVmKSAtIDQpKTsKIAog
CQlwYWRfYmxvY2tfaWZfbGVzc190aGFuKHNpemVvZihyZWYpKTsK
--------------000601000403020303070303--
