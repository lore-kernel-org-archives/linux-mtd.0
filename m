Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A215D26D6F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOVzr7OYUh0rc5eltiXcKwINMUptvXz8G44+fqBv7fA=; b=AKk9szoCGu8c5W
	jKTChmeioD5LfokMn7DLX0wTaceBX8Q+6B3YKaKPViVTzAlXwLSdnMA+aEE2/BeE+MU9r5dK4c7Q7
	oygkf9cJW1popYevp1sSv02ffOtGMNuxq3W5bx3H8QqcwIpu4NS3EtOj/0gXeWkIs967LZrYr9uvj
	XeOMfsj6AYkB04s/c4Y45cUU0oqXdnWolh5h2rDJejZIaDxcfthuN4Hfwo6CqAbzmPZx1hor1weYt
	zXC57WcRz6Dfe4SRjnym5fRtE2eJP0LQv3HSdkjx1h4srmkqOAG3FeAozjoA66yLzugR7Bu7BwwFV
	WT6xhzmlQrP4cViudc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG86-00000002lsQ-45SG;
	Fri, 09 Jan 2026 17:18:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG82-00000002loQ-3ex9
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D020C1F6E9;
	Fri,  9 Jan 2026 17:17:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64C0A606C6;
	Fri,  9 Jan 2026 17:18:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B60D9103C89AD;
	Fri,  9 Jan 2026 18:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v22HJHx8//qB5/a5Mqzhu2mFFylXUtBtPnkP97yMpsw=;
	b=wVJ+MX0pEoXe/7NLlNWUtxxBoI/lzU9mojd2jzQG93nDEXa3RsmSGhB2bptt7G/SnTRLBZ
	4fVO/5/czzugN6vkX+kUET3HUqmF7ItOAUTQCFXdFN23Fvu+caG/fpIpu9+D7N1tKjLayU
	aygZjlNhJmmDNDdS0lfgK/tGMdWbBrUBmZJr2ecHtKLAOGYkY6BcZZFvbiRrLsfFBFHn46
	Nk1ZS8cYeFI8tW4tkX6/4m7X0O4FV3mdBenwQeSlCBOKAjNkbzAZA1KuWVAOhaCuh2E3TC
	v+4o/eg0J7/n3tVsTOWbLFUwp4Ec+6vRljUCyKTi43fewgVX+rLrkF8QsmWjKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:03 +0100
Subject: [PATCH v2 05/27] mtd: spinand: Add missing check
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-5-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091827_053527_9E7B5973 
X-CRM114-Status: GOOD (  10.27  )
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

The update cache variant is mandatory, both read and write versions are
being checked, but not this one. All chip drivers seem to implement this
variant, so there should be no breakage.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The core has been like that since the begining, I do not think this
patch should be backported, hence no Fixes tag. This barely
qualifies as a fix anyway.
---
 drivers/mtd/nand/spi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 62447801abb1..8acea0372f21 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1432,6 +1432,9 @@ int spinand_match_and_init(struct spinand_device *spinand,
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.update_cache);
+		if (!op)
+			return -ENOTSUPP;
+
 		spinand->op_templates.update_cache = op;
 
 		return 0;

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
