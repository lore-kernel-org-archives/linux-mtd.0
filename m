Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 23:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1513320825
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 23:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jcGFadab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1513320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXGas0MB5FCWeTyPBvs2wE5WDp5RaOzj0VbERlcfwII=; b=jcGFadab7ETJC0
	tUYwrlmhKUQhSRuNQ8gzzLJrCDoxeWbIYOBj8r55zUfcdSq7c2u6+k9B2BR/jue9jtDtJEFpmaP5M
	v1RsSpmMptOnolc0TvJoZrDUMQcaL0S+ph7htnolbATvmx/HeUo+ptofuJa/xEgPlwOc0TS+h0v2u
	di1iUr/nX4DTnSS48Afw96Xh3XM6LgW1p66boVgeAuxh56SuDSX2YBZ3lKFLJ9PcCUINz7fwa6fiI
	5OjmuIYWTwqFlKEcAikYrm+RRrzn8ca3aMtyySRk8Uho6FWsAeLiro793OrZhoZRLalP+tJrtnCtP
	StcGxFmeeuUF0Y0zkbOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBc4-0006AH-DI; Tue, 19 May 2020 23:25:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBbb-0003RP-5r
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 23:25:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 23EE92A26CA;
 Wed, 20 May 2020 00:25:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/4] mtd: rawnand: ingenic: Fix the RB gpio active-high
 property on qi, lb60
Date: Wed, 20 May 2020 01:24:53 +0200
Message-Id: <20200519232454.374081-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200519232454.374081-1-boris.brezillon@collabora.com>
References: <20200519232454.374081-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_162503_382588_5CB0387F 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The rb-gpios semantics was undocumented and qi,lb60 (along with the
ingenic driver) got it wrong. The active state encodes the NAND ready
state, which is high level. Since there's no signal inverter on this
board, it should be active-high. Let's fix that here for older DTs so
we can re-use the generic nand_gpio_waitrdy() helper, and be consistent
with what other drivers do.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* New patch
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index e7bd845fdbf5..e939404e1383 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -184,7 +184,7 @@ static int ingenic_nand_dev_ready(struct nand_chip *chip)
 {
 	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
 
-	return !gpiod_get_value_cansleep(nand->busy_gpio);
+	return gpiod_get_value_cansleep(nand->busy_gpio);
 }
 
 static void ingenic_nand_ecc_hwctl(struct nand_chip *chip, int mode)
@@ -343,6 +343,18 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 		nand->chip.legacy.dev_ready = ingenic_nand_dev_ready;
 	}
 
+	/*
+	 * The rb-gpios semantics was undocumented and qi,lb60 (along with
+	 * the ingenic driver) got it wrong. The active state encodes the
+	 * NAND ready state, which is high level. Since there's no signal
+	 * inverter on this board, it should be active-high. Let's fix that
+	 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
+	 * helper, and be consistent with what other drivers do.
+	 */
+	if (of_machine_is_compatible("qi,lb60") &&
+	    gpiod_is_active_low(nand->busy_gpio))
+		gpiod_toggle_active_low(nand->busy_gpio);
+
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
 
 	if (IS_ERR(nand->wp_gpio)) {
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
