Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07707C7EE30
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cu9f8iAk/kdOEcVcF1YYqKp/E1BhXr+rz7mhCIzDhp4=; b=pv4c1rMYfr73Jk
	JYJfxWrmMSiFwbIXkGTmAa1SA5T+Xjx+mHDvO2nI+thYSVUGG0HBnvK0L68RY9tCv6tIYiVxTmrF3
	3VKRXE3ufZfgAdxRk3kWOdj1hSch7cptUIV4qkGukK8cNbMw7rGNd7Bh/xCzAqvr45Z37Wc22pqT7
	IbEmmxdGWTrbxKf/q/vGvXw6J05W/EaaXHVxIQUgD1fqdwrl6wUDMPrAYu4NDeYW6O3yMkbbVT6Wm
	+BsEwkIYDlIbQvDCgPdQr6N7zJBUkBX8EgbyjGc2N3RVD6HFLuLKseCtf8bvTiMoDMBPghQSHXb+R
	7j57K4+85jhQdao37Inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdGF-00000005wYb-1LSP;
	Tue, 01 Jul 2025 15:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbb6-00000005dA4-30uT
	for linux-mtd@lists.infradead.org;
	Tue, 01 Jul 2025 14:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0578A61443;
	Tue,  1 Jul 2025 14:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BE6C4CEEB;
	Tue,  1 Jul 2025 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751378671;
	bh=/MBHO/HqDaUBfzBgNGZeYC4UQPMQnREgL2F3m4ayADY=;
	h=From:To:Cc:Subject:Date:From;
	b=BDb1gITGKIO6DCGeNfIDtTY3aHfaO9vINFNOBkMJJ+rTmWSAbobkDnC0tSb7FjsOQ
	 PqIqe1g6Jpv5iHlaDsLAIiDGd1cBWwGJVJctOuQ0ooMWRB/0xBlvK3+oYeETKbsbEZ
	 JfXb9yJomsLbsqZQAnKkuzUxRi1e7fppRexivtCRSvBVMcutFaXucS8uuNT+RrM9O3
	 AcD0CRvi0qKDBCCxXcAWZPQZTcgDyvZPILEkHNw1UdvFiN/zE1YaSn6Wmnhr3LngOV
	 1t4UyA3czdAQ1cd+wk46KBMHfkkoMM8GLaV1XxWKO/smBH8FYhhl3RwRKR4r2CZuhM
	 QmK4C6ApXV9/g==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jean-Marc Ranger <jmranger@hotmail.com>
Subject: [PATCH] mtd: spi-nor: Fix spi_nor_try_unlock_all()
Date: Tue,  1 Jul 2025 16:04:26 +0200
Message-Id: <20250701140426.2355182-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

Commit ff67592cbdfc ("mtd: spi-nor: Introduce spi_nor_set_mtd_info()")
moved all initialization of the mtd fields at the end of spi_nor_scan().
Normally, the mtd info is only needed for the mtd ops on the device,
with one exception: spi_nor_try_unlock_all(), which will also make use
of the mtd->size parameter. With that commit, the size will always be
zero because it is not initialized. Fix that by not using the size of
the mtd_info struct, but use the size from struct spi_nor_flash_parameter.

Fixes: ff67592cbdfc ("mtd: spi-nor: Introduce spi_nor_set_mtd_info()")
Cc: stable@vger.kernel.org
Reported-by: Jean-Marc Ranger <jmranger@hotmail.com>
Closes: https://lore.kernel.org/all/DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com/
Tested-by: Jean-Marc Ranger <jmranger@hotmail.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/swp.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9c9328478d8a..9b07f83aeac7 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -56,7 +56,6 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 					u64 *len)
 {
-	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
@@ -77,13 +76,13 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	*len = min_prot_len << (bp - 1);
 
-	if (*len > mtd->size)
-		*len = mtd->size;
+	if (*len > nor->params->size)
+		*len = nor->params->size;
 
 	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
 		*ofs = 0;
 	else
-		*ofs = mtd->size - *len;
+		*ofs = nor->params->size - *len;
 }
 
 /*
@@ -158,7 +157,6 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
  */
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
@@ -183,7 +181,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		can_be_bottom = false;
 
 	/* If anything above us is unlocked, we can't use 'top' protection */
-	if (!spi_nor_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
+	if (!spi_nor_is_locked_sr(nor, ofs + len, nor->params->size - (ofs + len),
 				  status_old))
 		can_be_top = false;
 
@@ -195,11 +193,11 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	/* lock_len: length of region that should end up locked */
 	if (use_top)
-		lock_len = mtd->size - ofs;
+		lock_len = nor->params->size - ofs;
 	else
 		lock_len = ofs + len;
 
-	if (lock_len == mtd->size) {
+	if (lock_len == nor->params->size) {
 		val = mask;
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
@@ -248,7 +246,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
@@ -273,7 +270,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		can_be_top = false;
 
 	/* If anything above us is locked, we can't use 'bottom' protection */
-	if (!spi_nor_is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
+	if (!spi_nor_is_unlocked_sr(nor, ofs + len, nor->params->size - (ofs + len),
 				    status_old))
 		can_be_bottom = false;
 
@@ -285,7 +282,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	/* lock_len: length of region that should remain locked */
 	if (use_top)
-		lock_len = mtd->size - (ofs + len);
+		lock_len = nor->params->size - (ofs + len);
 	else
 		lock_len = ofs;
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
