Return-Path: <SRS0=9VLx=TM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A202C04A6B
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 15:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FEE20882
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 15:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mx+qiuE9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FEE20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=breakpoint.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp/4YzQHUaMyCfA4cQ04JnB0Lp8DAGpsE9G2rIVt6/s=; b=mx+qiuE9Ju/wlr
	7ShAtLrUoONnYSiMzdgE4WfY4/l3TEZdhybP5laNl2wOvKsGGWMqxwZOGXSr4jfoYuf3WwuTBKz9M
	77M2tYuONmy4hacrRrfvkdBL0Ww0qpc4a3X5wo+1tsa+OKyoGOUVvY3+jVVkv8Oa9XZ03elHTQzSZ
	BrrMLXS5kQfXQ8YDhDfPuyTR69XIIHCeD8ZN5IPOHVqF5Tvx1xSj7mYjFxg5vwAO3/H6EkB2PoSoW
	bySkBgUw3jVPlRkoqQ6LzmGM5S2dGMrQ8UlrsU8gYEL1u4zqlTBHc9L0+RsBu3IefiN2z9sMYJ7za
	a7pkSZpDPM9peNQNYE7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPqas-0004zq-5X; Sun, 12 May 2019 15:40:54 +0000
Received: from chamillionaire.breakpoint.cc ([2a01:7a0:2:106d:670::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPqal-0004rO-V0
 for linux-mtd@lists.infradead.org; Sun, 12 May 2019 15:40:52 +0000
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Chamillionaire.breakpoint.cc with esmtp (Exim 4.89)
 (envelope-from <sebastian@breakpoint.cc>)
 id 1hPqag-000492-I4; Sun, 12 May 2019 17:40:46 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: Add ZSTD compression
Date: Sun, 12 May 2019 17:40:30 +0200
Message-Id: <20190512154030.26027-2-sebastian@breakpoint.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190512154030.26027-1-sebastian@breakpoint.cc>
References: <20190512154030.26027-1-sebastian@breakpoint.cc>
MIME-Version: 1.0
X-Breakpoint-Spam-Score: -1.0
X-Breakpoint-Spam-Level: -
X-Breakpoint-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_084048_716151_EA601601 
X-CRM114-Status: GOOD (  22.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 "sebastian@breakpoint.cc" <sebastian@breakpoint.cc>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: "sebastian@breakpoint.cc" <sebastian@breakpoint.cc>

I added ZSTD support to mkfs.ubifs and compared the ZSTD results with
zlib/lzo and the available ZSTD compression levels. The results are in
the following table:

Comp    image MiB        time  image2 MiB        time
none          271   0m 0,723s         223   0m 0,589s
lzo           164   0m13,705s         116   0m11,636s
zlib          150   0m 7,654s         103   0m 6,347s
favor-lzo     158   0m21,137s         110   0m17,764s
zstd-01       154   0m 1,607s         106   0m 1,429s
zstd-02       153   0m 1,704s         105   0m 1,479s
zstd-03       152   0m 1,888s         104   0m 1,668s
zstd-04       151   0m 2,741s         103   0m 2,391s
zstd-05       150   0m 3,257s         102   0m 2,916s
zstd-06       150   0m 3,735s         102   0m 3,356s
zstd-07       150   0m 4,066s         102   0m 3,705s
zstd-08       152   0m 1,857s         104   0m 1,644s
zstd-09       152   0m 1,855s         104   0m 1,639s
zstd-10       150   0m 6,654s         102   0m 6,195s
zstd-11       150   0m10,027s         102   0m 9,130s
zstd-12       149   0m14,724s         101   0m13,415s
zstd-13       148   0m18,232s         100   0m16,719s
zstd-14       148   0m20,859s         100   0m19,554s
zstd-15       148   0m25,033s         100   0m23,186s
zstd-16       148   0m38,837s         100   0m36,543s
zstd-17       148   0m46,051s         100   0m43,120s
zstd-18       148   0m49,157s         100   0m45,807s
zstd-19       148   0m49,421s         100   0m45,951s
zstd-20       148   0m51,271s         100   0m48,030s
zstd-21       148   0m51,015s         100   0m48,676s
zstd-22       148   0m52,575s         100   0m50,013s

The UBIFS image was created via
  mkfs.ubifs -x $Comp -m 512 -e 128KiB -c 2200 -r $image $out

I used "debootstrap sid" to create a basic RFS and the results are in
the `image' column. The image2 column denotes the results for the same
image but with .deb files removed.
The time column contains the output of the runtime of the command.

ZSTD's compression level three is currently default. Based on the
compression results (for the default level) it outperforms LZO in
runtime and compression and is almost as good as ZLIB in terms of
compression but quicker.
The higher compression levels make almost no difference in compression
but take a lot of time (and require a more memory but I haven't
checked). Initially I assumed that may make sense to use -22 for RO data
partitions but at least in this example the benefit is only 4MiB.

I haven't tested the decompressor part in the kernel side, just wanted
to check if it makes sense to add yet another compressor.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 Makefile.am                         |  4 +++
 configure.ac                        | 23 ++++++++++++++
 include/mtd/ubifs-media.h           |  2 ++
 ubifs-utils/Makemodule.am           |  4 +--
 ubifs-utils/mkfs.ubifs/compr.c      | 47 ++++++++++++++++++++++++++---
 ubifs-utils/mkfs.ubifs/compr.h      |  1 +
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 32 ++++++++++++++++++--
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |  3 ++
 8 files changed, 107 insertions(+), 9 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 1bc4684b191df..aacf589771389 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -10,6 +10,10 @@ if WITHOUT_LZO
 AM_CPPFLAGS += -DWITHOUT_LZO
 endif
 
+if WITHOUT_ZSTD
+AM_CPPFLAGS += -DWITHOUT_ZSTD
+endif
+
 if WITH_SELINUX
 AM_CPPFLAGS += -DWITH_SELINUX
 endif
diff --git a/configure.ac b/configure.ac
index 1f862ec1d2d74..b64841c2b42e8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -66,6 +66,7 @@ need_pthread="no"
 need_uuid="no"
 need_zlib="no"
 need_lzo="no"
+need_zstd="no"
 need_xattr="no"
 need_cmocka="no"
 need_selinux="no"
@@ -138,6 +139,7 @@ AM_COND_IF([BUILD_UBIFS], [
 	need_xattr="yes"
 	need_zlib="yes"
 	need_lzo="yes"
+	need_zstd="yes"
 	need_openssl="yes"
 ])
 
@@ -164,6 +166,14 @@ AC_ARG_WITH([lzo],
 	*) AC_MSG_ERROR([bad value ${withval} for --without-lzo]) ;;
 	esac])
 
+AC_ARG_WITH([zstd],
+	[AS_HELP_STRING([--without-zstd], [Disable support for ZSTD compression])],
+	[case "${withval}" in
+	yes) ;;
+	no) need_zstd="no" ;;
+	*) AC_MSG_ERROR([bad value ${withval} for --without-zstd]) ;;
+	esac])
+
 AC_ARG_WITH([selinux],
 	[AS_HELP_STRING([--with-selinux],
 		[Enable support for selinux extended attributes])],
@@ -189,6 +199,7 @@ pthread_missing="no"
 uuid_missing="no"
 zlib_missing="no"
 lzo_missing="no"
+zstd_missing="no"
 xattr_missing="no"
 cmocka_missing="no"
 selinux_missing="no"
@@ -225,6 +236,10 @@ if test "x$need_lzo" = "xyes"; then
 	)
 fi
 
+if test "x$need_zstd" = "xyes"; then
+	PKG_CHECK_MODULES([ZSTD], [libzstd],, zstd_missing="yes")
+fi
+
 if test "x$need_xattr" = "xyes"; then
 	AC_CHECK_HEADERS([sys/xattr.h], [], [xattr_missing="yes"])
 	AC_CHECK_HEADERS([sys/acl.h], [], [xattr_missing="yes"])
@@ -283,6 +298,13 @@ if test "x$lzo_missing" = "xyes"; then
 	dep_missing="yes"
 fi
 
+if test "x$zstd_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find ZSTD library required for mkfs program])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.ubifs])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without ZSTD support])
+	dep_missing="yes"
+fi
+
 if test "x$xattr_missing" = "xyes"; then
 	AC_MSG_WARN([cannot find headers for extended attributes])
 	AC_MSG_WARN([disabling XATTR support])
@@ -314,6 +336,7 @@ fi
 ##### generate output #####
 
 AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])
+AM_CONDITIONAL([WITHOUT_ZSTD], [test "x$need_zstd" != "xyes"])
 AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" != "xyes"])
 AM_CONDITIONAL([WITH_SELINUX], [test "x$need_selinux" == "xyes"])
 AM_CONDITIONAL([WITH_CRYPTO], [test "x$need_openssl" == "xyes"])
diff --git a/include/mtd/ubifs-media.h b/include/mtd/ubifs-media.h
index e69ba1687134e..7751ac72c2288 100644
--- a/include/mtd/ubifs-media.h
+++ b/include/mtd/ubifs-media.h
@@ -343,12 +343,14 @@ enum {
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
+ * UBIFS_COMPR_ZSTD: ZSTD compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
 enum {
 	UBIFS_COMPR_NONE,
 	UBIFS_COMPR_LZO,
 	UBIFS_COMPR_ZLIB,
+	UBIFS_COMPR_ZSTD,
 	UBIFS_COMPR_TYPES_CNT,
 };
 
diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index b8e4075c9d2ae..164ce09cef586 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -22,8 +22,8 @@ mkfs_ubifs_SOURCES += ubifs-utils/mkfs.ubifs/crypto.c \
 		ubifs-utils/mkfs.ubifs/fscrypt.c
 endif
 
-mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm
-mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS)\
+mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm
+mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS)\
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubifs/
 
 UBIFS_BINS = \
diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/mkfs.ubifs/compr.c
index 8eff1865d96ef..7bbebf7a7d148 100644
--- a/ubifs-utils/mkfs.ubifs/compr.c
+++ b/ubifs-utils/mkfs.ubifs/compr.c
@@ -28,6 +28,9 @@
 #include <lzo/lzo1x.h>
 #endif
 #include <linux/types.h>
+#ifndef WITHOUT_ZSTSD
+#include <zstd.h>
+#endif
 
 #define crc32 __zlib_crc32
 #include <zlib.h>
@@ -109,6 +112,26 @@ static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
 }
 #endif
 
+#ifndef WITHOUT_ZSTD
+int zstd_comp_lvl = ZSTD_CLEVEL_DEFAULT;
+static ZSTD_CCtx *zctx;
+
+static int zstd_compress(void *in_buf, size_t in_len, void *out_buf,
+			 size_t *out_len)
+{
+	size_t ret;
+
+	ret = ZSTD_compressCCtx(zctx, out_buf, *out_len, in_buf, in_len,
+				zstd_comp_lvl);
+	if (ZSTD_isError(ret)) {
+		errcnt += 1;
+		return -1;
+	}
+	*out_len = ret;
+	return 0;
+}
+#endif
+
 static int no_compress(void *in_buf, size_t in_len, void *out_buf,
 		       size_t *out_len)
 {
@@ -192,6 +215,11 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
 		case MKFS_UBIFS_COMPR_ZLIB:
 			ret = zlib_deflate(in_buf, in_len, out_buf, out_len);
 			break;
+#ifndef WITHOUT_ZSTD
+		case MKFS_UBIFS_COMPR_ZSTD:
+			ret = zstd_compress(in_buf, in_len, out_buf, out_len);
+			break;
+#endif
 		case MKFS_UBIFS_COMPR_NONE:
 			ret = 1;
 			break;
@@ -219,18 +247,29 @@ int init_compression(void)
 #endif
 
 	zlib_buf = malloc(UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR);
-	if (!zlib_buf) {
-		free(lzo_mem);
-		return -1;
-	}
+	if (!zlib_buf)
+		goto err;
+
+#ifndef WITHOUT_ZSTD
+	zctx = ZSTD_createCCtx();
+	if (!zctx)
+		goto err;
+#endif
 
 	return 0;
+err:
+	free(zlib_buf);
+	free(lzo_mem);
+	return -1;
 }
 
 void destroy_compression(void)
 {
 	free(zlib_buf);
 	free(lzo_mem);
+#ifndef WITHOUT_ZSTD
+	ZSTD_freeCCtx(zctx);
+#endif
 	if (errcnt)
 		fprintf(stderr, "%llu compression errors occurred\n", errcnt);
 }
diff --git a/ubifs-utils/mkfs.ubifs/compr.h b/ubifs-utils/mkfs.ubifs/compr.h
index e3dd95ce1487b..d58c7c7bd313f 100644
--- a/ubifs-utils/mkfs.ubifs/compr.h
+++ b/ubifs-utils/mkfs.ubifs/compr.h
@@ -36,6 +36,7 @@ enum compression_type
 	MKFS_UBIFS_COMPR_NONE,
 	MKFS_UBIFS_COMPR_LZO,
 	MKFS_UBIFS_COMPR_ZLIB,
+	MKFS_UBIFS_COMPR_ZSTD,
 };
 
 int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 4b31979d9d2c2..7f66e842c494b 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -35,6 +35,10 @@
 #include <selinux/label.h>
 #endif
 
+#ifndef WITHOUT_ZSTD
+#include <zstd.h>
+#endif
+
 #include "crypto.h"
 #include "fscrypt.h"
 
@@ -158,7 +162,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqaK:b:P:C:";
+static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:L:j:UQqaK:b:P:C:";
 
 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
@@ -175,6 +179,7 @@ static const struct option longopts[] = {
 	{"jrn-size",           1, NULL, 'j'},
 	{"reserved",           1, NULL, 'R'},
 	{"compr",              1, NULL, 'x'},
+	{"comp-lvl",           1, NULL, 'L'},
 	{"favor-percent",      1, NULL, 'X'},
 	{"fanout",             1, NULL, 'f'},
 	{"space-fixup",        0, NULL, 'F'},
@@ -209,8 +214,8 @@ static const char *helptext =
 "-o, --output=FILE        output to FILE\n"
 "-j, --jrn-size=SIZE      journal size\n"
 "-R, --reserved=SIZE      how much space should be reserved for the super-user\n"
-"-x, --compr=TYPE         compression type - \"lzo\", \"favor_lzo\", \"zlib\" or\n"
-"                         \"none\" (default: \"lzo\")\n"
+"-x, --compr=TYPE         compression type - \"lzo\", \"favor_lzo\", \"zlib\"\n"
+"                         \"zstd\" or \"none\" (default: \"lzo\")\n"
 "-X, --favor-percent      may only be used with favor LZO compression and defines\n"
 "                         how many percent better zlib should compress to make\n"
 "                         mkfs.ubifs use zlib instead of LZO (default 20%)\n"
@@ -223,6 +228,7 @@ static const char *helptext =
 "-U, --squash-uids        squash owners making all files owned by root\n"
 "-l, --log-lebs=COUNT     count of erase blocks for the log (used only for\n"
 "                         debugging)\n"
+"-L, --comp-lvl=COUNT     compression level (for zstd)\n"
 "-y, --yes                assume the answer is \"yes\" for all questions\n"
 "-v, --verbose            verbose operation\n"
 "-V, --version            display version information\n"
@@ -518,6 +524,10 @@ static void select_default_compr(void)
 #endif
 }
 
+#ifndef WITHOUT_ZSTD
+extern int zstd_comp_lvl;
+#endif
+
 static int get_options(int argc, char**argv)
 {
 	int opt, i, fscrypt_flags = FS_POLICY_FLAGS_PAD_4;
@@ -632,6 +642,18 @@ static int get_options(int argc, char**argv)
 				return err_msg("bad count of log LEBs '%s'",
 					       optarg);
 			break;
+#ifndef WITHOUT_ZSTD
+		case 'L':
+			if (c->default_compr != UBIFS_COMPR_ZSTD)
+				return err_msg("Compression level can used only"
+					       " with the ZSTD compressor");
+			zstd_comp_lvl = strtoll(optarg, &endp, 0);
+			if (zstd_comp_lvl < 1 ||
+			    zstd_comp_lvl > ZSTD_maxCLevel())
+				return err_msg("Compression level must be 1 .. "
+					       "%d", ZSTD_maxCLevel());
+			break;
+#endif
 		case 'p':
 			c->orph_lebs = strtol(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg ||
@@ -654,6 +676,10 @@ static int get_options(int argc, char**argv)
 				c->default_compr = UBIFS_COMPR_NONE;
 			else if (strcmp(optarg, "zlib") == 0)
 				c->default_compr = UBIFS_COMPR_ZLIB;
+#ifndef WITHOUT_ZSTD
+			else if (strcmp(optarg, "zstd") == 0)
+				c->default_compr = UBIFS_COMPR_ZSTD;
+#endif
 #ifndef WITHOUT_LZO
 			else if (strcmp(optarg, "favor_lzo") == 0) {
 				c->default_compr = UBIFS_COMPR_LZO;
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
index 8f0186043079c..f1425c5af31a8 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -77,6 +77,9 @@
 #if MKFS_UBIFS_COMPR_ZLIB != UBIFS_COMPR_ZLIB
 #error MKFS_UBIFS_COMPR_ZLIB != UBIFS_COMPR_ZLIB
 #endif
+#if MKFS_UBIFS_COMPR_ZSTD != UBIFS_COMPR_ZSTD
+#error MKFS_UBIFS_COMPR_ZSTD != UBIFS_COMPR_ZSTD
+#endif
 
 extern int verbose;
 extern int debug_level;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
