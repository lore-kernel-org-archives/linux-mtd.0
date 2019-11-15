Return-Path: <SRS0=wpvZ=ZH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6ECC432C3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 09:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EDD20732
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 09:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WPITa+wW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98EDD20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7GL+Go4Rh8fVS/jUEuO13tQtbpuxtCvBY5sBrK1JGk0=; b=WPITa+wW2PPEn+qumc9EfK/NiM
	HO4AWo+6XRNIx0ocxwEv6gaMDgLlwDHfTrQX5y5a18i083ata1jMYhmzjUeL6X9gmu282I9fR+c17
	RziwYgtYw5LLQXd+bi8UK5wQEwfbA5idi0TxU7tCuhvLddTonZsBiUXSuPKnMpBdCTpzL541hSBEZ
	5Wre6PO9PbRZHn3T95qbdHu8FFoCP2L9ALmyrSUD5CXSLnqP1/08WXI1JU6Qlk4c+CvMYp/FrVTEx
	afvR66T3QtuRtzAfBZPcG3KZ5tcE01S+fvVznDnQOMnw0RIBTKNNVaOBCYAQLTEV0wVxr5FFDR0Mx
	NDcu8Diw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVXSi-0007eH-VI; Fri, 15 Nov 2019 09:00:16 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXRy-0005lK-CL
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2019 08:59:33 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id xAF8wWGw046218;
 Fri, 15 Nov 2019 16:58:35 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, vigneshr@ti.com, bbrezillon@kernel.org,
 tudor.ambarus@microchip.com
Subject: [PATCH 3/4] mtd: spi-nor: Add Octal 8D-8D-8D mode support for
 Macronix mx25uw51245g
Date: Fri, 15 Nov 2019 16:58:07 +0800
Message-Id: <1573808288-19365-4-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
References: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com xAF8wWGw046218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_005930_707510_41005FA8 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Mason Yang <masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

mx25uw51245g is a SPI NOR that supports 1-1-1/8-8-8 mode and the SFDPRD
command but returns an empty SFDP page. This forces us to add a new entry
in the flash_info table and patch spi_nor_fixups hooks to tweak flash
parameters for spi_nor_read/pp_setting() and then to enter
Octal 8D-8D-8D modes.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/spi-nor/spi-nor.c | 114 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   3 ++
 2 files changed, 117 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4cdf52d..9013590 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -615,6 +615,56 @@ static int write_disable(struct spi_nor *nor)
 }
 
 /*
+ * Read configuration register 2, returning its value in the
+ * location. Return the configuration register 2 value.
+ * Returns negative if error occurred.
+ */
+static int read_cr2(struct spi_nor *nor, u32 addr)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR2, 1),
+				   SPI_MEM_OP_ADDR(4, addr, 1),
+				   SPI_MEM_OP_DUMMY(4, 1),
+				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+
+		if (spi_nor_protocol_is_8_8_8(nor->read_proto)) {
+			op.cmd.buswidth = 8;
+			op.addr.buswidth = 8;
+			op.dummy.buswidth = 8;
+			op.data.buswidth = 8;
+			op.cmd.nbytes = 2;
+
+			if (spi_nor_protocol_is_8D_8D_8D(nor->read_proto)) {
+				op.dummy.nbytes *= 2;
+				op.cmd.dtr = true;
+				op.addr.dtr = true;
+				op.dummy.dtr = true;
+				op.data.dtr = true;
+			}
+
+			if (nor->ext_cmd_mode == EXT_CMD_IS_INVERSE)
+				op.cmd.ext_opcode = ~SPINOR_OP_RDCR2;
+			else
+				op.cmd.ext_opcode = SPINOR_OP_RDCR2;
+		}
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = -ENOTSUPP;
+	}
+
+	if (ret < 0) {
+		dev_err(nor->dev, "error %d reading CR\n", ret);
+		return ret;
+	}
+
+	return nor->bouncebuf[0];
+}
+
+/*
  * Write configuration register 2 one byte
  * Returns negative if error occurred.
  */
@@ -2275,10 +2325,72 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 	return 0;
 }
 
+static void
+spi_nor_set_read_settings(struct spi_nor_read_command *read,
+			  u8 num_mode_clocks,
+			  u8 num_wait_states,
+			  u8 opcode,
+			  enum spi_nor_protocol proto);
+
+static void
+spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
+			u8 opcode,
+			enum spi_nor_protocol proto);
+
+static void
+mx25uw51245g_default_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = &nor->params;
+
+	if (!(nor->spimem->spi->mode & (SPI_RX_OCTAL | SPI_TX_OCTAL)))
+		return;
+
+	/* Octal 8S-8S-8S mode */
+	params->hwcaps.mask |= SNOR_HWCAPS_OPI_FULL_STR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8],
+				  0, 20, SPINOR_OP_READ_8_8_8,
+				  SNOR_PROTO_8_8_8);
+
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8],
+				SPINOR_OP_PP_8_8_8, SNOR_PROTO_8_8_8);
+
+	/* Octal 8D-8D-8D mode */
+	params->hwcaps.mask |= SNOR_HWCAPS_OPI_FULL_DTR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8D_8D_8D],
+				  0, 20, SPINOR_OP_READ_8D_8D_8D,
+				  SNOR_PROTO_8_8_8_DTR);
+
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8D_8D_8D],
+				SPINOR_OP_PP_8D_8D_8D, SNOR_PROTO_8_8_8_DTR);
+
+	nor->ext_cmd_mode = EXT_CMD_IS_INVERSE;
+}
+
+static void
+mx25uw51245g_post_sfdp_fixups(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = &nor->params;
+	u8 cr2;
+
+	cr2 = read_cr2(nor, CR2_REG0) & CR2_REG0_MODE_MASK;
+
+	if (params->hwcaps.mask & SNOR_HWCAPS_OPI_FULL_DTR)
+		cr2 |= CR2_REG0_MODE_OPI_DTR;
+	else if (params->hwcaps.mask & SNOR_HWCAPS_OPI_FULL_STR)
+		cr2 |= CR2_REG0_MODE_OPI_STR;
+
+	write_cr2(nor, CR2_REG0, cr2);
+}
+
 static struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+static struct spi_nor_fixups mx25uw51245g_fixups = {
+	.default_init = mx25uw51245g_default_init,
+	.post_sfdp = mx25uw51245g_post_sfdp_fixups,
+};
+
 static void gd25q256_default_init(struct spi_nor *nor)
 {
 	/*
@@ -2442,6 +2554,8 @@ static void gd25q256_default_init(struct spi_nor *nor)
 			 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 			 .fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51245g", INFO(0xc2813a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_4B_OPCODES)
+				.fixups = &mx25uw51245g_fixups},
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 2e720ca..3aa54dd 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -114,6 +114,9 @@
 /* Write CFG Reg 2 - defined in JEDEC JESD216C. */
 #define SPINOR_OP_WRCR2		0x72	/* Write configuration register 2 */
 
+/* Used for Macronix flashes only */
+#define SPINOR_OP_RDCR2		0x71	/* Read configuration register 2 */
+
 /* Used for Macronix and Winbond flashes. */
 #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
 #define SPINOR_OP_EX4B		0xe9	/* Exit 4-byte mode */
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
