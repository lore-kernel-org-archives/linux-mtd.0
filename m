Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905BEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3bBotF9ZP5KgGCzOA5dcX2cpv2oIm/OYrp3drOLVJQ=; b=uFozkZj9wk4wcP
	XQUqWJdBscQpPGEHYU1Xcn9FdmnF/v7gf9u00KynoX9KtyhL5mODHBnxIITw4rqORaZupKRYV/Mpb
	tpszcfHWsNTm51dO25eYZZUwdXNtPzSCT4HDW4hNFDjWKBhJwIKyx3+5C8KMAKZUPhR1WKDpF2I5H
	l+zJXMyiNfr7MRzRXcD+5qQdVJHpRBodgQUa9qL4M/XnVrqYu6Vov3gqDqvRdJOoXDzlpLjZ4RG2F
	r0Offyg7Zw1vRfzVJYvjiKO8oRTrey7QlBo9ONjTYLa+5fcKac6jCTJMKpxG1wRGs1JEMD2XQ02ua
	ExRiNS54B5DLlxpH208Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5cur-001dZt-I8; Fri, 07 Jan 2022 00:15:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ctX-001d9A-5y
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 196so3787836pfw.10
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjymxtvSAHzuripXcrJD4sdFOCg6SKx5Og6RNHAAYLc=;
 b=MGpGfRuqt4Yuwkq9IYK8nB59rRTrQpGt0xdwWcBlnJ8jTI0FXTnXADT82QvjTxKT+n
 iNauB7iptLi9ftqc08f1l9CvH1ZKjhsFVaJ2bGxdf+O70xiFOB54ntHeAlcsqaYGnsC7
 qzM1wKD0AJPDtChFSnAAC+X4fznY1+07hYoKCWm14VU5YnWref9YGUio7qIHgdKBsfbg
 cgHDfENCvW8e51cLB1gu/3O0bz9IH1UMmvtRO8AHoYxJTyWFJwbJX3w6lXm50EcqP3nZ
 nJR9wmAqeP8weA4nXOXuWiLZ2jRmeBLnxDtKm9IHudwwfWDIsvcl77F92iNw/xataZIO
 7eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjymxtvSAHzuripXcrJD4sdFOCg6SKx5Og6RNHAAYLc=;
 b=S5Ze4wb3r5NTXdCzA+JfJ3KWege59GXBG/MCERtyV3c6G8tg3oyOY/deiDjCYVXn8y
 aZ4Q2jjeHVMXjWXytA0cjQvH7Hr36a5Q8e2ofK3nG0S6QIsTTwAIyh7FOmjIikIhJ6TT
 kCBpj4n+6h2m5aZYrUBq48zgzY95ylplHJm4OnQfgVLzb4WSck0Ilcjjr6gRgCq+8kam
 feHgNkxFnuLItspDRTOYwCEs7OajTbMTCIj2YtKAdsZhzVQTpx++lwhMZGX5tn1gNuo0
 GrFTBV1ewIsYgZLA2jBTAIXdSNiL1mDQaKVgDlJD9AruNzUb6YlltyKpjC7SsBVz4OB9
 VCNg==
X-Gm-Message-State: AOAM530r3OQ7hcaSFXKdJ4lndMB41g14iwLG11X1qPYnzMFHAGQPn3ct
 tTaQpn7Q5nlj142INDMIVX8aPy71q/I=
X-Google-Smtp-Source: ABdhPJzDNmh5EoWEtS9OXTcEzCJS222a/iK4JdH9QhwRgbZ29nKgAyj1CHQ/xSanc64V87hPFkyKNA==
X-Received: by 2002:a63:7116:: with SMTP id m22mr53796704pgc.348.1641514449788; 
 Thu, 06 Jan 2022 16:14:09 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:09 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v2 5/9] mtd: rawnand: brcmnand: Allow working without
 interrupts
Date: Thu,  6 Jan 2022 16:13:24 -0800
Message-Id: <20220107001328.2233896-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107001328.2233896-1-f.fainelli@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161411_248538_23E77020 
X-CRM114-Status: GOOD (  16.23  )
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

The BCMA devices include the brcmnand controller but they do not wire up
any interrupt line, allow the main interrupt to be optional and update
the completion path to also check for the lack of an interrupt line.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 54 +++++++++++-------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index eb3f96489f83..08e2acde5133 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -216,7 +216,7 @@ struct brcmnand_controller {
 	void __iomem		*nand_base;
 	void __iomem		*nand_fc; /* flash cache */
 	void __iomem		*flash_dma_base;
-	unsigned int		irq;
+	int			irq;
 	unsigned int		dma_irq;
 	int			nand_version;
 
@@ -1610,7 +1610,7 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 	bool err = false;
 	int sts;
 
-	if (mtd->oops_panic_write) {
+	if (mtd->oops_panic_write || ctrl->irq < 0) {
 		/* switch to interrupt polling and PIO mode */
 		disable_ctrl_irqs(ctrl);
 		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
@@ -3144,35 +3144,29 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* IRQ */
-	ctrl->irq = platform_get_irq(pdev, 0);
-	if ((int)ctrl->irq < 0) {
-		dev_err(dev, "no IRQ defined\n");
-		ret = -ENODEV;
-		goto err;
-	}
-
-	/*
-	 * Some SoCs integrate this controller (e.g., its interrupt bits) in
-	 * interesting ways
-	 */
-	if (soc) {
-		ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
-				       DRV_NAME, ctrl);
+	ctrl->irq = platform_get_irq_optional(pdev, 0);
+	if (ctrl->irq > 0) {
+		/*
+		 * Some SoCs integrate this controller (e.g., its interrupt bits) in
+		 * interesting ways
+		 */
+		if (soc) {
+			ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
+					       DRV_NAME, ctrl);
 
-		/* Enable interrupt */
-		ctrl->soc->ctlrdy_ack(ctrl->soc);
-		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
-		if (brcmnand_soc_has_ops(soc))
-			static_branch_enable(&brcmnand_soc_has_ops_key);
-	} else {
-		/* Use standard interrupt infrastructure */
-		ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
-				       DRV_NAME, ctrl);
-	}
-	if (ret < 0) {
-		dev_err(dev, "can't allocate IRQ %d: error %d\n",
-			ctrl->irq, ret);
-		goto err;
+			/* Enable interrupt */
+			ctrl->soc->ctlrdy_ack(ctrl->soc);
+			ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
+		} else {
+			/* Use standard interrupt infrastructure */
+			ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
+					       DRV_NAME, ctrl);
+		}
+		if (ret < 0) {
+			dev_err(dev, "can't allocate IRQ %d: error %d\n",
+				ctrl->irq, ret);
+			goto err;
+		}
 	}
 
 	for_each_available_child_of_node(dn, child) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
