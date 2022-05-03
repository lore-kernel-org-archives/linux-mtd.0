Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F656C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLLHnugJ3gxrlljFKz1zw6rab54kZpT71N16o5QyKvo=; b=y14M2BwTYAHkyB
	MYWNlSKQxam2bw93w7tIuygpGKikO4kZGdbFdvuNBewVU9A/H+iGLekBoMqIpYe8XjyEXv/8eQuor
	TBOtTuFAinB3BrWL7YH1RVT48TEwZ3OdxWvwPnpwQBhpTxguFAw1qlpxQYUnkvCm/BYET2YFI1OzZ
	HBMC1K+QAIikrB4p1UmUG8F0SFQrh32J9fMkP/TIj04ppjB3fiDW9oPKwcbFpWxwzuXYaXp07lraQ
	oFwISaoo4gZH1P9f/u4XJcD7o++JRxzNgw78LZZXAxVbs+L/YKXdLmKksLOoF/R7oxwVD9Yz5guhX
	+qUgJS93MkMFqXEf8n9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlni5-004ZF5-6Q; Tue, 03 May 2022 08:16:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlnhz-004ZDP-Mi
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565795; x=1683101795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7eKdp6UzU7cgQ00B3Ym9xWrGrAbwEhMF5rejAPX+KLg=;
 b=x9Bj6E2f9Ohd7EuVXFxbJ3JOU+/pcBykP9cGqq3YT8D/oS/7kZ2um+Vy
 v75LPDfzuNULOkqnPoPkAZ0CEFsoi3Jn62DH2SqwuT++vJWcYFvBVRRuy
 nnHsQweiBQ8l+scwZbmyvlR6z1FUD7kOOa0mVXHDQ+yR0VyAkA0EjkwZv
 IY+cs1m2KGJTr+r/tuGBgzIBsCqguws0D9ej5GiKuzQxaSuS7MPyrfeLp
 7QPJQjEMqhNx9We/1Q1X7JfEyodmIvbp04VqxxMR1Fi86zHCoRS3yOo61
 qbHlJ/mBlArlT50UfYHecR4O6opRN7v/CF8ORBYz7ddeJpjLxKFB5Mtfl A==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="162523470"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:33 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:31 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Date: Tue, 3 May 2022 11:16:20 +0300
Message-ID: <20220503081627.341870-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011635_834936_04A2C73A 
X-CRM114-Status: GOOD (  23.57  )
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

Address width was an unfortunate name, as it means the number of IO lines
used for the address, whereas in the code it is used as the number of
address bytes. s/addr_width/addr_nbytes throughout the entire SPI NOR
framework.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c |  6 +--
 drivers/mtd/spi-nor/controllers/hisi-sfc.c   |  2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c  |  8 ++--
 drivers/mtd/spi-nor/core.c                   | 46 ++++++++++----------
 drivers/mtd/spi-nor/core.h                   | 12 ++---
 drivers/mtd/spi-nor/issi.c                   |  2 +-
 drivers/mtd/spi-nor/otp.c                    | 12 ++---
 drivers/mtd/spi-nor/sfdp.c                   | 32 +++++++-------
 drivers/mtd/spi-nor/xilinx.c                 |  2 +-
 include/linux/mtd/spi-nor.h                  |  4 +-
 10 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index acfe010f9dd7..5ac8c321535b 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -350,10 +350,10 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 	__be32 temp;
 	u32 cmdaddr;
 
-	switch (nor->addr_width) {
+	switch (nor->addr_nbytes) {
 	default:
 		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
-			  nor->addr_width);
+			  nor->addr_nbytes);
 		fallthrough;
 	case 3:
 		cmdaddr = addr & 0xFFFFFF;
@@ -709,7 +709,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	const struct aspeed_smc_info *info = controller->info;
 	u32 cmd;
 
-	if (chip->nor.addr_width == 4 && info->set_4b)
+	if (chip->nor.addr_nbytes == 4 && info->set_4b)
 		info->set_4b(chip);
 
 	/* This is for direct AHB access when using Command Mode. */
diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 94a969185ceb..5070d72835ec 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -237,7 +237,7 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
 	reg = readl(host->regbase + FMC_CFG);
 	reg &= ~(FMC_CFG_OP_MODE_MASK | SPI_NOR_ADDR_MODE_MASK);
 	reg |= FMC_CFG_OP_MODE_NORMAL;
