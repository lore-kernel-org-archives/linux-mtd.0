Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E222C282D7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1762084A
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDkvH+23";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="yR5u+quP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1762084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w/pSm9laZK9uafagwevX3EQaEDrK4//pb3FcFCFGGKc=; b=QDkvH+23sBKmX42iicgLq0DmGr
	ijd8QcD3/4/C6qT+LQ1ec+yodfZeBWzvk3CmycWY67EnnjKevT/DU2X2AkD5sTWNMpJ393TPdR3vh
	s4D8CMdhb1UxD6ErZRSzPlO5FU85r6aW8e9oyL+jr8aFUQziv0CROEu1s72eAVa3OLTvqlUjuV7So
	Hnx/3ediTiRHYyQm59Em7azLtp0ZK2G9g3a9ul/+mQ6VlMaeLCdyOsUKUW6T8/dOPYZH4x412GP+W
	GeqTlhP3oxC4cOURbvstt1jzUb8qPgOJ1qFRossuLlIMZRE0GVQ0IzjJKNC3D53AHfyKIkDbrPbnu
	cgtSBDUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gq4b0-0000JD-4C; Sat, 02 Feb 2019 23:21:10 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gq4a3-0007Aw-Lk
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2019 23:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549149609; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=vVN5VtadRVOJSLQl/c/1jRVzXuFZu0B1bzeIau0Tvdw=;
 b=yR5u+quPqVo06NiV7bOYHcvs2r1r/zdVFBZTsf7SYSQ0ndCXbLWQqpKlNpb+irZvnHplAb
 m7meO7ch8WzXtxUXXvHWEpXVsoIFVcdkSwAnETXgb5onXheo2yP3ZZ5B1dWYAEFtjr1Xuh
 RYv13uFNEFVn5PC+owvkOLigPkuVQJ4=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v2 5/9] mtd: rawnand: jz4780: Add ooblayout for the JZ4725B
Date: Sat,  2 Feb 2019 20:19:22 -0300
Message-Id: <20190202231926.2444-6-paul@crapouillou.net>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_152012_419270_0924D709 
X-CRM114-Status: GOOD (  16.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mathieu Malaterre <malat@debian.org>, devicetree@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
NAND.

Add an optional "ingenic,oob-layout" device property. When set to
"ingenic,jz4725b", this specific OOB layout is used.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: Instead of forcing the OOB layout, leave it to the board code or
    devicetree to decide if the jz4725b-specific layout should be used
    or not.

 drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 51 +++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
index c0855fef7735..baebb9a5c7c8 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
@@ -44,6 +44,7 @@ struct jz4780_nand_cs {
 struct jz4780_nand_controller {
 	struct device *dev;
 	const struct jz_soc_info *soc_info;
+	const struct mtd_ooblayout_ops *oob_layout;
 	struct jz4780_bch *bch;
 	struct nand_controller controller;
 	unsigned int num_banks;
@@ -213,7 +214,7 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nfc->oob_layout);
 
 	return 0;
 }
@@ -345,11 +346,47 @@ static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
 	return 0;
 }
 
+static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section || !ecc->total)
+		return -ERANGE;
+
+	oobregion->length = ecc->total;
+	oobregion->offset = 3;
+
+	return 0;
+}
+
+static int jz4725b_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = mtd->oobsize - ecc->total - 3;
+	oobregion->offset = 3 + ecc->total;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
+	.ecc = jz4725b_ooblayout_ecc,
+	.free = jz4725b_ooblayout_free,
+};
+
 static int jz4780_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	unsigned int num_banks;
 	struct jz4780_nand_controller *nfc;
+	const char *layout;
 	int ret;
 
 	num_banks = jz4780_nemc_num_banks(dev);
@@ -366,6 +403,18 @@ static int jz4780_nand_probe(struct platform_device *pdev)
 	if (!nfc->soc_info)
 		return -EINVAL;
 
+	nfc->oob_layout = &nand_ooblayout_lp_ops;
+
+	ret = device_property_read_string(dev, "ingenic,oob-layout", &layout);
+	if (!ret) {
+		if (!strcmp(layout, "ingenic,jz4725b")) {
+			nfc->oob_layout  = &jz4725b_ooblayout_ops;
+		} else {
+			dev_err(dev, "Unrecognized OOB layout %s\n", layout);
+			return -EINVAL;
+		}
+	}
+
 	/*
 	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
 	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
