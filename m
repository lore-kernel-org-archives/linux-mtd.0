Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E960710A88E6
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbtvU2J9vpUO0ts3Rh3RictqtBocVUX8Qrn130/SGsw=; b=iHnrznICbJ1VeT
	YBerDmD3jFpjjAxWBgD7CJ6MEBGg5EpJ6VjTRF+HfA3PDhm3YVrQLrz2ZAIcAIQo7jjGWUT+q0l6/
	S/nvVB1w6OFK8YDpEyLRzrOTFhd+UD7fNwP9Itb18seVOfTXbymLVaDcXGSYFOX6RM8VbAe5yiXsO
	+wJSK15H+Q7p8QVK3y91Sb3yqyZ7YIDo1t5U/FZs8/oa8YkjKdc6eWtSdcqF+N0qPDhnpqiqfm3cX
	Crr20QRB5IAStpTM5sO+V5yl6oAs9E9VMaHZJQm48Ryih8rxMXdXg4eVRKCJPAFeJ1Np8PBEmr7+A
	wFoNr/FEP7KJR/fnq11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrx-00000005sts-30l7;
	Thu, 26 Mar 2026 16:47:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrs-00000005spr-0U2a
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:47:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 63B84C5505C;
	Thu, 26 Mar 2026 16:48:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F771601FA;
	Thu, 26 Mar 2026 16:47:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8D0710450015;
	Thu, 26 Mar 2026 17:47:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774543653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=teX1nj50p7T/nQpS+gQuoF7Rys4YzHubJDIitOgqOXM=;
	b=EZLRM5cEiOd+snGueB87q1ZnE9nd5QmVHSiERyZYLBStCh1LN8Q9RZO6BNIWXTU3AYmkTM
	niE3Ny/oV3lX+qZ87kSFXoxluVQYbo9j+JjWeegtV1nXtJkzDGSEWGrmeyiQU/n0w0rHjc
	4Xnyq4B8yMEpOUfN2wj36ZpXF9iznaMjFzh3Q4F8cWvFIf83SzI3UIzCtKdTmwDYsFFgoO
	sykLNxdAbs83NajR0HIF7OszH1EMTxvvTf67tLSQjSN0wqozGxYYCVSFarz278IuuPJFi2
	WwE7tT+nEkg7dq7IVaxaMqhZVNinvAaamU5ZJ0gog77RHQtEdnvzK46D7etD+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:47:17 +0100
Subject: [PATCH 3/4] mtd: spinand: Prevent continuous reads on some
 controllers
MIME-Version: 1.0
Message-Id: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-3-0d626e1dfb2b@bootlin.com>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Steam Lin <STLin2@winbond.com>, 
 Santhosh Kumar K <s-k6@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094736_300676_97EB93F4 
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

Some controllers do not have full control over the CS line state and may
deassert it under certain conditions in the middle of a (long)
transfer.

Continuous reads are stopped with a CS deassert, hence both features
cannot live together.

Whenever a controller flags that it cannot maintain the CS state
reliably, disable continuous reads entirely.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
SPI NOR reads are not affected, hence only a solution in SPI NAND is
needed.
---
 drivers/mtd/nand/spi/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index dbe2c463fe01..82f4dd441541 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -951,6 +951,7 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	enum nand_ecc_engine_type engine_type = nand->ecc.ctx.conf.engine_type;
+	struct spi_controller *ctlr = spinand->spimem->spi->controller;
 
 	/* OOBs cannot be retrieved so external/on-host ECC engine won't work */
 	if (spinand->set_cont_read) {
@@ -962,8 +963,9 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 		 */
 		spinand_cont_read_enable(spinand, false);
 
-		if (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
-		    engine_type == NAND_ECC_ENGINE_TYPE_NONE)
+		if ((engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
+		     engine_type == NAND_ECC_ENGINE_TYPE_NONE) &&
+		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion))
 			spinand->cont_read_possible = true;
 	}
 }

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
