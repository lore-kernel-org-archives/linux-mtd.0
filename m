Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9E6C28D13
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tGt/wNP+FEyx8O+nCbKHS1dpfJ/CSrm5clCWSUz0sI=; b=05YXnIcn3egvF7
	PINClEVHtVoxeZbu/9lDnBuQ1yvZlvRQWGZ1Ebwj/X9HAI0fjoNmKlTY0rwEYYgGrRuAqJoJw2Wop
	WayozZBcCmKTswjiaw0g5UArYnFO/KrBxPPPMhvAZywskzsfJKGR79C7WfsU4mc8JDOnBVNXIpkwm
	yiHsDP3bI6HDDH0KvhobcoU4Vs8WWRgqnnqGr4aVi6uAsOSPwendNWc7dRf6jO6+hIOTZKn2QVfHN
	MiE67N2xLi5C+h1Ad6iu8lJv6EF2z5uiC+UrZihDMubMsLxgVNen+rSSDGZxcpWo7cdnHhUdX/HDj
	kJx8avir2KQZoIydHgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7gU-009hJR-5S; Thu, 25 Aug 2022 07:53:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7gO-009h0y-JG
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 07:53:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b16so25031831edd.4
        for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2022 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Lc3v8hBHsCf49bYVex16KFSKbVG0hlFgO3dkVBUtLng=;
        b=e6L6q0BJUH+0W1pJctd5mNfbN9fET2DENNXVuhELy/kF0phr1KgPmbFrEL6S4XysGM
         ENOkFXDnlTf0HOOXyds250s4+e1nZ2S5t+l5rV5GknHKbwpwF6O1m1hlgSlTqwKshIfX
         qN5WrWKcNdQUeCq47fNrJljeHZ8YDMoqz900JcLJAUW0RDTMCs7DXcu6ob3YpWHQN5pj
         MxgcRgZFdqYKrj/le87dmCMrQZsXfgZvKns67C1hqEKSmcZ6LvTmBnZvphVn7aebsrBe
         XwkKOEgJUO8H/YDCOF7FaMrBMN/aSMBZ/ZivCIvOjBrywuiGm3PrCtSNjj6DwGlKw0cU
         MW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Lc3v8hBHsCf49bYVex16KFSKbVG0hlFgO3dkVBUtLng=;
        b=VONtk6vMpizg+IeS90uTZzB1SQWI/RNOtMheTIx99tv8HF2N+BA0UVzcGTLtdum3H6
         +P4ohGAH5H6pEPdreTlbUryHgbIeMByTPlD67/5NRzZTcsz6HPZUugPIRKioNX6uC05I
         jhN3tqlxbPROUhHXk0OfbEn1ylIvptUCxrl+2b/W+1MZ5H5qMePkNcLKfnqSstjOfTU+
         bUb6ModG3jtxoUXixU5UL5kyLlpSM+nBocesM6hi8RmS88O4L3bt+MOQqmqNU6MPy6hu
         5AdjLYUXExUwio/TfNrUQvsc/SiiGRCuE/ENJA9DhKu39itt9Jv9PThuMJqn3caNnYxS
         eBuQ==
X-Gm-Message-State: ACgBeo1KCsOrr2/ozxEr1D3jmVNQCD6Pwlzalq11yWmLvfSK/DC9lskh
	EMjcLiLAYde272LJCoYVbliqtQ==
X-Google-Smtp-Source: AA6agR6Wb3bI3r2PWMumq/hRNZ1lgycNJckeEnHdbCXKdsWIg069biDuqP8AkDqmL9yidwsSFdF9nQ==
X-Received: by 2002:aa7:cc97:0:b0:445:afab:2634 with SMTP id p23-20020aa7cc97000000b00445afab2634mr2190277edt.54.1661414022265;
        Thu, 25 Aug 2022 00:53:42 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906b09600b0073dbfd33a8dsm1491736ejy.21.2022.08.25.00.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:53:41 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: marvell: Fix error handle regarding dma_map_sg
Date: Thu, 25 Aug 2022 09:53:38 +0200
Message-Id: <20220825075338.35338-3-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825075338.35338-1-jinpu.wang@ionos.com>
References: <20220825075338.35338-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_005344_695000_42DE1EF0 
X-CRM114-Status: GOOD (  12.87  )
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

dma_map_sg return 0 on error, in case of error return -ENXIO,
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
Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
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
