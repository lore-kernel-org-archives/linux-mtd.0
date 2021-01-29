Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383DFC433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C501064E02
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C501064E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld7llIIO+RE93rlJsHVD5FGHiHz3S14DOuza5IL+t34=; b=0Eukt1/5l42H4enGBGfnH3Z8D1
	KiCJXNyqwNpzF3VRNuxXfmS0N9JClLAsrGTL3k4CyHCVzGei6SblxeeVJZso4aMMzaTX2Tfai8hHU
	hWkWr8eXmfPFM/V2IsFK1PaKZZhQCBMobH3Mxyg7GsFXt2BTIJrpxfGpNxqt6t6hAjv0cAg58ZKB4
	g4k2677T172LsDDEpkRudU+hZx9oVpwJjoCoxcikYPS4t+1oCl+XBIuN7g24eammGK8+lSRfiJtKk
	bOaXxoMaLhUvXz6W8ZhaD9NozjPn9DnJjgHMLL3XPXNKXLEOA1J3ZVIG8NT6dh2O7/XJxG8luo/gN
	KydOuq/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OwW-0002CD-LP; Fri, 29 Jan 2021 08:15:48 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OwP-000294-Ou
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 08:15:43 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG4.macronix.com with ESMTP id 10T8FEbB076586;
 Fri, 29 Jan 2021 16:15:16 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: zhengxunli <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Subject: [PATCH 1/3] mtd: spi-nor: macronix: add support for Macronix octaflash
Date: Fri, 29 Jan 2021 16:13:36 +0800
Message-Id: <1611908018-29937-2-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 10T8FEbB076586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_031542_189145_7B99BA08 
X-CRM114-Status: GOOD (  19.59  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 zhengxunli <zhengxunli@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ocatflash is an xSPI compliant octal DTR flash. Add support
for using it in octal DTR mode.

Enable Octal DTR mode with 20 dummy cycles to allow running at the
maximum supported frequency of 200Mhz.

When reading ID in OCTAL DTR mode, ID will appear in a repeated
manner. ex: ID[0] = 0xc2, ID[1] = 0xc2, ID[2] = 0x94, ID[3] = 0x94...
Rearrange the ID so that the ID can pass.

Signed-off-by: zhengxunli <zhengxunli@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 122 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9203aba..7253566 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,15 @@
 
 #include "core.h"
 
+#define SPINOR_OP_RD_CR2		0x71		/* Read configuration register 2 */
+#define SPINOR_OP_WR_CR2		0x72		/* Write configuration register 2 */
+#define SPINOR_OP_MXIC_DTR_RD		0xee		/* Fast Read opcode in DTR mode */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_OPI_DTR_DIS	0x1		/* Disable Octal DTR */
+#define SPINOR_REG_MXIC_CR2_DC		0x00000300	/* For setting dummy cycles */
+#define SPINOR_REG_MXIC_DC_20		0x0		/* Setting dummy cycles to 20 */
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -33,6 +42,115 @@
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+/**
+ * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @enable:		whether to enable or disable Octal DTR
+ *
+ * This also sets the memory access dummy cycles to 20 to allow the flash to
+ * run at up to 200MHz.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, flash_id[3], i;
+	int ret;
+
+	if (enable) {
+		/* Use 20 dummy cycles for memory array reads. */
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			return ret;
+
+		*buf = SPINOR_REG_MXIC_DC_20;
+		op = (struct spi_mem_op)
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
+				   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_DC, 1),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			return ret;
+
+		nor->read_dummy = 20;
+	}
+
+	/* Set/unset the octal and DTR enable bits. */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (enable)
+		*buf = SPINOR_REG_MXIC_OPI_DTR_EN;
+	else
+		*buf = SPINOR_REG_MXIC_OPI_DTR_DIS;
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+	if (!enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
+			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
+
+	if (enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nor->info->id_len; i++)
+		flash_id[i] = buf[i * 2];
+
+	if (memcmp(flash_id, nor->info->id, nor->info->id_len))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void octaflash_default_init(struct spi_nor *nor)
+{
+	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
+}
+
+static void octaflash_post_sfdp_fixup(struct spi_nor *nor)
+{
+	/* Set the Fast Read settings. */
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
+				  0, 20, SPINOR_OP_MXIC_DTR_RD,
+				  SNOR_PROTO_8_8_8_DTR);
+
+	nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
+	nor->params->rdsr_dummy = 4;
+	nor->params->rdsr_addr_nbytes = 4;
+}
+
+static struct spi_nor_fixups octaflash_fixups = {
+	.default_init = octaflash_default_init,
+	.post_sfdp = octaflash_post_sfdp_fixup,
+};
+
 static const struct flash_info macronix_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -90,6 +208,10 @@
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66uw2g345g", INFO(0xc2943c, 0, 64 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
