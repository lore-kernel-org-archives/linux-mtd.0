Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC909C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4YIipGq/teY+jhcZklGmNM0wxHhnlrkU2LlbYUA67k=; b=oy/xB+iI6JkxHa
	HUnFzv32da6V3/aMaS1tUPnn/w53s91eO0YTdD0eWaJ/omme/hJXxiMs1EsvyOwCIcmzjIDbgn3yn
	OsuboRhCCOMjlGAeipTdA1TpbDBi7MY1zxo6k/UUXi9AxZc/ic9SeS5VOCrvLsEEvfIzaVXWwQMBW
	LzCZTdwMP0pksLEEYvaiQ5rEgyfaB2EopingLn4TxNOXWJw6aTUwyI5iB6dS5Us8+D6B0F62sdku2
	1VQq0neVJ83nNJSd+dLqSIOavRuFzrfET9hz6WWAkcylbug+EqWJD+Snzhu5YLn5OZtm3+jVxSpZC
	eu3Czh0+6skZIxciYxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnC8-000BlU-Qn; Wed, 09 Feb 2022 13:39:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnAA-000B2W-JX
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 13:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644413859; x=1675949859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=56Vhvf0u70vmnyIVAUMgLpS2q4yH2DW8nZy1d9h27Sc=;
 b=ZwxFsOnEhN0iZWMkutpnbFTEUtLCgqz1B86T+5J23OWZH6wJNvMd929R
 HYmqbXnuxHFIXte7VQdkViA5obVcEVOQHOs40pVhYAEEUNjO7ym6RrnLJ
 M+qVtSq85dJ/dj/qpmfZ9l3VvmuCOatW/zAQnRjut65vyV2wjwnrKgVE5
 dX8VdsCUR0CyceV3DEnLXhYUwKTpRAlCY3EcHxt3hG4boPRZjW0+Wm387
 z/OHTiYVlnVrnB57YD1hHzNxR0fDUvvgyGzt0VFfwV+98E/FPWrAxQ/Zz
 1EwYZ63IfTLcSfyxVV4DD/ZOnkILYSSpHLZ6MCUClQ8AxKdyIaGzImVWt A==;
IronPort-SDR: UCgVZp/JoAE9v0Fc/lS4g7H1hNUzrR6Hlpe+PJLISEW44LETtn8d01wcc2PbPzG9M6yxGm9Bx2
 Fm/Sq4heJaaqWvH43p4Ng5XC8OBUfqiaNrx6I9mi3Jg2LNhwUcjAjcc31p2Es1RpBwFYTE8oe2
 GeQ7H1Be1fyFpSn7KhoQuUKL4pjfYSJwfNIPmxXz95OP4Esiuq8kp7gIkvf2nj7aATLW1Snsus
 PpUQbDTVid/vX7WnzRkljuTcs8vawagym0qayFZFOQTrCAzxe13xjHjfYMUItiDARkl9utZZrO
 8xXas2UF0INI/EPUwl0pTPZ3
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="152460213"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 06:37:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 06:37:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 06:37:33 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v6 7/7] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Date: Wed, 9 Feb 2022 15:36:56 +0200
Message-ID: <20220209133656.374903-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209133656.374903-1-tudor.ambarus@microchip.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_053738_688240_D5DEA648 
X-CRM114-Status: GOOD (  18.90  )
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

mx66lm1g45g supports just 1-1-1, 8-8-8 and 8D-8D-8D modes. There are
versions of mx66lm1g45g which do not support SFDP, thus use
SPI_NOR_SKIP_SFDP. The RDID command issued through the octal peripheral
interface outputs data always in STR mode for whatever reason. Since
8D-8D-8S is not common, avoid reading the ID when enabling the octal dtr
mode. Instead, read back the CR2 to check if the switch was successful.
Tested in 1-1-1 and 8d-8d-8d modes using sama7g5 QSPI IP.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c2853b
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/partname
mx66lm1g45g
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
cat: can't open '/sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp': No such file or directory

 drivers/mtd/spi-nor/macronix.c | 131 +++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 97dba1ae7fb1..31b2a9f34e03 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,130 @@
 
 #include "core.h"
 
