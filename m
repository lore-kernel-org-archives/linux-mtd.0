Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5B5C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:48:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DE82070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQjPjg72";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e9DgydfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DE82070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JX2Op1cVGkMbEWN1kfWBVI3XZyqywuG7FOhdX+G5Jw=; b=GQjPjg72rsxKeg
	nFDqPrz+PT3GokSZjR9azIktpP6QN1jMQAENYRBe+9ILmkOXMJyOgYRJ12gmLh1ac1yj7A+eoncgq
	hfbTmg2adYPrfn9g4zb9jlF/cqGFqOYtRP8Wresx0ArVCBZolPbCoCsGMLLjf5S4l8H9BAShZvA3G
	IHsJCfC6uvmFQoTa15tJEXGL+xQEm2dF5mqoYzZ4KJYXxC32mwUm3isGKDFR6kvg1s8qXCSI6mOdh
	L0JQiC/6NeWFYmDEPzbSHHBBpGctC0ZbFd2FeIY3/OYv6JxPiiZ98rowPQ9mSPChHpBYEBZSeopMT
	ll+8+jKT+nu+0VStYF7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wNz-0002NP-AS; Mon, 04 Mar 2019 22:48:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wMh-0000N8-Ux; Mon, 04 Mar 2019 22:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C0xZHVxU5eut+4nBFhQLvfU/KD70+/8knYttQoRMFaY=; b=e9DgydfXJ7vASOXljKiPeLmA6K
 EndataHzxWSjZZcS/4WOzLh6PMGanzCAGJJQI9JMvyT/yNL8ywioNOOo6Bz1vZFx/X7UN7Xb7pTvm
 rjldT8kIEJo47pgQ0eOd5G1665G1xyLfSxDCu56LJsYDm5vOzbLjNDEv2Cu4jYarp+mHFqOPe0D/b
 thD+lDIwNi2wtUerEDOVpre/l6Jha804+L3sxJ3O/DYsYr3VFUS0VmCkSV0dC77VTL+PxEIjGPib3
 h8BuMezCdx/CZeYh77IYnAnOJi4i6oKjTV0etMSSw7eV42KTGfodp+MMaX7MnDkeJFT/HBjcrwEAU
 n6hbCiWA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6r-00036Q-Q8; Mon, 04 Mar 2019 22:30:59 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7E82024000A;
 Mon,  4 Mar 2019 22:30:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 20/36] mtd: nand: ecc: Clarify the software Hamming
 introductory line
Date: Mon,  4 Mar 2019 23:28:25 +0100
Message-Id: <20190304222841.13899-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_223057_874856_83E90AE8 
X-CRM114-Status: GOOD (  14.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The include file pretends being the header for "ECC algorithm", while
it is just the header for the Hamming implementation. Make this clear
by rewording the sentence.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand-ecc-sw-hamming.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 1bd7493c682b..4ce99fa574e3 100644
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
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
