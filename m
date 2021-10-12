Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5C2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A92B60ED4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A92B60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DS5LwW6eGiYjRBEcxkUZmaj/z3v8ikqf0pEEg/jIQoE=; b=Q3qaSrQquK7Gey
	Jf0eUzQXMlDizIpJNZC7RTyLmtq+bftbaw5LS6yZz2EYrw8OvKHOArJcU2I5zbSGeK2mObYmXszEa
	h3jXgnHLe48xnQdNFaF2QUrOHn/oDiH7OCH7Rg7WVoJFbtGa1kEr3SybTNn04W8SrCx82D9zw0zSX
	v2kPraC37ptZqzW2cH5ObbDg4zl09bcO3218j99BiwiiC/KN+ucoewR+ByDqx8fWTqWdVXyUE1+e+
	Q08SDk2MKMqHtUHHRqpv0Vk7t2d/4/xogZvfLW47x0kif3XGp8QQF4fumVlm4q6eLeKABD6J1IRD7
	MwQLrUYYGIcVOW28U7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maB73-00BfaL-LU; Tue, 12 Oct 2021 06:18:09 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maB6n-00BfYb-Bw
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 06:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634019473; x=1665555473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L510CHpjo1YY2067LRyVcJ8FsxKVpTHc7AorOe0IHRo=;
 b=kIat4K+ARv451KS6WbfcReKVtFDcy1sr+RZi7k598JyepNXvolMF6S9m
 nFpUBUKY5vaDqfJhlE3gqTSaUO7YZ+EjTVHqtB/B+DbY7uWmxzDGfIqb/
 UnWQ5liScuon9cISZ+8pDotZndSHTrH017lJmAj6IW9KPwTQIImmv5FTD
 oGBbImWDCrVb8AXW56vQ4mvVIjHYgh1XWdKcwloZWz+dsJ/wJqXaJAsWv
 cyY5Fvi8lnrkJ1uIiqpqHylbgpBAOL2gV2rwU8f++bFR5pRKTagad7m45
 nyvwhm6+9noeE3Myp9r3tBsRUAoAUxdfNDIfKKlqVsi8JGofik/62p3eo A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19984098"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:17:45 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:17:45 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:17:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634019465; x=1665555465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L510CHpjo1YY2067LRyVcJ8FsxKVpTHc7AorOe0IHRo=;
 b=lYWtSDbhLEdIYAa8SlJLQB1tHIrPmI+XYmBIzSnAzFbPiDZll0byHzgF
 wIDxwfbEdlo2UZMU23pWhggrnCDt/tRczG1bHvTFCzuhu0hlZLuUOX1un
 UcTGOCktgyZP0T1+pdPUqTjAzXQreI9TipmJXZNkLbBGatd6slX7+O3cl
 6l+GuQQtZv7QLpp6irQm9QNRYWX+SoMRhavzx50MsB5bB99sL+VWfPkyS
 hfYjOlwOXPF6NlQ8lEkoJIivPzavnc0BwlSESOcUFx5C6CnTU1JVEDan2
 f6N216bCROHwRqT1Dofcqq7nTv4z8UmJY/t6a5edTNRDURx7gK/fshA8p g==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19984097"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:17:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 802B2280075;
 Tue, 12 Oct 2021 08:17:45 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: spi-nor: micron-st: Add support for
 output-driver-strength for MT25Q
Date: Tue, 12 Oct 2021 08:17:04 +0200
Message-Id: <20211012061704.284214-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012061704.284214-1-alexander.stein@ew.tq-group.com>
References: <20211012061704.284214-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_231753_749963_09B136F4 
X-CRM114-Status: GOOD (  23.23  )
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

MT25Q[UL] Micron flashes support this by the Bits [2:0] in the Enhanced
Volatile Configuration Register.
Checked datasheet:
- mt25t-qljs-L512-xBA-xxT.pdf

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Various format fixes
* Apply property only to MT25Q devices (e.g. N25Q devices support a
 different set of impedances)
