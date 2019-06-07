Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F995C2BCA1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 16:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E8A208C3
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 16:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jp431NR0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="fdNdUy/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E8A208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6bJTMJxC0jdWwOmGswOMBALPLkE+LkFyUWvwULxoEQ=; b=Jp431NR0+pJ7B9
	Le0ugFt99N5sF/Sp7+RBTif67IZf5X8Re1eHWfWFmJt6ClXvTMyGtUj4oG3or32Zk+jkacci+RdsO
	NMMa1L9rOK2YOiyqNs0OOEaaZDQZKx657EeCjDTa5OvWvtHjJZ7OGG8eJY1p9eg6EwFxjQoXUWNy+
	KY4HpgUUNSe1xY1GVh/YPU/56Xez9HyoSLOOJ0FwzLnuwnHWynWCbN71B20Arb1xjBbtam4RzYZIj
	zv3gsIprlVhCS7ZbwzTskKAIZ5VkMfwUz7uf8Qds14pZRplfU8btIZrH7yLvppPIibxFQTu0fPV/7
	8VacXnFdoi+0s0wSd9/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZHKd-0007ci-5v; Fri, 07 Jun 2019 16:03:07 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZHKM-0007Mm-1z
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2019 16:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1559923363; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVwrMcOcSydsdoB2Vv8m9KiILY45YMjy1Ki46blBbCg=;
 b=fdNdUy/Y1risixnQhQvkBHePcQaIwgehM6qcOgDx1M2IwZdalgo6yQHnBIY+L6xpYqX4R5
 b/yRV+3CRlark93gHlvidve0mEKWEPLb095TBxRda7LfRj0WDxIk7QKfYkjDyaY9N60LH/
 lq9/Hduqj21qiSlmQj+Kd2a2s9DO9OQ=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] mtd/rawnand: ingenic-nand: Make probe function
 __init_or_module
Date: Fri,  7 Jun 2019 18:02:00 +0200
Message-Id: <20190607160200.16052-2-paul@crapouillou.net>
In-Reply-To: <20190607160200.16052-1-paul@crapouillou.net>
References: <20190607160200.16052-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_090250_286869_2E469A51 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This allows the probe function to be dropped after the kernel finished
its initialization, in the case where the driver was not compiled as a
module.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
index d7b7c0f13909..b7f2facb4b37 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
@@ -302,7 +302,7 @@ static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.attach_chip = ingenic_nand_attach_chip,
 };
 
-static int ingenic_nand_init_chip(struct platform_device *pdev,
+static int __init_or_module ingenic_nand_init_chip(struct platform_device *pdev,
 				  struct ingenic_nfc *nfc,
 				  struct device_node *np,
 				  unsigned int chipnr)
@@ -399,7 +399,7 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 	}
 }
 
-static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
+static int __init_or_module ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 				   struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -427,7 +427,7 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 	return 0;
 }
 
-static int ingenic_nand_probe(struct platform_device *pdev)
+static int __init_or_module ingenic_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	unsigned int num_banks;
@@ -473,7 +473,7 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ingenic_nand_remove(struct platform_device *pdev)
+static int __exit ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
-- 
2.21.0.593.g511ec345e18


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
