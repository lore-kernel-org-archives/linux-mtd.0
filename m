Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5548FC27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wd1uJAaHOygzmM6UgNABqu66gnfPcFK4lknDPFnwl88=; b=bRrUpTheQkNF1k
	zEcllCQ7LthQGAQ86Iy4x9X5pkvr11/uspwaTmRtfn2gRJ9AHntgLEGwm9AGxT1YP4+jrlOy7Q4uq
	QLDmYevuEJvit0h7U4yQ6cSu/yM/eAq1zRmUF2ON7hNtIkRhmtzAo3WYV+9rBLVOLxo3i4tuvIlOL
	hGpstrrm+haxw0b6Zz2gCcsVLNmCN6NWIfxQoym0+qOE4i0v9frfvT79bvZ2tbepNeWOYZ9+5YBnc
	eEEwsBWol6khUyleTrZphKKZNKWCsDVxbOeyxm8kkIWJlvQI/dJwxT/k6mXimzkgmiH6MVBX2uEhE
	rZsvDZEwdNSrZ0ekkxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRG5-0000000CJfF-3E7O;
	Fri, 07 Jun 2024 04:31:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCs-0000000CHA7-0uAt
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3j94b2DtJ7EyIpOmCC0Xn4vieJGC3WAikLFfGh5r/nI=; b=Nq55ED5q0ahsOJd4T8IyidqXCG
	I7CwTKRq3c3eXz+7hDxV56RUgR9T7T8gx1jZz4yQrl8CsbeDrtrq4l2b59makKVGvVgX2MvPqmdzv
	PeJ6y/8dzby6GCh60yy1lRPY+82uDUWqCouSrrtowqfh6dIfEok8h++gRRsb2rpuqCePUju2KP77Y
	Q3xPDuQ9S5/clFbJXGDgINzM+pH+MofVgxS2bUM4zZ8TpSjAbYrPD8jwEKAzq16TP8PNxFEvg6bx9
	6XvhD/Px/niYMYdiJjS96U0pVf2HDZlvQeyJllJAEgiZ9vZaXgzTCMb1yeEbtKatZB9Qv9cjxOZ1c
	isPXy01w==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCo-00000004U6K-386j
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSk63LHtzwPFT;
	Fri,  7 Jun 2024 12:23:26 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EC5D180AA6;
	Fri,  7 Jun 2024 12:27:25 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:06 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 053/110] ubifs-utils: Move ubifs-media.h in libubifs
Date: Fri, 7 Jun 2024 12:25:18 +0800
Message-ID: <20240607042615.2069840-54-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052759_147903_2BC91FC7 
X-CRM114-Status: UNSURE (   8.11  )
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

Since ubifs-media.h is only used for ubifs-utils, move it under
ubifs-utils/libubifs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am                           | 4 ++--
 ubifs-utils/common/ubifs.h                          | 2 +-
 {include/mtd => ubifs-utils/libubifs}/ubifs-media.h | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename {include/mtd => ubifs-utils/libubifs}/ubifs-media.h (100%)

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index cb4e1cf1..d297f7a2 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -31,7 +31,7 @@ common_SOURCES = \
 	ubifs-utils/common/lpt.c \
 	ubifs-utils/common/super.c \
 	ubifs-utils/common/sign.h \
-	include/mtd/ubifs-media.h
+	ubifs-utils/libubifs/ubifs-media.h
 
 if WITH_CRYPTO
 common_SOURCES += ubifs-utils/common/crypto.c \
@@ -47,7 +47,7 @@ mkfs_ubifs_SOURCES = \
 
 mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm -lpthread
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
-	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -rdynamic
+	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs -rdynamic
 
 EXTRA_DIST += ubifs-utils/common/README
 
diff --git a/ubifs-utils/common/ubifs.h b/ubifs-utils/common/ubifs.h
index 5a909f63..ed297cc7 100644
--- a/ubifs-utils/common/ubifs.h
+++ b/ubifs-utils/common/ubifs.h
@@ -25,7 +25,7 @@
 #ifndef __UBIFS_H__
 #define __UBIFS_H__
 
-#include <mtd/ubifs-media.h>
+#include "ubifs-media.h"
 #include "libubi.h"
 
 /* Maximum logical eraseblock size in bytes */
diff --git a/include/mtd/ubifs-media.h b/ubifs-utils/libubifs/ubifs-media.h
similarity index 100%
rename from include/mtd/ubifs-media.h
rename to ubifs-utils/libubifs/ubifs-media.h
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
