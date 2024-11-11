Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E930D5E392
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLdGqsyupqKIpW0xfMwGg8dtRiY2aDE9TCNcL+oUEeo=; b=IcT5TE4F70Rnh9
	EGscM86d5RWik0UytkfdDYl9nUCkOTab5IhZd68k+R+pb1aa99JeDdnU3dLsM9NtI0xo7NhK2T4ec
	CICSy+AWlbdt3MHkGHZ6Hzu/TN1Wbhpf/7Jqpjc8tAjJRVIDWCkhZPdcmnDMC6GHM7JeB+Fq6UVdH
	X5/XaUHtdy8AYQg1NfPAVc5u6wyDo6aZW+Bb+cBbAyikRCQwQZVtpFTow/EKLBZa2erF3JdEmbtAl
	9iN6VH/yo5eIxMqWLAEVtRfz49EZlqt3fJ1rQf0x/+KL0wjaF976175qd6KUXoPP/JwAagxsCaeW4
	QF2EAn3aMJ7ZTrU1Qjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaT-0000000GmP4-2oyo;
	Mon, 11 Nov 2024 08:15:53 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUH-0000000GZCE-2gy3
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0n63npSz28fQJ;
	Mon, 11 Nov 2024 15:00:42 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DDE2A1402CE;
	Mon, 11 Nov 2024 15:05:23 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:23 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 045/102] ubifs-utils: Add descriptions for new lib files in libubifs/README
Date: Mon, 11 Nov 2024 15:02:48 +0800
Message-ID: <20241111070346.1314122-46-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230526_207130_9671DB76 
X-CRM114-Status: GOOD (  11.93  )
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

There are many linux kernel source files have been adapted into
ubifs-utils, add descriptions for these source files in README.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am   |  2 +-
 ubifs-utils/libubifs/README | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/libubifs/README

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 92b3dde8..14015751 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -50,7 +50,7 @@ mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUI
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs
 
-EXTRA_DIST += ubifs-utils/common/README
+EXTRA_DIST += ubifs-utils/common/README ubifs-utils/libubifs/README
 
 dist_sbin_SCRIPTS = ubifs-utils/mount.ubifs
 
diff --git a/ubifs-utils/libubifs/README b/ubifs-utils/libubifs/README
new file mode 100644
index 00000000..551ed8e6
--- /dev/null
+++ b/ubifs-utils/libubifs/README
@@ -0,0 +1,30 @@
+UBIFS Library (Imported from linux kernel 6.8-rc2 41bccc98fb7931d63)
+
+* ubifs.h is a selection of definitions from fs/ubifs/ubifs.h from the linux kernel.
+* key.h is copied from fs/ubifs/key.h from the linux kernel.
+* ubifs-media.h is copied from fs/ubifs/ubifs-media.h from the linux kernel.
+* find.c is copied from fs/ubifs/find.c from the linux kernel.
+* scan.c is copied from fs/ubifs/scan.c from the linux kernel.
+* gc.c is copied from fs/ubifs/gc.c from the linux kernel.
+* log.c is copied from fs/ubifs/log.c from the linux kernel, and amended.
+* tnc_commit.c is copied from fs/ubifs/tnc_commit.c from the linux kernel, and amended.
+* master.c is copied from fs/ubifs/master.c from the linux kernel, and amended.
+* recovery.c is copied from fs/ubifs/recovery.c from the linux kernel, and amended.
+* lpt.c is a selection of functions copied from fs/ubifs/lpt.c from the linux kernel, and amended.
+* auth.c is a selection of functions copied from fs/ubifs/auth.c from the linux kernel, and amended.
+* budget.c is a selection of functions copied from fs/ubifs/budget.c from the linux kernel, and amended.
+* commit.c is a selection of functions copied from fs/ubifs/commit.c from the linux kernel, and amended.
+* debug.c is a selection of functions copied from fs/ubifs/debug.c from the linux kernel, and amended.
+* debug.h is a selection of functions copied from fs/ubifs/debug.h from the linux kernel, and amended.
+* io.c is a selection of functions copied from fs/ubifs/io.c from the linux kernel, and amended.
+* lprops.c is a selection of functions copied from fs/ubifs/lprops.c from the linux kernel, and amended.
+* lpt_commit.c is a selection of functions copied from fs/ubifs/lpt_commit.c from the linux kernel, and amended.
+* misc.h is a selection of functions copied from fs/ubifs/misc.h from the linux kernel, and amended.
+* orphan.c is a selection of functions copied from fs/ubifs/orphan.c from the linux kernel, and amended.
+* replay.c is a selection of functions copied from fs/ubifs/replay.c from the linux kernel, and amended.
+* sb.c is a selection of functions copied from fs/ubifs/sb.c from the linux kernel, and amended.
+* super.c is a selection of functions copied from fs/ubifs/super.c from the linux kernel, and amended.
+* tnc.c is a selection of functions copied from fs/ubifs/tnc.c from the linux kernel, and amended.
+* tnc_misc.c is a selection of functions copied from fs/ubifs/tnc_misc.c from the linux kernel, and amended.
+* journal.c is a selection of functions copied from fs/ubifs/journal.c from the linux kernel, and amended.
+* dir.c is a selection of functions copied from fs/ubifs/dir.c from the linux kernel, and amended.
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
