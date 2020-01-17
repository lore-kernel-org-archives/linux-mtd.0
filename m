Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C97DC35243
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195652072B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sqmPM3wH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 195652072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqtJUA/Tx7P5PVufnitBa+9Ied2Babczahoyb6S4CC8=; b=sqmPM3wHlW2RQE
	UNfUVkgNcWqbqqj9MtkTPwYgn3neGec2fEjD6UukxaZLqxtuZn6eROHpUR2oEuwFIz0T9LJBqf6+5
	GB47rTYD/JDruDLQQGf4taBc9SlQ3fX1DYys1r10rfnKq1kGOMuNH0TI4syaGWgcZiGoBpLYmYHUc
	fcWwWjCu+TaQrBJrlMOx8SL+cAieSbZFDmgqwOCeAwTepAWvREY8eKHGem7QHqBwl+wLmWQBfMk5o
	9hJt5ahmMC2rgAHlFeVfTSTjskGeMcSxjVfaFj07Yu+cwC+DaYYDYM8SQGktgj78Idc0OW2yoWdAn
	Io7ndzF2Cr8ZQELtkQKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isZOV-0001S3-WC; Fri, 17 Jan 2020 21:43:08 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isZNf-0000iQ-6G
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 21:42:17 +0000
Received: from xps13.lan (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id CEDE5240009;
 Fri, 17 Jan 2020 21:42:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 05/21] mtd: rawnand: Return an enum from
 of_get_nand_ecc_algo()
Date: Fri, 17 Jan 2020 22:41:35 +0100
Message-Id: <20200117214151.20767-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117214151.20767-1-miquel.raynal@bootlin.com>
References: <20200117214151.20767-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_134215_362267_6D37A46A 
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
Cc: Julien Su <juliensu@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mason Yang <masonccyang@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is an enumeration to list ECC algorithm, let's use it instead of
returning an int.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 35 +++++++++++++++++---------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 65fe8d1ef4ff..16b63ec0af05 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4805,17 +4805,20 @@ static const char * const nand_ecc_algos[] = {
 	[NAND_ECC_RS]		= "rs",
 };
 
-static int of_get_nand_ecc_algo(struct device_node *np)
+static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
 {
+	enum nand_ecc_algo ecc_algo;
 	const char *pm;
-	int err, i;
+	int err;
 
 	err = of_property_read_string(np, "nand-ecc-algo", &pm);
 	if (!err) {
-		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
-			if (!strcasecmp(pm, nand_ecc_algos[i]))
-				return i;
-		return -ENODEV;
+		for (ecc_algo = NAND_ECC_HAMMING;
+		     ecc_algo < ARRAY_SIZE(nand_ecc_algos);
+		     ecc_algo++) {
+			if (!strcasecmp(pm, nand_ecc_algos[ecc_algo]))
+				return ecc_algo;
+		}
 	}
 
 	/*
@@ -4823,15 +4826,14 @@ static int of_get_nand_ecc_algo(struct device_node *np)
 	 * for some obsoleted values that were specifying ECC algorithm.
 	 */
 	err = of_property_read_string(np, "nand-ecc-mode", &pm);
-	if (err < 0)
-		return err;
+	if (!err) {
+		if (!strcasecmp(pm, "soft"))
+			return NAND_ECC_HAMMING;
+		else if (!strcasecmp(pm, "soft_bch"))
+			return NAND_ECC_BCH;
+	}
 
-	if (!strcasecmp(pm, "soft"))
-		return NAND_ECC_HAMMING;
-	else if (!strcasecmp(pm, "soft_bch"))
-		return NAND_ECC_BCH;
-
-	return -ENODEV;
+	return NAND_ECC_UNKNOWN;
 }
 
 static int of_get_nand_ecc_step_size(struct device_node *np)
@@ -4876,7 +4878,8 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 static int nand_dt_init(struct nand_chip *chip)
 {
 	struct device_node *dn = nand_get_flash_node(chip);
-	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
+	enum nand_ecc_algo ecc_algo;
+	int ecc_mode, ecc_strength, ecc_step;
 
 	if (!dn)
 		return 0;
@@ -4898,7 +4901,7 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (ecc_mode >= 0)
 		chip->ecc.mode = ecc_mode;
 
-	if (ecc_algo >= 0)
+	if (ecc_algo != NAND_ECC_UNKNOWN)
 		chip->ecc.algo = ecc_algo;
 
 	if (ecc_strength >= 0)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
