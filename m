Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C11CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzLwKDwtBkLSDdikgTUQxzDQXldeWLzsHdXFn3Xk9ew=; b=k6OVhXWRt8O5Mf
	07a9McgsiswEWHZzlyxswXRPIJmVPc2lcrxdcgr8FEfhf/O4nP0famMPBmd2ilO93KB7fQjJHvT2E
	toerhtbNvDFqPgEukBtbe8EmJe8U5BrplJCGdr6rkqXk/S+QgkHuuwJ+evbmlfW5y2ixALXfKE4f7
	bSW0XXfTiCGB0fUm6w9d64Zxd1Eqm8E3fmKg/45omoRUZK0HhgiSrDXy54j0059KS/LqAhRdcq2L1
	vrpOUcMkbGfFF2UoCiTU2QB1ZViddsk+KIXdECWemQFBU2V0F24up3MtitR3qY0Mca9daEX+9aM9u
	qHdMsVO25nPVT2bgVKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswP-00000006VYn-2nXc;
	Fri, 31 Oct 2025 17:29:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvU-00000006UQu-0L4p
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D80C1A17C2;
	Fri, 31 Oct 2025 17:28:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7461360704;
	Fri, 31 Oct 2025 17:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A938211818466;
	Fri, 31 Oct 2025 18:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qLn8pqGpyg4U7OLjWyRrfWQycUAFq+5725pA6nA01gM=;
	b=UEe5WHxTMWNUU4sVtZJCYJu6Mgx3Z7Fcdlhkt0JsnLfHxQPyeTuP7KXuMD5arq8/mWdo95
	4/QFu7UYGaPOYcbWh5NYEIOtRY9N76+ZDZw2YIwior6GT6Td4xU4YIhA14Fo5v6Cb73BTT
	yWms+2/LBhlpVdl8SDCxgYsiRBC3h9QyJh/gYc0xxngoqMw61s3tAMYXxEMrGPl8MwssBT
	J9uX6M4FZNnA7F7+ndzl2Yk2K7+YlAXa13JnA9JC+sOpoA+vFUHDMEay7yME4roDBsaZy1
	y52H258HZf+jgJxxEFxstc4pNJ6L+PUQOQkHH94HQaH1HFNwFsF6rzimSfzcEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:02 +0100
Subject: [PATCH 18/28] mtd: spinand: winbond: Register W35N vendor specific
 operation
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-18-be42de23ebf1@bootlin.com>
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
X-CRM114-CacheID: sfid-20251031_102837_305736_B3AFF338 
X-CRM114-Status: UNSURE (   8.15  )
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
index 36053f35ee5e84eb355343443a28d274cf7ea5c3..1c13dba08369c48ca26381c634abcea4e7360f30 100644
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
