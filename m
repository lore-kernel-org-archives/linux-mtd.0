Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCAEC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cH3H/mAEPIE6K0uzmvL3q4GLx82qdr89Z35eHIVke0=; b=nXSkxVK14n73ab
	ThPJzp03NCOQHoPKVCqmnQfn+mva/MYHg9a6VhOqoMbji30K/cnXEzHzXgM9V0OKg6NEGqaJgPXX9
	+rWbdk9PqbinbKXz9gWFTyntq1TfH5Uagy5xyIXcqVdvl1sVaoRGZtJ/hXfnEGxP8msYr/DQPGWCN
	LW8SzX3kgMRZ4/DahhEwqs9n2ZJtFfIh5G9O1qAaUY9uvsUESpb/PV2B0MqB4Cf+hCeOtT1i3m6WS
	jqMVw9WnwpeL7A3VPMdeY1WjNfVc2tS258+Owx/dFmcDrnM+4UP4aVi5X7slUnknChkuVZbn8fH3A
	2R6XiBG25yYe1Aktm47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlniD-004ZIo-Q6; Tue, 03 May 2022 08:16:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlni6-004ZFg-Cw
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565803; x=1683101803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g541UwZtqpJRaQ+1gkda7ej4G5Hnk8FN0xrb2/9MG60=;
 b=wlYrG6DJAnwA7xECjRM+Cvs54VTdWs6FJc0LZHQfG0IJGYUCBEMmYWsz
 N1HNhul0d4PbZw7wkM8OFUnP0wUFh8+jPJBRdOGp+BiETKmmkLfFT0cdr
 2stFGubwMjVgrl8m/Vw11DRY/0oi5xbzZ3wUiNR6hhkyR3obtL96Q0mJA
 /X5Ijel22JHlHzvobOvGtrSsKrAKyoI4ajFP3CJi9qwxNNPQHGtGeG1T+
 6OnQCsIu2wFuiDeiMMHZrq9bQUgiFBxRmaLrqIf7Bmmb8UzoTV+G9Tgag
 DhVSZpwoadna37xtMo98J7pSr380S4z+/Lqz6DanNPw0egVdXc9ZOw4lV g==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="154619069"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:41 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:39 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at SFDP
 parsing time
Date: Tue, 3 May 2022 11:16:23 +0300
Message-ID: <20220503081627.341870-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011642_552953_FE07B8AA 
X-CRM114-Status: GOOD (  17.89  )
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

At the SFDP parsing time we should not change members of struct spi_nor,
but instead fill members of struct spi_nor_flash_parameters which could
leter on be used by callers. The caller will then decide if SFDP params
should be used and more importantly when they should be used. Clean the
code flow and don't initialize nor->addr_nbytes at SFDP parsing time.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c |  5 ++---
 drivers/mtd/spi-nor/core.h |  2 ++
 drivers/mtd/spi-nor/sfdp.c | 18 ++++++------------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b2e6a7050b3a..3709b57572ae 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2281,8 +2281,8 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
-	if (nor->addr_nbytes) {
-		/* already configured from SFDP */
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
@@ -2527,7 +2527,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_nbytes = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index fe7683fe1b4d..41df8bc8e008 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -345,6 +345,7 @@ struct spi_nor_otp {
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @addr_nbytes:	number of address bytes to send.
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
@@ -377,6 +378,7 @@ struct spi_nor_flash_parameter {
 	u64				size;
 	u32				writesize;
 	u32				page_size;
+	u8				addr_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 058ce218d2af..90d7c25f7281 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -178,19 +178,16 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 			     size_t len, void *buf)
 {
-	u8 addr_nbytes;
 	int ret;
 
-	addr_nbytes = nor->addr_nbytes;
-
 	nor->read_opcode = SPINOR_OP_RDSFDP;
 	nor->addr_nbytes = 3;
 	nor->read_dummy = 8;
 
 	ret = spi_nor_read_raw(nor, addr, len, buf);
 
-	nor->addr_nbytes = addr_nbytes;
 	/* Restore setup to its uninitialized state. */
+	nor->addr_nbytes = 0;
 	nor->read_opcode = 0;
 	nor->read_dummy = 0;
 
@@ -461,11 +458,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
 	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
-		nor->addr_nbytes = 3;
+		params->addr_nbytes = 3;
 		break;
 
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
-		nor->addr_nbytes = 4;
+		params->addr_nbytes = 4;
 		break;
 
 	default:
@@ -652,7 +649,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->addr_nbytes;
+		return nor->params->addr_nbytes;
 	}
 }
 
@@ -689,7 +686,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	u32 addr;
 	int err;
 	u8 i;
-	u8 addr_nbytes;
 	u8 read_data_mask, map_id;
 
 	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
@@ -697,8 +693,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
-	addr_nbytes = nor->addr_nbytes;
-
 	map_id = 0;
 	/* Determine if there are any optional Detection Command Descriptors */
 	for (i = 0; i < smpt_len; i += 2) {
@@ -753,8 +747,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	/* fall through */
 out:
 	kfree(buf);
-	nor->addr_nbytes = addr_nbytes;
 	/* Restore setup to its uninitialized state. */
+	nor->addr_nbytes = 0;
 	nor->read_dummy = 0;
 	nor->read_opcode = 0;
 	return ret;
@@ -1096,7 +1090,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	nor->addr_nbytes = 4;
+	params->addr_nbytes = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
