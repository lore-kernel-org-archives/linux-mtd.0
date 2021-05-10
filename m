Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D7CC43600
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:47:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759076198A
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759076198A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F5TBn/1bBjmmRhCYdL7oGk++Eh8Qiux0jbibx5+L48I=; b=JXl780cGC4OTv2F8TMCTyQF+r
	IR6T4tJf6ir/Qx2JoxIoWWHJ0FGTIoEYy9NCxrVqFt1pMsH7rCxyWUM4yYIeckn0WRXv5H9JyRvg1
	i2hUP5MukEUE87kKwAXWFNBPfn+lFP+WhP+qwu/7AglD/7IvFO23sB+03FpJbqwevbtnakddfghfL
	3lQqqH+XgnlegqWpvEIBAzC5BRiGjpsenQvb1NSG4NHG5C/0ZUtRTI9bjqdgGG0YLWgvRY1UN5Q5d
	gAi8F9P6kvHnvGnmZcoXUTgmhBGs3EYhnO1KV8NJmgfOn3kH955Ld/fsxzhPLzcSKxtixrGR0tVi6
	y492AygVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3QD-00DzPT-7H; Mon, 10 May 2021 10:45:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LQ-00DyUY-OD
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=JDz9sj+l+VWKvt/u9LU2KxKNixcFqeRP5NjiHv1YwFY=; b=LSQ5ZWkphdO13CgCn7nInZhOc9
 4Z9e4i8GRJEuOKEmb2skwK0gAvlslpevxpPMxUUxbXApH4NpouCIjP2osvmXfF2vHJ6zyz53aIh7w
 Tj2CI3Xb7ksnsl6bPYLzS+VRH2j2GRYDz+J5vi0LTrBz5V0ZmRemu+7/bjarO1f8nFwQKCPBi7HqB
 ZTdcN3gKF76KxgRyxQoLA0UwfSq4i1U32a8lc3P9IMhaWQxSYH0RVEXRepyVmIJryCSV0jRrF6Grx
 dOTrmCGDKUEIeQfY251Aj0gGUrc1ueCJZAAPl1eP95nk8475Dj/Hw/kmqvu6ddl0LfWoaT4VPtQI7
 lad5sPWA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LN-008YZH-IV
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:40:59 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 35F3B1C000B;
 Mon, 10 May 2021 10:40:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/5] mtd: rawnand: Move struct gpio_desc declaration to the
 top
Date: Mon, 10 May 2021 12:40:48 +0200
Message-Id: <20210510104051.9701-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-1-miquel.raynal@bootlin.com>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034057_765753_899AF316 
X-CRM114-Status: GOOD (  11.69  )
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
