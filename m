Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00277C28B2B
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 06:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APmLvT2ZvSS1ZdcbBg/v0GADwispJcPjFOqhlKRKzQQ=; b=DAcw/R9icN9lI6
	T7SZZ8PNOKDjAUeadfoYJrrjnVlY/98NYPmzff3HBR73HHMHP0qte+9o1CRylcBYiCr9zDW/FDkII
	0oD39L61aCsH2bmHzxFr1H+NKpS0XwkARknNbLC4mKDZKq+VhyMnMxTcVBml3gdRHVOZPegpK3yhA
	bOGJv91vaeQQo196vx2dFW9gZjq4Efbjp92lW1BTi5m99L2XtlZQQtAvRd2+HXaabKpn8sZ4O/hUl
	iA6cZV9OQy+G3fB6yCsapb6SBOfCYg6olp6pZfkeazOblqAIJ2p8NpKro8xxU8R58t57YRcE6ZTfz
	1kn0u4xOCeCRnVPzCclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvBB-0029eA-6e; Fri, 19 Aug 2022 06:08:26 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvB0-0029SH-63
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 06:08:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id y13so6940919ejp.13
        for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2022 23:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zxM42Y9uEm9HYeKUiC4xFIG7yPyezX+CS6v5K5nZU8U=;
        b=DP1gLMIPVWB7ZYRop6oPt9NMumqgtsCGEOsM4vtsybhCRs5Dzp0CsQyLxargAIZINe
         ODmtV6u0iTI76C8ByXG7V1u+ccKF2e4qad3XsUzDIL6hye4OHE21JrXHHI932pE31adz
         R5XPcDmOIlBlW11EAcwZZ7lNflcuox+CFV9XjBDIN+0uCxGBFeyNFx2ldpUzzJncXSE0
         1qtTuvw6sM8xrgjoFNXPjTWjVc/9E1DWxISdgmYV5jaFfPcDxncJ6b7lwd3QEA0UaswE
         kDGyILqBu+97OQjN5PmYrcF4nGuApHE1R3j50OpsFP7F3eX1tJg1XxbfZIv3QdZxdek/
         84fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zxM42Y9uEm9HYeKUiC4xFIG7yPyezX+CS6v5K5nZU8U=;
        b=maQ4miKh2tNfitAagNG04XM69dO0KvNou6c1g81uDlY1PWRZsnhx/aIlO91gCl+Vqr
         jKAx6TpFIDttytH4hHV6WNahZ9VI8aGjg532diJ9XnHUaRzh67dCLbdMigPLFTn+Hv9Q
         cLaCNkyv8dEn2fHqhJnQub12o6UEiDEqO30IgAMbtReGfGVvQBm0joMKD3zTMJpvHUz2
         VUgqbzYkvMGbtEnh1UEZ3GucDwY0xytK1kU39oJSaNwUcSFSpl/xu4mGWXHpIVbQ77sl
         rGCKdpsxQ9QlVO0zKGGO3mVY8AmHTQAaC7U7tOVvZtUDLRHUECYlWveiT4nYhjKNVMq6
         blWA==
X-Gm-Message-State: ACgBeo3Rzunz81LpmL//Wqbxrwj0Wm7Lu7eTIl9SoZaO2muySi+TTSym
	L7AwbI74dwLURloQzUAz8DHjpw==
X-Google-Smtp-Source: AA6agR7AxvNaR5kMACgc+5EvILcU4znfyr/yCo9fq+C5k8P8mQOI0CDjA9l2YlHqPOv1CkuTKAdmLQ==
X-Received: by 2002:a17:906:5d07:b0:738:b86d:df3d with SMTP id g7-20020a1709065d0700b00738b86ddf3dmr3767679ejt.617.1660889289504;
        Thu, 18 Aug 2022 23:08:09 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:143b:fd00:5207:8c7f:747a:b80d])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709063a8e00b0073a644ef803sm1809660ejd.101.2022.08.18.23.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 23:08:08 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 05/19] mtd: rawnand: marvell: Fix error handle regarding dma_map_sg
Date: Fri, 19 Aug 2022 08:07:47 +0200
Message-Id: <20220819060801.10443-6-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-1-jinpu.wang@ionos.com>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_230814_263499_FE4AB241 
X-CRM114-Status: GOOD (  12.19  )
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

dma_map_sg return 0 on error, in case of error return -EIO,
also add the dma_unmap_sg as rollback on the following error.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 2455a581fd70..d9f2f1d0b5ef 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -865,13 +865,19 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 	marvell_nfc_enable_dma(nfc);
 	/* Prepare the DMA transfer */
 	sg_init_one(&sg, nfc->dma_buf, dma_len);
-	dma_map_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	ret = dma_map_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	if (!ret) {
+		dev_err(nfc->dev, "Could not map DMA S/G list\n");
+		return -ENXIO;
+	}
+
 	tx = dmaengine_prep_slave_sg(nfc->dma_chan, &sg, 1,
 				     direction == DMA_FROM_DEVICE ?
 				     DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
 				     DMA_PREP_INTERRUPT);
 	if (!tx) {
 		dev_err(nfc->dev, "Could not prepare DMA S/G list\n");
+		dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
 		return -ENXIO;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
