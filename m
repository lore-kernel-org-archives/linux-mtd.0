Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79D1C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29D92086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/xdXWzG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="xMnQQ4R7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29D92086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6Bve6AwyJbDTT2z/5qa+r8Pr70d0sndxG0YKCaXwKu8=; b=u/xdXWzGaYT5aPmqiNb1UTzC3P
	snL/OYWwimv0Y8LBy8z49gz2L/ZseUmlACozOkHLS/mBT9CNr3ZzFo20yHiPK8mU4VvQ7nu/b+TUJ
	uEqPEDFWAOctO6EErwSoTWOi6kC52oa0ZJWp5Y/L2dFWu/57ZyRvb75u4IqztQCVPv8R1q3lrUN2P
	AHOTBQWtCuVi4J7WdD/l0l8lN4WxlV7z5fJ0yjoJNoAfC7ilRmODUs7CTEfxCY6sKP7fcUuM8Jo0J
	Ajqqs3T5s3A0cvmwIcZyprpTTx33Panx0HwowNOGOADEv3iewc25Ewh8QWHmQehEQ1jpPLDW77Zkl
	sY7lgJ3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkIe9-0008NJ-DL; Fri, 18 Jan 2019 01:08:33 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkIcx-0007Fz-W3
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 01:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1547773638; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=LdKmC0sOyR3V2mJtKk2VStVW2W3EwccGJghrjd+po30=;
 b=xMnQQ4R7KuLpk2Pch64tLORPLEPzAbzc/74NPOr6Q58I4KDHyQKIAsOmUaA/FOEVOhmClP
 AUmWlALF0ITh/YudOx8GruETDwiKOyxEL44oicuNTdQ0dMFlAIWPnenhpEf87cs58rKER2
 guDy0iWYulVghW66ZFfoqyA1EF+JMro=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH 6/8] mtd: rawnand: jz4780-bch: Don't set clock rate in driver
Date: Thu, 17 Jan 2019 22:06:32 -0300
Message-Id: <20190118010634.27399-6-paul@crapouillou.net>
In-Reply-To: <20190118010634.27399-1-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_170720_274770_E77715C3 
X-CRM114-Status: GOOD (  10.91  )
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
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This should be done in devicetree. Besides, it prevents us from
supporting other SoCs which don't use the same clock frequency for the
BCH hardware.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/jz4780_bch.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
index 7e4e5e627603..161d3821e1c4 100644
--- a/drivers/mtd/nand/raw/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/jz4780_bch.c
@@ -57,8 +57,6 @@
 #define BCH_BHINT_UNCOR			BIT(1)
 #define BCH_BHINT_ERR			BIT(0)
 
-#define BCH_CLK_RATE			(200 * 1000 * 1000)
-
 /* Timeout for BCH calculation/correction. */
 #define BCH_TIMEOUT_US			100000
 
@@ -348,8 +346,6 @@ static int jz4780_bch_probe(struct platform_device *pdev)
 		return PTR_ERR(bch->clk);
 	}
 
-	clk_set_rate(bch->clk, BCH_CLK_RATE);
-
 	mutex_init(&bch->lock);
 
 	bch->dev = dev;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
