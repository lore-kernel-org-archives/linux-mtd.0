Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC58FC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D75520678
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RzrFKBTc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D75520678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrI9bPpqRJs7RgArMBSKoRf5BCnk4nR4Iamm+olR2/g=; b=RzrFKBTcdriUoE
	+8rCMgCvcH6wa3WP/JjPnp/A2HJ2hLHVRY+uWlYYc4R9UUSS7w3W5LhhNyCxDH62BQd7R8NeUTKlB
	mVgi0mf0sQQwfgxH7XPyLs2SToShksVt/gZE0zvwNZMgJm2FUUhNkaeHhpfuAwElyw5ne1Z/nhH4O
	Sdn9RU3VkadObEx7G8Ndc44yZqmUlwGkF4FmCZUeVfiTS0/x4hdkalZOndpNBYIhIQ5/JuZqhb4S3
	nbIopK+NqrEsxlTNXypP5mvJcg0bmPzzrHCNKOrFbJ9H847u8VgylzJ3Pcz5KyyNiDkKY/qmCmLPu
	ROJERQ0q+zd2jsorKygw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2Q8-0000Kx-OU; Thu, 19 Sep 2019 19:48:52 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2AN-0002RD-2J; Thu, 19 Sep 2019 19:32:37 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7197D240006;
 Thu, 19 Sep 2019 19:32:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 22/40] mtd: nand: ecc: Clarify the software Hamming
 introductory line
Date: Thu, 19 Sep 2019 21:31:22 +0200
Message-Id: <20190919193141.7865-23-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919193141.7865-1-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_123235_307325_FBE42812 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
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
