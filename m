Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C76C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:50:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FFF61005
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FFF61005
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iB2lMFDJESI80oH+OLzxTar+WrsdsryDzvNF+aEz24w=; b=GLCN7Nbky93AeJ1QAcUmqJ6Kt
	e+G36kz4DPMH8jp6bQalHBDZfIy2AUBuW+R3Yv3I4kHYPHhn+9SySfnO1/8lhdbXDY+OIUyWXcCXY
	cwWec6hCV1wm0VMJuIbUrDcg5H1BZq4ar90gzCV/8iejaQl0cF8F6hf2DinYU4x97HqnXUsoIzb5j
	L1EeGMQgQCjvgENgnWOZqev8IINfaBwSLfASYmXdyqnfrjOHslPYZenwlMWugkHIoSopMTH79SaB7
	QmTfBcc3Dg1iB55EiPeOak+smm0ZcI3/wDIBM3nCUqd9nTKNhjB6cfZ7XTLh1CUMP0S6vtLRqp/tW
	DZs7gCAhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDcr-00C98L-Rm; Fri, 02 Apr 2021 06:49:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDcQ-00C93R-2e
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:49:25 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 04772C0002;
 Fri,  2 Apr 2021 06:49:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/5] mtd: rawnand: Move struct gpio_desc declaration to the top
Date: Fri,  2 Apr 2021 08:49:12 +0200
Message-Id: <20210402064915.220781-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402064915.220781-1-miquel.raynal@bootlin.com>
References: <20210402064915.220781-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074922_673065_06290DE0 
X-CRM114-Status: GOOD (  10.94  )
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
index 93e8f72beba6..09473d065c94 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 
 struct nand_chip;
+struct gpio_desc;
 
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
@@ -1399,7 +1400,6 @@ void nand_cleanup(struct nand_chip *chip);
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
