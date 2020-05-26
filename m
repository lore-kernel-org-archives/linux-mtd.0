Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D9DC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ACC620721
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1hoJ/KY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ACC620721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doWwsG8xy4wNciKdYZm0RpoPrNBTCumaIN7kq/bWIwA=; b=E1hoJ/KYdEhUDk
	t/owSK4cY34MBb+0Q31M4NoUBSjewrrfjyJrGHNxPJdZqVE48VnrCzFnIgyo3QBhJk6R5IxT8rbHp
	Lkj/Ct/nrsBzHCjywsl+DrKmhSt1x7zSyJ58vYbIcnb7LSTnVV4bEqnxSx/PPe4NqvWWZIqxhsqbI
	NSpJt2mIciat9LrdK8YaDi8VBGGazvwvAjck2Oy+LaDFOYxowF38ppF6RXha3HGBEIclI5Ux/VsH1
	by0UdrzTKiUj7By2EWBwE/sXq+1frNy3TNjTq27/kkZ3ygyFn/g+DpuqxnthcEeY10aDUt4TOMh9l
	cpj6mY3BL5ZQ1bqZQtsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfCs-0004yR-L4; Tue, 26 May 2020 19:25:46 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf5Z-0001pB-CZ
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:18:15 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 128C9240007;
 Tue, 26 May 2020 19:18:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 28/28] mtd: rawnand: Allocate the best data interface
 structure dynamically
Date: Tue, 26 May 2020 21:17:25 +0200
Message-Id: <20200526191725.7591-29-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121814_417211_AF13776F 
X-CRM114-Status: GOOD (  18.64  )
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
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Instead of manipulating the statically allocated structure and copy
timings around, allocate one at identification time and save it in the
nand_chip structure once it has been initialized.

This way, either there is a "best data interface" and the requested
timings will be these, or there is none, forcing the core to use the
default set, statically defined in the core, shared across all NAND
chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 42 ++++++++++++++++++++++----------
 include/linux/mtd/rawnand.h      | 13 +++++++---
 2 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2547136a9cd7..247bf5faaf55 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -947,7 +947,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
  */
 static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 {
-	u8 mode = chip->data_interface.timings.mode;
+	u8 mode = chip->best_iface->timings.mode;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
 	int ret;
 
@@ -966,7 +966,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 
 	/* Change the mode on the controller side */
 	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
-							&chip->data_interface);
+							  chip->best_iface);
 	if (ret)
 		return ret;
 
@@ -1030,8 +1030,10 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 		ret = ops->setup_data_interface(chip,
 						NAND_DATA_IFACE_CHECK_ONLY,
 						iface);
-		if (!ret)
+		if (!ret) {
+			chip->best_iface = iface;
 			return ret;
+		}
 
 		/* Fallback to slower modes */
 		best_mode = iface->timings.mode;
@@ -1052,6 +1054,8 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 			break;
 	}
 
+	chip->best_iface = iface;
+
 	return 0;
 }
 
@@ -1070,14 +1074,25 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
  */
 static int nand_choose_data_interface(struct nand_chip *chip)
 {
+	struct nand_data_interface *iface;
+	int ret;
+
 	if (!nand_controller_has_setup_data_iface(chip))
 		return 0;
 
+	iface = kzalloc(sizeof(*iface), GFP_KERNEL);
+	if (!iface)
+		return -ENOMEM;
+
 	if (chip->ops.choose_data_interface)
-		return chip->ops.choose_data_interface(chip,
-						       &chip->data_interface);
+		ret = chip->ops.choose_data_interface(chip, iface);
+	else
+		ret = nand_choose_best_sdr_timings(chip, iface, NULL);
 
-	return nand_choose_best_sdr_timings(chip, &chip->data_interface, NULL);
+	if (ret)
+		kfree(iface);
+
+	return ret;
 }
 
 /**
@@ -2514,8 +2529,7 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	 * nand_setup_data_interface() uses ->set/get_features() which would
 	 * fail anyway as the parameter page is not available yet.
 	 */
-	if (!memcmp(&chip->data_interface, nand_reset_data_iface,
-		    sizeof(*nand_reset_data_iface)))
+	if (!chip->best_iface)
 		return 0;
 
 	ret = nand_setup_data_interface(chip, chipnr);
@@ -5252,9 +5266,6 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 
 	mutex_init(&chip->lock);
 
-	/* Enforce the right timings for reset/detection */
-	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
-
 	ret = nand_dt_init(chip);
 	if (ret)
 		return ret;
@@ -6059,7 +6070,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	for (i = 0; i < nanddev_ntargets(&chip->base); i++) {
 		ret = nand_setup_data_interface(chip, i);
 		if (ret)
-			goto err_nanddev_cleanup;
+			goto err_free_data_iface;
 	}
 
 	/* Check, if we should skip the bad block table scan */
@@ -6069,10 +6080,12 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* Build bad block table */
 	ret = nand_create_bbt(chip);
 	if (ret)
-		goto err_nanddev_cleanup;
+		goto err_free_data_iface;
 
 	return 0;
 
+err_free_data_iface:
+	kfree(chip->best_iface);
 
 err_nanddev_cleanup:
 	nanddev_cleanup(&chip->base);
@@ -6166,6 +6179,9 @@ void nand_cleanup(struct nand_chip *chip)
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
 
+	/* Free the data interface */
+	kfree(chip->best_iface);
+
 	/* Free manufacturer priv data. */
 	nand_manufacturer_cleanup(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 00557e553827..0f215faa3072 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1070,7 +1070,9 @@ struct nand_manufacturer {
  * @options: Various chip options. They can partly be set to inform nand_scan
  *           about special functionality. See the defines for further
  *           explanation.
- * @data_interface: NAND interface timing information
+ * @best_iface: The best NAND data interface which fits both the NAND chip and
+ *              NAND controller constraints. If unset, the default reset data
+ *              interface must be used.
  * @bbt_erase_shift: Number of address bits in a bbt entry
  * @bbt_options: Bad block table specific options. All options used here must
  *               come from bbm.h. By default, these options will be copied to
@@ -1117,7 +1119,7 @@ struct nand_chip {
 	unsigned int options;
 
 	/* Data interface */
-	struct nand_data_interface data_interface;
+	struct nand_data_interface *best_iface;
 
 	/* Bad block information */
 	unsigned int bbt_erase_shift;
@@ -1212,7 +1214,12 @@ extern const struct nand_data_interface *nand_reset_data_iface;
 static inline const struct nand_sdr_timings *
 nand_get_sdr_timings(struct nand_chip *chip)
 {
-	return nand_extract_sdr_timings(&chip->data_interface);
+	const struct nand_data_interface *iface = chip->best_iface;
+
+	if (!iface)
+		iface = nand_reset_data_iface;
+
+	return nand_extract_sdr_timings(iface);
 }
 
 /*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
