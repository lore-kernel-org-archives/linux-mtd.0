Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1A8C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jzGMXFoS8BMQK4UtiNa9lHLsB6LrH6KVoFMf1sgTrk4=; b=jqtF0vywjxlABI
	6/Ot9fpGUXbYZNUJiVe9vHWvW1eKYD4vCrZNDzfbweecddS3pdF61kfwFfOUKGH+5/EKUDrxY8dRO
	e5BwYr8WjEEd3mxOqOinajLi4Z3OrxC2N6e4zDxFU6twKrxB3rWLHBVnnWPlwkUvO3OVpZiycizZd
	CKGXiEyOULFnfQK7V9ysUeX5yoLS5SttBhx0ldkoGLIfx4kFzwwFYUXFh8z9PzPjLGyVwJ4Sa1bhm
	llS4b4pXS/1qOOCCIidM3jWazSeNMvtopCKMLXyb5NPkqiUsA12ZdZ33V+ATH+h3VwW73kOxrWjTT
	Pz9SR4nX35S2+vnR/uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGy8B-005TcA-T6; Thu, 28 Jul 2022 07:40:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGy88-005TXl-Hf; Thu, 28 Jul 2022 07:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658994025; x=1690530025;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oIeSpejyFizNCjTe32oFzhYJ7T8h3L0O2WEPh4ZDXt0=;
  b=aPj1l22Zqq94xXZohwA+tQXBC4mWJKdBpcUfwNDTx85N3Tvt5GrifFgp
   VO+1RtI1rYWP6FqaUIreRrxNDWeQWwbh0GHkfjDAjJYztRCdIrpKTcsZf
   NkejQ5x4ZFczh3vCk5RmGJ9VwVlaD/v0P/aksDWMv/4FpKPKHvduQ23VK
   Vo7BisEQOySbpwZh2YDvmj+A/7kaSx5Dp9P7ZTyUrBQBCpG+hlAUvLeTk
   u0wMyZroSpPEKecAcrDpGdFRZ7i2Rxxy3SkV+eVjgVjuerdp869X3WDz3
   uQ0OYdBP8E0QNhjqR5fB7zZG5Mxwv3XNq94sNGHwhjFAibPuqHasq1Oon
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="166752216"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2022 00:40:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 28 Jul 2022 00:40:18 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 28 Jul 2022 00:40:15 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<peda@axentia.se>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@microchip.com>, <bbrezillon@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Date: Thu, 28 Jul 2022 10:40:14 +0300
Message-ID: <20220728074014.145406-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_004024_757223_65D751B5 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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

Every dma_map_single() call should have its dma_unmap_single() counterpart,
because the DMA address space is a shared resource and one could render the
machine unusable by consuming all DMA addresses.

Cc: stable@vger.kernel.org
Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 6ef14442c71a..330d2dafdd2d 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -405,6 +405,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 
 	dma_async_issue_pending(nc->dmac);
 	wait_for_completion(&finished);
+	dma_unmap_single(nc->dev, buf_dma, len, dir);
 
 	return 0;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
