Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469B2C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FsaHg3T9xtrexL2eDs2+cu0pS+3S955z+f8z5zseaU=; b=3+OmiZwcn9mlq2
	lq+jUMQYJdThMf0Qcp0yhgURVVEKihm5LZUw7OCiNKnB+SOxfJyiN8Zj00lPvQBo09hQMiUq4nAQR
	s3S85rW/IlMdWqLY9KQgJj/TdN8F3t6Q8lTBAGgQZSbvT21ZgjpPPO2WyquYawkA4RZeY7jJcsOqb
	Vt1GanXPms3KdO+kRYJQfaoanVaaNrXaYwQV8uN3x8DH0mC6BGku49BYNSWku/Nk0qwCXqe5OQmq1
	+cfVDuGNCE9ConC0De1c3VvI2LzBYdkZu3AgcqE3CPfXdPrmCwfUOBK96EnnxAPtr7KFehiCwNpCb
	bCLzoCFvxHuUOAvJ0b8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE4d-000VgK-Rk; Thu, 09 Jun 2022 09:03:28 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE13-000Tnk-7U
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so20495771pjt.4
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+yFBcR/nCNd8fULBpw1am8yAwscEOwV9ABLOIN1JcI=;
        b=qHsqYhJazFfXFfKWDUi1tgBTojPYmgPQmOsigzkTt8ox6bH8LA7fBpe7TCsTZFTDOc
         iPhD90ewY1x5eFDJ/Ef9A2926hWZ58dMR9S0RN6+Jv8wF3w4uDdE3Dx7z6xX8/gJOVDh
         qYxr0WLec9GV2dYE8hbBGOIwaEHuZOpOpQtZtdjs/oQzk/8gXzz840+Q1GbvWsOwVJeA
         E6tpZmn/7Mce4QGGKaVD1xOeRzotkavPkaw+Z0P0hPtFQbPDzd20WzDtjtUCKsm7utvt
         IGvVZi8IPV7I6x9LXe7gUv8wOOx9XNRGdEiXRSWTRPBgrSHh9FzvIqWv3/mLrZN/Wijk
         N05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+yFBcR/nCNd8fULBpw1am8yAwscEOwV9ABLOIN1JcI=;
        b=NCXbxeFgXKe5lzHMA6xL065jJoDqlZ6uEJWxEAomyhrc3PM2DztH4qOCEfDAbcxQRR
         a6H1MtzKikkrFROieypZusgLzK6otB6kaQc/rw34a4W+6Z5K7xRWAN8VrjwLf8xxORqn
         kYnfJEYKYQQLGlaUv5uZOT1nX0P53ZUHdpfAJrHbpeDLeVmZEtEUsffzTEP/TUyotk4j
         Qm7eCLY34BowB6XZhJ6dAln8HAhRrnIfRdXuga6GEvZeFu9Az4v7EPwPGzmawidlE7Y+
         xKdC/mixgEs86RiqQ+vwg4q3uGIR9xCm0QSXx4sXx2nd55zOcrsmdUWQ3YnMH96TBmY0
         8Vng==
X-Gm-Message-State: AOAM533rN4crY+TLwVwDFGqYJbOuje3CvU7SVRPakriAMu0dZcTpSVbG
	5y8+TAKVS/RZVjOhDVr5kpee41w0vC0=
X-Google-Smtp-Source: ABdhPJx3VNzwTjtsM5Rppwg8FKjTRUz0TdBoc1Sj11/T5a0iiXh9DdEZ81JMVc6QmBzCQi+/IkB7xQ==
X-Received: by 2002:a17:90b:4c48:b0:1e6:9145:513 with SMTP id np8-20020a17090b4c4800b001e691450513mr2416560pjb.227.1654765183350;
        Thu, 09 Jun 2022 01:59:43 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:43 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Date: Thu,  9 Jun 2022 17:57:38 +0900
Message-Id: <51c3b5f0a73bd6d812122f45c3b19b310332ead1.1654741888.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015945_394702_46135D1E 
X-CRM114-Status: GOOD (  24.07  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Address width was an unfortunate name, as it means the number of IO lines
used for the address, whereas in the code it is used as the number of
address bytes. s/addr_width/addr_nbytes throughout the entire SPI NOR
framework.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v16:
  - Remove drivers/mtd/spi-nor/controllers/aspeed-smc.c

 drivers/mtd/spi-nor/controllers/hisi-sfc.c  |  2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c |  8 ++--
 drivers/mtd/spi-nor/core.c                  | 46 ++++++++++-----------
 drivers/mtd/spi-nor/core.h                  | 12 +++---
 drivers/mtd/spi-nor/issi.c                  |  2 +-
 drivers/mtd/spi-nor/otp.c                   | 12 +++---
 drivers/mtd/spi-nor/sfdp.c                  | 32 +++++++-------
 drivers/mtd/spi-nor/xilinx.c                |  2 +-
 include/linux/mtd/spi-nor.h                 |  4 +-
 9 files changed, 60 insertions(+), 60 deletions(-)

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
index 502967c76c5f..14b6b1f38b69 100644
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
@@ -1113,7 +1113,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
-						nor->addr_width, addr);
+						nor->addr_nbytes, addr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
 
@@ -1126,13 +1126,13 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
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
@@ -2249,9 +2249,9 @@ static int spi_nor_default_setup(struct spi_nor *nor,
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
@@ -2266,26 +2266,26 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
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
 
@@ -2304,7 +2304,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	return spi_nor_set_addr_width(nor);
+	return spi_nor_set_addr_nbytes(nor);
 }
 
 /**
@@ -2497,7 +2497,7 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_width = 0;
+		nor->addr_nbytes = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
@@ -2718,7 +2718,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_width == 4 &&
+	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
 	    !(nor->flags & SNOR_F_4B_OPCODES)) {
 		/*
@@ -2845,7 +2845,7 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
-	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
+	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
 		nor->params->set_4byte_addr_mode(nor, false);
 
@@ -3030,7 +3030,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 {
 	struct spi_mem_dirmap_info info = {
 		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
-				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
+				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
 				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
@@ -3061,7 +3061,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 {
 	struct spi_mem_dirmap_info info = {
 		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 0),
-				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
+				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
 				      SPI_MEM_OP_NO_DUMMY,
 				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
 		.offset = 0,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3f841ec36e56..cd76296d0060 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -84,9 +84,9 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPI_NOR_SECTOR_ERASE_OP(opcode, addr_width, addr)		\
+#define SPI_NOR_SECTOR_ERASE_OP(opcode, addr_nbytes, addr)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
-		   SPI_MEM_OP_ADDR(addr_width, addr, 0),		\
+		   SPI_MEM_OP_ADDR(addr_nbytes, addr, 0),		\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
@@ -429,7 +429,7 @@ struct spi_nor_fixups {
  *                  isn't necessarily called a "sector" by the vendor.
  * @n_sectors:      the number of sectors.
  * @page_size:      the flash's page size.
- * @addr_width:     the flash's address width.
+ * @addr_nbytes:    number of address bytes to send.
  *
  * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
  *                  meaning. If one wants to skip the SFDP tables, one should
@@ -488,7 +488,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
-	u16 addr_width;
+	u16 addr_nbytes;
 
 	bool parse_sfdp;
 	u16 flags;
@@ -550,11 +550,11 @@ struct flash_info {
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
index 1ede4c89805a..42218a1164f6 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -351,7 +351,7 @@ struct spi_nor_flash_parameter;
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
- * @addr_width:		number of address bytes
+ * @addr_nbytes:	number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
@@ -381,7 +381,7 @@ struct spi_nor {
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
