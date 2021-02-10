Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BDCC433E9
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 17:02:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C9F64DF6
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 17:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C9F64DF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d3Sqt9pNCYh6Ef5vjSrDNERBx1hXuFSCh0qPPmZ3BOI=; b=GP0JnPTX4XlGGE+Mg94Kb+MImS
	KmBfUdZao7Rg62sMPC/Pw+yUBy3I0Tnpk1oRyDy26WeaVDgyeM5j8iWDRyg5Ohgtm2M/oz7wUARn9
	6ksXVr3bRpfe8+x1vwOSnV9zaL+hYZMdW60gWHGLaQKgBViVDuffsMgWl64wMQD1eGj5YiBszGnE0
	zoEX7D8IbLnY7aMQgJ2zEBBQ5+b0Tpvp7NUub+guUMCPX5Kx7Al5n3QhTai95blQaj5KzQVlip0X4
	G/WNTw7RzQKJop+FwhL3ww0gIkMuzPXrw0g8xiu8KfKa9mlPg2cvIZI9Kc9pDtqFLRcRZYKZckrR+
	W1zMjtCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9sru-0005Rq-9z; Wed, 10 Feb 2021 17:01:34 +0000
Received: from mxout013.mail.hostpoint.ch ([2a00:d70:0:e::313])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9srq-0005Qb-WA
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 17:01:32 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout013.mail.hostpoint.ch with esmtp (Exim 4.92.3 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1l9srd-000PCr-Pd; Wed, 10 Feb 2021 18:01:17 +0100
Received: from [2a02:168:6182:1:b84f:77c9:95ef:b111]
 (helo=ryzen2700.home.reto-schneider.ch)
 by asmtp014.mail.hostpoint.ch with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92.3 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1l9srd-000BU0-KD; Wed, 10 Feb 2021 18:01:17 +0100
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: miquel.raynal@bootlin.com, richard@nod.at, sr@denx.de,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: spi: Support GigaDevice GD5F1GQ5UExxG
Date: Wed, 10 Feb 2021 18:00:31 +0100
Message-Id: <20210210170031.19753-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_120131_106472_541B5C65 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: Reto Schneider <reto.schneider@husqvarnagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

The relevant changes to the already existing GD5F1GQ4UExxG support has
been determined by consulting the GigaDevice product change notice
AN-0392-10, version 1.0 from November 30, 2020.

As the overlaps are huge, variable names have been generalized
accordingly.

Apart form the lowered ECC strength (4 instead of 8 bits per 512 bytes),
the new device ID, and the extra quad IO dummy byte, no changes had to
be taken into account.

New hardware features are not supported, namely:
 - Power on reset
 - Unique ID
 - Double transfer rate (DTR)
 - Parameter page
 - Random data quad IO

The inverted semantic of the "driver strength" register bits, defaulting
to 100% instead of 50% for the Q5 devices, got ignored as the driver has
never touched them anyway.

The no longer supported "read from cache during block erase"
functionality I do not know how to reflect.

Implementation has been tested on MediaTek MT7688 based GARDENA smart
Gateways using both, GigaDevice GD5F1GQ5UEYIG and GD5F1GQ4UBYIG.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 69 +++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 33c67403c4aa..1dd1c5898093 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -13,7 +13,10 @@
 #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
 #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
 
-#define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
+#define GD5FXGQ5XE_STATUS_ECC_1_4_BITFLIPS	(1 << 4)
+#define GD5FXGQ5XE_STATUS_ECC_4_BITFLIPS	(3 << 4)
+
+#define GD5FXGQXXEXXG_REG_STATUS2		0xf0
 
 #define GD5FXGQ4UXFXXG_STATUS_ECC_MASK		(7 << 4)
 #define GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS	(0 << 4)
@@ -102,7 +105,7 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
+static int gd5fxgqx_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
 				       struct mtd_oob_region *region)
 {
 	if (section)
@@ -114,7 +117,7 @@ static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
+static int gd5fxgqx_variant2_ooblayout_free(struct mtd_info *mtd, int section,
 					struct mtd_oob_region *region)
 {
 	if (section)
@@ -127,9 +130,10 @@ static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops gd5fxgq4_variant2_ooblayout = {
-	.ecc = gd5fxgq4_variant2_ooblayout_ecc,
-	.free = gd5fxgq4_variant2_ooblayout_free,
+/* Valid for Q4/Q5 and Q6 (untested) devices */
+static const struct mtd_ooblayout_ops gd5fxgqx_variant2_ooblayout = {
+	.ecc = gd5fxgqx_variant2_ooblayout_ecc,
+	.free = gd5fxgqx_variant2_ooblayout_free,
 };
 
 static int gd5fxgq4xc_ooblayout_256_ecc(struct mtd_info *mtd, int section,
@@ -165,7 +169,7 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQ4UEXXG_REG_STATUS2,
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
 						      &status2);
 	int ret;
 
@@ -203,6 +207,43 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int gd5fxgq5xexxg_ecc_get_status(struct spinand_device *spinand,
+					u8 status)
+{
+	u8 status2;
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
+						      &status2);
+	int ret;
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case GD5FXGQ5XE_STATUS_ECC_1_4_BITFLIPS:
+		/*
+		 * Read status2 register to determine a more fine grained
+		 * bit error status
+		 */
+		ret = spi_mem_exec_op(spinand->spimem, &op);
+		if (ret)
+			return ret;
+
+		/*
+		 * 1 ... 4 bits are flipped (and corrected)
+		 */
+		/* bits sorted this way (1...0): ECCSE1, ECCSE0 */
+		return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int gd5fxgq4ufxxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
@@ -282,7 +323,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
 	SPINAND_INFO("GD5F1GQ4UFxxG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE, 0xb1, 0x48),
@@ -292,8 +333,18 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4ufxxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GQ5UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x51),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq5xexxg_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {

base-commit: 92bf22614b21a2706f4993b278017e437f7785b3
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
