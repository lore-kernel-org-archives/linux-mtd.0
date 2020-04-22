Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F8AC5518A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 12:18:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBB0217BA
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 12:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="miuzQfqR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="dSCuaJ00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBB0217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eufm2NfDk0yHousYe2SxFBrUHEHy0TCfZR7gGJVZl1s=; b=miuzQfqRCtWFZb
	i7Z1m7Y1TGozBK7kJlAlCBUtyq4+BvnsKBS+x/mA1nBVo+XCoG1T60/1n+jn20aIVDuSBYr5XNwbL
	tonfpoWUSSMyMSlMX1RVESeUNwE64izyLNN5YbDX4dPvchI5R/w2QzRw5/Z1YLx8eNf7R9Yno9c99
	C1jEf+M2+IpqCLTc71ISYIzQfwVDUtkPslZwgCWwU3HDahQmixwHhHR8w/HRU+F3MElNS2EcU4V7A
	S9djNMw9MD3lRFm2t9hTtaz4vCunp/x9kgA7yHYw9agCWE3f6LEZA4x1OgaipvD4uw2CdYeJtIJWN
	dwGWRNVshJWIeQtnmayA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jREKW-0001kB-Nb; Wed, 22 Apr 2020 12:18:16 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jREKS-0001h6-2I
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 12:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=11286; q=dns/txt; s=axis-central1;
 t=1587557892; x=1619093892;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=RYZ4Av5X5kFZMCtxu6bcOGXX2RiwgZkMCXp3IYY3Pls=;
 b=dSCuaJ00r1SFLjDeXpGEWVOShxqKmxLSSF1YKd3bFrvlaNYE0g8I4PhN
 OMIgjCcdq8jHKlWXRv5loHM63tX/+DR59ioBL+HqtqtdaMJLxbU8Oa7ML
 s3YF3lZc/rjA7MBrnZYgrhLRyS1pvOiPAvgZR+SIzhDxDRC7lLir6ysLm
 KlldKsC+HegbD3BK//FrTl2kR35UpQVTbnDeiVx8qIQO+hp0ti7DijDsC
 QX0xEaP8KolUuJ3zZutTd8xCEFiVxLQXp2DfeYExynfes51Atk17IGnk1
 iLiD22aPdUUllzOWt0wfeb8arx0/sryw4WCLCb7j0HrLCs2oltCv4d7Ra g==;
IronPort-SDR: h60wyEwpDGh39QXRkjlAdpvLRm3TEC9YbNiRGvpu57RyxK1UWClwL/BdgET1rpq0TrSUF/Q73e
 dB2Nl8ys3c/VBYWtU6QSGLn4eTSGkvODEdOkYjNZr1rI9WFTTDO948e+2G1e0sQSFKFneLSO/C
 ZTp/xmSwPjGnFDK2jUu8m2SKtK8WNFV868MwA0ODTFr48oTIV3NcS0vFAClNc8xTerECvjGbsV
 ZHboKOj8g4P2cqQ6wz1J7M9UoduJ+myui4Dx09B8EdimZkkIBIMBmNDZcQ5XAz88uluieyvxn9
 Zy4=
X-IronPort-AV: E=Sophos;i="5.72,414,1580770800"; 
   d="scan'208";a="7698675"
From: Rickard Andersson <rickaran@axis.com>
To: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: rawnand: Non ONFI specialized timing support
Date: Wed, 22 Apr 2020 14:18:00 +0200
Message-ID: <20200422121800.7365-1-rickaran@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_051812_445127_86262E68 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: rickaran@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Rickard x Andersson <rickaran@axis.com>

The Kioxia/Toshiba TH58NVG2S3HBAI4 NAND memory is not a
ONFI compliant memory. The timings of that memory are quite
close to ONFI mode 4 but is breaking that spec.

This patch adds a special table with timings that can be
used for non ONFI memories.

Erase block read speed is increased from 6739 KiB/s to
13260 KiB/s. Erase block write speed is increased from
3004 KiB/s to 3872 KiB/s.

Tested on IMX6ULL which has a NAND controller supporting
EDO mode.

Signed-off-by: Rickard x Andersson <rickaran@axis.com>
---
 drivers/mtd/nand/raw/internals.h    |  3 +-
 drivers/mtd/nand/raw/nand_base.c    | 73 +++++++++++++++++++++++++++++++++----
 drivers/mtd/nand/raw/nand_ids.c     |  4 ++
 drivers/mtd/nand/raw/nand_timings.c | 66 +++++++++++++++++++++++++++++++--
 include/linux/mtd/rawnand.h         | 24 ++++++++++++
 5 files changed, 157 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index fbf6ca015cd7..4fcb9f87caaf 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,7 +81,8 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
 int onfi_fill_data_interface(struct nand_chip *chip,
 			     enum nand_data_interface_type type,
-			     int timing_mode);
+			     int timing_mode,
+			     enum non_onfi_spec_timing spec_timing);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ddd396e93e32..8980e42ec6bd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -793,7 +793,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 	 * timings to timing mode 0.
 	 */
 
