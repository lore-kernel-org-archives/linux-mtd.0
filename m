Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0476FD12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szYjpatDihRlqKZwRcaBnLwP4w/nQgK/FCCdzZTtLRY=; b=2q1WAv09AfxS7J
	UivLJ/NFPjv384VPGf56DElfzA9ugdsUZdS1a1PuJAbVY918GyoABnsU/IIuGAFs/n5BWTrxRd0ta
	shjWT7ZSA+48wlCAE2AV7eeUhpo+J6Re1gRqmrRqYBg3BbXHgA51GMEpQhMIms5KNsedQZVOCse4C
	alMhT3bEYRQE6AUds7Vi1h+7CjQshwKVg+LCkTpqyFPkNjYBlJ0dJvgkX67oB3U7dZ01P9dbmmbD6
	ZdSxpxCZI7h+2k+HEiwpSXl8MWRSJlomiXqgochwzG3nrIcb9av+jusuEYpKGQibdy2+dg3p3Ft+h
	rWxnL3OdKbv7BCRMD2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOX5-0000000GbVu-2rkA;
	Mon, 11 Nov 2024 07:08:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVC-0000000GZzh-0yT4
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+//KDrDoXrCNay7QRZn9vELi2shBnOQW6iNpT6zzfUw=; b=LAQtTV0p7xDarJS/RPKxd6y2YL
	DF6hZVwXr55yA6wAFzHKp0WWLBA2GqQM4egb/dGkEK6wkJ1g/Bv7ufMv12igt/fT3ruKmmRjUeZ8d
	ATfv7ggFEUDClJPxWXkGtSu4I5WnBK/4FX56prt9PMkdVEB/gt2CiYxlHs9IOkC+ZUVBaapl1FEAI
	FrzNXkPpW0nxRID3+IN0SBOzUo/GRhwd9d8JDIG296af3LK9BthlKn//izaOrPatjqBnJ/+D+YaKz
	FX/NXZoBNjqtqKV42A5jZzzmvzW1ITQj12cHhvHnEWRSYaC6CYtZjqs7CckCHLL4oIgmlIzE98769
	L/+kRb9Q==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV4-0000000CR2h-3XZQ
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rv48NGzpZQG;
	Mon, 11 Nov 2024 15:03:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B55811401F1;
	Mon, 11 Nov 2024 15:05:52 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 102/102] ubifs-utils: Support Address-Sanitizier debug
Date: Mon, 11 Nov 2024 15:03:45 +0800
Message-ID: <20241111070346.1314122-103-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070615_865086_4CCF4372 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add new option '--asan' for configuration to support dynamic
Address-Sanitizier debugging, which could detect kinds of invalid
memory accessing problems(eg. UAF, r/w OOB, etc.). Currently, only
ubifs-utils(mkfs.ubifs/fsck.ubifs) is supported.
Enable Address-Sanitizier debugging with configuration:
  ./configure --enable-asan

Notice: The Address-Sanitizier will stop the program and print
problems if memory problems are detected. Sometimes the memory
problems come from third libs(not mtd-utils), which could stuck
the testcases.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 configure.ac              | 14 ++++++++++++++
 ubifs-utils/Makemodule.am |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 7b5d6096..b160c037 100644
--- a/configure.ac
+++ b/configure.ac
@@ -105,6 +105,10 @@ AC_ARG_WITH([crypto],
 	[AS_HELP_STRING([--with-crypto], [Support for UBIFS crypto features])],
 	[], [with_crypto="check"])
 
+AC_ARG_ENABLE([asan],
+	[AS_HELP_STRING([--enable-asan], [Support AddressSanitizer debug])],
+	[], [enable_asan="no"])
+
 ##### search for dependencies #####
 
 need_clock_gettime="no"
@@ -146,6 +150,14 @@ AS_IF([test "x$with_zlib" != "xno"], [
 				       [with_zlib="no"])])
 ], [])
 
+AC_ARG_VAR([ASAN_LIBS], [linker flags for lasan])
+AS_IF([test "x$enable_asan" = "xyes"], [
+	AC_CHECK_LIB([asan], [_init], [
+		ASAN_LIBS="-lasan -fsanitize=address -fsanitize-recover=address -g"], [
+		AC_MSG_ERROR([cannot find libasan])
+	])
+])
+
 if test "x$need_uuid" = "xyes"; then
 	PKG_CHECK_MODULES(UUID, [uuid], [],
 			  [PKG_CHECK_MODULES_STATIC(UUID, [uuid], [], [uuid_missing="yes"])])
@@ -275,6 +287,7 @@ AM_CONDITIONAL([WITH_XATTR], [test "x$with_xattr" = "xyes"])
 AM_CONDITIONAL([WITH_SELINUX], [test "x$with_selinux" = "xyes"])
 AM_CONDITIONAL([WITH_CRYPTO], [test "x$with_crypto" = "xyes"])
 AM_CONDITIONAL([WITH_UBIHEALTHD], [test "x$enable_ubihealthd" = "xyes"])
+AM_CONDITIONAL([WITH_ASAN], [test "x$enable_asan" = "xyes"])
 
 AM_CONDITIONAL([BUILD_UBIFS], [test "x$with_ubifs" = "xyes"])
 AM_CONDITIONAL([BUILD_JFFSX], [test "x$with_jffs" = "xyes"])
@@ -321,6 +334,7 @@ AC_MSG_RESULT([
 	compiler:          ${CC}
 	cflags:            ${CFLAGS}
 	ldflags:           ${LDFLAGS}
+	asan debug:        ${enable_asan}
 
 	lzo support:       ${with_lzo}
 	zlib support:      ${with_zlib}
diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index a511c40d..21ba0597 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -72,7 +72,7 @@ mkfs_ubifs_SOURCES = \
 	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
 
 mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
-		   $(DUMP_STACK_LD) -lm -lpthread
+		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs
 
@@ -90,7 +90,7 @@ fsck_ubifs_SOURCES = \
 	ubifs-utils/fsck.ubifs/handle_disconnected.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
-		   $(DUMP_STACK_LD) -lm -lpthread
+		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
 fsck_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs \
 	-I$(top_srcdir)/ubifs-utils/fsck.ubifs
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
