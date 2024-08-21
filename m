Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7878FC52D7C
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGjQELuiMD15SSBlXOw0dc/6JJpbOvw1p0dN24TJHJY=; b=eNMcu0J3Kjy75q
	bSqiD9yza+rjYC6zHd6xR19UVHReV0CfeJRADfkHIUFOvTY9JgstwAaKTcNZ9CSEO5Lw11kczBo5T
	B9wmsLpZ7wk89JAU0TRKraw39ali2lZEFMkcqi0LuLQ3ckKEw2PcJzDj86S2Af2rxYl6/cyjTWCtP
	GWkY76nfEgZeOBV+4ZNYh1S3MNhafJMfEt00kxgp9H7zBTe3nQLBRiln7YoRGGiJXATuFQiAECWre
	Vxl3svGuxlwVyRfpXKmx2WOq4qxSGhB9imDEeKySRAejfcniwfX2natL2Wksm8EgUMPkq7QMEyFA/
	ihjamg9VrEOxzhhjOK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9d-00000009kSy-3nGs;
	Wed, 21 Aug 2024 16:25:49 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9R-00000009kIp-4AIJ
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 16:25:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A5F1BF211;
	Wed, 21 Aug 2024 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724257536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=awBXnpUws44XdFsIwYUq2LRQZdjnXHVhbm2kBNbsOVc=;
	b=G1SiDKPNpL1DdXfqcQUbZFPIbBxXl9viguaiQYEQ9imTMX2eB0RmQUKV0ZCznkOMHYUFm5
	7FWIzgTc3Tw9mavxTMEOo2OAv1M7dzcoUFWFtmUmW3Xbo6Fgpw5i8QcYUTn37Ikz782JXT
	9dTVHYmbsPNBcVOuX6X578v8km6AK38sDiQPCNSUNDRkEPOhqtjwS6RSWudSoQ/n/QJ6KH
	ecMDWEDINVHTg2cJj4W3SxgINlCJ/3O2KpdofBVjsZ3wCV9TJjhZj8zD+tnl+vNTsTLIx8
	t/ICyulKRTwaQmjQFm03d2xm8mA/skUUn/hxjQgnXtPadaXPUAih1ISYdE5dEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 9/9] mtd: spi-nand: macronix: Continuous read support
Date: Wed, 21 Aug 2024 18:25:28 +0200
Message-ID: <20240821162528.218292-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821162528.218292-1-miquel.raynal@bootlin.com>
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_092538_490767_FBD17812 
X-CRM114-Status: GOOD (  27.25  )
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

Enabling continuous read support implies several changes which must be
done atomically in order to keep the code base consistent and
bisectable.

1/ Retrieving bitflips differently

Improve the helper retrieving the number of bitflips to support the case
where many pages have been read instead of just one. In this case, if
there is one page with bitflips, we cannot know the detail and just get
the information of the maximum number of bitflips corrected in the most
corrupted chunk. Compatible Macronix flashes return:
- the ECC status for the last page read (bits 0-3),
- the amount of bitflips for the whole read operation (bits 4-7).
Hence, when reading two consecutive pages, if there was 2 bits corrected
at most in one chunk, we return this amount times (arbitrary) the number
read pages. It is probably a very pessimistic calculation in most cases,
but still less pessimistic than if we multiplied this amount by the
number of chunks. Anyway, this is just for statistics, the important
data is the maximum amount of bitflips, which leads to wear leveling.

2/ Configuring, enabling and disabling the feature

Create an init function for allocating a vendor structure. Use this
vendor structure to cache the internal continuous read state. The state
is being used to discriminate between the two bitflips retrieval
methods. Finally, helpers for enabling and disabling sequential reads
are also created.

3/ Fill the chips table

Flag all the chips supporting the feature with the ->set_cont_read()
helper.

In order to validate the changes, I modified the mtd-utils test suite
with extended versions of nandbiterrs, nanddump and flash_speed in order
to support, test and benchmark continuous reads. I also ran all the UBI
tests successfully.

The nandbiterrs tool allows to track the ECC efficiency and
feedback. Here is its default output (stripped):

