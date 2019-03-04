Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3E3C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E205B206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uudXNZ3o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z6DvBcT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E205B206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAcSpVcyB7Ie2nax0XMG09sfzsV7gI7qg4ul0x+1ftM=; b=uudXNZ3oun58lB
	gSOyYio6dtm2oI5pKgi+ym37zSE2zxNAaaImGoI81JKUy+j8fIydHa9PFZEsD8bO9G2atm4tbqaXA
	iXpcu3QMLcNT4/YWHZ/qu3v6WgRvfJljF3xgVox/jmwU1gLYE0uDocUowOaeWDE/ZpGvtFIJuGn3S
	IkHG266bLi3GkWp3sgOEN6HeIl3Z0RUvbO0M5j/RsNg508XwZRU9BZY1co6zZqfiaxTF3uDMo0dCe
	r8zAhtchi6POcm+doeFpN4a+RQeBSfQFPyW+I7b/RGmmHzbADOry3ybW23KG14ZDUgYl5n6FIPQCk
	ApVnEKTnnw5zk8CVB0LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wkS-00008v-7i; Mon, 04 Mar 2019 23:11:52 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjS-0007DE-GX; Mon, 04 Mar 2019 23:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=paHqY1gVLmb3fF/WCr7pektdHu8zbKhb5DDQjcsSYHY=; b=Z6DvBcT9u7cNynX2tv1nmKwwOq
 g/PLv0y4MkswbrZUKqona90OtV34Un93sEGaKxUCt07nCqtGSxWGUTMOLUuaSNJJ82+5JPhEMEI1+
 0NMsVUJEPBQDHAxd6jwXRrKlhLxKhJRzUEbvlvWQNlf3m9uME9FLqnwPGktK29taUAd0qX1vZVSVE
 VkHUSorIw5j8SnILxcXcVX7F9VD3EcAQFtUPv+Ecrp7MKuShhDuWxiNUHE6iOPOMninZCzSvcueTD
 KRuTtlfd/LMgxFbW8lGSirGC/XT3HwBODMP2oSrPzsvTdXpRvbFtbwUC5DmeHTKmj/3o5x4RU6VH1
 /rhltdRg==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w7p-0001Eu-UX; Mon, 04 Mar 2019 22:31:58 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C51C0240009;
 Mon,  4 Mar 2019 22:31:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 32/36] mtd: rawnand: Fill a default ECC provider/algorithm
Date: Mon,  4 Mar 2019 23:28:37 +0100
Message-Id: <20190304222841.13899-33-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173158_133995_77370C11 
X-CRM114-Status: GOOD (  10.57  )
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

The raw NAND layer may want to use one or another ECC provider if the
user did not explicitly broadcasted his choice through the DT. Raw
NAND controllers can also want to force these values. In any case, the
NAND core must be able to know their preference and this works by
letting subsystems/drivers filling/changing the "defaults" ECC
structure.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3149af72f519..f4b9374a8729 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5596,6 +5596,13 @@ static int nand_scan_tail(struct nand_chip *chip)
 		break;
 	}
 
+	/*
+	 * If there is no specific user request for the ECC engine provider, use
+	 * the one chosen by the driver being instantiated.
+	 */
+	chip->base.ecc.defaults.provider = ecc->mode;
+	chip->base.ecc.defaults.algo = ecc->algo;
+
 	ret = nanddev_init(&chip->base, &rawnand_ops, mtd->owner);
 	if (ret)
 		goto err_nand_manuf_cleanup;
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
