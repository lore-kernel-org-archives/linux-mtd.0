Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AD2C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D4C20776
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCnHxjHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D4C20776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ln7gnGX4CF9pJ/Wa3BPh7DV2H4bsXQTexqUzCYwQe1Y=; b=gCnHxjHT2iVRiO
	SVgk191K8P9w71xblZ6PZYtMZmTWiXORPl2F9rGXjUW791v/2QWRG2HsSR1w39Z2TJqPLh7KJxxgd
	dQRkWn2gFDqjQznjT5N/VZqG14h25blCiOh6eBXhJwAokGFyKFoipj9KrjOUrvU0eHh1twaISFrx4
	KpaSpEqVDZ3iXX6uPBtE2NFtsM5k0zwn3x3cavkazIjMMRNALGs4rBsLXeo3P+XeIwE/YfltAZHQq
	PYsB3v9dWLU1X/cp0H/+J6eP8oQoNvt55gY6a3Q+s0Sy8aacoYACuNkTHMU9henosG4A4WrDYG//l
	ucWv7O2pjogPH4Z5iaeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdHCi-0001Nn-Bj; Mon, 25 May 2020 17:48:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdH7w-0003L2-It
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 17:43:06 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 128F3240002;
 Mon, 25 May 2020 17:43:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Date: Mon, 25 May 2020 19:42:37 +0200
Message-Id: <20200525174239.11349-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525174239.11349-1-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_104304_808226_1A9F7B9D 
X-CRM114-Status: GOOD (  10.93  )
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

This helper is here to simplify the life of NAND manufacturer drivers.

Manufacturers will be allowed to propose their own set of timings and,
if they want, use this helper to:
1/ verify it is supported by the controller,
2/ fallback on a supported default ONFI mode, slower but still faster
   than the default mode 0.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h |  2 ++
 drivers/mtd/nand/raw/nand_base.c | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index ac103d8767be..9af6979257e2 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -89,6 +89,8 @@ int onfi_fill_data_interface(struct nand_chip *chip,
 			     enum nand_data_interface_type type,
 			     int timing_mode);
 unsigned int onfi_find_equivalent_sdr_mode(const struct nand_sdr_timings *vendor_timings);
+int nand_choose_best_vendor_sdr_iface(struct nand_chip * chip,
+				      struct nand_data_interface *best_iface);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 15e10f045c9f..d9fe7795f183 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1078,6 +1078,33 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 	return nand_choose_best_sdr_iface(chip, &chip->data_interface);
 }
 
+/**
+ * nand_choose_best_vendor_sdr_iface - given a set of timings, find the closest
+ *                                     mode/timings set for this interface
+ *                                     supported by both the NAND controller and
+ *                                     the NAND chip
+ * @chip: the NAND chip
+ * @best_iface: the best data interface (can eventually be updated)
+ */
+int nand_choose_best_vendor_sdr_iface(struct nand_chip * chip,
+				      struct nand_data_interface *best_iface)
+{
+	int ret;
+
+	/* Pick the closest mode */
+	best_iface->timings.mode = onfi_find_equivalent_sdr_mode(&best_iface->timings.sdr);
+
+	/* Find the closest supported data interface */
+	ret = nand_choose_best_sdr_iface(chip, best_iface);
+	if (ret)
+		return ret;
+
+	chip->data_interface = *best_iface;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_choose_best_vendor_sdr_iface);
+
 /**
  * nand_fill_column_cycles - fill the column cycles of an address
  * @chip: The NAND chip
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
