Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFF4C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573BF20721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXoEqSh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573BF20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sllyr/bod9AMHyogr/3Bg7o9rNhdH+6GquNqGOiYfyk=; b=HXoEqSh0fFkvkf
	zp0YfkcpfilgqLOkqwImfbIlvQIG9Mw25uEWH953D9LanS0uRhmMwTVdJNpIBKZTkysSGiAYsi5bN
	hRIx2YUMt/e7s6nFTkZRlhAFu38fQuJRYCMcXrRy2/bWwVxWErodsgbRRLH/35lb1oqprUkVbvib/
	jVwNV0e0m3hYcHFSsAbskW4Y2z0klGkYcO1QU9zZCFIeoxfBUdASBgoV/MBVs7koPtzhp87Iqc4Vh
	EqwwJqimpw1sBemYmyMO26XHc5xDEzMcdxoCX85nt9DWR2T9/vSymH2VNKQSmeSr4n3S0jSTaM+W6
	zfauBJsqYrE9AcQdeT4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRq4-0004VB-0j; Thu, 28 May 2020 23:21:28 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRlQ-0006KE-15
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:16:42 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 792FE240002;
 Thu, 28 May 2020 23:16:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 18/30] mtd: rawnand: timings: Make
 onfi_fill_interface_config() a void helper
Date: Fri, 29 May 2020 01:16:00 +0200
Message-Id: <20200528231612.8958-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161640_572159_6C6D1695 
X-CRM114-Status: GOOD (  13.62  )
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

Warn the user if the parameters are wrong but basically it would mean
there is a serious issue in the NAND core. So no need to ever check
its output, let's make this helper return void.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h    |  8 ++++----
 drivers/mtd/nand/raw/nand_base.c    |  6 ++----
 drivers/mtd/nand/raw/nand_timings.c | 19 +++++++++----------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 93386bdfbad6..11415b054d2e 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -84,10 +84,10 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
-int onfi_fill_interface_config(struct nand_chip *chip,
-			       struct nand_interface_config *iface,
-			       enum nand_interface_type type,
-			       int timing_mode);
+void onfi_fill_interface_config(struct nand_chip *chip,
+				struct nand_interface_config *iface,
+				enum nand_interface_type type,
+				int timing_mode);
 unsigned int
 onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index de596c06c9c2..07a7d918b462 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1041,10 +1041,8 @@ static int nand_choose_interface(struct nand_chip *chip)
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
-		ret = onfi_fill_interface_config(chip, &chip->interface_config,
-						 NAND_SDR_IFACE, mode);
-		if (ret)
-			continue;
+		onfi_fill_interface_config(chip, &chip->interface_config,
+					   NAND_SDR_IFACE, mode);
 
 		/*
 		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 997a1dd929de..6c12cd52323d 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -347,18 +347,19 @@ onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
  * @type: The interface type
  * @timing_mode: The ONFI timing mode
  */
-int onfi_fill_interface_config(struct nand_chip *chip,
-			       struct nand_interface_config *iface,
-			       enum nand_interface_type type,
-			       int timing_mode)
+void onfi_fill_interface_config(struct nand_chip *chip,
+				struct nand_interface_config *iface,
+				enum nand_interface_type type,
+				int timing_mode)
 {
 	struct onfi_params *onfi = chip->parameters.onfi;
 
-	if (type != NAND_SDR_IFACE)
-		return -EINVAL;
+	if (WARN_ON(type != NAND_SDR_IFACE))
+		return;
 
-	if (timing_mode < 0 || timing_mode >= ARRAY_SIZE(onfi_sdr_timings))
-		return -EINVAL;
+	if (WARN_ON(timing_mode < 0 ||
+		    timing_mode >= ARRAY_SIZE(onfi_sdr_timings)))
+		return;
 
 	*iface = onfi_sdr_timings[timing_mode];
 
@@ -378,6 +379,4 @@ int onfi_fill_interface_config(struct nand_chip *chip,
 		/* nanoseconds -> picoseconds */
 		timings->tCCS_min = 1000UL * onfi->tCCS;
 	}
-
-	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
