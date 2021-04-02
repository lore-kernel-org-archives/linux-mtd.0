Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440A1C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:00:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C6661107
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C6661107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g0UAs8eU8EP3QR1r68qxt8moUsSJSj++ftJDGLvUqx0=; b=AaBUompmQIF0xcBcCfnJNO4Ln
	NRj97V7yk+OJ5bxmxAcYza0/O0tK1CqWl43MGr3r8Y0erOrgXYWBelxu+3sb+Q+EBZit9Bz/QbAEy
	y8+y4Wn7jdOqRs9FzfWXDDEZDfkvwZ7d+dExuFla05DE2YZS6HqKY0IocBvwn5Vj5ua6yIu46Cbo0
	8Iqh2gvDWTlHtGTAEZIuu6QG4zVU9Q/I/pqswM4MypNYh+2TlG91LtaKyrYO0rFBdt8da/tfEVb8o
	fkQD/4ND6zPg7NxTYtSSQhtnTXQ4w042aH3rX36YZ3ycguwZbShhSNuZcYDpFXGyFyrZvKpb3iCxW
	YE/uHlevQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGaK-00CgEz-3p; Fri, 02 Apr 2021 09:59:24 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTf-00Cezl-Ah
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:34 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 993541C000F;
 Fri,  2 Apr 2021 09:52:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 11/16] mtd: rawnand: Add
 onfi_fill_nvddr_interface_config() helper
Date: Fri,  2 Apr 2021 11:51:40 +0200
Message-Id: <20210402095145.254867-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105231_775757_C99F5145 
X-CRM114-Status: GOOD (  15.91  )
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

Same logic as for the SDR path, let's create a
onfi_fill_nvddr_interface_config() helper to fill an interface
configuration structure with NV-DDR timings, given a specific ONFI mode.

There is one additional thing to do compared to SDR mode: tCAD timing
can be fast or slow and this depends on an ONFI parameter page bit. By
default the slow value is declared in the timings structure definition,
but this helper can shrink it down if necessary.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_onfi.c    |  1 +
 drivers/mtd/nand/raw/nand_timings.c | 41 +++++++++++++++++++++++++++++
 include/linux/mtd/onfi.h            |  2 ++
 3 files changed, 44 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index f7a4a0573fe7..8e4677f2ba76 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -315,6 +315,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 	onfi->tBERS = le16_to_cpu(p->t_bers);
 	onfi->tR = le16_to_cpu(p->t_r);
 	onfi->tCCS = le16_to_cpu(p->t_ccs);
+	onfi->fast_tCAD = p->nvddr_nvddr2_features & BIT(0);
 	onfi->sdr_timing_modes = le16_to_cpu(p->sdr_timing_modes);
 	if (p->features & ONFI_FEATURE_NV_DDR)
 		onfi->nvddr_timing_modes = p->nvddr_timing_modes;
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index fb483e696cb9..8eaa132c3900 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -636,6 +636,45 @@ static void onfi_fill_sdr_interface_config(struct nand_chip *chip,
 	}
 }
 
+/**
+ * onfi_fill_nvddr_interface_config - Initialize a NVDDR interface config from a
+ *                                    given ONFI mode
+ * @chip: The NAND chip
+ * @iface: The interface configuration to fill
+ * @timing_mode: The ONFI timing mode
+ */
+static void onfi_fill_nvddr_interface_config(struct nand_chip *chip,
+					     struct nand_interface_config *iface,
+					     unsigned int timing_mode)
+{
+	struct onfi_params *onfi = chip->parameters.onfi;
+
+	if (WARN_ON(timing_mode >= ARRAY_SIZE(onfi_nvddr_timings)))
+		return;
+
+	*iface = onfi_nvddr_timings[timing_mode];
+
+	/*
+	 * Initialize timings that cannot be deduced from timing mode:
+	 * tPROG, tBERS, tR, tCCS and tCAD.
+	 * These information are part of the ONFI parameter page.
+	 */
+	if (onfi) {
+		struct nand_nvddr_timings *timings = &iface->timings.nvddr;
+
+		/* microseconds -> picoseconds */
+		timings->tPROG_max = 1000000ULL * onfi->tPROG;
+		timings->tBERS_max = 1000000ULL * onfi->tBERS;
+		timings->tR_max = 1000000ULL * onfi->tR;
+
+		/* nanoseconds -> picoseconds */
+		timings->tCCS_min = 1000UL * onfi->tCCS;
+
+		if (onfi->fast_tCAD)
+			timings->tCAD_min = 25000;
+	}
+}
+
 /**
  * onfi_fill_interface_config - Initialize an interface config from a given
  *                              ONFI mode
@@ -651,4 +690,6 @@ void onfi_fill_interface_config(struct nand_chip *chip,
 {
 	if (type == NAND_SDR_IFACE)
 		return onfi_fill_sdr_interface_config(chip, iface, timing_mode);
+	else
+		return onfi_fill_nvddr_interface_config(chip, iface, timing_mode);
 }
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index 14e66a49557e..a9677bf1e47e 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -162,6 +162,7 @@ struct onfi_ext_param_page {
  * @tBERS: Block erase time
  * @tR: Page read time
  * @tCCS: Change column setup time
+ * @fast_tCAD: Command/Address/Data slow or fast delay (NV-DDR only)
  * @sdr_timing_modes: Supported asynchronous/SDR timing modes
  * @nvddr_timing_modes: Supported source synchronous/NV-DDR timing modes
  * @vendor_revision: Vendor specific revision number
@@ -173,6 +174,7 @@ struct onfi_params {
 	u16 tBERS;
 	u16 tR;
 	u16 tCCS;
+	bool fast_tCAD;
 	u16 sdr_timing_modes;
 	u16 nvddr_timing_modes;
 	u16 vendor_revision;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
