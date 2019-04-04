Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF4DC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 10:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDED204EC
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 10:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRmRbwcD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CDED204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0qz+QqM4TlWNBPlEYs9H1tEAaqszY51VUO22A8m9RMk=; b=oRmRbwcDpi47Ez
	b9GG62++j+ypb2K1N9ip3NLhtO1fEwNJVykyAWCDq8SFP3JnP/iGEwSCsj+Ciq04/4HjjkTxoL+9i
	JflvDbtTfHElRkYnKWJfvHgJtr0sr0+t0rMRyAp2c3hEGtsPgCO4K1wjXS6E6Elb6eGLeTvUK7wx6
	FHQYr67nFijAv5vGisZB/3rTyXyL1PlzhuS5yf+azUpzTL96SglF47kaQK5YCKTrhfZKQ2iV220pY
	m65jyW3rTUOnYxwLF8Qcu5FDlceCGkHHTJVbaRn2IwtoOMetAseXwY5xnsPh2pDetbFmk7lOR5JNa
	O52KolAHI2lVF14HfLWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBzuA-0000St-Oe; Thu, 04 Apr 2019 10:47:34 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBzu6-0000Rn-Ts
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 10:47:32 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D96BF34CE1D455304EA7;
 Thu,  4 Apr 2019 18:47:23 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Thu, 4 Apr 2019
 18:47:16 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <bbrezillon@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <paul@crapouillou.net>
Subject: [PATCH -next] mtd: rawnand: ingenic: Add missing MODULE_* information
Date: Thu, 4 Apr 2019 18:47:11 +0800
Message-ID: <20190404104711.23560-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_034731_146557_6FB6909C 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: YueHaibing <yuehaibing@huawei.com>

gcc warning this:

WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/raw/ingenic/ingenic_ecc.o

Add MODULE_LICENSE,MODULE_AUTHOR and MODULE_DESCRIPTION.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 9df5741a577e ("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index 7b07a6a..77e996e 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -158,3 +158,8 @@ int ingenic_ecc_probe(struct platform_device *pdev)
 	return 0;
 }
 EXPORT_SYMBOL(ingenic_ecc_probe);
+
+MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
+MODULE_AUTHOR("Harvey Hunt <harveyhuntnexus@gmail.com>");
+MODULE_DESCRIPTION("Ingenic ECC common driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
