Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6188ED2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuNaL4TrPwW8HXInEek9pc5iBhx2TKqGzt9hWG7yxOc=; b=gmM0YGYIwWckvy
	/aylQ87d2d3L1pXQ25Bqd1C9dsZskbaysd9OM3VB1gyRlvifyK5YM2iXnuOFgqUjKjm5vrbu+Mkd1
	9N/5DBWngrmWWoOyOnYteRjEM8EmPnCUKmOaL3AswWzfbL1+guYABuRFzPl+E2vyUj7MGZObZXt/o
	9F1XSpIBfP+5mIpIjMNHhsi6m338cmdplWNL0tCGxPujIhNHvoIWf27RN0F0OptsMKZWpXQjdXNeM
	lxmsTq8VBJH0O+zvs3+R3QiNv3jgySk7X8BNEVczq3mSPMBkzKfH43W/nBDfGSqHfTOv3EzLMAFEp
	97PkiYAtvaJiferMmtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGJ-0000000GvdW-09Gq;
	Mon, 11 Nov 2024 08:59:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQG8-0000000GvTg-0EKM
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:58:58 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn3LQ4JcbzsRWl;
	Mon, 11 Nov 2024 16:56:14 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B90ED1800D0;
	Mon, 11 Nov 2024 16:58:53 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:58:53 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 044/102] ubifs-utils: Move ubifs-media.h in libubifs
Date: Mon, 11 Nov 2024 16:57:15 +0800
Message-ID: <20241111085741.2066378-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_005856_247951_5B7164FF 
X-CRM114-Status: UNSURE (   8.67  )
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
index 3211d84f..92b3dde8 100644
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
@@ -48,7 +48,7 @@ mkfs_ubifs_SOURCES = \
 mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
 		   $(DUMP_STACK_LD) -lm -lpthread
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
-	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common
+	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs
 
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
