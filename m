Return-Path: <SRS0=yHHw=H4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A68C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Feb 2021 10:25:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F1564EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Feb 2021 10:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0F1564EC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aY3yadLAXsfF2PKhjlqRl74AkKcy3FrvOrqdOJRuw6U=; b=LPhCHQq1kWm+70Cy03N/FenHt7
	8CLdyMClvxzfbTjyrF3FDZyhxOMEWerntNyFzAc4Tm1U+B0G3VBnm6R8+Bt6OH8NkaGNRagXD2sFo
	ob2zE1mTwwjnhEzrLHPphcC59+l9vTgnErvhSXEO9EsOD3qpo19nE9zixxU8ZkhTYDVOST4HdMl11
	2sIz+sCD1TDZLe9AxtdESdfQp5bfcUgQTW5bEry5WjhJY7yecazB8ki2a9i78iVsVJj896+M2FPIq
	nYZII4vE5Vh+1QJxV4c/aDGIZtJgrckt3pHr/DxjMgnArSSs51CSU7YjZIoVeGkG6KGh2MuVYj0wM
	Nj88nujw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFaIT-0001UW-8b; Fri, 26 Feb 2021 10:24:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFaIM-0001TS-Pg
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2021 10:24:31 +0000
Received: from [2a0a:edc0:0:c01:1d::a2]
 (helo=drehscheibe.grey.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lFaIJ-0004Uw-6r; Fri, 26 Feb 2021 11:24:23 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lFaII-00060H-FZ; Fri, 26 Feb 2021 11:24:22 +0100
Received: from sha by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lFaII-006D2U-Ec; Fri, 26 Feb 2021 11:24:22 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: Use AC_SYS_LARGEFILE
Date: Fri, 26 Feb 2021 11:24:21 +0100
Message-Id: <20210226102421.1480045-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_052426_847592_1B9DAA57 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently mtd-utils on 32bit systems fail on devices >2GiB due to off_t being
a signed 32bit type. Add AC_SYS_LARGEFILE to make off_t a 64bit type.
Adding AC_SYS_LARGEFILE results in _FILE_OFFSET_BITS being defined to 64
in include/config.h. To let this have an effect we must make sure that
include/config.h is included before all other includes which is
archieved by adding its inclusion to CPPFLAGS.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Makefile.am          | 3 ++-
 configure.ac         | 2 +-
 include/common.h     | 2 --
 include/libmissing.h | 2 --
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index d4de62c..9da38af 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,6 +1,7 @@
 ACLOCAL_AMFLAGS = -I m4
 
-AM_CPPFLAGS = $(WARN_CFLAGS) -D_GNU_SOURCE -std=gnu99 -I$(top_srcdir)/include
+AM_CPPFLAGS = $(WARN_CFLAGS) -D_GNU_SOURCE -std=gnu99 -I$(top_srcdir)/include \
+		-include $(top_builddir)/include/config.h
 
 if WITHOUT_XATTR
 AM_CPPFLAGS += -DWITHOUT_XATTR
diff --git a/configure.ac b/configure.ac
index a792bd1..c57cf46 100644
--- a/configure.ac
+++ b/configure.ac
@@ -23,7 +23,7 @@ AC_PROG_LIBTOOL
 AC_DISABLE_STATIC
 AC_PROG_CC
 AC_PROG_INSTALL
-
+AC_SYS_LARGEFILE
 
 m4_ifndef([PKG_PROG_PKG_CONFIG],
   [m4_fatal([Could not locate the pkg-config autoconf
diff --git a/include/common.h b/include/common.h
index 7270769..31b6cd1 100644
--- a/include/common.h
+++ b/include/common.h
@@ -31,8 +31,6 @@
 #include <unistd.h>
 #include <sys/sysmacros.h>
 
-#include "config.h"
-
 #ifndef PROGRAM_NAME
 # error "You must define PROGRAM_NAME before including this header"
 #endif
diff --git a/include/libmissing.h b/include/libmissing.h
index 0196033..0fb0cf4 100644
--- a/include/libmissing.h
+++ b/include/libmissing.h
@@ -1,8 +1,6 @@
 #ifndef LIBMISSING_H
 #define LIBMISSING_H
 
-#include "config.h"
-
 #ifdef HAVE_EXECINFO_H
 #include <execinfo.h>
 #endif
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
