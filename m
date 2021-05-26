Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1243CC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:34:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87A96113D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87A96113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5TBn/1bBjmmRhCYdL7oGk++Eh8Qiux0jbibx5+L48I=; b=1xXIqlc9jbrt7k
	nMFBpg7TQF8zDBZnIbsBgV/kEIh/KElN8XqUvCM//3UuT5U5k8QzcQ6poNL5CzJA1yykZbngYA4uw
	cSwzNYAyYjHhGjU43bebTp2IDGSC0pGDOjfV0xN8umAWuYpJ7irEryZrQmmJEr162MSF58B4Gs5sQ
	+KcheTpSFjbuyRZPFKUpjkb7vp2bSMmT3Pe5HFTkersU8EXc/b8v/nEemryhFbXgii/zz8AZtbxss
	e9LbTa8E4B1dzO5d5VuCHW+w7HWGa4s4/fs3sNksHizood9nf263womwrgHF1iZDFmvKYvMRNscpX
	C1oeMltbynqxnUKoV5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrns-00DbX4-Hk; Wed, 26 May 2021 11:34:24 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpu9-00Cuev-JO
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:32:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5ECC760013;
 Wed, 26 May 2021 09:32:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v3 1/4] mtd: rawnand: Move struct gpio_desc declaration to
 the top
Date: Wed, 26 May 2021 11:32:39 +0200
Message-Id: <20210526093242.183847-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526093242.183847-1-miquel.raynal@bootlin.com>
References: <20210526093242.183847-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_023245_828082_F52BE6B5 
X-CRM114-Status: GOOD (  11.20  )
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

The struct gpio_desc is declared in the middle of the rawnand.h header,
right before the first function using it (nand_gpio_waitrdy). Before
adding a new function and to make it clear: move the declaration to the
top of the file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 29df2f43dcb5..93f5c0196a09 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 
 struct nand_chip;
+struct gpio_desc;
 
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
@@ -1413,7 +1414,6 @@ void nand_cleanup(struct nand_chip *chip);
  * instruction and have no physical pin to check it.
  */
 int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms);
-struct gpio_desc;
 int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
 		      unsigned long timeout_ms);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
