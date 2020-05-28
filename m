Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F71C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:24:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5573420721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jhXzMyn0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5573420721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfJ4TLyclobn1KGDGng7SOO43MFlsmmuI+25Q7i/kr0=; b=jhXzMyn02p6Zyz
	+2Mtsk4wqpD6boDaLct3+43comEWB/0EU4+bF9COqPVNUaFY9QEwpIizfzsTaG+rEcsr4Ixd00BL3
	z3HvwTFR9hOvXL03Cac8IRT9JCF8eTnv81OTOLTh2bJLBk7pDVnTWUWBf6Y2WGPqXZAfGKabUh1oa
	GwU/Uh3HMYfjUt6eV9ReKqnMJkH0Ywzd5++dIjWmaVFLfHNis+T+ykpPuuoea+ukNkRO2v2qiGeZG
	GyQmlB+MXOurpOXpfYGL3I3HVhO4isv5LpmAuyGvHz492qyKmBHu21t2cERBFECRJdWbIXcGIUaAH
	qn5vQfODvpOjymdhDjzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRt7-0007TK-KR; Thu, 28 May 2020 23:24:37 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRlb-0006UV-Tv
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:16:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5C586240004;
 Thu, 28 May 2020 23:16:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 29/30] mtd: rawnand: Get rid of the default ONFI timing mode
Date: Fri, 29 May 2020 01:16:11 +0200
Message-Id: <20200528231612.8958-30-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161652_471283_71879714 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ->choose_interface() hook is here for manufacturer drivers to
provide a better timing interface than the default one, this field is
not needed anymore.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 19 ++++---------------
 include/linux/mtd/rawnand.h      |  9 ---------
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 132feee3ba13..2f913ce8328f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1010,10 +1010,8 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
  * @iface: the interface configuration (can eventually be updated)
  * @spec_timings: specific timings, when not fitting the ONFI specification
  *
- * If specific timings are provided, use them. Otherwise, try to retrieve
- * supported timing modes from ONFI information. Finally, if the NAND chip does
- * not follow the ONFI specification, rely on the ->default_timing_mode
- * specified in the nand_ids table.
+ * If specific timings are provided, use them. Otherwise, retrieve supported
+ * timing modes from ONFI information.
  */
 int nand_choose_best_sdr_timings(struct nand_chip *chip,
 				 struct nand_interface_config *iface,
@@ -1036,15 +1034,8 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 
 		/* Fallback to slower modes */
 		best_mode = iface->timings.mode;
-	} else {
-		if (chip->parameters.onfi) {
-			unsigned int onfi_modes;
-
-			onfi_modes = chip->parameters.onfi->async_timing_mode;
-			best_mode = fls(onfi_modes) - 1;
-		} else {
-			best_mode = chip->onfi_timing_mode_default;
-		}
+	} else if (chip->parameters.onfi) {
+		best_mode = fls(chip->parameters.onfi->async_timing_mode) - 1;
 	}
 
 	for (mode = best_mode; mode >= 0; mode--) {
@@ -4763,8 +4754,6 @@ static bool find_full_id_nand(struct nand_chip *chip,
 		chip->options |= type->options;
 		chip->base.eccreq.strength = NAND_ECC_STRENGTH(type);
 		chip->base.eccreq.step_size = NAND_ECC_STEP(type);
-		chip->onfi_timing_mode_default =
-					type->onfi_timing_mode_default;
 
 		chip->parameters.model = kstrdup(type->name, GFP_KERNEL);
 		if (!chip->parameters.model)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index ce4a525517a6..7b7db2d91a9a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1069,9 +1069,6 @@ struct nand_manufacturer {
  * @options: Various chip options. They can partly be set to inform nand_scan
  *           about special functionality. See the defines for further
  *           explanation.
- * @onfi_timing_mode_default: Default ONFI timing mode. This field is set to the
- *			      actually used ONFI mode if the chip is ONFI
- *			      compliant or deduced from the datasheet otherwise
  * @interface_config: NAND interface timing information
  * @bbt_erase_shift: Number of address bits in a bbt entry
  * @bbt_options: Bad block table specific options. All options used here must
@@ -1119,7 +1116,6 @@ struct nand_chip {
 	unsigned int options;
 
 	/* Data interface */
-	int onfi_timing_mode_default;
 	struct nand_interface_config interface_config;
 
 	/* Bad block information */
@@ -1271,10 +1267,6 @@ nand_get_interface_config(struct nand_chip *chip)
  *               @ecc_step_ds in nand_chip{}, also from the datasheet.
  *               For example, the "4bit ECC for each 512Byte" can be set with
  *               NAND_ECC_INFO(4, 512).
- * @onfi_timing_mode_default: the default ONFI timing mode entered after a NAND
- *			      reset. Should be deduced from timings described
- *			      in the datasheet.
- *
  */
 struct nand_flash_dev {
 	char *name;
@@ -1295,7 +1287,6 @@ struct nand_flash_dev {
 		uint16_t strength_ds;
 		uint16_t step_ds;
 	} ecc;
-	int onfi_timing_mode_default;
 };
 
 int nand_create_bbt(struct nand_chip *chip);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