-	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0,
+				 NON_ONFI_TIMING_NOT_USED);
 	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
 							&chip->data_interface);
 	if (ret)
@@ -875,6 +876,51 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 }
 
 /**
+ * nand_handle_non_onfi_spec_timings - Handle non ONFI timings
+ * @chip: The NAND chip
+ *
+ * Returns 0 for success or negative error code otherwise.
+ */
+static int nand_handle_non_onfi_spec_timings(struct nand_chip *chip)
+{
+	int ret;
+
+	if (chip->spec_timing == NON_ONFI_TIMING_NOT_USED)
+		return -EINVAL;
+
+	if (chip->onfi_timing_mode_default)
+		return -EINVAL;
+
+	ret = onfi_fill_data_interface(chip,
+				       NAND_SDR_IFACE,
+				       chip->onfi_timing_mode_default,
+				       chip->spec_timing);
+	if (ret)
+		return ret;
+	/*
+	 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
+	 * controller supports the requested timings.
+	 */
+	ret = chip->controller->ops->setup_data_interface(chip,
+					NAND_DATA_IFACE_CHECK_ONLY,
+					&chip->data_interface);
+
+	if (ret) {
+		/*
+		 * Settings were not supported by the controller,
+		 * restore safe settings.
+		 */
+		chip->spec_timing = NON_ONFI_TIMING_NOT_USED;
+		ret = onfi_fill_data_interface(chip,
+					       NAND_SDR_IFACE,
+					       chip->onfi_timing_mode_default,
+					       chip->spec_timing);
+	}
+
+	return ret;
+}
+
+/**
  * nand_init_data_interface - find the best data interface and timings
  * @chip: The NAND chip
  *
@@ -882,9 +928,11 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
  * and the driver.
  * First tries to retrieve supported timing modes from ONFI information,
  * and if the NAND chip does not support ONFI, relies on the
- * ->onfi_timing_mode_default specified in the nand_ids table. After this
- * function nand_chip->data_interface is initialized with the best timing mode
- * available.
+ * ->onfi_timing_mode_default specified in the nand_ids table. If
+ * onfi_timing_mode_default is not provided then ->spec_timing
+ * will be used if set.
+ * After this function nand_chip->data_interface is initialized with the
+ * best timing mode available.
  *
  * Returns 0 for success or negative error code otherwise.
  */
@@ -903,14 +951,21 @@ static int nand_init_data_interface(struct nand_chip *chip)
 	if (chip->parameters.onfi) {
 		modes = chip->parameters.onfi->async_timing_mode;
 	} else {
-		if (!chip->onfi_timing_mode_default)
-			return 0;
+		if (!chip->onfi_timing_mode_default) {
+			if (chip->spec_timing) {
+				ret = nand_handle_non_onfi_spec_timings(chip);
+				if (ret)
+					return ret;
+			}
 
+			return 0;
+		}
 		modes = GENMASK(chip->onfi_timing_mode_default, 0);
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
-		ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode);
+		ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode,
+					       NON_ONFI_TIMING_NOT_USED);
 		if (ret)
 			continue;
 
@@ -4564,6 +4619,7 @@ static bool find_full_id_nand(struct nand_chip *chip,
 		chip->ecc_step_ds = NAND_ECC_STEP(type);
 		chip->onfi_timing_mode_default =
 					type->onfi_timing_mode_default;
+		chip->spec_timing = type->spec_timing;
 
 		chip->parameters.model = kstrdup(type->name, GFP_KERNEL);
 		if (!chip->parameters.model)
@@ -4981,7 +5037,8 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	mutex_init(&chip->lock);
 
 	/* Enforce the right timings for reset/detection */
-	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0,
+				 NON_ONFI_TIMING_NOT_USED);
 
 	ret = nand_dt_init(chip);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index ea5a342cd91e..b1eb508a74e0 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -56,6 +56,10 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
 		  NAND_ECC_INFO(40, SZ_1K), 4 },
+	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
+		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
+		SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512),
+		0, NON_ONFI_TIMING_1},
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index bea3062d71d6..0de07da36485 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -271,14 +271,67 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	},
 };
 
