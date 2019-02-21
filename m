Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C72EC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FD820880
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aIBpoOC5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C3KMas+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68FD820880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU/uOHDtuwQQYwdjFAQn8Jy5Ca98izJSsIjJW3QpiKM=; b=aIBpoOC5DQttkZ
	iu9Zjms2uc/7Ijhq0eQJdTQzqHZa9SC47Xl3wOa9hCgKfcvG4e8u9ckyhioVgXUJQZftEfbM5WlaQ
	0w/FlBx1TfeKSOC3Oxq2vPcJh/ykpn/tNa+cR4LEU3fVuGiR35hTKaC9gut7/zVV4PQBKT4R0qUDU
	dYspl2nM2/0qU7DiuK6HrbgLLYW4xSktGjfG8Sq2OnQk8fpqZItusJCERWGdTia2hlkRDSKLizmVI
	JQm5hDl1ooypAj95UtAjXoIMiQux9gZzHgXpv0ekJNgDO6xbMTRbuhJiLlAUpOyGXrgGvbImVz6Rx
	birvE7LApwNcm11rokPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkfj-0006OJ-8I; Thu, 21 Feb 2019 09:29:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkeN-0004eF-JQ; Thu, 21 Feb 2019 09:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5VF+gNYgoXrPF6c9ZOTjAYlBhRxATSJ4Yi7DrRUC/c=; b=C3KMas+e8vgrtFoKyZWYWD0hCC
 yh1FXqSkcunP2Pgt9ohD5xFEtMB8/wgGdn00yWJHnrC1g8PfyndNbD2nYaBuw972FUhcusAdiow23
 nZ8tqV3dU66k/md//+X4z89RJ7PnFpSHmYZjmrk6B28GJSG7vrGZZ7WTUnHs6zS3HZB6HPUM5FqCI
 ziQkMjBEXznonPK0NSgbsAv3RGqB6Cj3qcmgTOkz4HhVOloeBDlekzpWjKP+zCVL5NRXM0bykJ1/g
 oxeygVtgDDPe5f8lvJ79/fmT+crf5lzwsHgybpGG7IiKLH2QqH2LrBBzdOQJUnSQ9p6YcnWX0j2tD
 KOkHaHsg==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkeK-00072w-Lx; Thu, 21 Feb 2019 09:28:13 +0000
X-Originating-IP: 90.88.23.190
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 71E4F40006;
 Thu, 21 Feb 2019 09:27:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH 1/6] mtd: nand: omap: Fix comment in platform data using wrong
 Kconfig symbol
Date: Thu, 21 Feb 2019 10:27:28 +0100
Message-Id: <20190221092734.21634-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190221092734.21634-1-miquel.raynal@bootlin.com>
References: <20190221092734.21634-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_042812_862883_92B20B42 
X-CRM114-Status: GOOD (  12.99  )
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
 Julien Su <juliensu@mxic.com.tw>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The symbol that is being used in the #if/#endif bloc is not the one
mentioned at the bottom.

Fixes: 93af53b8633c ("nand: omap2: Remove horrible ifdefs to fix module probe")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/platform_data/elm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
index b8686c00f15f..fef4b081b736 100644
--- a/include/linux/platform_data/elm.h
+++ b/include/linux/platform_data/elm.h
@@ -60,6 +60,6 @@ static inline int elm_config(struct device *dev, enum bch_ecc bch_type,
 {
 	return -ENOSYS;
 }
-#endif /* CONFIG_MTD_NAND_ECC_BCH */
+#endif /* CONFIG_MTD_NAND_OMAP_BCH */
 
 #endif /* __ELM_H */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
