Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFE3C4361A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 19:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E795B20C56
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 19:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E795B20C56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7odBmeMzt/4auOQn/HXzpAUZC+fN90UtrQg5o3Kfqn8=; b=SNJkMYZv35bAE9ZAaQ1kTT2P2
	cZrtVhPd1y+U+WGhE237mkucyNDY5WnPS7cUhv96VgNEAKZhux2mtCFg+LlVCzP9FBPTy5ls6dmRB
	QtkXWl7iSwpmvU6NVmbAb4rJ7nZMn+FIi/AcYnZJLeexClLkUqTHbSmyWy2FdrtUeA1Tr9MU+ukqt
	VHanY+l0iXfE63tiE7A4RI3SSMn/6FGqq/bKscckpTbLw0Dq89G6MZklVZY/PEAL0bs8Kp3hnr6OC
	imERQW9SdLCWwxRLKwSDWcvAo3+LbwJi0CqA3oSvToyEvLvbtq2EWbNaDPObcv04H09PlWQbOSeST
	j7rGWmL5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkttb-0006I4-B9; Thu, 03 Dec 2020 19:04:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkttM-0006DN-Pd
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 19:03:50 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A875224000F;
 Thu,  3 Dec 2020 19:03:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/9] mtd: rawnand: orion: Do not force a particular software
 ECC engine
Date: Thu,  3 Dec 2020 20:03:36 +0100
Message-Id: <20201203190340.15522-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203190340.15522-1-miquel.raynal@bootlin.com>
References: <20201203190340.15522-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_140348_971614_F77DA492 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Originally, commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework
user input parsing bits") kind of broke the logic around the
initialization of several ECC engines.

Unfortunately, the fix (which indeed moved the ECC initialization to
the right place) did not take into account the fact that a different
ECC algorithm could have been used thanks to a DT property,
considering the "Hamming" algorithm entry a configuration while it was
only a default.

Add the necessary logic to be sure Hamming keeps being only a default.

Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Fixes: 553508cec2e8 ("mtd: rawnand: orion: Move the ECC initialization to ->attach_chip()")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/orion_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index e3bb65fd3ab2..66211c9311d2 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -86,7 +86,9 @@ static void orion_nand_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
 static int orion_nand_attach_chip(struct nand_chip *chip)
 {
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 
 	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
