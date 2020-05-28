Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F24C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:21:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E41120721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEieSgSL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E41120721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rf34dEtxAdnroEKO0wVENK6EmE4x7WFeKMqzoGmN+Nw=; b=TEieSgSLn6md4q
	AZX7GNh9GEbPl3ZZBboFCU8CJEJQumSi2MYaTe5On9RU1L9VLdIdEbx5HQdkbsZVhO77TTvOJOUIC
	g0Zfz3dKHmLtM96G394mC45NJJ36XAXrusWhYpM7/CFfpc+Oab4272ZN7OtWnCXi/OUMEfVhtMtcg
	zmdwrPKnTULIVSRFYRaN3+bm+KaRuUP1Gkw1VdFv5BoamrUlfsUaSLjHAj3tPYNnRpo/HpnATqgqs
	gosKRaWew6PWdpo3d4EQO7oCsTkuqbWM2sJlC5AXrG+rp2/YfqhiZ473wsrLzc+97YztlfTfURu4v
	oep+WE2cfCzgh4h7oH6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRpo-0004Gh-R9; Thu, 28 May 2020 23:21:12 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRlQ-0006LW-If
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:16:45 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 911E5240009;
 Thu, 28 May 2020 23:16:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 19/30] mtd: rawnand: Define a unique reset interface
 configuration
Date: Fri, 29 May 2020 01:16:01 +0200
Message-Id: <20200528231612.8958-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161640_902874_8462C50A 
X-CRM114-Status: GOOD (  12.14  )
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

All NAND chips will always use the same interface configuration for
reset and at startup: SDR mode 0. Instead of copying around the
interface configuration, let's just define a helper to retrieve the
reset interface configuration object.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c    | 10 +++-------
 drivers/mtd/nand/raw/nand_timings.c |  6 ++++++
 include/linux/mtd/rawnand.h         |  3 +++
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 07a7d918b462..4a72ec221262 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -928,9 +928,7 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
 	 * timings to timing mode 0.
 	 */
 
-	onfi_fill_interface_config(chip, &chip->interface_config,
-				   NAND_SDR_IFACE, 0);
-	ret = ops->setup_interface(chip, chipnr, &chip->interface_config);
+	ret = ops->setup_interface(chip, chipnr, nand_get_reset_interface());
 	if (ret)
 		pr_err("Failed to configure data interface to SDR timing mode 0\n");
 
@@ -2483,7 +2481,6 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
  */
 int nand_reset(struct nand_chip *chip, int chipnr)
 {
-	struct nand_interface_config saved_intf_config = chip->interface_config;
 	int ret;
 
 	ret = nand_reset_interface(chip, chipnr);
@@ -2508,11 +2505,10 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	 * nand_setup_interface() uses ->set/get_features() which would
 	 * fail anyway as the parameter page is not available yet.
 	 */
-	if (!memcmp(&chip->interface_config, &saved_intf_config,
-		    sizeof(saved_intf_config)))
+	if (!memcmp(&chip->interface_config, nand_get_reset_interface(),
+		    sizeof(chip->interface_config)))
 		return 0;
 
-	chip->interface_config = saved_intf_config;
 	ret = nand_setup_interface(chip, chipnr);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 6c12cd52323d..0089196b9e36 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -292,6 +292,12 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 	},
 };
 
+/* All NAND chips share the same reset data interface: SDR mode 0 */
+const struct nand_interface_config *nand_get_reset_interface(void)
+{
+	return &onfi_sdr_timings[0];
+}
+
 /**
  * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
  *                              set of timings
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index c2fcac38bcc2..b37eb5ee11c8 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1202,6 +1202,9 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
 	return mtd_get_of_node(nand_to_mtd(chip));
 }
 
+/* Default/reset data interface */
+const struct nand_interface_config *nand_get_reset_interface(void);
+
 /*
  * A helper for defining older NAND chips where the second ID byte fully
  * defined the chip, including the geometry (chip size, eraseblock size, page
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
