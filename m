Return-Path: <SRS0=P+6h=ND=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1AAC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 11:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E824F60F91
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 11:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E824F60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wuxrw/bU7Czv/Th7GUoIyCJi9BGykmVIuqgnShVRhlI=; b=KOGFC+D6AxYX3p
	W9K7deYCGnJ2HMENfTcHpW2SNq0q7fMIHFZds2+kZD4HtvoNZauaR7CukPFe9BUURp/hFO9y8lTU8
	E8lonKdojnDFNaXZ6jJracB1RAvl85wZQuxEsvSUHDl+AYPAuT5VvqCikl6VWh1dUDDCYuZPq/n4f
	Z4uM6xO8EC+R260hbM2A4i2ZFHHqy2j90EQVdg03dKY4zY0Ek4Jokw8udYhowvYNpMrrXi2F3/M1R
	krNdPAQBndcXAHCFQ42CHKYwo14NCuDbQRTrAkGL5WbFAHQnCh7rr9chOMjBchObYrW3mREjf1YaV
	ryn6K1dquBA5OTdoaLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE92I-009qum-Fn; Thu, 12 Aug 2021 11:38:10 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE92F-009qtr-Mn
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 11:38:09 +0000
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
 by mail.ispras.ru (Postfix) with ESMTPS id 1227C40A2BB0;
 Thu, 12 Aug 2021 11:38:06 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Evgeny Novikov <novikov@ispras.ru>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: [PATCH] mtd: rawnand: mxic: Enable and prepare clocks in probe
Date: Thu, 12 Aug 2021 14:38:00 +0300
Message-Id: <20210812113800.12466-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_043807_958756_BC1011C8 
X-CRM114-Status: GOOD (  10.57  )
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

It seems that mxic_nfc_probe() missed invocation of
mxic_nfc_clk_enable(). The patch fixed that. In addition, error handling
was refined appropriately.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index da1070993994..37e75bf60ee5 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -509,9 +509,15 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->send_dly_clk))
 		return PTR_ERR(nfc->send_dly_clk);
 
+	err = mxic_nfc_clk_enable(nfc);
+	if (err)
+		return err;
+
 	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(nfc->regs))
-		return PTR_ERR(nfc->regs);
+	if (IS_ERR(nfc->regs)) {
+		err = PTR_ERR(nfc->regs);
+		goto fail;
+	}
 
 	nand_chip = &nfc->chip;
 	mtd = nand_to_mtd(nand_chip);
@@ -527,8 +533,10 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		err = irq;
+		goto fail;
+	}
 
 	mxic_nfc_hw_init(nfc);
 
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
