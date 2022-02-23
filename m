Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1913EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoqjjZxBPTGRg1UyKzTFzmeRzJiqbyZWNTaCkQD/TBI=; b=r/34X1ytfX0EFW
	8xOSw3CE6i7bp26qj2+WODnhDbAWi2SSoZtV1xQJS5bFJ4BEFl3UL4YWTTMMv9oyQtjlK7g9tswOl
	NuXZ9jN0MulSiSEkGYrrN3cmI+EoqoJPO46gvdMQ875jFdsXwZHGoG9SKdFPLLqH8NGBDzTSPRUNS
	vcfyp34frMvjaWcOPBNEdh9DEIEhrmPlet3le/w8+fgHeYJc9H4gt4svlbtHlEIp7VIK2AMZWs+q0
	XHZQRcj5uS3KqRl9jnNKImGqkgNTN45naBSTeIG1wxtvVkhbBhtV9zQNpxp14J2mxOWNxrQXFxznV
	4bqBUxwjbDvjpH97WLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMs58-00EcHJ-9o; Wed, 23 Feb 2022 13:53:26 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwG-00EZTp-Pz
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:19 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1255222455;
 Wed, 23 Feb 2022 14:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PO24KqasPOTM4jCeX4Ybk7x9YJsT4PPkecU/Xv5RjVk=;
 b=qzuPpoIoijOQPFiqR8P0FyKDLX2LI/IMPqD/ZVnSQDfKqBrWK+Z+dbl1PYvZGQtOaZ6V9P
 uhSXpU2XOssYir35+mHSqv5FhXT5vh7w9bymS65H7+Hzuoqhs1Qs+SjbaoKjss4SUJ2fDV
 zi+ys4A7DaqSXdzksNvZUR9HuLKhLnc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 13/32] mtd: spi-nor: sst: unify function names
Date: Wed, 23 Feb 2022 14:43:39 +0100
Message-Id: <20220223134358.1914798-14-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054417_065554_6AE3D31F 
X-CRM114-Status: GOOD (  14.10  )
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

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/sst.c | 44 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 30183e9189b9..63bcc97bf978 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -13,12 +13,12 @@
 
 #define SST26VF_CR_BPNV		BIT(3)
 
-static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sst26vf_nor_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	return -EOPNOTSUPP;
 }
 
-static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	int ret;
 
@@ -38,27 +38,27 @@ static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return spi_nor_global_block_unlock(nor);
 }
 
-static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sst26vf_nor_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	return -EOPNOTSUPP;
 }
 
-static const struct spi_nor_locking_ops sst26vf_locking_ops = {
-	.lock = sst26vf_lock,
-	.unlock = sst26vf_unlock,
-	.is_locked = sst26vf_is_locked,
+static const struct spi_nor_locking_ops sst26vf_nor_locking_ops = {
+	.lock = sst26vf_nor_lock,
+	.unlock = sst26vf_nor_unlock,
+	.is_locked = sst26vf_nor_is_locked,
 };
 
-static void sst26vf_late_init(struct spi_nor *nor)
+static void sst26vf_nor_late_init(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &sst26vf_locking_ops;
+	nor->params->locking_ops = &sst26vf_nor_locking_ops;
 }
 
-static const struct spi_nor_fixups sst26vf_fixups = {
-	.late_init = sst26vf_late_init,
+static const struct spi_nor_fixups sst26vf_nor_fixups = {
+	.late_init = sst26vf_nor_late_init,
 };
 
-static const struct flash_info sst_parts[] = {
+static const struct flash_info sst_nor_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
@@ -114,11 +114,11 @@ static const struct flash_info sst_parts[] = {
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		.fixups = &sst26vf_fixups },
+		.fixups = &sst26vf_nor_fixups },
 };
 
-static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-		     size_t *retlen, const u_char *buf)
+static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
+			 size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t actual = 0;
@@ -203,19 +203,19 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_late_init(struct spi_nor *nor)
+static void sst_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->info->mfr_flags & SST_WRITE)
-		nor->mtd._write = sst_write;
+		nor->mtd._write = sst_nor_write;
 }
 
-static const struct spi_nor_fixups sst_fixups = {
-	.late_init = sst_late_init,
+static const struct spi_nor_fixups sst_nor_fixups = {
+	.late_init = sst_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_sst = {
 	.name = "sst",
-	.parts = sst_parts,
-	.nparts = ARRAY_SIZE(sst_parts),
-	.fixups = &sst_fixups,
+	.parts = sst_nor_parts,
+	.nparts = ARRAY_SIZE(sst_nor_parts),
+	.fixups = &sst_nor_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