+#define SPINOR_OP_READ_CR2		0x71	/* Read Configuration Register 2 */
+#define SPINOR_OP_WRITE_CR2		0x72	/* Write Configuration Register 2 */
+#define SPINOR_OP_MX_DTR_RD		0xee	/* Octa DTR Read Opcode */
+
+#define SPINOR_REG_CR2_MODE_ADDR	0	/* Address of Mode Enable in CR2 */
+#define SPINOR_REG_CR2_DTR_OPI_ENABLE	BIT(1)	/* DTR OPI Enable */
+#define SPINOR_REG_CR2_SPI		0	/* SPI Enable */
+
+/**
+ * Macronix SPI NOR flash operations.
+ */
+#define SPI_NOR_MX_READ_CR2_OP(ndummy, buf, ndata)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_READ_CR2, 0),		\
+		   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 0),	\
+		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
+		   SPI_MEM_OP_DATA_IN(ndata, buf, 0))
+
+#define SPI_NOR_MX_WRITE_CR2_OP(buf, ndata)				\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRITE_CR2, 0),		\
+		   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 0),	\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
+
+static int spi_nor_macronix_read_cr2(struct spi_nor *nor, u8 ndummy, void *sr,
+				     unsigned int nbytes)
+{
+	struct spi_mem_op op = SPI_NOR_MX_READ_CR2_OP(ndummy, sr, nbytes);
+
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int spi_nor_macronix_write_cr2(struct spi_nor *nor, const void *sr,
+				      unsigned int nbytes)
+{
+	struct spi_mem_op op = SPI_NOR_MX_WRITE_CR2_OP(sr, nbytes);
+	int ret;
+
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int spi_nor_macronix_octal_dtr_en(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int i, ret;
+
+	buf[0] = SPINOR_REG_CR2_DTR_OPI_ENABLE;
+	ret = spi_nor_macronix_write_cr2(nor, buf, 1);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nor->info->id_len; i++)
+		if (buf[i * 2] != nor->info->id[i])
+			return -EINVAL;
+	return 0;
+}
+
+static int spi_nor_macronix_octal_dtr_dis(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	/*
+	 * One byte transactions are not allowed in 8D-8D-8D mode. mx66lm1g45g
+	 * requires that undefined register addresses to keep their value
+	 * unchanged. Its second CR2 byte value is not defined. Read the second
+	 * byte value of CR2 so that we can write it back when disabling
+	 * Octal DTR mode.
+	 */
+	ret = spi_nor_macronix_read_cr2(nor, 4, buf, 2);
+	if (ret)
+		return ret;
+	/* Keep the value of buf[1] unchanged.*/
+	buf[0] = SPINOR_REG_CR2_SPI;
+
+	ret = spi_nor_macronix_write_cr2(nor, buf, 2);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (memcmp(buf, nor->info->id, nor->info->id_len)) {
+		dev_dbg(nor->dev, "Failed to disable 8D-8D-8D mode.\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	return enable ? spi_nor_macronix_octal_dtr_en(nor) :
+			spi_nor_macronix_octal_dtr_dis(nor);
+}
+
+static void mx66lm1g45g_late_init(struct spi_nor *nor)
+{
+	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
+
+	/* Set the Fast Read settings. */
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
+				  0, 20, SPINOR_OP_MX_DTR_RD,
+				  SNOR_PROTO_8_8_8_DTR);
+
+	nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
+	nor->params->rdsr_dummy = 4;
+	nor->params->rdsr_addr_nbytes = 4;
+}
+
+static struct spi_nor_fixups mx66lm1g45g_fixups = {
+	.late_init = mx66lm1g45g_late_init,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -100,6 +224,13 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx66lm1g45g", INFO(0xc2853b, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K |
+			      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE |
+			    SPI_NOR_SOFT_RESET)
+		.fixups = &mx66lm1g45g_fixups,
+	},
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
