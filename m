Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4572C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TYgAr9tGpd0Bpa/WHEMxpIPkKrNH3UqmUADbmE4M/Q=; b=DXC4xz3ivhWO/R
	p4WyKiNCTDt97l126z6FEzxGEdUw83myvoJ6P8l5jzlUha994SFOciqk2e09xyXeyFaBBvHw1KeJS
	xRxrOo0Md+4+5OMVkl+GcUJbXtV6S7qckc2lTwx52C52YRFUx6ihMQLXXoNGHR4tU074SkJLUhF6T
	ielfiVBdwwq2Ynx5PQMQvGrOXo8kDzPV0fT6H6WVr8sL0Cu7DxU8OHMs/lZtw6cv5tvqnw5NopLjA
	0x9iBjw1RNb9iTxrDCHwK9jx72M+ujo5DIK0fBqXwAoJ2Fgcu/yaIzs6A3JWdNaNB8USmZ0TEjTRh
	UvSgKQnc7VmhCEi+sYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHuh-00Bofb-34; Fri, 17 Dec 2021 18:25:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myH6v-00BUth-NY
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 17:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639762417; x=1671298417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q6vbmTwCfFyw8BgvRy6F2ER+ZoYJoJRst2fhkRcVU4U=;
 b=V1JyCB+R/VxmN0o5uNeqIEUR1gvXRq62xvdgxDXcZpQDclQ4YUBHHgg9
 a/wBUjAMdsGFq1XBZMAv76gwazoVPw5vR4Tlm3rpDc7nVehpzx52bJ90N
 VpzrLO6smqmVUbdMk0xgqsmvk/JhCUwDFNEJztb5LoYIHnGvbnlhtkaH6
 Nkqm04iTFSgoJmc8k4pE3CjalSBp55PUq7E+HXxB95/9iBvrIH8iKCjnd
 Tvqm7cmzsgm4+EDlIoN2fGabIGKTQp4xnr/L7KHNUUQZcHm4PFxOJzy9g
 al6ZNQO48t0RVaENeB+MrbuZU/gptnjSCLrvIjsQ6YguHxD3krX42K0h3 A==;
IronPort-SDR: X1TBxiokBY0e+P8Z0+BJaOx9KsPMdFMWUPzr/DIKgeqcPwtV54REyv+ebgETDoV/miahQabnfo
 SJExo0nj9CBXMpzZxVgr8yNs8xt/XsLvC+aCUM+LibeQ6H7gd8HOriZQRuZl4JHKLTY1tcY7hk
 YHrUGMVag0NsnYxk47Au1ExJ0cPqC/OKzMXC+UkM8vvtCXtZ+v9pM9RmaW6hEx8vV6+7+H+IsD
 zDhSyKYKMKgpR/SBcl9jZO9fmJWDOWKuhEjSjo30jEdntMCkyUZosw/18W+sZxtJveAgUOtPqy
 j/wnpR02afVfhlKKX2nl9kQG
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147626817"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 10:33:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 10:33:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 10:33:33 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Date: Fri, 17 Dec 2021 19:33:29 +0200
Message-ID: <20211217173329.553293-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217173329.553293-1-tudor.ambarus@microchip.com>
References: <20211217173329.553293-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_093337_858018_5E933840 
X-CRM114-Status: GOOD (  18.55  )
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

 drivers/mtd/spi-nor/macronix.c | 110 +++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 67aaa83038b6..a27f3b3b0815 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -32,6 +32,109 @@ static struct spi_nor_fixups mx25l25635_fixups = {
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
+	u8 *buf = nor->bouncebuf;
+	struct spi_mem_op op =
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_READ_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
+			   SPI_MEM_OP_DUMMY(octal_dtr ? 4 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(octal_dtr ? 2 : 1, buf, 1));
+
+	if (octal_dtr)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int spi_nor_macronix_write_cr2(struct spi_nor *nor, bool octal_dtr)
+{
+	u8 *buf = nor->bouncebuf;
+	struct spi_mem_op op;
+	int ret;
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRITE_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(octal_dtr ? 2 : 1, buf, 1));
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
@@ -100,6 +203,13 @@ static const struct flash_info macronix_parts[] = {
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
