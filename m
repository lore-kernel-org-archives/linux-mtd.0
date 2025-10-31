Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B828CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9BuaTttOUSTU0um9vH1IqL0FEoOfkDAZm677XGLraA=; b=MBSe/cyBX+hm/N
	gQ3fcByivYAx/MiMPri0Xq1MksPLdnBAG4o7eNK+luBmyKzZhmz7aZm9BxOTseP9r2eroRvDQjU6h
	pI7I4ItFX+t1aTI4ejd55anyF1DD1DnAB2sE5+BoYENQ1uIiUp3ONVBAv2mOvdPfBMNHIYAWvFBZC
	MF8FPUCNleo+RwHg9KYb2lL4kfBkCknHWDuXGRJqunbPoh4ZDMJkuTO7kMmWyBOChvjX/LGSYSO1W
	6Kzda/E3dpR2yYz8/PCpgPfkz2dVOcI70o6xWc/YnVxnp4R/JEcW8/klM2hOXlDPSAAyEXvUhv+QG
	59bXEc9sp7TSOe7ZMOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswk-00000006W1o-2q20;
	Fri, 31 Oct 2025 17:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvj-00000006Uju-1q2x
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Oct 2025 17:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0TkMp9aMwcsGosTWrhdTtxz4Lwc7YIxnivcDZ+k6Uqo=; b=GijteBDaSH4QficpWr+ZrqIv33
	iSoCuHCm/NYFHs0/gwUUipLKUcOd1w60vaa7uTH2qyDGuwHSnYx1FQDEOjhQ/wYuszKCid7CRa4DR
	QHeng/fUxruvFJIEGj1hZCfracVARa2tmrBOArgyWNklR/qT5Yl10X4+emsfGVnvS4spSmtpkM/uW
	fRfnl/tK2am4Lbese3J11157cqHS8ZsrQkNEptimv+ZpsfYdoVcxBoGWy2sEzK9mvpkgi61iHjH44
	NwuLhYqN2vBjQDrkglXdv3oGZUKzQi5QOPAECI9APDhRu5AH1SGQO8kIFQT0syzfJcTQOjdxEtzNf
	k8K5uDDg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3w-0000000Bkfk-2uNn
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 16:33:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 636834E41415;
	Fri, 31 Oct 2025 17:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3ACC160704;
	Fri, 31 Oct 2025 17:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B053A11818007;
	Fri, 31 Oct 2025 18:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0TkMp9aMwcsGosTWrhdTtxz4Lwc7YIxnivcDZ+k6Uqo=;
	b=hqNZ/wsUGkTKZq0riG/RmSnnIu+QPPr5pXIU6713zaYh/NXlRythOCClzvCx1gGf3gP5dh
	yuDeya8OSJEaPvBDjz9H7XBH6q3G92VWEGDKFegdGjw8rY7TydMlKET3/ntMuEmC8Moqx3
	5GvTE+YcEf0nwT2FSO5G3gFnVLKnH2g998eTODG+mg2ILBDdv+x0dKwxoCNp8CuJRd6s01
	U7K9wgK6oNMpFuXhFBxa2+ZLzLGRmG9mTCPMHWA2O1974jWEPBk1YDGcotII5jhekKbfbK
	bn51RrZRAgPew1eXsdTJN+9Hc6WAMsXJzpRRDASkSIpU1SEo1zlzeFZqsgBfqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:06 +0100
Subject: [PATCH 22/28] mtd: spinand: Gather all the bus interface steps in
 one single function
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-22-be42de23ebf1@bootlin.com>
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
X-CRM114-CacheID: sfid-20251031_163316_817987_2BE240F3 
X-CRM114-Status: GOOD (  13.74  )
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

Writing the quad enable bit in one helper and doing the chip
configuration in another does not make much sense from a bus interface
setup point of view.

Instead, let's create a broader helper which is going to be in charge of
all the bus configuration steps at once. This will specifically allow to
transition to octal DDR mode, and even fallback to quad (if suppoorted)
or single mode otherwise.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 62 +++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7c01516c6b6acb41d2cc080d6fbaaa5ace661602..caf549617f369ada2c1712e863e563ae547ca0e6 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -177,18 +177,9 @@ static int spinand_init_cfg_cache(struct spinand_device *spinand)
 	return 0;
 }
 
-static int spinand_init_quad_enable(struct spinand_device *spinand)
+static int spinand_init_quad_enable(struct spinand_device *spinand,
+				    bool enable)
 {
-	bool enable = false;
-
-	if (!(spinand->flags & SPINAND_HAS_QE_BIT))
-		return 0;
-
-	if (spinand->op_templates->read_cache->data.buswidth == 4 ||
-	    spinand->op_templates->write_cache->data.buswidth == 4 ||
-	    spinand->op_templates->update_cache->data.buswidth == 4)
-		enable = true;
-
 	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE,
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
@@ -1306,12 +1297,6 @@ static int spinand_manufacturer_init(struct spinand_device *spinand)
 			return ret;
 	}
 
-	if (spinand->configure_chip) {
-		ret = spinand->configure_chip(spinand);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 
@@ -1517,6 +1502,31 @@ static int spinand_detect(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_configure_chip(struct spinand_device *spinand)
+{
+	bool quad_enable = false;
+	int ret;
+
+	if (spinand->flags & SPINAND_HAS_QE_BIT) {
+		if (spinand->ssdr_op_templates.read_cache->data.buswidth == 4 ||
+		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
+		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
+			quad_enable = true;
+	}
+
+	ret = spinand_init_quad_enable(spinand, quad_enable);
+	if (ret)
+		return ret;
+
+	if (spinand->configure_chip) {
+		ret = spinand->configure_chip(spinand);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 static int spinand_init_flash(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
@@ -1527,10 +1537,6 @@ static int spinand_init_flash(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
-	ret = spinand_init_quad_enable(spinand);
-	if (ret)
-		return ret;
-
 	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
 	if (ret)
 		return ret;
@@ -1543,19 +1549,25 @@ static int spinand_init_flash(struct spinand_device *spinand)
 		return ret;
 	}
 
+	ret = spinand_configure_chip(spinand);
+	if (ret)
+		goto manuf_cleanup;
+
 	/* After power up, all blocks are locked, so unlock them here. */
 	for (i = 0; i < nand->memorg.ntargets; i++) {
 		ret = spinand_select_target(spinand, i);
 		if (ret)
-			break;
+			goto manuf_cleanup;
 
 		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
 		if (ret)
-			break;
+			goto manuf_cleanup;
 	}
 
-	if (ret)
-		spinand_manufacturer_cleanup(spinand);
+	return 0;
+
+manuf_cleanup:
+	spinand_manufacturer_cleanup(spinand);
 
 	return ret;
 }

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
