Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1272C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:16:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A671220830
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:16:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShhnPEIF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OVHZ1mZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A671220830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPAJI1ZgH1q6EH1xtNsJgkuK+psmLQqQ+ITxWQ/xqJs=; b=ShhnPEIFBdKY5X
	EbOtJx9Lemt9C/bhrcsOPTdsNs3CZWvqA0i6nepTglHXAMKBIyvcZwBW7vZLKwM+1zYzokRYNwj/5
	HEG7SztlcjQKcQnQsYJ2aS7MJYvo38Fo1uBUJIHETI8jT2HJKgpvVflaW3twjzhmaBN7a7XUptd25
	2+uiCGH6fpNmtHRfrCL1AI7h4s20zOiWNA4HRfn/m+fkhh7zhVfoPnxHSE+QXOVE7hDcxLReMsz3s
	T87B4BeFwxqHPI71kOFmFZjL2ymTSHjqu+cQDorriAzOEGlZwkfXxUvv2Selk5nay7iuv573wphWq
	NS8q4rH9LAg7qiZlf32A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wok-0006tq-V9; Mon, 04 Mar 2019 23:16:18 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjk-0007DE-Rn; Mon, 04 Mar 2019 23:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ylaYu230je7Z9TjzYiSP6GcquiVm2ydxjjliHqUTEtw=; b=OVHZ1mZWOXJCe1fTYLu2KkthL8
 sg90BfIcaao/+8MElrbwP9kyvwyboQikKuDAG2GiYKqEwmq9gVyIVCrzFOgmlsJaPpVQ+lkZ3cZBj
 gdukcl+g/rTkVRdwx2qjVPl9VRIC1dpATAVDQOT3e2PVRxHu23ibBKBVZWnyU4CwXJ0EPkFuU6XJB
 TbWMzlVp7fGJ2jQhuYR4ILWm2VF6qJtPpou31Zc/XmYK1lioONi2GOx8zxTZ/9gX3CI5h3godkfbU
 e8B1z/5Y8PJX3WFmascsQAGG8fWjp/OdipXj15oBP6GhztCXU2guLWbWJrt2ufP7AOqlmzEMYI5oI
 kJK7ec3g==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w5r-00014v-LB; Mon, 04 Mar 2019 22:29:56 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 834A5240007;
 Mon,  4 Mar 2019 22:29:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 09/36] mtd: rawnand: Clarify the values for invalid ECC
 mode/algo
Date: Mon,  4 Mar 2019 23:28:14 +0100
Message-Id: <20190304222841.13899-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_172955_876011_D789F050 
X-CRM114-Status: GOOD (  11.07  )
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

In the nand_ecc_{mode,algo} enumerations, clarify the fact that the
value 0 will be used for invalid/uninitialized data.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index d25e0c07b0ad..95b0c7114701 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -88,7 +88,7 @@ struct nand_chip;
  * Constants for ECC_MODES
  */
 enum nand_ecc_mode {
-	NAND_ECC_INVALID,
+	NAND_ECC_INVALID = 0,
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
@@ -98,7 +98,7 @@ enum nand_ecc_mode {
 };
 
 enum nand_ecc_algo {
-	NAND_ECC_UNKNOWN,
+	NAND_ECC_UNKNOWN = 0,
 	NAND_ECC_HAMMING,
 	NAND_ECC_BCH,
 	NAND_ECC_RS,
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
