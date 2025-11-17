Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD237CCD19A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 02:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PY0ip321MHz8tODJ1CIdnPwj1/h3NnwlfCxLH1DxTag=; b=thn+VZ8B/PFnl6
	qFSe0JLAnnC+NAFVvZKdcb0gfF5JUtUMTa8rKgh4MxVQJzjgEkglkbdNcUBLYvK3BEcaOwJ8krLwH
	1pCnnL0gje9kNPJlLg9UFCrUVVYD6WWvbnE5vBWk+8Pqbj6NqkND0uVg17iz4u2coWNBtaEIIF7Vh
	A5AljIOFKaJRk5vxcHJF0KDFgLfTbQnObyZ512o7vnT9VtrLn3Hz4XI0GzbPBnnN4rv9OGA8Iwe7J
	k7Es8WglljH5BRrOvs4g+vv8klePwqYzFjO2HUvFPsY/msMKU4bnLzLaa2dL5YrK7Ws9x7oLC1Cj9
	HnEP/pTb0e7jpbDqC/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpOF-0000000FKtF-2RMM;
	Mon, 17 Nov 2025 02:54:51 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpOD-0000000FKsl-1Nuu
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 02:54:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1vKpNs-0000000074Y-3WYn;
	Mon, 17 Nov 2025 02:54:28 +0000
Date: Mon, 17 Nov 2025 02:54:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Daniel Golle <daniel@makrotopia.org>,
	George Moussalem <george.moussalem@outlook.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: esmt: add support for F50L1G41LC
Message-ID: <799b34e6b45f1029890f80d587a90a4915aced9e.1763342973.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_185449_401490_16D16276 
X-CRM114-Status: GOOD (  13.12  )
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

This adds support for ESMT F50L1G41LC, which appears to be an updated
version of the already supported F50L1G41LB.
Add esmt_8c SPI_NAND manufacturer to account for the newly used vendor
ID with support for the ESMT F50L1G41LC chip.

Link: https://github.com/openwrt/openwrt/pull/15214#issuecomment-3514824435
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/nand/spi/core.c |  1 +
 drivers/mtd/nand/spi/esmt.c | 24 ++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  1 +
 3 files changed, 26 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index f92133b8e1a60..d207286572d87 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1227,6 +1227,7 @@ static const struct nand_ops spinand_ops = {
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&alliancememory_spinand_manufacturer,
 	&ato_spinand_manufacturer,
+	&esmt_8c_spinand_manufacturer,
 	&esmt_c8_spinand_manufacturer,
 	&fmsh_spinand_manufacturer,
 	&foresee_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 9a9325c0bc497..e60e4ac1fd6fb 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -12,6 +12,7 @@
 
 /* ESMT uses GigaDevice 0xc8 JECDEC ID on some SPI NANDs */
 #define SPINAND_MFR_ESMT_C8			0xc8
+#define SPINAND_MFR_ESMT_8C			0x8c
 
 #define ESMT_F50L1G41LB_CFG_OTP_PROTECT		BIT(7)
 #define ESMT_F50L1G41LB_CFG_OTP_LOCK		\
@@ -184,6 +185,21 @@ static const struct spinand_fact_otp_ops f50l1g41lb_fact_otp_ops = {
 	.read = spinand_fact_otp_read,
 };
 
+
+static const struct spinand_info esmt_8c_spinand_table[] = {
+	SPINAND_INFO("F50L1G41LC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x2C),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL),
+		     SPINAND_USER_OTP_INFO(28, 2, &f50l1g41lb_user_otp_ops),
+		     SPINAND_FACT_OTP_INFO(2, 0, &f50l1g41lb_fact_otp_ops)),
+};
+
 static const struct spinand_info esmt_c8_spinand_table[] = {
 	SPINAND_INFO("F50L1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x01, 0x7f,
@@ -224,6 +240,14 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 static const struct spinand_manufacturer_ops esmt_spinand_manuf_ops = {
 };
 
+const struct spinand_manufacturer esmt_8c_spinand_manufacturer = {
+	.id = SPINAND_MFR_ESMT_8C,
+	.name = "ESMT",
+	.chips = esmt_8c_spinand_table,
+	.nchips = ARRAY_SIZE(esmt_8c_spinand_table),
+	.ops = &esmt_spinand_manuf_ops,
+};
+
 const struct spinand_manufacturer esmt_c8_spinand_manufacturer = {
 	.id = SPINAND_MFR_ESMT_C8,
 	.name = "ESMT",
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 927c10d787695..ce76f5c632e17 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -354,6 +354,7 @@ struct spinand_manufacturer {
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer alliancememory_spinand_manufacturer;
 extern const struct spinand_manufacturer ato_spinand_manufacturer;
+extern const struct spinand_manufacturer esmt_8c_spinand_manufacturer;
 extern const struct spinand_manufacturer esmt_c8_spinand_manufacturer;
 extern const struct spinand_manufacturer fmsh_spinand_manufacturer;
 extern const struct spinand_manufacturer foresee_spinand_manufacturer;
-- 
2.51.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
