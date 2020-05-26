Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA8DC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471F320776
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3FWs12T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471F320776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbEqkWbdsZWa0WWtxnmgGFZF+AUC3NnXXwLWN3yMnbg=; b=a3FWs12TRrbdW2
	4tY2u7WKLaXsTaWZnzD2PJuir6moqKFohJY5ocMhfJtzqTZXBDR7ADdVEQU9l9Mvm3lTYcJuvwjUp
	fwOsd+NPSR6TtX9RPT4NTdxVYtiALU+JUOSJ4q18R/YDYKlS1JXGwr2++BYi6I5ViunMloW+9ep04
	A4CRn3DpoJmXR/2mXgTgyKdlc3w+Wh4KPMavnWn8wvJPoT7n63ZxEqgc0ZkuhqWWcyP5zv3lGH4Q1
	jlza/sYk7Ha4QoNIaM2Yd8nK86jwOu3SOnG/N4kF9nUwUx4wzBXDgz4d+NIM4K9HO/evEXv6qH+rh
	uRKhn5dJPlDl7NzHCRMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdf8s-0007AN-Rb; Tue, 26 May 2020 19:21:38 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf5C-0001UW-F9
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:17:52 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DAAFA240002;
 Tue, 26 May 2020 19:17:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 13/28] mtd: rawnand: timings: Provide
 onfi_fill_data_interface() with a data interface
Date: Tue, 26 May 2020 21:17:10 +0200
Message-Id: <20200526191725.7591-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121750_787453_29D55EDD 
X-CRM114-Status: GOOD (  13.47  )
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

We rely be default on the data interface which is in the nand_chip
structure but it should be possible to fill any other data interface.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/internals.h    | 1 +
 drivers/mtd/nand/raw/nand_base.c    | 7 ++++---
 drivers/mtd/nand/raw/nand_timings.c | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 347d42c55353..dc84e3b55d48 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -85,6 +85,7 @@ int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
 int onfi_fill_data_interface(struct nand_chip *chip,
+			     struct nand_data_interface *iface,
 			     enum nand_data_interface_type type,
 			     int timing_mode);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9b94552fb177..89f10a8c1d62 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -927,7 +927,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 	 * timings to timing mode 0.
 	 */
 
-	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
 	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
 							&chip->data_interface);
 	if (ret)
@@ -1040,7 +1040,8 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
-		ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode);
+		ret = onfi_fill_data_interface(chip, &chip->data_interface,
+					       NAND_SDR_IFACE, mode);
 		if (ret)
 			continue;
 
@@ -5250,7 +5251,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	mutex_init(&chip->lock);
 
 	/* Enforce the right timings for reset/detection */
-	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
 
 	ret = nand_dt_init(chip);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index a73d934e86f9..ce6bb87db2e8 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -276,14 +276,15 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 /**
  * onfi_fill_data_interface - Initialize a data interface from a given ONFI mode
  * @chip: The NAND chip
+ * @iface: The data interface to fill
  * @type: The data interface type
  * @timing_mode: The ONFI timing mode
  */
 int onfi_fill_data_interface(struct nand_chip *chip,
+			     struct nand_data_interface *iface,
 			     enum nand_data_interface_type type,
 			     int timing_mode)
 {
-	struct nand_data_interface *iface = &chip->data_interface;
 	struct onfi_params *onfi = chip->parameters.onfi;
 
 	if (type != NAND_SDR_IFACE)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
