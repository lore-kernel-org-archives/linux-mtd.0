Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC36D5CC8E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYFQh1riZ5y1TuYA+Uwq/e7kOk7hOBvqFtMcTqQJiNU=; b=21wdVjIq+jTtqq
	ABcOB5smhX76/6gTNAfBfI0KgAvTVNkwKfR9dXPT3tOcHhzXHqzS4/THGdfQZN4N92rBBkHvHUbqY
	fNLd2kvkj31voUrULrvIZv9hLM8qVJVJP46JXQAWwevHSwGNGmDCwPnkAW7a4QQTHwaQnCrEZRle2
	fsyEjbuYLVrpD9nJs97LJavT1HoBZV5IQWMZcvMedUfpk+Wmvj2F6BwCu0Lvi/PNRHFF+fiCzR30x
	RXgMXCdEX+yjt9TtnAmQNxRlB7ldgsDM1jIlX3IkerW4YQw9VNr8D8TBiuXpXwolMR4LhKrJX/Txd
	zURftULE0wV1zDs8Vpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Nt-000000002Ml-3RFd;
	Wed, 30 Oct 2024 10:57:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Ea-000000000Q6-0IIL
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 10:47:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 2BB72C000B;
	Wed, 30 Oct 2024 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730285246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUlUDpq8VP1OTa7j0y4mtc+eoVWsoIOVcCnsrw8rmJ8=;
	b=JtuhmXyJ48hFUcuMsvNP2kwUzG5k13sa3FfxMhrI5KIE0hzyiBWs9JLxOxn6moV/hOcgFl
	P5OwYt1HV5VdRAlNwYSthC7tTOXO/HdSr/DYcSgbLZyJxRmk4F6FqXlCqQk10GHlneYNRu
	JIOb7uW9iEnKWZ9smETw4LPVH30Zh9yNGLyDUYGUsPdebM+W83vwA/ALihBxfoF/LsneDR
	gp4IvmCTYlIOIGdIs1ZJ+KzPr8W5qnlFfDfXv1kkeyJcfXhy8iQ6ig/zN8Norv6aHBPMDn
	Hvkdn77siMNviFlOn4eoWhLQ/IHaTz6ZFZagTCqfn1ZOtF5M5/yWwrchRqo78g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 4/5] mtd: rawnand: davinci: Add clock resource
Date: Wed, 30 Oct 2024 11:47:16 +0100
Message-ID: <20241030104717.88688-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
References: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_034728_259813_4BCA642A 
X-CRM114-Status: GOOD (  12.08  )
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

NAND controller has a reference clock but the driver doesn't use it.

Add a struct clock in the struct davinci_nand_info so it can be used
to compute timings.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3c0efbdd789e..11dc30c29957 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -10,6 +10,7 @@
  *   Dirk Behme <Dirk.Behme@gmail.com>
  */
 
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -117,6 +118,8 @@ struct davinci_nand_info {
 	uint32_t		mask_cle;
 
 	uint32_t		core_chipsel;
+
+	struct clk		*clk;
 };
 
 static DEFINE_SPINLOCK(davinci_nand_lock);
@@ -822,6 +825,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return -EADDRNOTAVAIL;
 	}
 
+	info->clk = devm_clk_get(&pdev->dev, "aemif");
+	if (IS_ERR(info->clk)) {
+		dev_err(&pdev->dev, "failed to get clock %ld", PTR_ERR(info->clk));
+		return PTR_ERR(info->clk);
+	}
+
 	info->pdev		= pdev;
 	info->base		= base;
 	info->vaddr		= vaddr;
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
