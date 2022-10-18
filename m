Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C7FC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rIIhJt46tTAc90RqlpqJHDXIM8TtBEnRhjcmUqPAO6s=; b=VlL/KBOXDYmYY7
	nrwCVm+AdydZAsz/TdxA8yxbvp6foIvhUfy0cS7OEaDgSUYCae7tJeOK+MCFvRUm9aKCW3aNe10+q
	bVzrDo5qzw9rASW0OINVA0WTwbGXogQE7TFwigW+K4FwcIAP7APqblbFUxI4NcfkYzwWEBCZ9xVoC
	dBaK6JJUuhz+4Lgcq0ba1gNHZb0tw8C7rJ1UZIzrnwRCAD64NoAAOYppKN16u+dK1ETSntSWeOr5s
	29b0mPtekhfN5qbz3V9bVPmsOBpG4d+xQe46kT3MB98yZsRPBOGFhyUl2l/lN1mm96FKTaxr3oVfy
	le5w7R4t1Mvv6cOJcAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjMI-005QEc-D6; Tue, 18 Oct 2022 09:58:03 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjM6-005Pzy-2H
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:57:52 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29I8w1nE013790;
	Tue, 18 Oct 2022 02:57:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MUu7QZPffo5qJiHwQCv0H+P/92KlchSqfHoOUv4vRPc=;
 b=aiXKVJK2DhLjLkrSlBGYc+eBjcO27lHSVJleQABYSOUrff9Wpk3SUycQd+Zt9RrwR1Wg
 y0jnZDVB4B5Y5tHSR0Mvb7rHR9+VsQ0utmqipBJM6tvnFXtgeokNxCfJyFSMlWAVauUJ
 1/UanDdWIhO/l+pm1VM3rrC1VRItqNmB5MABi+wQe1iW9cfiEHggnAT/lEbbODiP4Nzv
 5sYr9LLmjlKFxpVXCeeddWr08oE8CxIov4IITkU8QXGlhpP+rzEKpf9s9YnLFbwi5SjK
 gfVWCudkN/iRZjKOavPdY7R4eBNvGJrKhKSA0cdVK0PC+P2HAJ48YsegHG95FrKnC2sK zg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7r54anqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 18 Oct 2022 02:57:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 18 Oct 2022 02:57:35 -0700
Received: from pek-ywang12-d1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 18 Oct 2022 02:57:32 -0700
From: <yaliang.wang@windriver.com>
To: <yaliang.wang@windriver.com>, <tudor.ambarus@microchip.com>,
        <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: spi-nor: spansion: add clear sr fixup for s25fl-l family
Date: Tue, 18 Oct 2022 17:57:32 +0800
Message-ID: <20221018095732.251299-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: dohR8heUcitNISMxfRcULNknOD-vNAPz
X-Proofpoint-ORIG-GUID: dohR8heUcitNISMxfRcULNknOD-vNAPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_03,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210180057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025750_209052_BF987F65 
X-CRM114-Status: GOOD (  28.04  )
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

From: Yaliang Wang <Yaliang.Wang@windriver.com>

Spansion S25FL-L family flashes s25fl064l/s25fl128l/s25fl256l can't
automatically recover from programming/erase errors, the Status Register
error bits inflecting the errors will not change until a Clear Status
Register command be executed.

Same thing also happens on other Spansion flash families, they've
properly handled it, USE_CLSR manufacturer flag was introduced for this
purpose, but S25FL-L cannot simply reuse their work, because S25FL-L has
the different error bit settings. S25FL-L defines programming/erase
error bits in Status Register 2, whereas the other families define the
same error bits in Status Register 1, causing S25FL-L needs a different
method to handle this problem.

Cc: stable@vger.kernel.org
Fixes: 0074a8f3b303 ("mtd: spi-nor: Add support for s25fl128l and s25fl256l")
Fixes: d8b494a32889 ("mtd: spi-nor: Add support for Spansion S25FL064L")
Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/spansion.c | 119 ++++++++++++++++++++++++++-------
 1 file changed, 93 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 0150049007be..8f353ddda5f5 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,7 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_SR2V			0x00800001
 #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
 #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
@@ -25,6 +26,10 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
+/* s25fl-l family specific */
+#define S25FL_L_SR2V_P_ERR			BIT(5)	/* Programming Error Occurred */
+#define S25FL_L_SR2V_E_ERR			BIT(6)	/* Erase Error Occurred */
+
 /* Cypress SPI NOR flash operations. */
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
@@ -44,6 +49,29 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+/**
+ * spansion_nor_clear_sr() - Clear the Status Register.
+ * @nor:	pointer to 'struct spi_nor'.
+ */
+static void spansion_nor_clear_sr(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPANSION_CLSR_OP;
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+						       NULL, 0);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+}
+
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -342,6 +370,65 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
 };
 
+/**
+ * s25fl_l_sr_ready_and_clear() - S25FL_L family flashes need to query
+ * Status Register 1 to check if the flash is ready and clear it if
+ * there are Programming/Erase errors in Status Register 2.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int s25fl_l_sr_ready_and_clear(struct spi_nor *nor)
+{
+	int ret;
+	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_SR2V,
+					  &nor->bouncebuf[1]);
+
+	/* Read Status Register 1 */
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	/* RDSR2 command isn't available in QPI mode, use RDAR instead  */
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[1] & (S25FL_L_SR2V_P_ERR | S25FL_L_SR2V_E_ERR)) {
+		if (nor->bouncebuf[1] & S25FL_L_SR2V_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spansion_nor_clear_sr(nor);
+
+		/*
+		 * WEL bit remains set to one when an erase or page program
+		 * error occurs. Issue a Write Disable command to protect
+		 * against inadvertent writes that can possibly corrupt the
+		 * contents of the memory.
+		 */
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
+		return -EIO;
+	}
+
+	return !(nor->bouncebuf[0] & SR_WIP);
+}
+
+static void s25fl_l_late_init(struct spi_nor *nor)
+{
+	nor->params->ready = s25fl_l_sr_ready_and_clear;
+}
+
+static const struct spi_nor_fixups s25fl_l_fixups = {
+	.late_init = s25fl_l_late_init,
+};
 static const struct flash_info spansion_nor_parts[] = {
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
@@ -428,13 +515,16 @@ static const struct flash_info spansion_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &s25fl_l_fixups },
 	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &s25fl_l_fixups },
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &s25fl_l_fixups },
 	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
@@ -460,29 +550,6 @@ static const struct flash_info spansion_nor_parts[] = {
 	},
 };
 
-/**
- * spansion_nor_clear_sr() - Clear the Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- */
-static void spansion_nor_clear_sr(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op = SPANSION_CLSR_OP;
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
-						       NULL, 0);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
-}
-
 /**
  * spansion_nor_sr_ready_and_clear() - Query the Status Register to see if the
  * flash is ready for new commands and clear it if there are any errors.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
