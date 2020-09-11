Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D93C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 22:28:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F1C221EB
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 22:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgK/Ga7Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="up4RrXzj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F1C221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VM5KFK9j6jgV0S6Mmkfe14JQviNdPMenwsuATuAB0m8=; b=fgK/Ga7YPS/G+mAeT4iT7csID
	vga4RUpYwf2KR2ZWMcmSWo9SReS97rA/HiqVgmF+KwW6fD1GW1t+HQOR7kTA1QDlrNn6DqelMIJoo
	9nwf8yJxD9Z450spqL/05xarQSNzvcu2k4qdf0kf9pLEjD8pC/Cc6sfZlQIzFmhlqkEyB2qFuQL5w
	L5Jge4HdkVQr9EEblzn3cjcORsh0BAyiYRLgXFTHWH4WYnBsn3EE+H0+GEiaeKNN9EtN/jIbWEYwj
	yf3ehyqgN7ok1+qYJ4wqex5B/JSlCmgoh014c54LclLwy/21xY8tas1hhLWrd4GNaseh0BdADx28Z
	3LeF43+ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGrVQ-0000KF-Lv; Fri, 11 Sep 2020 22:26:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGrVN-0000Ix-8E
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 22:26:54 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B107323E3E;
 Sat, 12 Sep 2020 00:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1599863209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmmwK2Y9u7jsPMtTnW9MItYW8rCYDk6ANdnsdKNOgqU=;
 b=up4RrXzjlO92SvcRh6Z+R3wQ0gag4uRzavmr5z4uOvOsygkj5IysJP2NSWM/9sXQb7LucX
 FnGxntFF85xuHZavU7onqeNByjzF+U4D7yhvFriAEwbrvQNtbi51GrrehtFvqCsmGpFgid
 p5QNvJEcX44hh1eb6CXzOQ0tERGaAC0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] mtd: spi-nor: implement OTP support for Winbond and
 similar flashes
