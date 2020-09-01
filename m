Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07764C433E2
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89DE215A4
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mOT4Nz3V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxTTonRR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89DE215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bzrJ0eJ+9savdsI2ilmh9ccEs41HQs2H/YS+pzZodw=; b=mOT4Nz3VKK5V2VJkT80zWUX01L
	fnr1O/a+VrRKGnBScsjFDF97hAKzRnVZM7WYEPrJDntum570NDwuMj6jZ437YhifXZZr+z94HaH+f
	NFMbUxHoBjIUTFUtwTzXDlydPH+YFg5TdE/Z2q+tXB4WT8jqYNbp+a45Siw0UIn6Zx0URrWC88uya
	yeLqrO/J/fnZCtw8Z/WWlFVa6r3l74Q807QCrcSNCG2JavrdOarLzm8b8eIjt7rnuYh7XI1vVFtxR
	o2t9fASkRHfP/zrxM12EkJirZAE0PrqKGY2UWvldPk0DRcxEaOuccq40nNq6amw4rvXjUGFKQkOKs
	PE4yK4hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8B6-0000dy-IM; Tue, 01 Sep 2020 15:26:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8Al-0000TF-C4; Tue, 01 Sep 2020 15:26:12 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 858AE2158C;
 Tue,  1 Sep 2020 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598973970;
 bh=Ji7tBqTrt9Gluqit0pT2CuNHp+ScPqperCb3R3BIM60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RxTTonRRtLwSkZCojYHmzzpAAVAqDBa5NITg4LvridMsSkn+D0UJegHD4Xqjw3Es0
 RUDJINkCENGy34CQ8DPBCcghDuYxaxWZxVVj/X2U0SLs+6KyW4O/Byvpfmikw8VxNi
 QL5OqU8TUQjBmHyVODbOiRDnCNS80pr1bBiFoZBQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] mtd: rawnand: marvell: Simplify with dev_err_probe()
Date: Tue,  1 Sep 2020 16:25:33 +0200
Message-Id: <20200901142535.12819-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901142535.12819-1-krzk@kernel.org>
References: <20200901142535.12819-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112611_565684_B9899B5E 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 8482d3bd8b1f..52cb7da2fc02 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2759,10 +2759,7 @@ static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
 	if (IS_ERR(nfc->dma_chan)) {
 		ret = PTR_ERR(nfc->dma_chan);
 		nfc->dma_chan = NULL;
-		if (ret != -EPROBE_DEFER)
-			dev_err(nfc->dev, "DMA channel request failed: %d\n",
-				ret);
-		return ret;
+		return dev_err_probe(nfc->dev, ret, "DMA channel request failed\n");
 	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
