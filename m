Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73034CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pueONDGRAk8Bfy47hnJYIikwOJbENk9ukf3eetc6QuM=; b=0t2qhVITW5z4zk
	rGTjQ70PXBUgEW+gL3G+Mp20pm5ReUBBS+f6bqEJiXlV5QsJIShoOEm1I/L6OVtROmg0X1oWfemBn
	5CSc/WVJnK3MGJGkcnHbiQM12vpl7qgooCQNtF2v2pj1oA0QrVT6Njl5sRulc3qydzS+WNl8PIE7m
	yolZ6DFcUzsAtIguxm7QR3+e4xd00q/JePvIcHQziwBf0eAB5JDRCEh2SX2GpRkVyxTmru3QxI8JD
	VEMmGD/sCzUICBHrm2VztjlHptxZnHqXjBSqlVvJ23JFUiildxB43NRpUFQ2scesXiLQFwynUhpoN
	uAnQ4651QtbCAUC+Sqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswI-00000006VNe-1ERr;
	Fri, 31 Oct 2025 17:29:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvS-00000006UPv-2rzY
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E5D54E41415;
	Fri, 31 Oct 2025 17:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0524760704;
	Fri, 31 Oct 2025 17:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5076E1181800B;
	Fri, 31 Oct 2025 18:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o9wIzIvZiwRUNi0x5RrTd6dDilzMRTH2lHz86yrV8Lw=;
	b=LDNV5w1lANS5nYtNjr1I5p7kB/z3pWHD38yKtMCCHsO2u4uEbsKvdnLSsEfDOeq/9WQH21
	w+FIA7SLXadznmJiif0B3U2MqTmZpzZUuZVGc2LusMHMyYpsXK8k2LSNV9XaW4HItAX+7y
	y9m6hTwQMXA1v6ict7ZW+nhKcW+ixNLaOlgtyRnVaBFapQ2PmdfAj8hixvoDcfNoXc18RQ
	VAgCDZpG4mAryhbsOD8WOsSiF8ZOBfl6xIuSlg0odP7vVBvU3p+chIf3y4Y9iC13n7ZCVu
	VaDdFdSp0xeXP5gskJBhAIa5OlC0c8OwCZ+VNA+M8o0JlrtOEjje9dUF65MylQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:01 +0100
Subject: [PATCH 17/28] mtd: spinand: winbond: Register W25N vendor specific
 operation
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-17-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102837_346752_56EF0924 
X-CRM114-Status: UNSURE (   8.64  )
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

Provide the Winbond W25N specific "select target" operation to let the
core verify it is supported by the controller before using it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 3003ad7e83ee8f553ec82a0326422916c0ed794c..36053f35ee5e84eb355343443a28d274cf7ea5c3 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -105,6 +105,9 @@ spinand_fill_winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, void *
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
 
+static SPINAND_OP_VARIANTS(winbond_w25_ops,
+		SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(NULL));
+
 static struct spi_mem_op
 spinand_fill_winbond_select_target_op(struct spinand_device *spinand, void *valptr)
 {
@@ -497,6 +500,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
+		     SPINAND_INFO_VENDOR_OPS(&winbond_w25_ops),
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
 	SPINAND_INFO("W25N02JW", /* high-speed 1.8V */

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