+static const struct nand_data_interface non_onfi_spec_sdr_timings[] = {
+	/*
+	 * Chosen by enum non_onfi_spec_timing = NON_ONFI_TIMING_1
+	 *
+	 * Data below is obtained from KIOXIA/Toshiba TH58NVG2S3HBAI4
+	 */
+	{
+		.type = NAND_SDR_IFACE,
+		.timings.sdr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tADL_min = 400000,
+			.tALH_min = 5000,
+			.tALS_min = 12000,
+			.tAR_min = 10000,
+			.tCEA_max = 25000,
+			.tCEH_min = 20000,
+			.tCH_min = 5000,
+			.tCHZ_max = 20000,
+			.tCLH_min = 5000,
+			.tCLR_min = 10000,
+			.tCLS_min = 12000,
+			.tCOH_min = 0,
+			.tCS_min = 20000,
+			.tDH_min = 5000,
+			.tDS_min = 12000,
+			.tFEAT_max = 1000000,
+			.tIR_min = 0,
+			.tITC_max = 1000000,
+			.tRC_min = 25000,
+			.tREA_max = 20000,
+			.tREH_min = 10000,
+			.tRHOH_min = 25000,
+			.tRHW_min = 30000,
+			.tRHZ_max = 60000,
+			.tRLOH_min = 5000,
+			.tRP_min = 12000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWC_min = 25000,
+			.tWH_min = 10000,
+			.tWHR_min = 60000,
+			.tWP_min = 12000,
+			.tWW_min = 100000,
+		},
+	},
+};
+
 /**
  * onfi_fill_data_interface - [NAND Interface] Initialize a data interface from
  * given ONFI mode
- * @mode: The ONFI timing mode
+ * @chip: The NAND chip
+ * @onfi_timing_mode: The ONFI timing mode
+ * @type: Timing type
+ * @spec_timing: Special timings to be used for non ONFI NAND memories
  */
 int onfi_fill_data_interface(struct nand_chip *chip,
 			     enum nand_data_interface_type type,
-			     int timing_mode)
+			     int onfi_timing_mode,
+			     enum non_onfi_spec_timing spec_timing)
 {
 	struct nand_data_interface *iface = &chip->data_interface;
 	struct onfi_params *onfi = chip->parameters.onfi;
@@ -286,10 +339,15 @@ int onfi_fill_data_interface(struct nand_chip *chip,
 	if (type != NAND_SDR_IFACE)
 		return -EINVAL;
 
-	if (timing_mode < 0 || timing_mode >= ARRAY_SIZE(onfi_sdr_timings))
+	if (onfi_timing_mode < 0 ||
+	    onfi_timing_mode >= ARRAY_SIZE(onfi_sdr_timings))
 		return -EINVAL;
 
-	*iface = onfi_sdr_timings[timing_mode];
+	if ((spec_timing > 0) &&
+	    (spec_timing <= ARRAY_SIZE(non_onfi_spec_sdr_timings)))
+		*iface = non_onfi_spec_sdr_timings[spec_timing - 1];
+	else
+		*iface = onfi_sdr_timings[onfi_timing_mode];
 
 	/*
 	 * Initialize timings that cannot be deduced from timing mode:
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b7445a44a814..329eff0951ed 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -961,6 +961,17 @@ struct nand_legacy {
 };
 
 /**
+ * enum non_onfi_spec_timing - Special timing that can be used for
+ * non ONFI NAND.
+ * @NON_ONFI_TIMING_NOT_USED:	No special timings
+ * @NON_ONFI_TIMING_1:		Special timing 1
+ */
+enum non_onfi_spec_timing {
+	NON_ONFI_TIMING_NOT_USED,
+	NON_ONFI_TIMING_1,
+};
+
+/**
  * struct nand_chip - NAND Private Flash Chip Data
  * @mtd:		MTD device registered to the MTD framework
  * @legacy:		All legacy fields/hooks. If you develop a new driver,
@@ -1001,6 +1012,10 @@ struct nand_legacy {
  *			      set to the actually used ONFI mode if the chip is
  *			      ONFI compliant or deduced from the datasheet if
  *			      the NAND chip is not ONFI compliant.
+ * @spec_timing:	      [INTERN] This field is set to choose the special
+ *			      non onfi timings. This is used if the chip is not
+ *			      ONFI compliant and the timings does not correspond
+ *			      to any of the ONFI modes.
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
@@ -1065,6 +1080,7 @@ struct nand_chip {
 	uint16_t ecc_strength_ds;
 	uint16_t ecc_step_ds;
 	int onfi_timing_mode_default;
+	enum non_onfi_spec_timing spec_timing;
 	int badblockpos;
 	int badblockbits;
 
@@ -1202,6 +1218,13 @@ static inline void *nand_get_manufacturer_data(struct nand_chip *chip)
  * @onfi_timing_mode_default: the default ONFI timing mode entered after a NAND
  *			      reset. Should be deduced from timings described
  *			      in the datasheet.
+ * @spec_timing:	Alternative timing table to be used after a NAND reset.
+ *			This can be used for non ONFI NANDs that does not have
+ *			timings that correspond well to the ONFI timing modes.
+ *			This value references non_onfi_spec_sdr_timings[] in
+ *			nand_timings.c.
+ *			Should be deduced from timings described
+ *			in the datasheet.
  *
  */
 struct nand_flash_dev {
@@ -1224,6 +1247,7 @@ struct nand_flash_dev {
 		uint16_t step_ds;
 	} ecc;
 	int onfi_timing_mode_default;
+	enum non_onfi_spec_timing spec_timing;
 };
 
 int nand_create_bbt(struct nand_chip *chip);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
