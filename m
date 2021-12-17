Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C98C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A97ewrz066k+IIRvIDVhT0Sx35RI9E1HJe/Wu2KKz0=; b=rEws6ugOjUt/Rr
	TUV2+p6Y2/icVshaYKGIVLdp6sGRxaLV9BJyeWKQwmyuneYLgymEMSnddum/brxKGiJx/Ke272fLz
	d4SoUQqbralT3rmQnpzAH1+wIWy7FrklIXBklliz3HJ82BF80r+KjQbb6HJNlhDvsHvfHdR/DZMBi
	BBsyggg+64QGzFB79T98H/tSGWnVxvOnBjJ8qX9E1C62Ca2jlpISLN5JgCHo3k2gRZyVZFfoc0JkN
	4R5xkGLPKwyuxfpNtspPFdP8VcJPAIz0AmX/u/NUvkX44xvYrOaglyvPu4suivO9tp3ailFOSWJzl
	5vkXdeLpwzdtXu5kaXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myI7e-00BuS8-AD; Fri, 17 Dec 2021 18:38:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myHcP-00BfBw-CJ
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 18:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639764369; x=1671300369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XoT/Zd0al9LkgfYRX4SVC3MU9eq62RqvTfnO0Pj/TM=;
 b=yvluu6t+2hUf3CxjNYWaOZfXYgaT6egpEMySO30TPHoVwgcty2jqGr3u
 ESVsAKAAFzIUm6S+9WS9Sp2Tq8kGg+hUW0uBG/BQvT+Nu5xomZZAiIG9S
 c5u+KO2aJ2Q8hSUi/jQRTSmPF9IcZfvA5W5QlMj2NX8sr/zfSKvsODUnQ
 xNlf5/2WpDAen4O5CPhilQvQsom4dMgv4VhHv2YsO4Faouwdeozj8CXUr
 FeaHV6a84Yx3W4Is3vuzROEUS8qaZhbfG5y/mNCLmu1XVfYH0ogYirrb2
 1OjGrWFSTSt4y7+mw9RX4zQYfkO5uj+84bGTbqm4EqTZQXbKUxHDNHPXe A==;
IronPort-SDR: W3A/4QsslP8YGxhMo3EIK9dGGnOtnjuAoVe2nXC3hI24jcngBQst4/LdHrh89JWRrGY5oMYpnf
 04zGwx2MoZE+nbx5BNXOfWbWXhRPC2IfSjxlBFZ7WkEtIVbOhsCW/nlAjZ4tiTQ4rICmFcsXQ0
 hR+RHKX6/oS34pyXcnbpaJmlsgo+kN8wlrOxCRVZjPOczLEoKXhuAXlFC2C9byxj7FaW36Tttr
 WxXjLG762iFHS9AIJy9S4k++zn2NPepjw/iwOjiLitfZMV4wkmIGcHuEgzLmSOcWmoRJgXVgSB
 PHWjbGm5nsrAYQ/PeP8RLfio
X-IronPort-AV: E=Sophos;i="5.88,214,1635231600"; d="scan'208";a="140162208"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 11:06:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 11:06:07 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 11:06:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v5 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Date: Fri, 17 Dec 2021 20:06:01 +0200
Message-ID: <20211217180601.585825-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217180601.585825-1-tudor.ambarus@microchip.com>
References: <20211217180601.585825-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_100609_533167_9201231E 
X-CRM114-Status: GOOD (  18.14  )
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
v5: drop superfluous "buf" local variable in
spi_nor_macronix_read/write_cr2. buf was used only once, no need for a
dedicated local variable.

v4: macronix requires that undefined register addresses to keep their
value unchanged. The second byte of CR2 is not defined. Read the second
byte of CR2 before disabling Octal DTR mode, so that we don't modify its
value when disabling Octal DTR.

v3:
- drop setting of dummy cycles, use the default value
- avoid odd lengths in octal dtr mode
- s/8d-8d-8d/8D-8D-8D

v2: SPI_NOR_SOFT_RESET as a FIXUP_FLAG

# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c2853b
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/partname
mx66lm1g45g
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
cat: can't open '/sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp': No such file or directory
 drivers/mtd/spi-nor/macronix.c | 107 +++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 67aaa83038b6..88b1218f19f4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -32,6 +32,106 @@ static struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+#define SPINOR_OP_READ_CR2		0x71
+#define SPINOR_OP_WRITE_CR2		0x72
+#define SPINOR_OP_MX_DTR_RD		0xee
+
+#define SPINOR_REG_CR2_MODE_ADDR	0
+#define SPINOR_REG_CR2_DTR_OPI_ENABLE	BIT(1)
+#define SPINOR_REG_CR2_SPI		0
+
+static int spi_nor_macronix_read_cr2(struct spi_nor *nor, bool octal_dtr)
+{
+	struct spi_mem_op op =
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_READ_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
+			   SPI_MEM_OP_DUMMY(octal_dtr ? 4 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(octal_dtr ? 2 : 1, nor->bouncebuf, 1));
+
+	if (octal_dtr)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int spi_nor_macronix_write_cr2(struct spi_nor *nor, bool octal_dtr)
+{
+	struct spi_mem_op op =
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRITE_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(octal_dtr ? 2 : 1, nor->bouncebuf, 1));
+	int ret;
+
+	if (octal_dtr)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	/* Set/unset the octal and DTR enable bits. */
+	if (enable) {
+		buf[0] = SPINOR_REG_CR2_DTR_OPI_ENABLE;
+	} else {
+		/*
+		 * One byte transactions are not allowed in 8D-8D-8D mode.
+		 * mx66lm1g45g requires that undefined register addresses to
+		 * keep their value unchanged. Its second CR2 byte value is not
+		 * defined. Read the second byte value of CR2 so that we can
+		 * write it back when disabling Octal DTR mode.
+		 */
+		ret = spi_nor_macronix_read_cr2(nor, true);
+		if (ret)
+			return ret;
+		buf[0] = SPINOR_REG_CR2_SPI;
+	}
+	ret = spi_nor_macronix_write_cr2(nor, !enable);
+	if (ret)
+		return ret;
+
+	/* Read back CR2 to make sure the switch was successful. */
+	ret = spi_nor_macronix_read_cr2(nor, enable);
+	if (ret)
+		return ret;
+	if (enable) {
+		if (buf[0] != SPINOR_REG_CR2_DTR_OPI_ENABLE) {
+			dev_dbg(nor->dev, "Failed to enable 8D-8D-8D mode.\n");
+			return -EINVAL;
+		}
+	} else if (buf[0] != SPINOR_REG_CR2_SPI) {
+		dev_dbg(nor->dev, "Failed to disable 8D-8D-8D mode.\n");
+		return -EINVAL;
+	}
+
+	return 0;
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
 static const struct flash_info macronix_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
@@ -100,6 +200,13 @@ static const struct flash_info macronix_parts[] = {
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
