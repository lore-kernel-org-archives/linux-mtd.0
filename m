Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C9C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5HvvuG15tuB84kLx87NdH+cvGCiLZtVyYZ8b2yy+kM=; b=G880QP2k9f0ycG
	1BgEFX1g/BY889kPrj7iN4OSZjBu0GpEl2RuXYXGr4eCkSytujij/7Sdlyj7Upg8Hkn0kO9lTlga3
	EddQK8H38+lDdxnkz4qaWKHSb5J9xReW9zVdzGtFakr0lm61lhOmLwmBQpJ0XlLi6l/5On+a0q5fX
	IiEytn5xof6Di7mnedCUBKlilJ55Dq8y4Wg2hSpUpmrobRvUyzH/BaAZ/FsjIAnabj0RhNGD3D7JI
	KcF/svt2ods5HqNGSPi4zysWHwTG5eO+2fjkUx0uJhfGAdAjFO6fEXIPeADlxdfe4RGvaBLrNsO60
	J+Ik25Mzuv9BzFzUh0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLO-007X2V-6N; Mon, 25 Jul 2022 09:25:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLC-007WjU-KB
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 09:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658741130; x=1690277130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZ/xIdZ82TqTec4JUdPD3hp3jpFKNDQq2r9sb8vvBWQ=;
  b=2JF3hsK1HhBgc2R9E+wjln5yC7x3NFHt4OBeYd/ildwWsDc40xLtufmn
   x1ZDFedcPbxhNfArehTnjDTOMab7YN9UZqdMT9Lglft1m40W7ZojUbtE7
   0YW6JVtlxDJjwDlKyLiLYfR1RECOrnAV3e1CY/McUzjW3J2nEG6bCxXUk
   NlSTuj/Md84QPBBSdi9TbF/baaQNbzx4hScs347MOXkukEGvkgj9eLvyV
   xHbSaeE7Wy3/v4VU0NyORh+mbYFTl5KVLsuoQVhUO6DB05ADFl/8loyxC
   SXzoq5tjLmy/v8UEoIKyaecCUTkKue4pB69MLaU3eTE7PXkl2Jh+37e/+
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="169328761"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2022 02:25:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Jul 2022 02:25:29 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 02:25:26 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <tkuw584924@gmail.com>,
	<Takahiro.Kuwano@infineon.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v17 3/7] mtd: spi-nor: Do not change nor->addr_nbytes at SFDP parsing time
Date: Mon, 25 Jul 2022 12:25:01 +0300
Message-ID: <20220725092505.446315-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725092505.446315-1-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_022530_826683_0437943D 
X-CRM114-Status: GOOD (  16.53  )
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
later on be used by callers. The caller will then decide if SFDP params
should be used and more importantly when they should be used. Clean the
code flow and don't initialize nor->addr_nbytes at SFDP parsing time.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 5 ++---
 drivers/mtd/spi-nor/core.h | 2 ++
 drivers/mtd/spi-nor/issi.c | 2 +-
 drivers/mtd/spi-nor/sfdp.c | 8 ++++----
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 31604188ee59..9f07f1036151 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2251,8 +2251,8 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
-	if (nor->addr_nbytes) {
-		/* already configured from SFDP */
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
@@ -2492,7 +2492,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_nbytes = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 19a692e27c92..7dc4cda41db3 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -340,6 +340,7 @@ struct spi_nor_otp {
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @addr_nbytes:	number of address bytes to send.
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
@@ -372,6 +373,7 @@ struct spi_nor_flash_parameter {
 	u64				size;
 	u32				writesize;
 	u32				page_size;
+	u8				addr_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
 
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 71687e5babdc..89a66a19d754 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -20,7 +20,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 	 */
 	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
-		nor->addr_nbytes = 4;
+		nor->params->addr_nbytes = 4;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 61ae8c8c5237..3a48173a2d78 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -462,11 +462,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
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
@@ -653,7 +653,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->addr_nbytes;
+		return nor->params->addr_nbytes;
 	}
 }
 
@@ -1098,7 +1098,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
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
