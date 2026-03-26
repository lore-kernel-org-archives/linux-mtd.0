Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606710A88E6
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipjoIj2XBzbiAxDoO+pAOlKLb517CsrpRVzekCaIheY=; b=KsyYLUQ6rjruaF
	o6QwgTFB7Bc3vH8K9+ieFExNpF1k5WAO9OQkeM7OTAr8FPJLvsHFpGk0pTXKmTIDsEuGUd69igjbe
	Aq/1fGzOKyWyQ0hlLMvjEP8jSiS1ftb3ZCUvpOvP0dOIglTj8NNryuS+3ODHeOpTly2wPa8zU4Kpj
	Q1A2jKIV1L6fACn9+PlW0lOo/ZNq3bZuAvxxbtGTiYYgp/ocpCj5xKkM+gEkDw91DaORTf0/T4jkB
	SkodK1wtyJxRulbdsfeqpfECYB/9hb03Pe72rwnGJiqjiVWhJEvGUvDcYCq6RgMTfQPrRGXVl24JM
	EVAEA0duTWJzPQczxUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXJ-00000005qdL-1rjj;
	Thu, 26 Mar 2026 16:26:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXC-00000005qYa-0AFa
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:26:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0ADC1A3008;
	Thu, 26 Mar 2026 16:26:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EE1C601FA;
	Thu, 26 Mar 2026 16:26:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DECB810450C99;
	Thu, 26 Mar 2026 17:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774542370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rlTKENBwUOxRSRFDk4mW7jT5HzuysuTleMW111bj1mo=;
	b=Of4KHQSA+1zvTKT2x+KYSyjNtVJCsB6+DUdi7HQkfsgkkMtfu0LcfffKZWUeuNZQ1DwbZi
	zTB36Y271KDhHHeIW89XbzebSpEG08XpFJD4Vm5/Svemzbfp9zIFAAll6TN/14C5OAtILE
	UmchmGAcsBU4C1Qrptfn8x6Dv2owWWEc/ZcauIMuKs+jTfpxD3gCJeMvn2IpwRm3vROZe0
	iCCiAR4iUVEZJTfcGF1Kem/DB4HqIsB99Yei/F40uusDRO4EEwY1GunePX83O6lGgzDYyA
	MHl7I4cKrKTEhQbSVdS1wfJj/ioW3YEbcXedTJsCGkeFco6aPnraD065CpOkAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:25:50 +0100
Subject: [PATCH v2 03/11] mtd: spinand: Drop ECC dirmaps
MIME-Version: 1.0
Message-Id: <20260326-winbond-v6-18-rc1-cont-read-v2-3-643de97a68a3@bootlin.com>
References: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
In-Reply-To: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_092614_214945_AF4E1433 
X-CRM114-Status: GOOD (  18.37  )
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

Direct mappings are very static concepts, which allow us to reuse a
template to perform reads or writes in a very efficient manner after a
single initialization. With the introduction of pipelined ECC engines
for SPI controllers, the need to differentiate between an operation with
and without correction has arised. The chosen solution at that time has
been to create new direct mappings for these operations, jumping from 2
to 4 dirmaps per target. Enabling ECC was done by choosing the correct
dirmap.

Today, we need to further parametrize dirmaps. With the goal to enable
continuous reads on a wider range of devices, we will need more
flexibility regarding the read from cache operation template to pick at
run time, for instance to use shorter "continuous read from cache"
variants.

We could create other direct mappings, but it would increase the matrix
by a power of two, bringing the theoretical number of dirmaps to
8 (read/write, ecc, shorter read variants) per target. This grow is not
sustainable, so let's change how dirmaps work - a little bit.

Operations already carry an ECC parameter, use it to indicate whether
error correction is required or not. In practice this change happens
only at the core level, SPI controller drivers do not care about the
direct mapping structure in this case, they just pick whatever is in the
template as a base. As a result, we allow the core to dynamically change
the content of the templates.

He who can do more can do less, so during the checking steps, make sure
to enable the ECC requirement just for the time of the checks.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 52 +++++++++++++++++----------------------------
 include/linux/mtd/spinand.h |  2 --
 2 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 1c3ac9ad650e..663f5d6a6bd7 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -487,10 +487,13 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		}
 	}
 
-	if (req->mode == MTD_OPS_RAW)
-		rdesc = spinand->dirmaps[req->pos.plane].rdesc;
+	rdesc = spinand->dirmaps[req->pos.plane].rdesc;
+
+	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED &&
+	    req->mode != MTD_OPS_RAW)
+		rdesc->info.op_tmpl.data.ecc = true;
 	else
-		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
+		rdesc->info.op_tmpl.data.ecc = false;
 
 	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
 		column |= req->pos.plane << fls(nanddev_page_size(nand));
@@ -579,10 +582,13 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
-	if (req->mode == MTD_OPS_RAW)
-		wdesc = spinand->dirmaps[req->pos.plane].wdesc;
+	wdesc = spinand->dirmaps[req->pos.plane].wdesc;
+
+	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED &&
+	    req->mode != MTD_OPS_RAW)
+		wdesc->info.op_tmpl.data.ecc = true;
 	else
-		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
+		wdesc->info.op_tmpl.data.ecc = false;
 
 	if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
 		column |= req->pos.plane << fls(nanddev_page_size(nand));
@@ -1231,12 +1237,17 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct spi_mem_dirmap_info info = { 0 };
 	struct spi_mem_dirmap_desc *desc;
+	bool enable_ecc = false;
+
+	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED)
+		enable_ecc = true;
 
 	/* The plane number is passed in MSB just above the column address */
 	info.offset = plane << fls(nand->memorg.pagesize);
 
+	/* Write descriptor */
 	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
-	info.op_tmpl = *spinand->op_templates->update_cache;
+	info.op_tmpl.data.ecc = enable_ecc;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
 	if (IS_ERR(desc))
@@ -1244,38 +1255,15 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc = desc;
 
+	/* Read descriptor */
 	info.op_tmpl = *spinand->op_templates->read_cache;
+	info.op_tmpl.data.ecc = enable_ecc;
 	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
 	spinand->dirmaps[plane].rdesc = desc;
 
-	if (nand->ecc.engine->integration != NAND_ECC_ENGINE_INTEGRATION_PIPELINED) {
-		spinand->dirmaps[plane].wdesc_ecc = spinand->dirmaps[plane].wdesc;
-		spinand->dirmaps[plane].rdesc_ecc = spinand->dirmaps[plane].rdesc;
-
-		return 0;
-	}
-
-	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
-	info.op_tmpl = *spinand->op_templates->update_cache;
-	info.op_tmpl.data.ecc = true;
-	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-					  spinand->spimem, &info);
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
-
-	spinand->dirmaps[plane].wdesc_ecc = desc;
-
-	info.op_tmpl = *spinand->op_templates->read_cache;
-	info.op_tmpl.data.ecc = true;
-	desc = spinand_create_rdesc(spinand, &info);
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
-
-	spinand->dirmaps[plane].rdesc_ecc = desc;
-
 	return 0;
 }
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 29ce5827032a..bbf17c346887 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -683,8 +683,6 @@ struct spinand_info {
 struct spinand_dirmap {
 	struct spi_mem_dirmap_desc *wdesc;
 	struct spi_mem_dirmap_desc *rdesc;
-	struct spi_mem_dirmap_desc *wdesc_ecc;
-	struct spi_mem_dirmap_desc *rdesc_ecc;
 };
 
 /**

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
