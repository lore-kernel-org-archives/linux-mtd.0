Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AACC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9i83gitIitQ3bTEenmrLmunWFwXKMeIEb/RD1bj5a0=; b=AmmxpuHcRP0PMX
	RWPPDa1FfHRjnLTc4P93/lHSCw6Ulob6iok1jIulRxdnoiFV6IiFy1mWf5x46OJ4z/qC9gzvZEVt1
	N37n6mvdgTxc5tmjy5L952lj4MKwiYD7bHW5T6T0KGrNjS1pTBp5JHcDyoLPxwVNWhYuaBDhCauPK
	KdWsfa+6qjN3bjXFN8UAKXuS/ouBrzKQZtUrMnOwx8Fem7CJMruNfJdHEfSzHHZL51ZqNF7YA1CAo
	eL/hbqyU51/UHbPb4rUSuw6KVu0TonUwn3BdPt+OHOKZ47HRh6kTyReY/iaigLBbvZTJCuywVXGfS
	zCVy6DttKw1A4FxSgQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSDR-0000000CUpM-1gQK;
	Fri, 07 Jun 2024 05:32:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCS-0000000CGoa-1WiD
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SWXfuxKIqvxwaRG0mRZChJCBlnJu2lqRPPr8vj7lYZI=; b=kJkqDjVfzvb6CANRuiNoC30NzO
	hgaAZ002ex3rSrqqFeLZQrz++5msdQTQb91my5Gf2aHc/IDFsR0dRIc9RFDYWkA234HQapbRXlzNl
	oZZ+W03aLI9+tU23iEzixobWcwJx1oZ9rr18HBDYqWiE8/CpOHRmouOOIvdJDa7Z9YbOyemSlrYKr
	cqVUKbsvFV1jYPtTUvEWhDZUp9KmyuEphvB50/VwFJadbVqLsx9MRGnIlBod8fJXK6sWjY32R6fPs
	yNn2HxYsfhNDUcudTwmskIPoyyp7ylFRIlmbZiZtp2DK2J5L3vL98ceoz9A8kfIoinPpOTtZWOZax
	+h4jxcJA==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCN-00000004Tsm-0yEV
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VwSkt13WFzPpnL;
	Fri,  7 Jun 2024 12:24:06 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E979180085;
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
Subject: [RFC PATCH mtd-utils 054/110] ubifs-utils: Add descriptions for new lib files in libubifs/README
Date: Fri, 7 Jun 2024 12:25:19 +0800
Message-ID: <20240607042615.2069840-55-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052731_998289_766F1BBB 
X-CRM114-Status: GOOD (  10.71  )
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
index d297f7a2..c02ec313 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -49,7 +49,7 @@ mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUI
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs -rdynamic
 
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
