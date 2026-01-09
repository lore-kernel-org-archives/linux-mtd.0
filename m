Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4772D26D6F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4HCUOqNdqUVcC9aHSBhoFdar9XGY+5zuKnplZoIviI=; b=VGLa3BieO8hkgz
	mxsjBIJ3CVGEaEC/HeRsFuCAGqZdd5COg/uBxo5yYW4mVYVCHcvud83PGc2vTQhNFa/YoLtOZtQd4
	u9SpuL/FV0Zkm75Gr+U0IcQCOBMIZ8w4UdijySUDtAvrNysYuxXYMkz1BV1NWBb0/7h5iA/ivueer
	pOghz41quaNTGUKjf8gtPRV4hMjmLgWkqRvwBCPqYWfHTf/Bk70A6tk6FOtT8HiMXQe7n+7aimq86
	WHXu4ySH9uRCeriUNZzhoPJ1h/0jJT3kcxjoEGZGRmOY15/2u4wy9hMyPJowh6gHa6v4nIETB1LZn
	Ym4+xiG6cwu8Y8/05ctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8O-00000002mL7-3HSB;
	Fri, 09 Jan 2026 17:18:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8H-00000002m7I-1MoW
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D4CA41A2754;
	Fri,  9 Jan 2026 17:18:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A63B7606C6;
	Fri,  9 Jan 2026 17:18:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE8B1103C89B9;
	Fri,  9 Jan 2026 18:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ms4xzKXIpxyRYeFBoWeTIh6rA/J+YRqZaN/VfApNv70=;
	b=tbS1LKI/eb73Y9y03PSO8xpC3djkLri3PDl7xXIvP1Zx3T/6F966i52Zcsn2Dp759d+kcq
	rZySUp63Lg6ISx9Hc6Bba4pcTKmZtMRMNbB4QbD1UkiAXxMrTU0/Ba6aJxC7EohTN53XZo
	mrHBXUOKVKH0SkgYLjmbKePb+Tl6XQ4w1okHaaa2bExxLdxgptZj1gWen+wxFzIOaBkNVD
	xC7eZlEd/rcFdO0aDxyHdNINZd5b4nfrhkDPCt/DZWazHhLPVXStilcnMXjubY7CHQXMCI
	LQ1ckWE/F0UqRqpYNhP11KVV6U/OOcw29Tozmq5wEAUm1bWXVYNXWDZIcXa+7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:15 +0100
Subject: [PATCH v2 17/27] mtd: spinand: winbond: Register W35N vendor
 specific operation
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-17-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091843_337849_3D657646 
X-CRM114-Status: UNSURE (   8.67  )
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

Provide the Winbond W35N specific "write VCR register" operation to let
the core verify it is supported by the controller before using it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 36053f35ee5e..1c13dba08369 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -93,6 +93,9 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
 
+static SPINAND_OP_VARIANTS(winbond_w35_ops,
+		SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(0, NULL));
+
 static struct spi_mem_op
 spinand_fill_winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, void *valptr)
 {
@@ -469,6 +472,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_octal_variants,
 					      &update_cache_octal_variants),
 		     0,
+		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
@@ -479,6 +483,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_octal_variants,
 					      &update_cache_octal_variants),
 		     0,
+		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
@@ -489,6 +494,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_octal_variants,
 					      &update_cache_octal_variants),
 		     0,
+		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
 	/* 2G-bit densities */

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
