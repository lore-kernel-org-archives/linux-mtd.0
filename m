Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261EC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:48:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9036861164
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9036861164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=85hb8o0yzreaD2U/240L/wK3fjsV5juCsH8euv8CBs0=; b=JJcQY++uxr3XNo7lroW1mncE0
	z21EYm6JgZw4xODsvUEW0UG20A3V+rj0bVJiKnp7Qs6pXXoDTo3hOXndTNgOvl4x8mGZnCkoFLF3d
	Me1GJN5ypVsUnzf9fj/mJS8rKnkpvx6ToZq2nHDVewAi1PM8CbKb7RxJElhLrWWLxbm6ZzIfkeBSh
	QbXct/wwnTgMMk8vKJzAHKKKUVSAR1Phj3ZlzJi35ROk5iUEV6I2tfMSk7Zyfw38dcNDgt8bVQiEY
	BZsCCte8+JEQ0vRPj8hQBjuii65XNZ/SHpFD4jz4tAP9q04mvnlr0kRyOwsGDak/SNjTgbw7gB7cG
	w0wUrV0Bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePMP-002QSv-AO; Wed, 05 May 2021 21:47:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDa-002Onp-LW
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=zYU7Li2KdHqY4iwbvCT6pIoPfWWi/Gt7E9xgXhja2dI=; b=mNQ0IXgvMqVZ1A+Ng6foBJHSBL
 CTltzgChqjP+3vB1wamtnxsapAWw2pkr2dPyPjKb1zauUUEmw5woU/XhOEB620ekruc/m1A7/3WO9
 YiJqiNddXjqmcs/k30rEfT/Z/EUB8waSOvJrAUfSH6SOdDYKWDNDES8RnfG8F1bmDcbUAKmfAPBR6
 cV/mC/acvyQJHTuaemb19pcSY7KB2lFp7raQxzSfSOZNCgmmlfvJsIrdCiAUa933gdsEhLPYy92It
 FCi7m9w1AyAUvOOnH9IiML5LQX6UrqDfnw6R0DzagTTkbS2/jTPb7scJBZdZBQrc7PeT3MxFC9heU
 KthODDzQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDY-005If3-1X
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:05 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D76531BF207;
 Wed,  5 May 2021 21:38:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 10/22] mtd: rawnand: Add an indirection on
 onfi_fill_interface_config()
Date: Wed,  5 May 2021 23:37:38 +0200
Message-Id: <20210505213750.257417-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143804_242084_690FD0ED 
X-CRM114-Status: GOOD (  12.57  )
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
