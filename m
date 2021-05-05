Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE7CC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:39:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A284613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A284613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+l2z6BshRAJLRyPZv10ItIc4bJP7O9qRwzkVDablfVA=; b=gxJQ3d4xyAVMEB6TzeejzvgiP
	CDmEJSA5KAmY3o+L7tW15AVYhg1h4K2cPgAlPTk9pMTUCUjqNFAg1IkPHiBxj7Ri1cI6tyd9G0nCg
	UvSJVYD41FuVFA7twGxsee0tzhTBz6t3eqc4bXvKS2MS2J/2ymT5ktlYb/GYfGRaWSKkTs4PLLYYV
	fYZz70+GGSbK/YSc7tvJncyBZHUNdiT4dbyMmI+RsHs9gxceKIXW95LLwk0rrAUNImfMNQT+mbA0g
	eVS0ZlKvtpwCv1huePZHi4rj3SHiPdW/Wl+BZtlPr703qYWjc/7DCa+7+S1/iRF578fj430pjmWww
	iiMG5n5zQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePEb-002Ozd-Fr; Wed, 05 May 2021 21:39:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDY-002OmA-BS
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=7DaBd+wzw6DtVvAVRbKib0Fa06GmxV/9NB2x51FA4+0=; b=2hpUnp7KfoY41WYCY4rW0fFQlP
 3NZM7wzgujLHtyAEHw3HGrB0vjPXoAYybXyXXlYAiQz2qaafjeztFWFLu60m2JrzJ6fWNoFHZvKoR
 TqgaYMSIi5RqvAKTYEruAEvn0dc/9IqjD1YDh8HcJnc9dcJfQe9rRnhF6G3JidLeEPDRDoMBd9gsa
 eoDnBEhW8ZKNYroTd3bGj1KWHU+X37gQyeB3lqXWK4vbkofqaVns489F5z0DXs1KSIydaJliLvfP9
 6wc3txT8uk1osDipaIn+l2e9WV6YN6otExGXX72zCBSMi8wvPfsbhqrkXgzT5iFC5Fsou898J4e7s
 9yH7jXXQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDU-005Icu-4I
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:03 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CB7341BF20A;
 Wed,  5 May 2021 21:37:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 06/22] mtd: rawnand: Use more recent ONFI specification wording
Date: Wed,  5 May 2021 23:37:34 +0200
Message-Id: <20210505213750.257417-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143800_485283_8D8E176A 
X-CRM114-Status: GOOD (  13.09  )
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
index fb072c444495..366327ceefd9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -935,7 +935,7 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
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