* Use spi_nor_spimem_setup_op() before issuing a command
* Add more return code checking
* Add a warning if setting drive strength fails at some point
* Use GENMASK()

 drivers/mtd/spi-nor/micron-st.c | 152 ++++++++++++++++++++++++++++++--
 1 file changed, 146 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..492805a5a278 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -16,6 +16,11 @@
 #define SPINOR_MT_OCT_DTR	0xe7	/* Enable Octal DTR. */
 #define SPINOR_MT_EXSPI		0xff	/* Enable Extended SPI (default) */
 
+struct micron_drive_strength {
+	u32 ohms;
+	u8 val;
+};
+
 static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
 {
 	struct spi_mem_op op;
@@ -118,6 +123,135 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };
 
+/*
+ * Read Micron enhanced volatile configuration register
+ * Return negative if error occurred or configuration register value
+ */
+static int micron_read_evcr(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_EVCR, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RD_EVCR,
+						    nor->bouncebuf, 1);
+	}
+
+	if (ret < 0) {
+		dev_err(nor->dev, "error %d reading EVCR\n", ret);
+		return ret;
+	}
+
+	return nor->bouncebuf[0];
+}
+
+/*
+ * Write Micron enhanced volatile configuration register
+ * Return negative if error occurred or configuration register value
+ */
+static int micron_write_evcr(struct spi_nor *nor, u8 evcr)
+{
+	int ret;
+
+	nor->bouncebuf[0] = evcr;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WD_EVCR, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		return spi_mem_exec_op(nor->spimem, &op);
+	}
+
+	return nor->controller_ops->write_reg(nor, SPINOR_OP_WD_EVCR,
+					      nor->bouncebuf, 1);
+}
+
+/*
+ * Supported values from Enahanced Volatile COnfiguration Register (Bits 2:0)
+ */
+static const struct micron_drive_strength drive_strength_data[] = {
+	{ .ohms = 90, .val = 1 },
+	{ .ohms = 45, .val = 3 },
+	{ .ohms = 20, .val = 5 },
+	{ .ohms = 30, .val = 7 },
+};
+
+static const struct micron_drive_strength *micron_st_find_drive_strength_entry(u32 ohms)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(drive_strength_data); i++) {
+		if (ohms == drive_strength_data[i].ohms)
+			return &drive_strength_data[i];
+	}
+	return NULL;
+}
+
+static void mt25q_post_sfdp(struct spi_nor *nor)
+{
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	u32 ohms;
+
+	if (!np)
+		return;
+
+	if (!of_property_read_u32(np, "output-driver-strength", &ohms)) {
+		struct micron_drive_strength const *entry =
+			micron_st_find_drive_strength_entry(ohms);
+
+		if (entry) {
+			int evcrr;
+			int ret;
+			u8 evcr;
+
+			evcrr = micron_read_evcr(nor);
+			if (evcrr < 0) {
+				dev_warn(nor->dev,
+					 "Reading EVCR failed: %d\n",
+					 evcrr);
+				return;
+			}
+
+			evcr = (u8)(evcrr & GENMASK(7, 3)) | entry->val;
+
+			ret = micron_write_evcr(nor, evcr);
+			if (ret)
+				dev_warn(nor->dev,
+					 "Setting EVCR failed: %d\n",
+					 ret);
+
+			dev_dbg(nor->dev, "%s: EVCR 0x%x\n", __func__,
+				(u32)micron_read_evcr(nor));
+		} else {
+			dev_warn(nor->dev,
+				"Invalid output-driver-strength property specified: %u",
+				ohms);
+		}
+	}
+}
+
+static struct spi_nor_fixups mt25q_fixups = {
+	.post_sfdp = mt25q_post_sfdp,
+};
+
 static const struct flash_info micron_parts[] = {
 	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
 			       SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
@@ -149,25 +283,29 @@ static const struct flash_info st_parts[] = {
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
+	  .fixups = &mt25q_fixups },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
 			      USE_FSR | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
+	  .fixups = &mt25q_fixups },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
+	  .fixups = &mt25q_fixups },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
+	  .fixups = &mt25q_fixups },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
@@ -182,10 +320,12 @@ static const struct flash_info st_parts[] = {
 			      NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      NO_CHIP_ERASE) },
+			      NO_CHIP_ERASE)
+	  .fixups = &mt25q_fixups },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
 			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE)
+	  .fixups = &mt25q_fixups },
 
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
 	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
