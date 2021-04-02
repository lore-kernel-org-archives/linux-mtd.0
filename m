Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7528C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:58:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6381A60FEE
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6381A60FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=85hb8o0yzreaD2U/240L/wK3fjsV5juCsH8euv8CBs0=; b=XShUoZfK+qQCrWYcLCV2l52ee
	lxh03fnlYKn3lH9aOS1YJtBCn8Fc9n2ct4+LZek+6rO8NNeSYgFQG9r6CtJZFpcdV5kukUGAWO13O
	5S5fxTtoi+Mw0PPGSUITX+IH93gQIy79d9paurd2q9RsOwrbgZ69eQ+NVZGDPFaC5SSJ5CYc0Kukv
	tV6CMFMvGQ8KMk551oVifC8Kjqxf4fCwicQ/p/S01sY2yrEEB4Uv99nEOBiKbfAHfXR2PfFHXHp8G
	G8x+ANiyx6SgBkaZiEDNmQh3OWjdOvA+BFnkikU7Drn+uUawAUYUlwvVYUT7SFNP8gU/HqXVuiwTa
	E3WPpBngg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGZ7-00Cg5s-Uz; Fri, 02 Apr 2021 09:58:10 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTb-00Ceyo-7q
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:29 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BC93B1C0004;
 Fri,  2 Apr 2021 09:52:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 10/16] mtd: rawnand: Add an indirection on
 onfi_fill_interface_config()
Date: Fri,  2 Apr 2021 11:51:39 +0200
Message-Id: <20210402095145.254867-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105227_509484_B4300C59 
X-CRM114-Status: GOOD (  12.33  )
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

This helper actually fills the interface configuration with SDR data.
As part of the work to bring NV-DDR support, let's rename this helper
onfi_fill_sdr_interface_config() and add a generic indirection to it.

There are no functional changes here, but this will simplify a next
change which adds onfi_fill_nvddr_interface_config() support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_timings.c | 32 ++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 481b56d5f60d..fb483e696cb9 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -601,23 +601,18 @@ onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
 }
 
 /**
- * onfi_fill_interface_config - Initialize an interface config from a given
- *                              ONFI mode
+ * onfi_fill_sdr_interface_config - Initialize a SDR interface config from a
+ *                                  given ONFI mode
  * @chip: The NAND chip
  * @iface: The interface configuration to fill
- * @type: The interface type
  * @timing_mode: The ONFI timing mode
  */
-void onfi_fill_interface_config(struct nand_chip *chip,
-				struct nand_interface_config *iface,
-				enum nand_interface_type type,
-				unsigned int timing_mode)
+static void onfi_fill_sdr_interface_config(struct nand_chip *chip,
+					   struct nand_interface_config *iface,
+					   unsigned int timing_mode)
 {
 	struct onfi_params *onfi = chip->parameters.onfi;
 
-	if (WARN_ON(type != NAND_SDR_IFACE))
-		return;
-
 	if (WARN_ON(timing_mode >= ARRAY_SIZE(onfi_sdr_timings)))
 		return;
 
@@ -640,3 +635,20 @@ void onfi_fill_interface_config(struct nand_chip *chip,
 		timings->tCCS_min = 1000UL * onfi->tCCS;
 	}
 }
+
+/**
+ * onfi_fill_interface_config - Initialize an interface config from a given
+ *                              ONFI mode
+ * @chip: The NAND chip
+ * @iface: The interface configuration to fill
+ * @type: The interface type
+ * @timing_mode: The ONFI timing mode
+ */
+void onfi_fill_interface_config(struct nand_chip *chip,
+				struct nand_interface_config *iface,
+				enum nand_interface_type type,
+				unsigned int timing_mode)
+{
+	if (type == NAND_SDR_IFACE)
+		return onfi_fill_sdr_interface_config(chip, iface, timing_mode);
+}
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
