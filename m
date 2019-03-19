Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F74C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74EB2133D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OhGGjcnx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="XvjbsXo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74EB2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Uj8IJ80qlHOIUNs7NGJWfzLGm8EcxDis7CWMVCp+0sg=; b=OhGGjcnx0SW/z1yH85mjIXdBKG
	Un+ehS3+cmek/fZCml3VrW6YlHJPPJypKcXq1Q8WHxXm5j1hnaaU1jq/APV2IIHhw51CR+BgGghNY
	ZstKOZtv2tVOzAAzztzuYpJaOFfZakHQrfSqWEQ2O6uFvWNCAXW9t2EBvduFgBq3fuAvwNEB2ksX6
	GrOu3H9Tb7bZD+3yjwkXKWLO0kKJfBuSncOO5yaGIPZv2JkueI3T9BtgZ5DwovQr5xvqE6gxPn1V/
	4NK9f/BKsM5WD5lSfaadcdfGgusAeLFOCXwGdhnIMOgduiZkpkW68bL3pOevIC1/YUObKSXCDEUbK
	fDslZKdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6G9l-0002XM-BT; Tue, 19 Mar 2019 14:55:57 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G8A-0007lc-7Y
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007256; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=89LjRLXQLwT2S+dBIUEOXVCnKaGXOEH7NjHzAKceDPw=;
 b=XvjbsXo7b663h1TqXCsQPT0EOfaQEmOvMO2t+PpfMpbfr0myq3xGXqQM4wLqtFnssiai8a
 qwPOk0+XbNnFwVGPVv0zWiumjMjtxV2CA3CU1wQQPcTgBAeu2/Vp80Uxbg0c3ahKYIKdow
 DRgtbafF7Mitrfci8w8pp39jKbf/aU4=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 09/13] mtd: rawnand: ingenic: Make use of ecc-engine
 property
Date: Tue, 19 Mar 2019 15:53:59 +0100
Message-Id: <20190319145403.31627-10-paul@crapouillou.net>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075418_947176_28589E77 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use the 'ecc-engine' standard property instead of the custom
'ingenic,bch-controller' custom property, which is now deprecated.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch
    
    v6: Fix 'a ecc-engine' -> 'an ecc-engine' typo

 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index d7f3a8c3abea..7b07a6a342d1 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -82,9 +82,9 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 
 /**
  * of_ingenic_ecc_get() - get the ECC controller from a DT node
- * @of_node: the node that contains a bch-controller property.
+ * @of_node: the node that contains an ecc-engine property.
  *
- * Get the bch-controller property from the given device tree
+ * Get the ecc-engine property from the given device tree
  * node and pass it to ingenic_ecc_get to do the work.
  *
  * Return: a pointer to ingenic_ecc, errors are encoded into the pointer.
@@ -95,7 +95,14 @@ struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *of_node)
 	struct ingenic_ecc *ecc = NULL;
 	struct device_node *np;
 
-	np = of_parse_phandle(of_node, "ingenic,bch-controller", 0);
+	np = of_parse_phandle(of_node, "ecc-engine", 0);
+
+	/*
+	 * If the ecc-engine property is not found, check for the deprecated
+	 * ingenic,bch-controller property
+	 */
+	if (!np)
+		np = of_parse_phandle(of_node, "ingenic,bch-controller", 0);
 
 	if (np) {
 		ecc = ingenic_ecc_get(np);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
