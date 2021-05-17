Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D320C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 06:19:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2240261166
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 06:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2240261166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqO+GV83t+K2raagFb+2qjHHrqFvDigROivRm6jd5eo=; b=GZ23G4fy2VxTh9BcTGPrCzmEZv
	m3xo5xwAZO9xAbCf15elOcOQwvPlmpUf8xtnRmiyLMc7fEpuQ+Ix/fWQvjQ4tHlUsMqBU3MsN4SCQ
	I1zzqTJcjurW3F1RxwT3pYgAj31ufjllAsZzIrrbM+M2Y9jS/T6QP3wlrf+e3PvKYy3cGx2atOOB+
	ekRl0yDMpxrZMwiMvqLXxQgcj+I0a8tV+BO2lKqQuXrvhTzvI4rGidX9/sEnj2cfh7FA3jXNYAPwt
	QtBdvddjinAX03+qK3gqFbwSwoxoQg5lAG3aWxAkPCUFLl7RfYlvioeS87vudg2js75DMLNgDt1ym
	gMPENDJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liWZ6-00DqOV-V6; Mon, 17 May 2021 06:17:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWYW-00DqKd-V3
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 06:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1ByKLWs2aKhkXW1mSOQuDkuhqMufElTOpMPZDTIq0RI=; b=uZ/HbTIQ/V6vDcwRPS54k7ySU8
 W8jWh1qA2PBuxru+d35BFDEE1y/CyYCemEm+MkhCLiC0pSd3c/OdMCDrtgFUvNwgRbZW2VVBN5ZhS
 fIh/Ue7OdSkzH3UnUpKDoQkI9c5WiBoRehExjXxrXy9gsQlPYx0wagmyOp5on8ZWOuV8ioNUNFcYn
 5JTgvNZ3lpdUAuYsklTXbEfj0eJGy6D3W+7dAYgHqrMSZUdwTxIqzaNKy/mSdYnpsxWafN+No+2/W
 jig6mwk8Z7k17f94ckYgtbxtqt48ogM00EGnDjJ23f6W9jZ93Gqy/p9CPv9dkxDM2FfDa/bz+iFn0
 oiIRpNew==;
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWYS-00DVGr-4T
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 06:16:43 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG4.macronix.com with ESMTP id 14H6G61g052301;
 Mon, 17 May 2021 14:16:06 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: Zhengxun Li <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 broonie@kernel.org, jaimeliao@mxic.com.tw,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Date: Mon, 17 May 2021 14:14:47 +0800
Message-Id: <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 14H6G61g052301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_231640_500232_96B68CDD 
X-CRM114-Status: GOOD (  19.96  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The octaflash is an xSPI compliant octal DTR flash. Add support
for using it in octal DTR mode.

Try to verify the flash ID to check whether the flash memory in octal
DTR mode and SPI mode are correct. When reading ID in OCTAL DTR mode,
ID will appear in a repeated manner. ex: ID[0] = 0xc2, ID[1] = 0xc2,
ID[2] = 0x94, ID[3] = 0x94... Rearrange the order so that the ID can pass.

The octaflash series can be divided into the following types:

MX25 series : Serial NOR Flash.
MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
LW/UW series : Support simultaneous Read-while-Write operation in multiple
	       bank architecture. Read-while-write feature which means read
	       data one bank while another bank is programing or erasing.

MX25LM : 3.0V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

MX25UM : 1.8V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf

MX66LM : 3.0V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

MX66UM : 1.8V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

MX25LW : 3.0V Octal I/O with Read-while-Write
MX25UW : 1.8V Octal I/O with Read-while-Write
MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

About LW/UW series, please contact us freely if you have any
questions. For adding Octal NOR Flash IDs, we have validated
each Flash on plateform zynq-picozed.

Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 185 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 42c2cf3..f4b33c0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,12 @@
 
 #include "core.h"
 
+#define SPINOR_OP_RD_CR2		0x71		/* Read configuration register 2 */
+#define SPINOR_OP_WR_CR2		0x72		/* Write configuration register 2 */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -32,6 +38,85 @@
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+/**
+ * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @enable:		whether to enable Octal DTR or switch back to SPI
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
+	int ret;
+
+	/* Set/unset the octal and DTR enable bits. */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. Since there is no register at the
+		 * next location, just initialize the value to 0 and let the
+		 * transaction go on.
+		 */
+		buf[0] = SPINOR_REG_MXIC_SPI_EN;
+		buf[1] = 0x0;
+	}
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
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
+	if (enable) {
+		for (i = 0; i < nor->info->id_len; i++)
+			if (buf[i * 2] != nor->info->id[i])
+				return -EINVAL;
+	} else {
+		if (memcmp(buf, nor->info->id, nor->info->id_len))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void octaflash_default_init(struct spi_nor *nor)
+{
+	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
+}
+
+static struct spi_nor_fixups octaflash_fixups = {
+	.default_init = octaflash_default_init,
+};
+
 static const struct flash_info macronix_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -86,6 +171,106 @@
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66lm2g45g", INFO(0xc2853c, 0, 64 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66lm1g45g", INFO(0xc2853b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66lw1g45g", INFO(0xc2863b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lm51245g", INFO(0xc2853a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lw51245g", INFO(0xc2863a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lm25645g", INFO(0xc28539, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lw25645g", INFO(0xc28639, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66um2g45g", INFO(0xc2803c, 0, 64 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66uw2g345gx0", INFO(0xc2943c, 0, 64 * 1024, 4096,
+				 SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+				 SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66um1g45g", INFO(0xc2803b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66um1g45g40", INFO(0xc2808b, 0, 32 * 1024, 4096,
+				SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+				SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66uw1g45g", INFO(0xc2813b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25um51245g", INFO(0xc2803a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw51245g", INFO(0xc2813a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw51345g", INFO(0xc2843a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25um25645g", INFO(0xc28039, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw25645g", INFO(0xc28139, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25um25345g", INFO(0xc28339, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw25345g", INFO(0xc28439, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw12845g", INFO(0xc28138, 0, 4 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw12a45g", INFO(0xc28938, 0, 4 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw12345g", INFO(0xc28438, 0, 4 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw6445g", INFO(0xc28137, 0, 2 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw6345g", INFO(0xc28437, 0, 2 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
