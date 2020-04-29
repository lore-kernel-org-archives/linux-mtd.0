Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A694C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:57:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3F620775
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUZN0ljC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3F620775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oiix3fPDVtX6N1/Dd9SEotPLpyNn2YGPj3czmxIucw=; b=tUZN0ljCvirmTj
	gEYWvg9t1fM/SwM8mhmViex36UvK+4e9FK9ak7F0fdaayZRDPbz21cLZVQP/uqdCAlYgQaoA0UBir
	fu+dCDdSFVemzwTbfBIzwXPMrSdsANDvKPqi2qlWIsp0AmAKW/LUrG9u0zvYa6Qq4nCaW6CSwAIjx
	DCGDANvalbqQYRY9bvTjCtP7MB2feNHoevjaTPB5gPQngdzjySwFuDuqTbbpwlBaiqNrjt6lRrDZy
	1v6CxZqoX3xXgde78uEgNZ6+onEdL8t6a/468ozJ+UA4ZKo9BcJw2aPPUgNZsz1zrheRh8hWJNwLF
	3onES8pfb9+h0/CQB3ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTp5B-00058B-FQ; Wed, 29 Apr 2020 15:57:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTp3y-0003wL-2Q
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 15:55:55 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BEFC620019;
 Wed, 29 Apr 2020 15:55:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 07/11] mtd: rawnand: onfi: Adapt the parameter page read to
 constraint controllers
Date: Wed, 29 Apr 2020 17:55:36 +0200
Message-Id: <20200429155540.22048-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200429155540.22048-1-miquel.raynal@bootlin.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_085554_268767_A8A6340F 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We already know that there are controllers not able to read the three
copies of the parameter page in one go. The workaround was to first
request the controller to assert command and address cycles on the
NAND bus to trigger a parameter page read, and then do a read
operation for each page.

But there are also controllers which are not able to split the
parameter page read between the command/address cycles and the actual
data operation.

All controllers are expected to be able to change the read column
though. So let's use a regular parameter page read operation for the
first iteration and use a change read column operation for the
following copies.

The extra command and address cycles sent over the NAND bus are
negligible compared to the amount of data that is being transferred
anyway.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_onfi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index ee0f2c2549c1..19e1be94c7e3 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -160,14 +160,14 @@ int nand_onfi_detect(struct nand_chip *chip)
 	if (!pbuf)
 		return -ENOMEM;
 
-	ret = nand_read_param_page_op(chip, 0, NULL, 0);
-	if (ret) {
-		ret = 0;
-		goto free_onfi_param_page;
-	}
-
 	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
-		ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf), true);
+		if (!i)
+			ret = nand_read_param_page_op(chip, 0, &pbuf[i],
+						      sizeof(*pbuf));
+		else
+			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
+							 &pbuf[i], sizeof(*pbuf),
+							 true);
 		if (ret) {
 			ret = 0;
 			goto free_onfi_param_page;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
