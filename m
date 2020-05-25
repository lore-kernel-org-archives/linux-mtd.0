Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82705C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59947206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLlIaiGI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59947206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nI3zSBb7Vs29S2aFZiB9LnGu/CS/3y0q/YQCXoZjdE=; b=PLlIaiGIahATke
	jmazl3K+QO+eyQ72qa0SPutUDtSTMLlrMYaE0+NRHYrgH6tFdmfS+kmMB0x/MzgiWS/W4hSfG7oH9
	XcIsyzdhE1wnJNXyB2jzDh5Q8UkpJZGZrBpd1wVcHVueZX34pxxANJzmxife12uJ8YvUkrXhJV5Dh
	3ZPzblegIbO2WrnXvW27J7VQiWRPRfNutLQ893kAYs35jT9Ydnc/fl6g2Zum5tyRTt91izB5OR9Iw
	OrczZlRGEYhDJmv9LXTYDpEvnbVAb0F6IV1LRZ1mylvj/aAMnbg8jjiS7QkwosuaesBiPt9rMOLdj
	/DrKH85WawTBZHXwpX4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdHA7-0007Ml-Ow; Mon, 25 May 2020 17:45:19 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdH7o-0003C1-DA
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 17:42:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3114024000D;
 Mon, 25 May 2020 17:42:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 08/19] mtd: rawnand: Rename onfi_timing_mode_default
Date: Mon, 25 May 2020 19:42:28 +0200
Message-Id: <20200525174239.11349-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525174239.11349-1-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_104256_718896_12F874BD 
X-CRM114-Status: GOOD (  16.01  )
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

This parameter would better be named default_timing_mode as we are
opening the way to non-ONFI timings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c    | 20 +++++++++-----------
 drivers/mtd/nand/raw/nand_toshiba.c |  2 +-
 include/linux/mtd/rawnand.h         |  8 ++++----
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7567c973964b..adbc12580e2e 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -952,7 +952,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 {
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
-		chip->onfi_timing_mode_default,
+		chip->default_timing_mode,
 	};
 	int ret;
 
@@ -987,9 +987,9 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	if (ret)
 		goto err_reset_chip;
 
-	if (tmode_param[0] != chip->onfi_timing_mode_default) {
+	if (tmode_param[0] != chip->default_timing_mode) {
 		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
-			chip->onfi_timing_mode_default);
+			chip->default_timing_mode);
 		goto err_reset_chip;
 	}
 
@@ -1016,9 +1016,8 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
  * and the driver.
  * First tries to retrieve supported timing modes from ONFI information,
  * and if the NAND chip does not support ONFI, relies on the
- * ->onfi_timing_mode_default specified in the nand_ids table. After this
- * function nand_chip->data_interface is initialized with the best timing mode
- * available.
+ * ->default_timing_mode specified in the nand_ids table. After this function
+ * nand_chip->data_interface is initialized with the best timing mode available.
  *
  * Returns 0 for success or negative error code otherwise.
  */
@@ -1037,10 +1036,10 @@ static int nand_init_data_interface(struct nand_chip *chip)
 	if (chip->parameters.onfi) {
 		modes = chip->parameters.onfi->async_timing_mode;
 	} else {
-		if (!chip->onfi_timing_mode_default)
+		if (!chip->default_timing_mode)
 			return 0;
 
-		modes = GENMASK(chip->onfi_timing_mode_default, 0);
+		modes = GENMASK(chip->default_timing_mode, 0);
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
@@ -1056,7 +1055,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
 						 NAND_DATA_IFACE_CHECK_ONLY,
 						 &chip->data_interface);
 		if (!ret) {
-			chip->onfi_timing_mode_default = mode;
+			chip->default_timing_mode = mode;
 			break;
 		}
 	}
@@ -4814,8 +4813,7 @@ static bool find_full_id_nand(struct nand_chip *chip,
 		chip->options |= type->options;
 		chip->base.eccreq.strength = NAND_ECC_STRENGTH(type);
 		chip->base.eccreq.step_size = NAND_ECC_STEP(type);
-		chip->onfi_timing_mode_default =
-					type->onfi_timing_mode_default;
+		chip->default_timing_mode = type->onfi_timing_mode_default;
 
 		chip->parameters.model = kstrdup(type->name, GFP_KERNEL);
 		if (!chip->parameters.model)
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index ae069905d7e4..b6efaf5195bb 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -198,7 +198,7 @@ static int tc58teg5dclta00_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	chip->onfi_timing_mode_default = 5;
+	chip->default_timing_mode = 5;
 	chip->options |= NAND_NEED_SCRAMBLING;
 	mtd_set_pairing_scheme(mtd, &dist3_pairing_scheme);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 622da6527a36..a4b68e7b246a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1067,9 +1067,9 @@ struct nand_manufacturer {
  * @options: Various chip options. They can partly be set to inform nand_scan
  *           about special functionality. See the defines for further
  *           explanation.
- * @onfi_timing_mode_default: Default ONFI timing mode. This field is set to the
- *			      actually used ONFI mode if the chip is ONFI
- *			      compliant or deduced from the datasheet otherwise
+ * @default_timing_mode: Default timing mode. This field is set to the actually
+ *                       used ONFI mode if the chip is ONFI compliant or deduced
+ *                       from the datasheet otherwise
  * @data_interface: NAND interface timing information
  * @bbt_erase_shift: Number of address bits in a bbt entry
  * @bbt_options: Bad block table specific options. All options used here must
@@ -1117,7 +1117,7 @@ struct nand_chip {
 	unsigned int options;
 
 	/* Data interface */
-	int onfi_timing_mode_default;
+	int default_timing_mode;
 	struct nand_data_interface data_interface;
 
 	/* Bad block information */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
