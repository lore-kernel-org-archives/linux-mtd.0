Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB9CCFA13
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1O5XT/k2j2aufHMlj9+KPOXEWroh98ye2z/9QfSzRtY=; b=cgvSetJDOyXd3s
	7QcH57n0WsY/VxSTjCaLPLrczB2fdnneHF5NnIuij+ixWZT8tGFMPM3YIzoC4gUjQmaEIohS+nMBa
	uXDUrTZ7jl43iHZuystZyzBn+8ypJ85HRCrQlETP/QcPLbJEFgE6O45RPjRdNS0luxiFOkrt/LIJI
	XveTwSNeJtTqE7EvLI/v6pZs5/ntOPrpLRbpXsoAqACI8feWIH8O7YaPslrMuoUndYr0DEpUwsAEd
	tfRINJB1NPepMFEfmqAFswi745DUmXO7NQ4TEeCN0uOAzmmtuKRDGniuyPzqq8jcu37JSas0qqt76
	MTgyqyp/ESmYf+8jPQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9AN-000000040Le-21gy;
	Wed, 29 Apr 2026 17:57:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9AK-000000040Kd-3O2w
	for linux-mtd@lists.infradead.org;
	Wed, 29 Apr 2026 17:57:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78629C5CD5E;
	Wed, 29 Apr 2026 17:58:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43A3C5FD43;
	Wed, 29 Apr 2026 17:57:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 773411072B168;
	Wed, 29 Apr 2026 19:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yWmmYQ59pDWo8CPH+WDZNUJOtVHq1mv94yrIZNpMFTQ=;
	b=A0uy++HpVsqXp/AWhYrAI2hp+p7ETugdFS9ytd4dkSCZwTjv36+cFoiIWz21fMnMSR76Pc
	e9+HB7ILr3sOak88h+392wCRwwauqRweo0aEedItbcLJw5mneGcjRYsFKXfoStHcHckx0G
	YdRGnC9kioVwBBtwXgo9e23sCWa5jBacVqwNtOjjGywvq/J3Kk2xPGQJ6jU9zWelyclGMn
	a7dCpyogvUIXu6KO4oUR91xBUJDErBJKBAX4/2ba3x4QQEmjuGjYXboWm+Z0S1WSQ1mS/G
	EU+q6ezfH6vSeti6bArRAEV8f3ILa5MPp+YtCN06qckkQkyMqihgfsw411IjUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:38 +0200
Subject: [PATCH v3 01/11] mtd: spinand: Drop a too strong limitation
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-1-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105741_135442_67DA1E27 
X-CRM114-Status: GOOD (  14.31  )
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

Since continuous reads may sometimes not be able to go past an erase
block boundary, it has been decided not to attempt longer reads and if
the user request is bigger, it will be split across eraseblocks.

As these request will anyway be handled correctly, there is no reason to
filter out cases where we would go over a target or a die, so drop this
limitation which had a side effect: any request to read more than the
content of an eraseblock would simply not benefit from the continuous
read feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 66c90419f6d5..fba3cc213c88 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -878,6 +878,12 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 	 * Each data read must be a multiple of 4-bytes and full pages should be read;
 	 * otherwise, the data output might get out of sequence from one read command
 	 * to another.
+	 *
+	 * Continuous reads never cross LUN boundaries. Some devices don't
+	 * support crossing planes boundaries. Some devices don't even support
+	 * crossing blocks boundaries. The common case being to read through UBI,
+	 * we will very rarely read two consequent blocks or more, so let's only enable
+	 * continuous reads when reading within the same erase block.
 	 */
 	nanddev_io_for_each_block(nand, NAND_PAGE_READ, from, ops, &iter) {
 		ret = spinand_select_target(spinand, iter.req.pos.target);
@@ -968,19 +974,6 @@ static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
 	nanddev_offs_to_pos(nand, from, &start_pos);
 	nanddev_offs_to_pos(nand, from + ops->len - 1, &end_pos);
 
-	/*
-	 * Continuous reads never cross LUN boundaries. Some devices don't
-	 * support crossing planes boundaries. Some devices don't even support
-	 * crossing blocks boundaries. The common case being to read through UBI,
-	 * we will very rarely read two consequent blocks or more, so it is safer
-	 * and easier (can be improved) to only enable continuous reads when
-	 * reading within the same erase block.
-	 */
-	if (start_pos.target != end_pos.target ||
-	    start_pos.plane != end_pos.plane ||
-	    start_pos.eraseblock != end_pos.eraseblock)
-		return false;
-
 	return start_pos.page < end_pos.page;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
