Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB505C04FF6
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crF93VxOT6/FNYwz3esGWRJBKOpwlP522JJVCpdc/Fg=; b=lSUk+2K7HsW29T
	47lC5en1AozqFEr13tJRm15H3rryvMzO720cUz4Oiyp7EUZx4o5w8lYN67GrjiG/jMOYSoCdxNo7o
	x8y57sm39oHu+hL2aKzyuMC3IF3Gv3qpiKG0/vzHxkK+QvaLefz1u4iEEKpr8/4diqoQ1sKniD7IV
	7xYKi4OF0OKRXzriq6ItHXZ1JiNC7YK+kDsyrLRObHojmVnDaeK7//QIyEFJo5N+X8iYbQ2J6V1CB
	A4bZlPj2+KD4HFlIGFOwal8inVqBbv8bjVXnb3DrlN6zA9mJ3nMJuO1pG4TmFFqFRKfi2Rt4GSbbC
	ebOmqJ7ZHkUvAPvV3txQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0J-00000005vNG-13ZF;
	Fri, 19 Apr 2024 14:14:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0G-00000005vM8-19xi
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 14:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A746619F7;
	Fri, 19 Apr 2024 14:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D068C3277B;
	Fri, 19 Apr 2024 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713536051;
	bh=q2bEZDZIudIS1aIa7CkbX4KQHDVLkk1sD20tkmStKgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+pT+XHEQrmbwKuAGXrFAPoJzygazswmUPaVuAbqaudckIJXqbZYvfTbyFkk/tWnP
	 sG7XtRzpei9J+MiWAoFJoCMDckSUtF98Kks8UiEm5kM5UnBEAPiLjlGu6acnOkzU5P
	 Irar+7lFMBF9zl1INSMepDc2gzARH4HUmPxxAR9X5yTv7ZzZ4Gi05GI0kYCHTeyKPs
	 /7Tad5JZCoQOA96NHTFQ7/Onrk6cKv7JHDIrZ/K/Bn6RsdByTGVkMqEFUCXN6fSqmH
	 pVfw7HWDHpxjWcSCyFxUO2wr6uURB9eIVppuGwtq+kOOxJP/vNhN/7AU8KZtrzn15G
	 VhsTHZgHUAoXQ==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 2/6] mtd: spi-nor: get rid of non-power-of-2 page size handling
Date: Fri, 19 Apr 2024 16:12:45 +0200
Message-Id: <20240419141249.609534-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419141249.609534-1-mwalle@kernel.org>
References: <20240419141249.609534-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_071412_434370_A4F2FE56 
X-CRM114-Status: GOOD (  19.34  )
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

The Xilinx flashes were the only user of the page sized that were no
power of 2. Support for them were dropped, thus we can also get rid of
the special page size handling for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 41 ++++++++++----------------------------
 drivers/mtd/spi-nor/core.h |  4 ----
 2 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cbe5f92eb0af..31dfdbf96765 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1463,14 +1463,6 @@ static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size
 	spi_nor_unprep(nor);
 }
 
-static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
-{
-	if (!nor->params->convert_addr)
-		return addr;
-
-	return nor->params->convert_addr(nor, addr);
-}
-
 /*
  * Initiate the erasure of a single sector
  */
@@ -1478,8 +1470,6 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 {
 	int i;
 
-	addr = spi_nor_convert_addr(nor, addr);
-
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
@@ -2064,8 +2054,6 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	while (len) {
 		loff_t addr = from;
 
-		addr = spi_nor_convert_addr(nor, addr);
-
 		ret = spi_nor_read_data(nor, addr, len, buf);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
@@ -2098,7 +2086,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	size_t page_offset, page_remain, i;
+	size_t i;
 	ssize_t ret;
 	u32 page_size = nor->params->page_size;
 
@@ -2111,23 +2099,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
-
-		/*
-		 * If page_size is a power of two, the offset can be quickly
-		 * calculated with an AND operation. On the other cases we
-		 * need to do a modulus operation (more expensive).
-		 */
-		if (is_power_of_2(page_size)) {
-			page_offset = addr & (page_size - 1);
-		} else {
-			u64 aux = addr;
-
-			page_offset = do_div(aux, page_size);
-		}
+		size_t page_offset = addr & (page_size - 1);
 		/* the size of data remaining on the first page */
-		page_remain = min_t(size_t, page_size - page_offset, len - i);
-
-		addr = spi_nor_convert_addr(nor, addr);
+		size_t page_remain = min_t(size_t, page_size - page_offset, len - i);
 
 		ret = spi_nor_lock_device(nor);
 		if (ret)
@@ -3054,7 +3028,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		spi_nor_init_params_deprecated(nor);
 	}
 
-	return spi_nor_late_init_params(nor);
+	ret = spi_nor_late_init_params(nor);
+	if (ret)
+		return ret;
+
+	if (WARN_ON(!is_power_of_2(nor->params->page_size)))
+		return -EINVAL;
+
+	return 0;
 }
 
 /** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 072c69b0d06c..3043d583eac2 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -366,9 +366,6 @@ struct spi_nor_otp {
  * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
- * @convert_addr:	converts an absolute address into something the flash
- *                      will understand. Particularly useful when pagesize is
- *                      not a power-of-2.
  * @setup:		(optional) configures the SPI NOR memory. Useful for
  *			SPI NOR flashes that have peculiarities to the SPI NOR
  *			standard e.g. different opcodes, specific address
@@ -403,7 +400,6 @@ struct spi_nor_flash_parameter {
 	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
-	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
 	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
 	int (*ready)(struct spi_nor *nor);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
