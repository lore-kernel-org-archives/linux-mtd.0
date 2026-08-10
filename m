Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A2C5AD55
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pi63wI6/f1KE2/4xu9qnQpPaDH2amMMMPrKVyP9pzVw=; b=LBdIlft30/QamA
	7ucMBxJRSEi3S7aY2wt+dv+0LHe40NWXrzExzMB9UHotgk8ytgLSXpCH/F7i6jVOFEhAsVF/pN5C0
	4S+B86pflw8ctl1rHRNkSYn3KFvxKHA+OBV4cguiZm4ryYm5i1O+jtxwLlr5M5SIZOLF6v3rCalOh
	JQBAz1RE4Rg1COuYwAYhcPiIcbmkMhmir6xlh8Y703LBNEY0tEoEfx3ftu5OKsKNlXV71fQjh4xBz
	JKuccXdLSpAOP8DZIB7dWS/ewd8hRL4L2fxA3ge1RExK3xhbEz+1+/hnBLAzRUPnVjZoKPYsJfI+N
	ixInTwljHYEKeFeiNkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtReq-0000000C9pw-3hmb;
	Mon, 10 Aug 2026 15:11:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtReo-0000000C9nQ-05sm
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 15:11:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8BC734E410F4;
	Mon, 10 Aug 2026 15:11:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60ED56033B;
	Mon, 10 Aug 2026 15:11:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8916A11C4A9EE;
	Mon, 10 Aug 2026 17:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786374671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CK2WRSq1MK+3g+V6+eHAiSzDyRizcyKiOdPn4mxRHrQ=;
	b=qj4Q31l2ntJSzOXcHUdWoRM7u96lrdcuozFS2fmbat/81N6n9PCOPldw1W0fbsToWVnB76
	xWuI+b2khf8gTTQgGJKjKIsnxWKcEMsJXF3ERUTa+hx2xOrIvbJxi2qATvqhA8Aph82CoI
	2reKKooyNgvEQhV5qSA+NOB/9j/IW0ZTWvy4O0iMl6Yfr/WrstY32tvyKhiuNzK25CCBUL
	FrIATjqOvEcVNPGp0BCRLmM1ZqQ6ImbsNr43f85XTxXtK2bZp/4X6eEJXpHLMWI6YpB/35
	tmymEZCyj7a14f131hzn6ZNDEohwsyGF2i6cKP0kRW8Jkd3TdL4s7R2qpIrosA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 10 Aug 2026 17:10:43 +0200
Subject: [PATCH v3 2/3] mtd: spi-nand: Set the DQS spi-mem capability if
 available
MIME-Version: 1.0
Message-Id: <20260810-winbond-nand-next-phy-tuning-v3-2-a97c3a61e675@bootlin.com>
References: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
In-Reply-To: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_081118_206196_5F69D2F1 
X-CRM114-Status: GOOD (  11.18  )
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

Check whether the NAND is capable of generating a DQS signal and set the
flag accordingly.

Not wiring the DQS signal on a DQS capable chip that will be used at
frequency requiring this signal may be considered a hardware bug, so
let's assume this line will be routed "in most cases". If/when we get
issues with this assumption, a DT property describing the lacking line
in the routing can be created.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 4 ++++
 include/linux/mtd/spinand.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 74bb5ee83b31..b54f7a1dae85 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -2050,6 +2050,10 @@ static int spinand_probe(struct spi_mem *mem)
 	if (ret)
 		return ret;
 
+	/* Assume manufacturer drivers will enable the DQS pin if it is available */
+	if (spinand->flags & SPINAND_HAS_DQS)
+		spi_mem_set_dqs(mem);
+
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
 		goto err_spinand_cleanup;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ec6efcfeef83..fe05b477afef 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -490,6 +490,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
 #define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
+#define SPINAND_HAS_DQS					BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
