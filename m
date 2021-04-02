Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273C2C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:54:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850FD6112F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850FD6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cXtqugeVWKkLvrKS/2Wb+Fo96FhCsdGtmZpFpSvC9io=; b=MgMeMfaGjSB1qznha2p3CZ5c5
	V+zIdhzDgmQmyi6mK5Wku5RLu1twRPidBYXyDydMJbcFgehPn+sW5opz5DDCK951+5vIfDC9+cyWJ
	XMqjUtLvRm2BYIcOZRYCtPWnvWadxzd6qJQTUbgzaiLA/TzVPjPQfPHBi56LwJZrAd3lYxL+f39u5
	hnFAxb2bEbP/TgE+f9Uxt+iE2ebWwD0TPQqxhjr0HvGQYCGFBUbqer4XdjPDrGpXlPvlZ+YtQxrCj
	T/VjcCn6sZCZdaOQII5v3NFqDZ0kJd9Eqi8uAyd77r7MyuEiPAr56EQW1t0GKVBEmf4q6SKpyFQ6T
	znyhSrJqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGVH-00CfRN-2e; Fri, 02 Apr 2021 09:54:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTO-00Cevp-E4
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:17 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 37B141C0002;
 Fri,  2 Apr 2021 09:52:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 06/16] mtd: rawnand: Use more recent ONFI specification
 wording
Date: Fri,  2 Apr 2021 11:51:35 +0200
Message-Id: <20210402095145.254867-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105215_277705_EDF5CF04 
X-CRM114-Status: GOOD (  12.95  )
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

In particular, first ONFI specifications referred to SDR modes as
asynchronous modes, which is not the term we usually have in mind. The
spec has then been updated, so do the same here in the NAND subsystem to
avoid any possible confusion.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 6 +++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h     | 2 +-
 drivers/mtd/nand/raw/nand_base.c               | 2 +-
 drivers/mtd/nand/raw/nand_onfi.c               | 2 +-
 include/linux/mtd/onfi.h                       | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index b46786cd53e0..7eec60ea9056 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2348,9 +2348,9 @@ cadence_nand_setup_interface(struct nand_chip *chip, int chipnr,
 	 * for tRP and tRH timings. If it is NOT possible to sample data
 	 * with optimal tRP/tRH settings, the parameters will be extended.
 	 * If clk_period is 50ns (the lowest value) this condition is met
-	 * for asynchronous timing modes 1, 2, 3, 4 and 5.
-	 * If clk_period is 20ns the condition is met only
-	 * for asynchronous timing mode 5.
+	 * for SDR timing modes 1, 2, 3, 4 and 5.
+	 * If clk_period is 20ns the condition is met only for SDR timing
+	 * mode 5.
 	 */
 	if (sdr->tRC_min <= clk_period &&
 	    sdr->tRP_min <= (clk_period / 2) &&
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index fdc5ed7de083..5e1c3ddae5f8 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -79,7 +79,7 @@ enum gpmi_type {
 struct gpmi_devdata {
 	enum gpmi_type type;
 	int bch_max_ecc_strength;
-	int max_chain_delay; /* See the async EDO mode */
+	int max_chain_delay; /* See the SDR EDO mode */
 	const char * const *clks;
 	const int clks_count;
 };
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a984cda86e2d..a2822b8b3e53 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -894,7 +894,7 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 		/* Fallback to slower modes */
 		best_mode = iface->timings.mode;
 	} else if (chip->parameters.onfi) {
-		best_mode = fls(chip->parameters.onfi->async_timing_mode) - 1;
+		best_mode = fls(chip->parameters.onfi->sdr_timing_modes) - 1;
 	}
 
 	for (mode = best_mode; mode >= 0; mode--) {
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 45649e03797d..02303455c34f 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -315,7 +315,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 	onfi->tBERS = le16_to_cpu(p->t_bers);
 	onfi->tR = le16_to_cpu(p->t_r);
 	onfi->tCCS = le16_to_cpu(p->t_ccs);
-	onfi->async_timing_mode = le16_to_cpu(p->async_timing_mode);
+	onfi->sdr_timing_modes = le16_to_cpu(p->sdr_timing_modes);
 	onfi->vendor_revision = le16_to_cpu(p->vendor_revision);
 	memcpy(onfi->vendor, p->vendor, sizeof(p->vendor));
 	chip->parameters.onfi = onfi;
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index cf14474bc454..2ade5632dc5b 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -93,7 +93,7 @@ struct nand_onfi_params {
 
 	/* electrical parameter block */
 	u8 io_pin_capacitance_max;
-	__le16 async_timing_mode;
+	__le16 sdr_timing_modes;
 	__le16 program_cache_timing_mode;
 	__le16 t_prog;
 	__le16 t_bers;
@@ -160,7 +160,7 @@ struct onfi_ext_param_page {
  * @tBERS: Block erase time
  * @tR: Page read time
  * @tCCS: Change column setup time
- * @async_timing_mode: Supported asynchronous timing mode
+ * @sdr_timing_modes: Supported asynchronous/SDR timing modes
  * @vendor_revision: Vendor specific revision number
  * @vendor: Vendor specific data
  */
@@ -170,7 +170,7 @@ struct onfi_params {
 	u16 tBERS;
 	u16 tR;
 	u16 tCCS;
-	u16 async_timing_mode;
+	u16 sdr_timing_modes;
 	u16 vendor_revision;
 	u8 vendor[88];
 };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