-	reg |= (nor->addr_width == 4) ? SPI_NOR_ADDR_MODE_4BYTES
+	reg |= (nor->addr_nbytes == 4) ? SPI_NOR_ADDR_MODE_4BYTES
 		: SPI_NOR_ADDR_MODE_3BYTES;
 	writel(reg, host->regbase + FMC_CFG);
 
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 9032b9ab2eaf..ab3990e6ac25 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -203,7 +203,7 @@ static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
 	      SPIFI_CMD_DATALEN(len) |
 	      SPIFI_CMD_FIELDFORM_ALL_SERIAL |
 	      SPIFI_CMD_OPCODE(nor->program_opcode) |
-	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
+	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_nbytes + 1);
 	writel(cmd, spifi->io_base + SPIFI_CMD);
 
 	for (i = 0; i < len; i++)
@@ -230,7 +230,7 @@ static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
 
 	cmd = SPIFI_CMD_FIELDFORM_ALL_SERIAL |
 	      SPIFI_CMD_OPCODE(nor->erase_opcode) |
-	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
+	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_nbytes + 1);
 	writel(cmd, spifi->io_base + SPIFI_CMD);
 
 	return nxp_spifi_wait_for_cmd(spifi);
@@ -252,12 +252,12 @@ static int nxp_spifi_setup_memory_cmd(struct nxp_spifi *spifi)
 	}
 
 	/* Memory mode supports address length between 1 and 4 */
-	if (spifi->nor.addr_width < 1 || spifi->nor.addr_width > 4)
+	if (spifi->nor.addr_nbytes < 1 || spifi->nor.addr_nbytes > 4)
 		return -EINVAL;
 
 	spifi->mcmd |= SPIFI_CMD_OPCODE(spifi->nor.read_opcode) |
 		       SPIFI_CMD_INTLEN(spifi->nor.read_dummy / 8) |
-		       SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
+		       SPIFI_CMD_FRAMEFORM(spifi->nor.addr_nbytes + 1);
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6bf3921541b5..b2e6a7050b3a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -38,7 +38,7 @@
  */
 #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
 
-#define SPI_NOR_MAX_ADDR_WIDTH	4
+#define SPI_NOR_MAX_ADDR_NBYTES	4
 
 #define SPI_NOR_SRST_SLEEP_MIN 200
 #define SPI_NOR_SRST_SLEEP_MAX 400
@@ -198,7 +198,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
 {
 	struct spi_mem_op op =
 		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
-			   SPI_MEM_OP_ADDR(nor->addr_width, from, 0),
+			   SPI_MEM_OP_ADDR(nor->addr_nbytes, from, 0),
 			   SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 			   SPI_MEM_OP_DATA_IN(len, buf, 0));
 	bool usebouncebuf;
@@ -262,7 +262,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 {
 	struct spi_mem_op op =
 		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 0),
-			   SPI_MEM_OP_ADDR(nor->addr_width, to, 0),
+			   SPI_MEM_OP_ADDR(nor->addr_nbytes, to, 0),
 			   SPI_MEM_OP_NO_DUMMY,
 			   SPI_MEM_OP_DATA_OUT(len, buf, 0));
 	ssize_t nbytes;
@@ -1143,7 +1143,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
-						nor->addr_width, addr);
+						nor->addr_nbytes, addr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
 
@@ -1156,13 +1156,13 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	 * Default implementation, if driver doesn't have a specialized HW
 	 * control
 	 */
-	for (i = nor->addr_width - 1; i >= 0; i--) {
+	for (i = nor->addr_nbytes - 1; i >= 0; i--) {
 		nor->bouncebuf[i] = addr & 0xff;
 		addr >>= 8;
 	}
 
 	return spi_nor_controller_ops_write_reg(nor, nor->erase_opcode,
-						nor->bouncebuf, nor->addr_width);
+						nor->bouncebuf, nor->addr_nbytes);
 }
 
 /**
@@ -2279,9 +2279,9 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static int spi_nor_set_addr_width(struct spi_nor *nor)
+static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
-	if (nor->addr_width) {
+	if (nor->addr_nbytes) {
 		/* already configured from SFDP */
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
@@ -2296,26 +2296,26 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
 		 * Force all 8D-8D-8D flashes to use an address width of 4 to
 		 * avoid this situation.
 		 */
-		nor->addr_width = 4;
-	} else if (nor->info->addr_width) {
-		nor->addr_width = nor->info->addr_width;
+		nor->addr_nbytes = 4;
+	} else if (nor->info->addr_nbytes) {
+		nor->addr_nbytes = nor->info->addr_nbytes;
 	} else {
-		nor->addr_width = 3;
+		nor->addr_nbytes = 3;
 	}
 
