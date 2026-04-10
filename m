Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E2F459FC
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rH6lEMcmmWIxq96pZMf3n5f5oimC3u8ofxQjo9MtN4c=; b=jo160K4hJ1S6lS
	Tfv87RVV9m6cMbRLPNu+KsEQxAA23B3//lbaTY0QQEfBhTqV8n5fI6KbXNCp2rIeVe623spSGgLv7
	Atc2yE0+g0uLuT6plK8d7fZJ7knfSh1KBMQpnFFsdvMeks62PO/4VuvQw588VoxAR2QBCfVEhVHpO
	9+cVT0jWjZc6/uWc887WrwK9fNjeSFGawEgkW2Aaaiqq/ucpGeDf9ZWYrJK4aql/4/nmPZu8bCAr1
	EH/MIWrNH4szuS3qj4whrZsFSp+S0mfNyXFP9nIR8q3Ss9S+1ufqBB2IjGu5BiW/bWRWRHFrba/vc
	MSTnrZs72JJNy02nEccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr8-0000000CdRO-44KG;
	Fri, 10 Apr 2026 17:41:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr5-0000000CdPf-0X4k
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:41:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 26D914E429B3;
	Fri, 10 Apr 2026 17:41:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3378603F0;
	Fri, 10 Apr 2026 17:41:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F281010450082;
	Fri, 10 Apr 2026 19:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775842876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KwQcWNOtwSww1tE4Ej8T9s6pqrHBg9EZ9z5kc47zF+c=;
	b=xCTfkMrymL7P7nBQyGQfECaGcvz4IFCFaydu29//TvtvzOMR/p6/NZbHpKfUoI+rHF5seq
	E4svM5ZGM/TArGt1N8OV6wV7MxYQ0JtdS/FWVjtqgGScjfOghwarKUM1qPmAXkVQfGAyfj
	pYHHo+XGDhKl6bLmGj9Ot9FtHjcD0LqFLqSYVhzyvBYHNqBwugPMtTHstiVI8LylpKLbA0
	TKxV/3dGFRzOG/aghhRLcIMxR8sIRwKKWg83mYfjDIqr1tqrEMLY6VswGCPc6tfZ6mJ8/M
	buMw+mygFJzGPeDkrrNU1mUd1FRe8Xh8Bnbn3fM9t7QqDd1v/rW5389uFSRJtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Apr 2026 19:41:01 +0200
Subject: [PATCH 1/5] spi: cadence-qspi: Revert the filtering of certain
 opcodes in ODTR
MIME-Version: 1.0
Message-Id: <20260410-winbond-6-19-rc1-oddr-v1-1-2ac4827a3868@bootlin.com>
References: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
In-Reply-To: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_104119_303210_A433213E 
X-CRM114-Status: GOOD (  10.02  )
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

I got mislead while analyzing the driver by the fact that the second
opcode byte was in all cases smashed:

        if (op->cmd.dtr)
                opcode = op->cmd.opcode >> 8;
        else
                opcode = op->cmd.opcode;

While at a first glance this doesn't let a chance to the second byte to
be shifted out on the bus, this is actually the second step of an
initialization, where the byte being apparently "ignored" in DTR mode
has already been written in a dedicated "extended opcode" register. As
such, the comment and the extra check that I proposed were entirely
wrong, remove them.

Fixes: bee085476d27 ("spi: cadence-qspi: Make sure we filter out unsupported ops")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
My apologies for this mistake. Until now I never had to deal with "non
repeated" opcodes. Now that I do, I realize that this was wrong.
---
 drivers/spi/spi-cadence-quadspi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 649ff55333f0..87e49d913591 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1538,10 +1538,6 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		if (op->data.nbytes && op->data.buswidth != 8)
 			return false;
 
-		/* A single opcode is supported, it will be repeated */
-		if ((op->cmd.opcode >> 8) != (op->cmd.opcode & 0xFF))
-			return false;
-
 		if (cqspi->is_rzn1)
 			return false;
 	} else if (!all_false) {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
