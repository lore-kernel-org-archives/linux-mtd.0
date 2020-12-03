Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A59C18E57
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 19:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DD621D95
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 19:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DD621D95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=whyMaZptVCuYOuRsTrorxMg1NMu04dZULkESn6xW3lA=; b=IQrqfidcDkm1SSlYMnVIdX3Bu
	t9TZ/WCvejhpdhr/S7ZMCyXIZxXCm2ze8f/q9DPStWeSouberhKHTQ6EPTgftfEmHfad2U2bE0FLW
	Dnw4pLRTUfE1GiAh6t6v9CsIwVebewFfsAmGZfF4Flh1H/qfIOtlHuahl4pqwvt+wmSMudqwTIOKh
	DWpHeymOpRy5Hbxrk+L1y/wtd2kdIQqrtcYJOgwgzKPpNFncw7jCpnVLHAJxteuhInuYEdxPTkkS3
	Puwk72Vok4jZzm0U2eljJFqlNf9vyx8z4XRboJc79mAMAW9ZrvFlag0qsY3apaI6+FR6vZlu3SPH3
	sCkZEJo3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkttZ-0006HW-EP; Thu, 03 Dec 2020 19:04:01 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkttL-0006C6-I9
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 19:03:50 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 413EE24000B;
 Thu,  3 Dec 2020 19:03:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/9] mtd: rawnand: gpio: Do not force a particular software
 ECC engine
Date: Thu,  3 Dec 2020 20:03:34 +0100
Message-Id: <20201203190340.15522-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203190340.15522-1-miquel.raynal@bootlin.com>
References: <20201203190340.15522-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_140347_751979_9CE8CE2F 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
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

Fixes: f6341f6448e0 ("mtd: rawnand: gpio: Move the ECC initialization to ->attach_chip()")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index eb03b8cea1cb..fb7a086de35e 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -164,7 +164,9 @@ static int gpio_nand_exec_op(struct nand_chip *chip,
 static int gpio_nand_attach_chip(struct nand_chip *chip)
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
