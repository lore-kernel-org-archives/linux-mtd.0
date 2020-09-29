Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FD9C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E13020897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiI3kNzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E13020897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YQn46TbHtBnv0rETXDZDkxEPXKeL4GjN0vDqJ5NVa9g=; b=aiI3kNzrXuoacj+/9UEo3aEPT
	g85cnFayh+pvh6Rs7gZcx+rYhYhkKzGzu0Oy1WNgR2SAEG18KK446EYP2pDOyFWwzYSL4V1NhKiqe
	CnQiJlrWPeIMcBD++FPr2duflmw8/SP/UhfJkCpg44nWWmneI3e2ArCVZeuOQoOL5eU3EMrvl84rm
	I8e4HtKxoiGnfBSSgZMhHwULUsc0trf6ejZOHQIa+/wC7wIk1QYAGyduVLnJYZoaRs8Y8w4EJoHUt
	maXdOea47kolOly0WfnaSer9NOTcf/CZHHK/6OyYLB1ousxbiFrD1GI4FegnzxA5yA0FTXtnDf5MG
	fL+J3GO7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdb-0001SQ-Kx; Tue, 29 Sep 2020 23:02:23 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcw-0001Eb-Qp
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:44 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1D14D200014;
 Tue, 29 Sep 2020 23:01:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/20] mtd: nand: ecc-hamming: Clarify the driver descriptions
Date: Wed, 30 Sep 2020 01:01:16 +0200
Message-Id: <20200929230124.31491-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190143_035579_108FE616 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The include file pretends being the header for "ECC algorithm", while
it is just the header for the Hamming implementation. Make this clear
by rewording the sentence.

Do the same with the module description.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 2 +-
 include/linux/mtd/nand-ecc-sw-hamming.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 76966f5ff13f..a17faed374a8 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -481,4 +481,4 @@ EXPORT_SYMBOL(nand_correct_data);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
-MODULE_DESCRIPTION("Generic NAND ECC support");
+MODULE_DESCRIPTION("NAND software Hamming ECC support");
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 30a0cfa50eed..85e9a929b5f9 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -4,7 +4,7 @@
  *			    David Woodhouse <dwmw2@infradead.org>
  *			    Thomas Gleixner <tglx@linutronix.de>
  *
- * This file is the header for the ECC algorithm.
+ * This file is the header for the NAND Hamming ECC implementation.
  */
 
 #ifndef __MTD_NAND_ECC_SW_HAMMING_H__
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