Date: Sat, 12 Sep 2020 00:26:34 +0200
Message-Id: <20200911222634.31804-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911222634.31804-1-michael@walle.cc>
References: <20200911222634.31804-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_182653_562820_151C72A1 
X-CRM114-Status: GOOD (  25.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use the new OTP ops to implement OTP access on Winbond flashes. Most
Winbond flashes provides up to four different OTP areas ("Security
Registers"). Newer flashes uses the first OTP area for SFDP data. Thus,
for these flashes only the last three areas are handled and the first
one is left untouched.

This was tested on a Winbond W25Q32JW as well as on a W25Q32FW.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c    | 161 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h    |   4 +
 drivers/mtd/spi-nor/winbond.c |  18 +++-
 include/linux/mtd/spi-nor.h   |  10 +++
 4 files changed, 191 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 348db19958e9..c150e3b6ee44 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2997,6 +2997,167 @@ int spi_nor_otp_is_locked_scur(struct spi_nor *nor, unsigned int region)
 	return *scur & SCUR_LDSO;
 }
 
+/**
+ * spi_nor_otp_read_secr() - read OTP data
+ * @nor:	pointer to 'struct spi_nor'
+ * @from:       offset to read from
+ * @len:        number of bytes to read
+ * @buf:        pointer to dst buffer
+ *
+ * Read OTP data by using the SPINOR_OP_RSECR commands. This method is used on
+ * GigaDevice and Winbond flashes.
+ *
+ * Return: number of bytes read successfully, -errno otherwise
+ */
+int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, uint64_t len, u8 *buf)
+{
+	u8 addr_width, read_opcode, read_dummy;
+	struct spi_mem_dirmap_desc *rdesc;
+	enum spi_nor_protocol read_proto;
+	int ret;
+
+	read_opcode = nor->read_opcode;
+	addr_width = nor->addr_width;
+	read_dummy = nor->read_dummy;
+	read_proto = nor->read_proto;
+	rdesc = nor->dirmap.rdesc;
+
+	nor->read_opcode = SPINOR_OP_RSECR;
+	nor->addr_width = 3;
+	nor->read_dummy = 8;
+	nor->read_proto = SNOR_PROTO_1_1_1;
+	nor->dirmap.rdesc = NULL;
+
+	ret = spi_nor_read_data(nor, addr, len, buf);
+
+	nor->read_opcode = read_opcode;
+	nor->addr_width = addr_width;
+	nor->read_dummy = read_dummy;
+	nor->read_proto = read_proto;
+	nor->dirmap.rdesc = rdesc;
+
+	return ret;
+}
+
+/**
+ * spi_nor_otp_write_secr() - write OTP data
+ * @nor:        pointer to 'struct spi_nor'
+ * @to:         offset to write to
+ * @len:        number of bytes to write
+ * @buf:        pointer to src buffer
+ *
+ * Write OTP data by using the SPINOR_OP_PSECR commands. This method is used on
+ * GigaDevice and Winbond flashes.
+ *
+ * Return: number of bytes written successfully, -errno otherwise
+ */
+int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, uint64_t len, u8 *buf)
+{
+	enum spi_nor_protocol write_proto;
+	struct spi_mem_dirmap_desc *wdesc;
+	u8 addr_width, program_opcode;
+	int ret;
+
+	program_opcode = nor->program_opcode;
+	addr_width = nor->addr_width;
+	write_proto = nor->write_proto;
+	wdesc = nor->dirmap.wdesc;
+
+	nor->program_opcode = SPINOR_OP_PSECR;
+	nor->addr_width = 3;
+	nor->write_proto = SNOR_PROTO_1_1_1;
+	nor->dirmap.wdesc = NULL;
+
+	/*
+	 * We only support a write to one single page. For now all winbond
+	 * flashes only have one page per OTP region.
+	 */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		goto out;
+
+	ret = spi_nor_write_data(nor, addr, len, buf);
+	if (ret < 0)
+		goto out;
+
+	ret = spi_nor_wait_till_ready(nor);
+
+out:
+	nor->program_opcode = program_opcode;
+	nor->addr_width = addr_width;
+	nor->write_proto = write_proto;
+	nor->dirmap.wdesc = wdesc;
+
+	return ret;
+}
+
+static int spi_nor_otp_lock_bit_cr(unsigned int region)
+{
+	static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
+
+	if (region >= ARRAY_SIZE(lock_bits))
+		return -EINVAL;
+
+	return lock_bits[region];
+}
+
+/**
+ * spi_nor_otp_lock_sr2() - lock the OTP region
+ * @nor:        pointer to 'struct spi_nor'
+ * @region:     OTP region
+ *
+ * Lock the OTP region by writing the status register-2. This method is used on
+ * GigaDevice and Winbond flashes.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region)
+{
+	int lock_bit;
+	u8 *sr2 = nor->bouncebuf;
+	int ret;
+
+	lock_bit = spi_nor_otp_lock_bit_cr(region);
+	if (lock_bit < 0)
+		return lock_bit;
+
+	ret = spi_nor_read_cr(nor, sr2);
+	if (ret)
+		return ret;
+
+	/* check if its already locked */
+	if (*sr2 & lock_bit)
+		return 0;
+
+	return spi_nor_write_16bit_cr_and_check(nor, *sr2 | lock_bit);
+}
+
+/**
+ * spi_nor_otp_is_locked_sr2() - get the OTP region lock status
+ * @nor:        pointer to 'struct spi_nor'
+ * @region:     OTP region
+ *
+ * Retrieve the OTP region lock bit by reading the status register-2. This
+ * method is used on GigaDevice and Winbond flashes.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
+{
+	int lock_bit;
+	u8 *sr2 = nor->bouncebuf;
+	int ret;
+
+	lock_bit = spi_nor_otp_lock_bit_cr(region);
+	if (lock_bit < 0)
+		return lock_bit;
+
+	ret = spi_nor_read_cr(nor, sr2);
+	if (ret)
+		return ret;
+
+	return (*sr2 & lock_bit);
+}
 
 static int spi_nor_init(struct spi_nor *nor)
 {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7ec4add17b72..74bbb7aef1f1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -472,6 +472,10 @@ int spi_nor_otp_read_otp_mode(struct spi_nor *nor, loff_t from, uint64_t len, u8
 int spi_nor_otp_write_otp_mode(struct spi_nor *nor, loff_t to, uint64_t len, u8 *buf);
 int spi_nor_otp_lock_scur(struct spi_nor *nor, unsigned int region);
 int spi_nor_otp_is_locked_scur(struct spi_nor *nor, unsigned int region);
+int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, uint64_t len, u8 *buf);
+int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, uint64_t len, u8 *buf);
+int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
+int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
 
 int spi_nor_hwcaps_read2cmd(u32 hwcaps);
 u8 spi_nor_convert_3to4_read(u8 opcode);
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6dcde15fb1aa..3b14e96e993f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -55,14 +55,19 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			   OTP_INFO(256, 3, 0x1000, 0x1000)
+	},
+
 	{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			    OTP_INFO(256, 3, 0x1000, 0x1000)
+	},
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
@@ -122,9 +127,18 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return spi_nor_write_disable(nor);
 }
 
+static const struct spi_nor_otp_ops winbond_otp_ops = {
+	.read = spi_nor_otp_read_secr,
+	.write = spi_nor_otp_write_secr,
+	.lock = spi_nor_otp_lock_sr2,
+	.is_locked = spi_nor_otp_is_locked_sr2,
+};
+
 static void winbond_default_init(struct spi_nor *nor)
 {
 	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
+	if (nor->params->otp_info.n_otps)
+		nor->params->otp_ops = &winbond_otp_ops;
 }
 
 static const struct spi_nor_fixups winbond_fixups = {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 04195d3e43b8..4750fb631c96 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -110,6 +110,11 @@
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
 
+/* Used for GigaDevices and Winbond flashes. */
+#define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
+#define SPINOR_OP_PSECR		0x42	/* Program Security registers */
+#define SPINOR_OP_RSECR		0x48	/* Read Security registers */
+
 /* Status Register bits. */
 #define SR_WIP			BIT(0)	/* Write in progress */
 #define SR_WEL			BIT(1)	/* Write enable latch */
@@ -141,8 +146,13 @@
 
 /* Status Register 2 bits. */
 #define SR2_QUAD_EN_BIT1	BIT(1)
+#define SR2_LB0			BIT(2)	/* Security Register Lock Bit 0 */
+#define SR2_LB1			BIT(3)	/* Security Register Lock Bit 1 */
+#define SR2_LB2			BIT(4)	/* Security Register Lock Bit 2 */
+#define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
+
 /* Supported SPI protocols */
 #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
 #define SNOR_PROTO_INST_SHIFT	16
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