Successfully corrected 0 bit errors per subpage
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Read reported 2 corrected bit errors
Successfully corrected 2 bit errors per subpage
Read reported 3 corrected bit errors
Successfully corrected 3 bit errors per subpage
Read reported 4 corrected bit errors
Successfully corrected 4 bit errors per subpage
Read reported 5 corrected bit errors
Successfully corrected 5 bit errors per subpage
Read reported 6 corrected bit errors
Successfully corrected 6 bit errors per subpage
Read reported 7 corrected bit errors
Successfully corrected 7 bit errors per subpage
Read reported 8 corrected bit errors
Successfully corrected 8 bit errors per subpage
Failed to recover 1 bitflips
Read error after 9 bit errors per page

The output using the continuous option over two pages (the second page
is kept intact):

Successfully corrected 0 bit errors per subpage
Read reported 2 corrected bit errors
Successfully corrected 1 bit errors per subpage
Read reported 4 corrected bit errors
Successfully corrected 2 bit errors per subpage
Read reported 6 corrected bit errors
Successfully corrected 3 bit errors per subpage
Read reported 8 corrected bit errors
Successfully corrected 4 bit errors per subpage
Read reported 10 corrected bit errors
Successfully corrected 5 bit errors per subpage
Read reported 12 corrected bit errors
Successfully corrected 6 bit errors per subpage
Read reported 14 corrected bit errors
Successfully corrected 7 bit errors per subpage
Read reported 16 corrected bit errors
Successfully corrected 8 bit errors per subpage
Failed to recover 1 bitflips
Read error after 9 bit errors per page

Regarding the throughput improvements, tests have been conducted in
1-1-1 and 1-1-4 modes, reading a full block X pages at a
time, X ranging from 1 to 64 (size of a block with the tested device).
The percent value on the right is the comparison of the same test
conducted without the continuous read feature, ie. reading X pages in
one single user request, which got naturally split by the core whit the
continuous read optimization disabled into single-page reads.

* 1-1-1 result:
1 page read speed is 2634 KiB/s
2 page read speed is 2704 KiB/s (+3%)
3 page read speed is 2747 KiB/s (+5%)
4 page read speed is 2804 KiB/s (+7%)
5 page read speed is 2782 KiB/s
6 page read speed is 2826 KiB/s
7 page read speed is 2834 KiB/s
8 page read speed is 2821 KiB/s
9 page read speed is 2846 KiB/s
10 page read speed is 2819 KiB/s
11 page read speed is 2871 KiB/s (+10%)
12 page read speed is 2823 KiB/s
13 page read speed is 2880 KiB/s
14 page read speed is 2842 KiB/s
15 page read speed is 2862 KiB/s
16 page read speed is 2837 KiB/s
32 page read speed is 2879 KiB/s
64 page read speed is 2842 KiB/s

* 1-1-4 result:
1 page read speed is 7562 KiB/s
2 page read speed is 8904 KiB/s (+15%)
3 page read speed is 9655 KiB/s (+25%)
4 page read speed is 10118 KiB/s (+30%)
5 page read speed is 10084 KiB/s
6 page read speed is 10300 KiB/s
7 page read speed is 10434 KiB/s (+35%)
8 page read speed is 10406 KiB/s
9 page read speed is 10769 KiB/s (+40%)
10 page read speed is 10666 KiB/s
11 page read speed is 10757 KiB/s
12 page read speed is 10835 KiB/s
13 page read speed is 10976 KiB/s
14 page read speed is 11200 KiB/s
15 page read speed is 11009 KiB/s
16 page read speed is 11082 KiB/s
32 page read speed is 11352 KiB/s (+45%)
64 page read speed is 11403 KiB/s

This work has received support and could be achieved thanks to
Alvin Zhou <alvinzhou@mxic.com.tw>.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 115 ++++++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index a4feeb030258..9c0c72b913ed 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -5,15 +5,26 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
 #define SPINAND_MFR_MACRONIX		0xC2
-#define MACRONIX_ECCSR_MASK		0x0F
+#define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
+#define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
+#define MACRONIX_CFG_CONT_READ         BIT(2)
 
 #define STATUS_ECC_HAS_BITFLIPS_THRESHOLD (3 << 4)
 
