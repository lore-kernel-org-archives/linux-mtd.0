Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53AEC433E2
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:26:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F6020684
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mbLsvgYh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+rmydmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F6020684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mPPWuW+hxB1aFEggIvsHLxyVwthskE/ICFYR583vYiE=; b=mbLsvgYhzAORjXU8atTJZTpOBj
	PE0x9aSZWnt7/iFgndvR+kNi+uqKbQcJrzefFePokMBW5ZZ0LtOlQNRNo44YaUfI78q70/GSCzpCc
	pcM4zkKYsZ3uvY7/66SFGlFn4HnZUWkoNlM21NYBhcjtHuGfTCktw/557g2uyuYAvCQBg7/xfCn+i
	U1Rh8qQxsytYs/2Dc2gaIwY7Dt6iSRmLN0WSkQYRlxLKtGm2UZFfv9ykUNVhvkQ5E3aj53PZ2YVOm
	iHjoA+nf+OcsOzteKwi9DUyh3ihC2+3tdJmkFatGSnZvgC0ehkodsspT5QPs9OJXXkmDRm1pV7HbN
	1dSopTWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8Ae-0000Pi-Mt; Tue, 01 Sep 2020 15:26:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8AZ-0000OM-TN; Tue, 01 Sep 2020 15:26:00 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 904D620BED;
 Tue,  1 Sep 2020 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598973959;
 bh=iZRokT/LvXKNu2UX1Yb/TKfow/L5EMf/GiV8BC/Qzd4=;
 h=From:To:Cc:Subject:Date:From;
 b=B+rmydmoDRrQML/RdSKE568dtNtwlYkX47MCkTwC1WwxV3RyIRMaMUYIQBmn426PA
 fZbb36fPUQn29OkEmMkOmoYYdWCA4abcNOWWx5vkolnzIUbSv6cshrN7mL6QufCw1R
 jSHLBjWdVwBCqvyjYreyYuG5ackDdKuVVVhLA5Cc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] mtd: onenand: Simplify with dev_err_probe()
Date: Tue,  1 Sep 2020 16:25:30 +0200
Message-Id: <20200901142535.12819-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112600_008389_F515FFEB 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/onenand/onenand_omap2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index aa9368bf7a0c..d8c0bd002c2b 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -494,11 +494,8 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 
 	c->int_gpiod = devm_gpiod_get_optional(dev, "int", GPIOD_IN);
 	if (IS_ERR(c->int_gpiod)) {
-		r = PTR_ERR(c->int_gpiod);
 		/* Just try again if this happens */
-		if (r != -EPROBE_DEFER)
-			dev_err(dev, "error getting gpio: %d\n", r);
-		return r;
+		return dev_err_probe(dev, PTR_ERR(c->int_gpiod), "error getting gpio\n");
 	}
 
 	if (c->int_gpiod) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