-	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
+	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
+		nor->addr_nbytes = 4;
 	}
 
-	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
+	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
 		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_width);
+			nor->addr_nbytes);
 		return -EINVAL;
 	}
 
 	/* Set 4byte opcodes when possible. */
-	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
 	    !(nor->flags & SNOR_F_HAS_4BAIT))
 		spi_nor_set_4byte_opcodes(nor);
 
@@ -2334,7 +2334,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	return spi_nor_set_addr_width(nor);
+	return spi_nor_set_addr_nbytes(nor);
 }
 
 /**
@@ -2527,7 +2527,7 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_width = 0;
+		nor->addr_nbytes = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
@@ -2748,7 +2748,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_width == 4 &&
+	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
 	    !(nor->flags & SNOR_F_4B_OPCODES)) {
 		/*
@@ -2875,7 +2875,7 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
-	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
+	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
 		nor->params->set_4byte_addr_mode(nor, false);
 
@@ -3060,7 +3060,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 {
 	struct spi_mem_dirmap_info info = {
 		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
-				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
+				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
 				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
@@ -3091,7 +3091,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 {
 	struct spi_mem_dirmap_info info = {
 		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 0),
-				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
+				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
 				      SPI_MEM_OP_NO_DUMMY,
 				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
 		.offset = 0,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 80d4831a4f34..5fc3d4a8add1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -90,9 +90,9 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPI_NOR_SECTOR_ERASE_OP(opcode, addr_width, addr)		\
+#define SPI_NOR_SECTOR_ERASE_OP(opcode, addr_nbytes, addr)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
-		   SPI_MEM_OP_ADDR(addr_width, addr, 0),		\
+		   SPI_MEM_OP_ADDR(addr_nbytes, addr, 0),		\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
@@ -434,7 +434,7 @@ struct spi_nor_fixups {
  *                  isn't necessarily called a "sector" by the vendor.
  * @n_sectors:      the number of sectors.
  * @page_size:      the flash's page size.
- * @addr_width:     the flash's address width.
+ * @addr_nbytes:    number of address bytes to send.
  *
  * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
  *                  meaning. If one wants to skip the SFDP tables, one should
@@ -493,7 +493,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
-	u16 addr_width;
+	u16 addr_nbytes;
 
 	bool parse_sfdp;
 	u16 flags;
@@ -555,11 +555,11 @@ struct flash_info {
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
 
-#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
+#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
-		.addr_width = (_addr_width),				\
+		.addr_nbytes = (_addr_nbytes),				\
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
 
 #define OTP_INFO(_len, _n_regions, _base, _offset)			\
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index c012bc2486e1..23e331cc42a9 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -20,7 +20,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 	 */
 	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
