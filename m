Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D1C32771
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 06:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgwKtUJKAKnFwVpZxhOli5Hmd98Q6KnKQEXBFKDeIEE=; b=Ku6h8vbss2gPYt
	G/VboN88HXEncMYfi+BTS4nbdirqiw7F8zy9ZWnVtkNZspl8gN25o9Jpy7GMMk/yJrATOjTKCvy+W
	LOm5mCymwmZuxNYsfehGef+wnxsAsu7BXoIwWQl94FFntPIb3ZyOoW8Z7423I5sdQK8uASO/RIBA+
	OJ9+hXfHrUuF3PgnixH9cPR6MRMEKKEunl1ok5NOOWI7MHPwxfbJODuu7yfclYbFxgNWSkx97r3sb
	NKJTFE5Qki0l3j6z1FzKksx2OYyUVnWtYz/v2JiLqJzSfDxT/StaFcoE16/4qVT1y1uQYz9uANoj7
	VeU++ZOTqr4z4JL8hOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvB0-0029ZV-6n; Fri, 19 Aug 2022 06:08:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvAx-0029Pe-Od
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 06:08:13 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z2so4457001edc.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2022 23:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=OzHUmQwcd+nCjF20f8h6cgiTVwPuicRa6w7QZAA1SIg=;
        b=YvXzy4ZZy1mdY4EMhepxkx1ON9GYFpmRW9Ft40fg5ySPmER4WpPEAyH3L2RPcRsDzn
         E3fbrhOX1RZ6y3tlBQK1gEOw3s81guyqOtbmH27tahaoKKVBaXeNpEHk6YF11vQlUI4y
         GJnFXYkXFW6nvVO8SaIE+GRZ1PupQN3KqmS/i5opp1YE2pZzKO8Fiilwqy6WRK0ij+M1
         pu2ShCoE+5XhledK85vKM0BQXjbtLuuesDCNfsvvfiMVj+UfZ6ghPG8gzgGa0P/3cHAe
         lapqf0KVRt2y3d06Mam60j47THi3xFU81mHpIEcUU33+bd+tpRGo+dBzZLdB1iqy/wxF
         4fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=OzHUmQwcd+nCjF20f8h6cgiTVwPuicRa6w7QZAA1SIg=;
        b=G9frUqdigzUHoKld1r/vusEGhzB6vrYnoFzv+MaRb5ljQ2BAdm0MAmClb0UNXXHVdu
         GUojqBNJ3c1t7KHmmbXXID4SgoucAfVsHnYfQPCacjOvLP5hFHvGoH+MM05q/1zrRS3Y
         UAcHGL2DnzPy5AFpCSshg4BFZsaaLIUrRxKBXruoGRu7B3SYkw16+A/N2RJOt2p0DCuc
         P56IIrsiIlsANhYbriog4uVC+Zu/xognL7MeFz0Y9r/fpHjTSPoSGDVtSUpHQAFT5SBZ
         0sMOIpTgOthRsPD7hHaEknXfXza4Wz14kLAr+OXk0/R8JAHZggRTKXm9bV79HIQ/+Jys
         FOpw==
X-Gm-Message-State: ACgBeo1eGmBp6Ax1IVr3oplt5UYxUjw1SC7+zyFUNOaOOoi2cVkeIRGD
	NigAsgAtun1saRHA99Bw4icmssRxTceXAA==
X-Google-Smtp-Source: AA6agR5DmMBvK+oUIDsQEG+pVfZgLO3Ld7GCkKqrInhA0LiEoWlC+RNyND2neXiQETWHpQprWlyS9g==
X-Received: by 2002:a05:6402:42c3:b0:43d:682f:c0ca with SMTP id i3-20020a05640242c300b0043d682fc0camr4885929edc.334.1660889288038;
        Thu, 18 Aug 2022 23:08:08 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:143b:fd00:5207:8c7f:747a:b80d])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709063a8e00b0073a644ef803sm1809660ejd.101.2022.08.18.23.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 23:08:07 -0700 (PDT)
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
Subject: [PATCH v1 04/19] mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
Date: Fri, 19 Aug 2022 08:07:46 +0200
Message-Id: <20220819060801.10443-5-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-1-jinpu.wang@ionos.com>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_230811_943456_9F8AC414 
X-CRM114-Status: GOOD (  13.28  )
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

dma_map_sg return 0 on error, in case of error return -EIO.

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
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 87c1c7dd97eb..a0c825af19fa 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -862,8 +862,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -893,8 +893,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
 				 eccsteps, dma_data_dir);
-		if (ret < 0)
+		if (!ret) {
+			ret = -EIO;
 			goto err_unmap_data;
+		}
 
 		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
 						   nfc->dma_ecc_sg.sgl,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
