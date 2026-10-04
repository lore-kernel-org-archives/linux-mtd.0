Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E640CA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KOmV5Sjpvz7X+QSOBVDmB4+9Yk0GHJTLHpeTc98JO4=; b=HJVr5QtBcfYuHq
	jhuby+KI3Tsn5uxc9dqjYKOR6RmxlGw0Wv5rvpLTO/D/IFKon5dMaKcayk1yu5tQtnWIavSLWVxCt
	vvUax9D8KUYMdrd8tNHXwXYn2VYmiwszcUAKd2CA57pakrk/iIbRjZ+PFtB6cre+nDxY57NjvCq+q
	XiVlDFLA0Dl96t6OBhm/bLRb0S2gBL3yAHmdRjfijwzBi32TWp57ppKNTHeedAHltowKox0XWlgWG
	5JBKz8nzTvKn9aXPp5x/HCh7ZmLy0hn7ATpT5qSYzt9j/HxbFChbCwHJPy/tdgBMho2R5lvI4ftZv
	pYF4zxwpjk3s0gy8znOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToZ-0000000FN2B-0VK2;
	Sun, 04 Oct 2026 21:32:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToN-0000000FMqp-3p3g
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:32:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 513434E41169;
	Sun,  4 Oct 2026 21:31:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2652E604FE;
	Sun,  4 Oct 2026 21:31:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E49B10328384;
	Sun,  4 Oct 2026 23:31:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AaT3znXFijVQd6HLc4m25AzjKoF9zvFnQ5DPUBLXFCY=;
	b=X4sFfDzb+GogzLIc5cjdNsso4UbPL+Ew0MgVdkaupcQc7GkhScqhPiKsk9bq9Wk3o52yk2
	GkeY8Xxo7vsxq56eeXurOqM+QjjsUmjeyMSGzLDms88wVeSV8Xti3jtdAw4dbJ2+VYa/gc
	4ABZj3qzZyrTKKufUObYMun2W8U7DJVu1gDd/NDwPNnL7lsO98Rin8NM2vHfBmu5bi0Bbx
	ZVE1NA8Yq0VPhGMI44bum2EW/f93nngRIq6jqU1OSX6A0tev4qVsX/BELKyiZemXl1ikAU
	aUwn1PEX6jy0QIiZXXSGZtU3DujDB5yLu8A9rDmGk/QtQOHoyVx+YhajnbVGJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:24 +0200
Subject: [PATCH v2 10/17] mtd: spi-nor: winbond: Prepare the introduction
 of W35TxxNW parts
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143200_285661_BF322D3F 
X-CRM114-Status: GOOD (  13.63  )
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

This is a new octal DTR family, they require:
- a callback for enter octal DTR modes,
- a callback to configure the number of dummy cycles (since the spi-nor
  core picks up a variant for which the number of duty cycles does not
  match the hardware default).

These chips have a flag regiter, but no SR2.

They also feature automatic error correction (SECDEC).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 96 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f2daab39ea57..d33e693ed711 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -11,6 +11,13 @@
 #define WINBOND_NOR_OP_RDEAR	0xc8	/* Read Extended Address Register */
 #define WINBOND_NOR_OP_WREAR	0xc5	/* Write Extended Address Register */
 #define WINBOND_NOR_OP_SELDIE	0xc2	/* Select active die */
+#define WINBOND_NOR_OP_WR_VCR	0x81	/* Write VCR registers */
+#define   WINBOND_NOR_VCR_IO_MODE_CFG_REG 0x00 /* IO mode configuration address (VCR) */
+#define     WINBOND_NOR_VCR_IO_MODE_SSDR 0xFF
+#define     WINBOND_NOR_VCR_IO_MODE_ODDR 0xE7
+#define   WINBOND_NOR_VCR_DUMMY_CFG_REG 0x01 /* Dummy cycle configuration address (VCR) */
+#define WINBOND_NOR_OP_RD_FR	0x70	/* Read Flag registers */
+#define WINBOND_NOR_OP_CL_FR	0x50	/* Clear Flag registers */
 
 #define WINBOND_NOR_WREAR_OP(buf)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),		\
@@ -24,6 +31,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
+#define WINBOND_NOR_WR_VCR_OP(addr, buf)				\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WR_VCR, 0),		\
+		   SPI_MEM_OP_ADDR(3, addr, 0),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
 static bool is_w25qxxrv(const struct spi_nor *nor)
 {
 	struct sfdp_header *sfdp_h = spi_nor_sfdp_get_header(nor);
@@ -252,6 +265,87 @@ static const struct spi_nor_fixups winbond_nor_ecc_configuration_fixups = {
 	.post_sfdp = winbond_nor_ecc_configuration_post_sfdp_fixups,
 };
 
+static int winbond_w35txxnw_nor_write_vcr(struct spi_nor *nor, u8 addr, u8 val)
+{
+	u8 *buf = nor->bouncebuf;
+	struct spi_mem_op op;
+	int ret;
+
+	if (!nor->spimem)
+		return -EOPNOTSUPP;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	buf[0] = val;
+	buf[1] = val;
+	op = (struct spi_mem_op)WINBOND_NOR_WR_VCR_OP(addr, buf);
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+		op.addr.nbytes = 4;
+		op.data.nbytes = 2;
+	}
+
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int winbond_w35txxnw_nor_set_dummy(struct spi_nor *nor, u8 dummy_cycles)
+{
+	return winbond_w35txxnw_nor_write_vcr(nor, WINBOND_NOR_VCR_DUMMY_CFG_REG,
+					      dummy_cycles);
+}
+
+static int winbond_w35txxnw_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
+{
+	enum spi_nor_protocol proto_aft;
+	u8 *buf = nor->bouncebuf;
+	u8 rdid_dummy_aft, val;
+	int ret;
+
+	if (enable) {
+		val = WINBOND_NOR_VCR_IO_MODE_ODDR;
+		proto_aft = SNOR_PROTO_8_8_8_DTR;
+		rdid_dummy_aft = 16;
+	} else {
+		val = WINBOND_NOR_VCR_IO_MODE_SSDR;
+		proto_aft = SNOR_PROTO_1_1_1;
+		rdid_dummy_aft = 0;
+	}
+
+	ret = winbond_w35txxnw_nor_write_vcr(nor, WINBOND_NOR_VCR_IO_MODE_CFG_REG, val);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful */
+	ret = spi_nor_read_id(nor, 0, rdid_dummy_aft, buf, proto_aft);
+	if (ret) {
+		dev_err(nor->dev, "Cannot read JEDEC ID after %s 8D-8D-8D mode (%d)\n",
+			enable ? "enabling" : "disabling", ret);
+		return ret;
+	}
+
+	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int winbond_w35txxnw_nor_late_init(struct spi_nor *nor)
+{
+	nor->params->set_octal_dtr = winbond_w35txxnw_nor_set_octal_dtr;
+	nor->params->set_dummy = winbond_w35txxnw_nor_set_dummy;
+	nor->params->opcodes.read_sr2 = 0;
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_w35txxnw_nor_fixups = {
+	.post_sfdp = winbond_nor_ecc_configuration_post_sfdp_fixups,
+	.late_init = winbond_w35txxnw_nor_late_init,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -673,6 +767,8 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x5b), .fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
+	  .fixups = &winbond_w35txxnw_nor_fixups },
 	{ .id = SNOR_ID(0xef, 0x60), .match = winbond_pw_with_ecc_match,
 	  .fixups = &winbond_nor_ecc_configuration_fixups },
 	{ .id = SNOR_ID(0xef, 0x60), .match = winbond_pw_match,

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
