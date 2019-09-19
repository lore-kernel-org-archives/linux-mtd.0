Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD24C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD1B20578
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofxIJMGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD1B20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86ZVsmGgYuNo0K5YnTTxveajnEuvCq7pkSxsof6YaiI=; b=ofxIJMGLgOrnb2
	DjbDCwlhPeCq4y/ocwOxY4zNZ5Yw9dWwer+xZZWMJOfdMeaDhnb41MABL9FS+tMzGM9YRNHR+CJcE
	KJ5FEgJefjjtMC1Ot17TcueU2lXZ2Hdx5IrPOWQLSdFGdXd4WEmZFsZodHmfo91jBRcm4gR9HSvze
	mah+gyEkkFnqo68NqLY6huGFqE5k66IIA5kd3wl1NZJ7+ZZx+zaRAig80JG7E/lTtJlGeGLqWRahA
	Q/WUyvPkv9CFTGHPRAnqF3gmQTcXVoXx/i8Cpq2yacuAqNwzBAcc919RFnScSr+TcUzmSUgL8FeKj
	xj1++0Sg8+HeyW/cx2Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2DW-0005CH-3Q; Thu, 19 Sep 2019 19:35:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB29j-0001pq-Ds; Thu, 19 Sep 2019 19:31:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EEFDF240004;
 Thu, 19 Sep 2019 19:31:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 03/40] mtd: rawnand: Create a new enumeration to describe
 OOB placement
Date: Thu, 19 Sep 2019 21:31:03 +0200
Message-Id: <20190919193141.7865-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919193141.7865-1-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_123155_646593_98B3F470 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is currently a confusion between the ECC type/mode/provider
(eg. hardware, software, on-die or none) and the in-bad/out-of-band
layout which is only described for hardware engines (OOB first,
syndrome).

Create a new enumeration to describe this placement.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c |  5 +++++
 include/linux/mtd/rawnand.h      | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e6c483ec191a..74e9289e931c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4842,6 +4842,11 @@ static const char * const nand_ecc_modes[] = {
 	[NAND_ECC_ON_DIE]	= "on-die",
 };
 
+static const char * const nand_ecc_engine_oob_placement[] = {
+	[NAND_ECC_SYNDROME_OOB_PLACEMENT] = "hw_syndrome",
+	[NAND_ECC_OOB_FIRST_PLACEMENT] = "hw_oob_first",
+};
+
 static int of_get_nand_ecc_mode(struct device_node *np)
 {
 	const char *pm;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index ccdc0c314acc..89f964816f2c 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -93,6 +93,18 @@ enum nand_ecc_mode {
 	NAND_ECC_ON_DIE,
 };
 
+/**
+ * enum nand_ecc_engine_oob_placement - NAND ECC engine OOB placement
+ * @NAND_ECC_DEFAULT_OOB_PLACEMENT: Standard layout, or not specified
+ * @NAND_ECC_SYNDROME_OOB_PLACEMENT: Syndrome layout (interlaced)
+ * @NAND_ECC_OOB_FIRST_PLACEMENT: Free OOB bytes first
+ */
+enum nand_ecc_engine_oob_placement {
+	NAND_ECC_DEFAULT_OOB_PLACEMENT,
+	NAND_ECC_SYNDROME_OOB_PLACEMENT,
+	NAND_ECC_OOB_FIRST_PLACEMENT,
+};
+
 enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
 	NAND_ECC_HAMMING,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
