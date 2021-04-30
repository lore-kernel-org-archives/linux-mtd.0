Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9ADC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 06:51:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFC2613E8
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 06:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFC2613E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FIKrJ05Z571EeuLS4Z5XqH9pp0qKzk4vkpPA3g26nu0=; b=Xl+PtcObWJimhuLUtrigGkD3gQ
	vrl4BRfkqrPCzuxFpIB5ucLtocF4rday8r6gH+ldavCnqkYJVFC8tP/mzz9NbygTvVsCCRhmkTv9R
	llJDSfZUJk/OYLBo/qwIVk9irvaaT4VlLSot6kxzD0uQ79KvQPDHfvl4f8a21b7yacRNbjzdM//wU
	8uDmJ0VIgSWJvqlQ9xmbk09zpgXnvxWvc4tXYwqdnoPzUBvqS9mSUJCj/yBxCeL1VYg0IfFbnHrW7
	uSTLfXT8A8fGBIS3cjxsv71Bx+wGnuMGXtSFaEBTZVQVWctCKcXXjWMZl18Zfped7NT56K4tCmVpA
	6SKO/YoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcMza-007Nc7-6B; Fri, 30 Apr 2021 06:51:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcMzX-007Nba-KY
 for linux-mtd@desiato.infradead.org; Fri, 30 Apr 2021 06:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0KRfznZTuM/jO4ilqCKxhVprbr78chsM5VnvUKT2TZQ=; b=lwNBlUXysdJuw8rYa35xh6vois
 I7AsGb/XyqtGfOZaOliF7sjlBEJOD9GLDzcRXa5hyGUKoFGwbb1UcgjRN1EMLy+iVKYSXyLt+ky96
 SrwNb1do5GT61XjvNLxNtfahuJt5w37VKA9a8Whi2O1kCJdpVdUS/rY1CWLcgFwY+Fq2UoitZwYGY
 XJEwqBIwQWwp7Ei5FVOStGraCFD84Es+7wNfx6815ejnc8wqpPG+RItUfLhwDqocoa0k3qsETKQPT
 xfzKC3bMlfDXgROX/CXAjcwiGskTQWM8cYDno+LfgPdvs4yMr0xA0nCAS5JzW3XvFcW/sxHV8w58g
 ttZAK5vQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcMzU-001BHU-QY
 for linux-mtd@lists.infradead.org; Fri, 30 Apr 2021 06:51:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id s82so2129962wmf.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Apr 2021 23:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0KRfznZTuM/jO4ilqCKxhVprbr78chsM5VnvUKT2TZQ=;
 b=w4owkoPn/X0937J/kiXHzvc2UhQDlqyTpaAsD65pbCF1GztVNQSLLB5Xd/bwWvm759
 54jdp6IxJUJ+71BRiK5YgrJwskaP8znmlBn1ZQlEgsO5pCDsKuIntNAkBVrcQktyKeZm
 tzO46PTWRQytxyEWGUH6O3Wzysir4Ww5g4AyvRIFmKXfe0P7v7AhUbYXfOGaZggxaALm
 95PBTd4xW9O/f5SOTlaGKtA9daQX4V6ZE4hBAYZd7clnk7wfhtYJAevx+Qibuy+s/pHK
 re+0Rei5xSUdzFIlyfV6KpBu66igG92f2EsqXhMfecOSEBqPCO48BcONhOG59VLiYH/s
 2Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0KRfznZTuM/jO4ilqCKxhVprbr78chsM5VnvUKT2TZQ=;
 b=DW4rAjp2HxBVvKYVNHbsiFgES281YILtQ+YIOpEIkPCiZJJa5H5NwmVTgAq7UkGOxV
 BhXohR7BKi8+k48bCGzj7MQR3QiguXYUV6sfNLvoAoSC6lnVDroT8n+YYdIi6Z9IMcGs
 XLQ+2DAbVhN6r8cPpKNb5gZrkO5AaZrMZPC6IXFuFcpZp16Z/IyQ76hI6SCD0PS7FoSc
 iz/3bdCEcAU/6U2m/KsSTnaLQAu5Phk0qXJmOqFd+F5GhVXuogQQtZnl5Jloo6U+SiYZ
 qT/dBuiBCYpRZvZZkEk4aWSO7wTSno6pz4/TwNJQmLD3jphZiPPSsV8R7WEVDJxNmTAJ
 HIUw==
X-Gm-Message-State: AOAM5337ok3Zo7vFeCewjkDUaCkDGxLL6c5FDaN0Di/jvqW7r0SenFmm
 QoMnjtzpztfO4IWLX7INRU0i8qMTnsS15P8f
X-Google-Smtp-Source: ABdhPJy5Xq6xSXMN7bfPOa3YB1UZCXhKQV1X71wcoaQaSjen/ujAsYWl6UcpGantJXxa+hp9Qc8Y3A==
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr4449459wmq.150.1619765466070; 
 Thu, 29 Apr 2021 23:51:06 -0700 (PDT)
Received: from ntb.petris.klfree.czf (snat2.klfree.cz. [81.201.48.25])
 by smtp.googlemail.com with ESMTPSA id d6sm1115174wrr.77.2021.04.29.23.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 23:51:05 -0700 (PDT)
From: Petr Malat <oss@malat.biz>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Petr Malat <oss@malat.biz>
Subject: [PATCH] mtd: Create partname and partid debug files for child MTDs
Date: Fri, 30 Apr 2021 08:50:57 +0200
Message-Id: <20210430065057.32018-1-oss@malat.biz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_235108_917996_CAB29EF6 
X-CRM114-Status: GOOD (  13.44  )
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

Partname and partid are set by the upper driver (spi-nor) on the master
MTD. If this MTD is partitioned and CONFIG_MTD_PARTITIONED_MASTER is
disabled, the master MTD is not instantiated and partname and partid
aren't available to the userspace.

Always read the partname and partid from the master MTD, they describe
the HW, which can't differ between master and its children.

Signed-off-by: Petr Malat <oss@malat.biz>
---
 drivers/mtd/mtdcore.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..66fa7f702174 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -361,6 +361,7 @@ static struct dentry *dfs_dir_mtd;
 
 static void mtd_debugfs_populate(struct mtd_info *mtd)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	struct device *dev = &mtd->dev;
 	struct dentry *root;
 
@@ -370,12 +371,12 @@ static void mtd_debugfs_populate(struct mtd_info *mtd)
 	root = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
 	mtd->dbg.dfs_dir = root;
 
-	if (mtd->dbg.partid)
-		debugfs_create_file("partid", 0400, root, mtd,
+	if (master->dbg.partid)
+		debugfs_create_file("partid", 0400, root, master,
 				    &mtd_partid_debug_fops);
 
-	if (mtd->dbg.partname)
-		debugfs_create_file("partname", 0400, root, mtd,
+	if (master->dbg.partname)
+		debugfs_create_file("partname", 0400, root, master,
 				    &mtd_partname_debug_fops);
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
