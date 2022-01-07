Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E36C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=su8CVhuCZ6PjfEaPJPS0xM+1m48KWjU93HJ2SMfSmAs=; b=PHTjbCuoaJNI81
	GyfV2NdLasI39PlWV1z2E6FenqONMLeDSshR2jMY2D0YyWM0YmIlSdfbnTlfSK4YAJMHBI7xDSGGW
	AkFowJUDRxScMlLbTv+TlB1T/K8SqfzL1RgYH5skfZHVq0Ja7hGMxgIiSdGG/sRCw6TZ0g+nXYTNO
	tqd883YY2qZ1R0LiZzoB4AkJtvGXdOjBtEdw1iZ+thvEmrB9Dt5wEuzVJlu6mVYf798PtSd5589b1
	QfEi/njDBlnP6z4mD+oDMuu2L6UZdQIcHGvJXM1+wGJb9BIVAgkwnCTHysLYgu7/XJtXqzzKUShxN
	CLySNhY+Lw+0tKiNIX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uHl-004wtS-Df; Fri, 07 Jan 2022 18:48:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uG4-004w1E-8O
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:37 +0000
Received: by mail-pl1-x634.google.com with SMTP id q14so5528473plx.4
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VtXa0JLQVvOi+abLVd3TXrF3D9fiUE3Nqg2B33JgGDE=;
 b=CF8Nt9xqrZ8z196sYsHi9Cn5s+V2Z6Vg2+nrGzD1GDpNAldFZSGmioe66CgmzlavLl
 3J726lPy2s3fplaVUDfuy7CwLDcvW6faEvIAWZhcQz4ecVtayt8HAcyeBj/1BXeP8+LA
 IWxMgNBdjp20VXY51YnhT6Ove5OXv1Cgif0G6mR+sh1QDpgKotG5RizK2MiIAMLM+S0i
 IcGwENp3QQ3DqmurhqMqfOcF1DW3mLCni5xZvqCRhvSu9oUvqNa7aet6onHaaFXryce1
 ZHHFu9CH4T0LlVvy7ns3NufmiHkrfHYzacDn2rVVwgvgEgw5luVqFu1yaNTPNDt/tQBv
 tMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VtXa0JLQVvOi+abLVd3TXrF3D9fiUE3Nqg2B33JgGDE=;
 b=2xwCeiSsmcLY3vi3T64fCDNbyFP+YFvxSPBGI8bGeZOJROtzmuB6cdqBuipqEkPVC7
 nAafn7usITHyJA1LjEWVJmHf1NULUZB2PnJgGJz0Vmfbioxc1vJVB7uEipXYozS/iqwg
 GG6uzBPybF7Apk4/fafy2i6y7oKZHvD549Ew2rDGd6p5iYRMdzAEXUJMcFpZk8wdp4Xo
 QLddhNYJZxs566SsIPoMiKNSLvvpCz67tqXGvMK60xDHjZPs51BhIPQQNMGE4Y8Gg0c6
 0PbejBLVCWGkgSJ6wk5eh18M69U5oJ5PsSsAJMivYabdhNBVyzowYV3iVSuJ95Hx25qu
 jXlA==
X-Gm-Message-State: AOAM532FRe/r4WeJWnqPF7HcJF2eoP+LlMqHbwNUel9DSB4PhT8enjYO
 sdVkW9H2OcNlHGb1HrfDwVSDNJRKrhg=
X-Google-Smtp-Source: ABdhPJzD2DUZByPCwa3IZAJVAvAj5ydfMJtnQXgy8olVj0AvXrolKfnLyRt8aLumzoHg4YE3lNfQQw==
X-Received: by 2002:a17:90b:1d07:: with SMTP id
 on7mr17132990pjb.206.1641581194689; 
 Fri, 07 Jan 2022 10:46:34 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:34 -0800 (PST)
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
Subject: [PATCH v3 5/9] mtd: rawnand: brcmnand: Allow working without
 interrupts
Date: Fri,  7 Jan 2022 10:46:10 -0800
Message-Id: <20220107184614.2670254-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104636_325090_8879BD57 
X-CRM114-Status: GOOD (  15.78  )
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
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 52 +++++++++++-------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 40818c881f08..08e2acde5133 100644
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
@@ -3144,33 +3144,29 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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
