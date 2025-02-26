Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989EFC021B8
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J2f5OMeoaPQOoB5kTOwUlYRhMyCDs2X5DRCTkfnEdYk=; b=2rn1l1j9U9Bhef
	67g5wduMn2pJWHsKLVDgFMdJRQr1CZ+jM1RWeHrOnKmzpmPra5MfqJQB49mxHpkKwfRJFdx2pCFoV
	ZHvtTqoY4PN7CBml4vNdGma8onrxFUwZ0iuvYJbYLUbN8BARStAzzjX8JvYi+fXyCysCSEKixoC7s
	ysZsIGTmARRuUrba+wlzwD38hx8RE7sHmj1vwZmtW1mZgkfPksc2sSYSRIEohBrx9gyoqqYM/612W
	/dETSGhw+JnWFWYy7o9t/GGyLQhWpt8b6mK2b1O0TM15hbvejFU8xSFVYwlfW2tsBQhcSwCfpaGMj
	PtcQhkNu1jsyhyIbe9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM4s-00000004wWg-0HwF;
	Wed, 26 Feb 2025 18:24:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnM4p-00000004wUA-0uGL
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 18:24:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A9FD1424
	for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 10:24:23 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1D4E3F5A1
	for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 10:24:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] ubifs-utils: link libmissing.a in case execinfo.h isn't present
Date: Wed, 26 Feb 2025 18:24:00 +0000
Message-ID: <20250226182400.1723418-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_102411_294085_89ACE48A 
X-CRM114-Status: UNSURE (   9.35  )
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

On musl execinfo.h doesn't exist, but ubifs-utils uses backtrace() when
reporting errors.  This results in build failures under musl.

Handily, libmissing.a already exists with a stub implementation of
backtrace().

Guard the execinfo.h include and if it isn't available instead include
libmissing.h, and link to libmissing.a to provide backtrace() if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ubifs-utils/Makemodule.am | 4 ++--
 ubifs-utils/common/defs.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 21ba059..f84569a 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -72,7 +72,7 @@ mkfs_ubifs_SOURCES = \
 	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
 
 mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
-		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
+		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread libmissing.a
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs
 
@@ -90,7 +90,7 @@ fsck_ubifs_SOURCES = \
 	ubifs-utils/fsck.ubifs/handle_disconnected.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
-		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
+		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread libmissing.a
 fsck_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs \
 	-I$(top_srcdir)/ubifs-utils/fsck.ubifs
diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index 7ff1771..d5edbf6 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -13,8 +13,11 @@
 #include <errno.h>
 #include <time.h>
 #include <assert.h>
+#if HAVE_EXECINFO_H
 #include <execinfo.h>
-
+#else
+#include "libmissing.h"
+#endif
 #include "ubifs.h"
 
 /* common.h requires the PROGRAM_NAME macro */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