+/* Bitflip theshold configuration register */
+#define REG_CFG_BFT 0x10
+#define CFG_BFT(x) FIELD_PREP(GENMASK(7, 4), (x))
+
+struct macronix_priv {
+	bool cont_read;
+};
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
@@ -53,6 +64,7 @@ static const struct mtd_ooblayout_ops mx35lfxge4ab_ooblayout = {
 
 static int macronix_get_eccsr(struct spinand_device *spinand, u8 *eccsr)
 {
+	struct macronix_priv *priv = spinand->priv;
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(0x7c, 1),
 					  SPI_MEM_OP_NO_ADDR,
 					  SPI_MEM_OP_DUMMY(1, 1),
@@ -62,33 +74,25 @@ static int macronix_get_eccsr(struct spinand_device *spinand, u8 *eccsr)
 	if (ret)
 		return ret;
 
-	*eccsr &= MACRONIX_ECCSR_MASK;
-	return 0;
-}
-
-static int macronix_get_bf(struct spinand_device *spinand, u8 status)
-{
-	struct nand_device *nand = spinand_to_nand(spinand);
-	u8 eccsr;
-
 	/*
-	 * Let's try to retrieve the real maximum number of bitflips
-	 * in order to avoid forcing the wear-leveling layer to move
-	 * data around if it's not necessary.
+	 * ECCSR exposes the number of bitflips for the last read page in bits [3:0].
+	 * Continuous read compatible chips also expose the maximum number of
+	 * bitflips for the whole (continuous) read operation in bits [7:4].
 	 */
-	if (macronix_get_eccsr(spinand, spinand->scratchbuf))
-		return nanddev_get_ecc_conf(nand)->strength;
+	if (!priv->cont_read)
+		*eccsr = MACRONIX_ECCSR_BF_LAST_PAGE(*eccsr);
+	else
+		*eccsr = MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(*eccsr);
 
-	eccsr = *spinand->scratchbuf;
-	if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength || !eccsr))
-		return nanddev_get_ecc_conf(nand)->strength;
-
-	return eccsr;
+	return 0;
 }
 
 static int macronix_ecc_get_status(struct spinand_device *spinand,
 				   u8 status)
 {
+	struct nand_device *nand = spinand_to_nand(spinand);
+	u8 eccsr;
+
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
 		return 0;
@@ -97,8 +101,19 @@ static int macronix_ecc_get_status(struct spinand_device *spinand,
 		return -EBADMSG;
 
 	case STATUS_ECC_HAS_BITFLIPS:
-	case STATUS_ECC_HAS_BITFLIPS_THRESHOLD:
-		return macronix_get_bf(spinand, status);
+		/*
+		 * Let's try to retrieve the real maximum number of bitflips
+		 * in order to avoid forcing the wear-leveling layer to move
+		 * data around if it's not necessary.
+		 */
+		if (macronix_get_eccsr(spinand, spinand->scratchbuf))
+			return nanddev_get_ecc_conf(nand)->strength;
+
+		eccsr = *spinand->scratchbuf;
+		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength || !eccsr))
+			return nanddev_get_ecc_conf(nand)->strength;
+
+		return eccsr;
 	default:
 		break;
 	}
@@ -106,6 +121,21 @@ static int macronix_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int macronix_set_cont_read(struct spinand_device *spinand, bool enable)
+{
+	struct macronix_priv *priv = spinand->priv;
+	int ret;
+
+	ret = spinand_upd_cfg(spinand, MACRONIX_CFG_CONT_READ,
+			      enable ? MACRONIX_CFG_CONT_READ : 0);
+	if (ret)
+		return ret;
+
+	priv->cont_read = enable;
+
+	return 0;
+}
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -135,7 +165,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX35LF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x37, 0x03),
 		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
@@ -145,7 +176,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX35LF1G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
@@ -251,7 +283,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX35UF2G14AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa0),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
@@ -291,7 +324,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX35UF2GE4AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa2, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
@@ -301,7 +335,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX35UF1G14AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x90),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -331,7 +366,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX35UF1GE4AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -341,7 +377,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_CONT_READ(macronix_set_cont_read)),
 	SPINAND_INFO("MX31LF2GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x2e),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
@@ -364,7 +401,27 @@ static const struct spinand_info macronix_spinand_table[] = {
 				     macronix_ecc_get_status)),
 };
 
+static int macronix_spinand_init(struct spinand_device *spinand)
+{
+	struct macronix_priv *priv;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spinand->priv = priv;
+
+	return 0;
+}
+
+static void macronix_spinand_cleanup(struct spinand_device *spinand)
+{
+	kfree(spinand->priv);
+}
+
 static const struct spinand_manufacturer_ops macronix_spinand_manuf_ops = {
+	.init = macronix_spinand_init,
+	.cleanup = macronix_spinand_cleanup,
 };
 
 const struct spinand_manufacturer macronix_spinand_manufacturer = {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