-		nor->addr_width = 4;
+		nor->addr_nbytes = 4;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index fa63d8571218..00ab0d2d6d2f 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -35,13 +35,13 @@
  */
 int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 {
-	u8 addr_width, read_opcode, read_dummy;
+	u8 addr_nbytes, read_opcode, read_dummy;
 	struct spi_mem_dirmap_desc *rdesc;
 	enum spi_nor_protocol read_proto;
 	int ret;
 
 	read_opcode = nor->read_opcode;
-	addr_width = nor->addr_width;
+	addr_nbytes = nor->addr_nbytes;
 	read_dummy = nor->read_dummy;
 	read_proto = nor->read_proto;
 	rdesc = nor->dirmap.rdesc;
@@ -54,7 +54,7 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 	ret = spi_nor_read_data(nor, addr, len, buf);
 
 	nor->read_opcode = read_opcode;
-	nor->addr_width = addr_width;
+	nor->addr_nbytes = addr_nbytes;
 	nor->read_dummy = read_dummy;
 	nor->read_proto = read_proto;
 	nor->dirmap.rdesc = rdesc;
@@ -85,11 +85,11 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 {
 	enum spi_nor_protocol write_proto;
 	struct spi_mem_dirmap_desc *wdesc;
-	u8 addr_width, program_opcode;
+	u8 addr_nbytes, program_opcode;
 	int ret, written;
 
 	program_opcode = nor->program_opcode;
-	addr_width = nor->addr_width;
+	addr_nbytes = nor->addr_nbytes;
 	write_proto = nor->write_proto;
 	wdesc = nor->dirmap.wdesc;
 
@@ -113,7 +113,7 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 
 out:
 	nor->program_opcode = program_opcode;
-	nor->addr_width = addr_width;
+	nor->addr_nbytes = addr_nbytes;
 	nor->write_proto = write_proto;
 	nor->dirmap.wdesc = wdesc;
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a5211543d30d..61ae8c8c5237 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -134,7 +134,7 @@ struct sfdp_4bait {
 
 /**
  * spi_nor_read_raw() - raw read of serial flash memory. read_opcode,
- *			addr_width and read_dummy members of the struct spi_nor
+ *			addr_nbytes and read_dummy members of the struct spi_nor
  *			should be previously
  * set.
  * @nor:	pointer to a 'struct spi_nor'
@@ -178,21 +178,21 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 			     size_t len, void *buf)
 {
-	u8 addr_width, read_opcode, read_dummy;
+	u8 addr_nbytes, read_opcode, read_dummy;
 	int ret;
 
 	read_opcode = nor->read_opcode;
-	addr_width = nor->addr_width;
+	addr_nbytes = nor->addr_nbytes;
 	read_dummy = nor->read_dummy;
 
 	nor->read_opcode = SPINOR_OP_RDSFDP;
-	nor->addr_width = 3;
+	nor->addr_nbytes = 3;
 	nor->read_dummy = 8;
 
 	ret = spi_nor_read_raw(nor, addr, len, buf);
 
 	nor->read_opcode = read_opcode;
-	nor->addr_width = addr_width;
+	nor->addr_nbytes = addr_nbytes;
 	nor->read_dummy = read_dummy;
 
 	return ret;
@@ -462,11 +462,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
 	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
-		nor->addr_width = 3;
+		nor->addr_nbytes = 3;
 		break;
 
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
-		nor->addr_width = 4;
+		nor->addr_nbytes = 4;
 		break;
 
 	default:
@@ -637,12 +637,12 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 }
 
 /**
- * spi_nor_smpt_addr_width() - return the address width used in the
+ * spi_nor_smpt_addr_nbytes() - return the number of address bytes used in the
  *			       configuration detection command.
  * @nor:	pointer to a 'struct spi_nor'
  * @settings:	configuration detection command descriptor, dword1
  */
-static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
+static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings)
 {
 	switch (settings & SMPT_CMD_ADDRESS_LEN_MASK) {
 	case SMPT_CMD_ADDRESS_LEN_0:
@@ -653,7 +653,7 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->addr_width;
+		return nor->addr_nbytes;
 	}
 }
 
@@ -690,7 +690,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	u32 addr;
 	int err;
 	u8 i;
-	u8 addr_width, read_opcode, read_dummy;
+	u8 addr_nbytes, read_opcode, read_dummy;
 	u8 read_data_mask, map_id;
 
 	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
@@ -698,7 +698,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
-	addr_width = nor->addr_width;
+	addr_nbytes = nor->addr_nbytes;
 	read_dummy = nor->read_dummy;
 	read_opcode = nor->read_opcode;
 
@@ -709,7 +709,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 			break;
 
 		read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
-		nor->addr_width = spi_nor_smpt_addr_width(nor, smpt[i]);
+		nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
 		nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
 		nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
 		addr = smpt[i + 1];
@@ -756,7 +756,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	/* fall through */
 out:
 	kfree(buf);
-	nor->addr_width = addr_width;
+	nor->addr_nbytes = addr_nbytes;
 	nor->read_dummy = read_dummy;
 	nor->read_opcode = read_opcode;
 	return ret;
@@ -1044,7 +1044,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	/*
 	 * We need at least one 4-byte op code per read, program and erase
 	 * operation; the .read(), .write() and .erase() hooks share the
-	 * nor->addr_width value.
+	 * nor->addr_nbytes value.
 	 */
 	if (!read_hwcaps || !pp_hwcaps || !erase_mask)
 		goto out;
@@ -1098,7 +1098,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	nor->addr_width = 4;
+	nor->addr_nbytes = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 1d2f5db047bd..5723157739fc 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -31,7 +31,7 @@
 		.sector_size = (8 * (_page_size)),			\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
-		.addr_width = 3,					\
+		.addr_nbytes = 3,					\
 		.flags = SPI_NOR_NO_FR
 
 /* Xilinx S3AN share MFR with Atmel SPI NOR */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5e25a7b75ae2..07b1324d434b 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -353,7 +353,7 @@ struct spi_nor_flash_parameter;
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
- * @addr_width:		number of address bytes
+ * @addr_nbytes:	number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
@@ -382,7 +382,7 @@ struct spi_nor {
 	size_t			bouncebuf_size;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
-	u8			addr_width;
+	u8			addr_nbytes;
 	u8			erase_opcode;
 	u8			read_opcode;
 	u8			read_dummy;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
