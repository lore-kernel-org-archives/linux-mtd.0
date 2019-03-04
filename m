Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCA1C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405C22070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VarRQMxJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hxOYmFZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405C22070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqp09H5ve6b0Ua9XVPkOjsWwG5qCihpfTBT6CIGHYZQ=; b=VarRQMxJCR9XTi
	0yBm5MXgqEK3ntkzxc9/4j+mJhZGdkbILP0EKCw2eL3BFVWO/TvC6otwtrIZLa9bR7nuQ/CImXJCX
	vqtoiFxFrEJVuvjAIpZUMXv4zh7W8CO/nHLisK3jSO6vNmFmKp5e/dMYL9FA6T9iGr1kYoXsxwb83
	mUVhlK8n/7ia602zNBW/IAKGu5QeGpD1Xgt7SPmiZA/eBbNnpMtjOgnzwZdai2Ad5JVMbmKXVzUax
	fdmK+wpsAqHGFORQd09dNJA72oIHoRqtzOw8DPM8pPvNvLOtG7hOQiveSC8M3uitse4uaRgZJb8Lv
	yfab86y4xAxqGboawUlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wPT-000508-EC; Mon, 04 Mar 2019 22:50:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wMn-0000N8-9g; Mon, 04 Mar 2019 22:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=STqcOgIAIO8MQyICHFg+Corf9CdiHycBzqOrprOL4kA=; b=hxOYmFZ+p0aylmiDL9UTNA+5Qs
 4Cgag7gJXxSPZBXJKvSunGV+5OLd2YLH/ZwtVIu1hCuIgU7n3Hds3nYGaPmY1fq2/ygArUwQFQ04v
 SEc9vJgr5J1QTFlO8xwZRS+QVeqT64AlgnBC0pTr/YHwYGVG5Hwqb+nJgoJvqjzLZoO44YErJsXAI
 aJG0u7gy+5YaR4TA15hFK+SRxdkBaAVlcEFplBM3CJfNBhol2pZhXspWsHSVTUs4/nhYjmUuXL9hf
 1oIgsUlG2tSGauO7AIPK0rLF1SayUXRNQSiXCVLtsDoqVMwFiSDlTtHy4sEdlIkK7r6zYkT3TKepa
 PlZZP+0Q==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w5l-0002w7-Vr; Mon, 04 Mar 2019 22:29:51 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9D2D9240006;
 Mon,  4 Mar 2019 22:29:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 08/36] mtd: rawnand: Add an invalid ECC mode to
 discriminate with valid ones
Date: Mon,  4 Mar 2019 23:28:13 +0100
Message-Id: <20190304222841.13899-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_222950_077652_06DF6018 
X-CRM114-Status: GOOD (  14.05  )
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

NAND ECC modes (or providers) have their own enumeration but, unlike
their algorithms counterpart, there is no invalid or uninitialized
value to discriminate between an error and having chosen a no-ECC
situation. Add an "invalid" entry for this purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 include/linux/mtd/rawnand.h      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 05174c6a3099..f4e85e56a041 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4875,7 +4875,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < ARRAY_SIZE(nand_ecc_modes); i++)
+	for (i = NAND_ECC_NONE; i < ARRAY_SIZE(nand_ecc_modes); i++)
 		if (!strcasecmp(pm, nand_ecc_modes[i]))
 			return i;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index c5bf6bb49329..d25e0c07b0ad 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -88,6 +88,7 @@ struct nand_chip;
  * Constants for ECC_MODES
  */
 enum nand_ecc_mode {
+	NAND_ECC_INVALID,
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
