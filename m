Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67C9C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:06:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4875E610CF
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4875E610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AK1a/HO/56kv85ClprXsIbJFY0f0psu0P70N9vGY5/g=; b=cAMyo50/F5FwwmNUKTslSbY6Y
	l8kPDxV1hdaDY2HfKg6Oo4sJ/N98zWYaZM+qPOQx5CTS9Syolu5y4idxWP0yv5/bDVlcK/hBBjvQn
	mNyxMlv8dVE8qQn6/atB5wO5DOrlnprSyemInNRyHGP8hX6WDRTxVlC+h8CQXCsVzNv2QUOBmyTuq
	JgfU+fpUgeQ9+HxDDB4jAc7+VY6fCX1qpt1pJDnl4nUBGhXixLyQh2El1gP3wnbnbdcDDlB7o8h/s
	NkGdMCzKcg2TTitbDoSS6jAmqW8DLQWcxEaldib7FBgFtVCNrsKzpIdjxWG/hOYIT+TNTmEXU/UoG
	wPLcEzEMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGgS-00Ch5E-Vf; Fri, 02 Apr 2021 10:05:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTv-00Cf4a-UL
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B32E41C0007;
 Fri,  2 Apr 2021 09:52:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 15/16] mtd: rawnand: Choose the best timings,
 NV-DDR included
Date: Fri,  2 Apr 2021 11:51:44 +0200
Message-Id: <20210402095145.254867-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105248_251067_FD45960C 
X-CRM114-Status: GOOD (  22.46  )
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

Now that the necessary peaces to support the NV-DDR interface type have
been contributed, let's add the relevant logic to make use of it. In
particular, the core does not choose the best SDR timings anymore but
calls a more generic helper instead.

This helper of course checks if NV-DDR is supported. If they are not,
then it fallback to SDR. Otherwise, it tries to find the best NV-DDR
supported mode, with a logic very close to what is being done on the
SDR side.

One singularity however: it looks like NV-DDR mode 0 is slower than SDR
mode 5. In the case we would be stuck at NV-DDR mode 0, let's try if SDR
mode 5 is supported. If yes, then we fallback to this mode, otherwise we
keep the original NV-DDR one.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h |  3 +
 drivers/mtd/nand/raw/nand_base.c | 95 +++++++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index c06bc2f1aaa2..7016e0f38398 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -95,6 +95,9 @@ onfi_find_closest_nvddr_mode(const struct nand_nvddr_timings *spec_timings);
 int nand_choose_best_sdr_timings(struct nand_chip *chip,
 				 struct nand_interface_config *iface,
 				 struct nand_sdr_timings *spec_timings);
+int nand_choose_best_nvddr_timings(struct nand_chip *chip,
+				   struct nand_interface_config *iface,
+				   struct nand_nvddr_timings *spec_timings);
 const struct nand_interface_config *nand_get_reset_interface_config(void);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e43ea20d7483..695d1db17ebd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -911,6 +911,99 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 	return 0;
 }
 
+/**
+ * nand_choose_best_nvddr_timings - Pick up the best NVDDR timings that both the
+ *                                  NAND controller and the NAND chip support
+ * @chip: the NAND chip
+ * @iface: the interface configuration (can eventually be updated)
+ * @spec_timings: specific timings, when not fitting the ONFI specification
+ *
+ * If specific timings are provided, use them. Otherwise, retrieve supported
+ * timing modes from ONFI information.
+ */
+int nand_choose_best_nvddr_timings(struct nand_chip *chip,
+				   struct nand_interface_config *iface,
+				   struct nand_nvddr_timings *spec_timings)
+{
+	const struct nand_controller_ops *ops = chip->controller->ops;
+	int best_mode = 0, mode, ret;
+
+	iface->type = NAND_NVDDR_IFACE;
+
+	if (spec_timings) {
+		iface->timings.nvddr = *spec_timings;
+		iface->timings.mode = onfi_find_closest_nvddr_mode(spec_timings);
+
+		/* Verify the controller supports the requested interface */
+		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
+					   iface);
+		if (!ret) {
+			chip->best_interface_config = iface;
+			return ret;
+		}
+
+		/* Fallback to slower modes */
+		best_mode = iface->timings.mode;
+	} else if (chip->parameters.onfi) {
+		best_mode = fls(chip->parameters.onfi->nvddr_timing_modes) - 1;
+	}
+
+	for (mode = best_mode; mode >= 0; mode--) {
+		onfi_fill_interface_config(chip, iface, NAND_NVDDR_IFACE, mode);
+
+		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
+					   iface);
+		if (!ret)
+			break;
+	}
+
+	chip->best_interface_config = iface;
+
+	return 0;
+}
+
+/**
+ * nand_choose_best_timings - Pick up the best NVDDR or SDR timings that both
+ *                            NAND controller and the NAND chip support
+ * @chip: the NAND chip
+ * @iface: the interface configuration (can eventually be updated)
+ *
+ * If specific timings are provided, use them. Otherwise, retrieve supported
+ * timing modes from ONFI information.
+ */
+static int nand_choose_best_timings(struct nand_chip *chip,
+				    struct nand_interface_config *iface)
+{
+	bool valid_nvddr_timings = false;
+	unsigned int best_sdr_mode;
+	int ret;
+
+	/* Try the fastest timings: NV-DDR */
+	ret = nand_choose_best_nvddr_timings(chip, iface, NULL);
+	if (!ret) {
+		if (chip->best_interface_config->timings.mode != 0)
+			return 0;
+
+		/*
+		 * ONFI SDR mode 5 is faster than ONFI NV-DDR mode 0, so check
+		 * if is supported before acking NV-DDR mode 0.
+		 */
+		valid_nvddr_timings = true;
+	}
+
+	/* Fallback to SDR timings */
+	ret = nand_choose_best_sdr_timings(chip, iface, NULL);
+	if (ret)
+		return ret;
+
+	best_sdr_mode = chip->best_interface_config->timings.mode;
+	if (!valid_nvddr_timings || best_sdr_mode == 5)
+		return 0;
+
+	/* Eventually go back to faster NV-DDR mode 0 */
+	return nand_choose_best_nvddr_timings(chip, iface, NULL);
+}
+
 /**
  * nand_choose_interface_config - find the best data interface and timings
  * @chip: The NAND chip
@@ -939,7 +1032,7 @@ static int nand_choose_interface_config(struct nand_chip *chip)
 	if (chip->ops.choose_interface_config)
 		ret = chip->ops.choose_interface_config(chip, iface);
 	else
-		ret = nand_choose_best_sdr_timings(chip, iface, NULL);
+		ret = nand_choose_best_timings(chip, iface);
 
 	if (ret)
 		kfree(iface);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
