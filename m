Return-Path: <SRS0=zNLG=MB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FC3C07E99
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jul 2021 09:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A127761107
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jul 2021 09:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A127761107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YbD8Xhz1qCClxwRclBnNPuOBhl+zrXeyuWVKqWIA9SQ=; b=Oz/3m3S7TjyhY3
	8+N+zxdkkEP6J8+7T2rhOtmg28w6A0ZxX/XkHABqc5l88dwnzt61WoFft7rvHD9pGHIRBXuU2dHlJ
	OKgU6LctONdx2RXSZq+PmzcCwAikOOHL25UDq1oy4KRiJOX0EtfxrO5qe9fjlUP6XZq45z43KMbm5
	cOK703TOr3M9IDFcMRLSHTYFJXHNjtPQEcBYtLFZ9N0ost0RIaqEmDvN4sWSCEUUv/fxeE4aDQ8zR
	23qp0H+dMcPeM1t8iDC5+inuz4RTlJz17NmXSRhuU59LN/i9oJR4MQgrOpjaIkdEv3xD5MqNe4gvz
	kbtRrMfhU3PllJA6yUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1mvV-001MJv-AC; Fri, 09 Jul 2021 09:36:05 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1mvS-001MFD-BW
 for linux-mtd@lists.infradead.org; Fri, 09 Jul 2021 09:36:04 +0000
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
 by mail.ispras.ru (Postfix) with ESMTPS id 1FA0340D403D;
 Fri,  9 Jul 2021 09:35:45 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Evgeny Novikov <novikov@ispras.ru>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lee Jones <lee.jones@linaro.org>, Pan Bian <bianpan2016@163.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: [PATCH] mtd: spi-nor: hisi-sfc: Remove excessive
 clk_disable_unprepare()
Date: Fri,  9 Jul 2021 12:35:42 +0300
Message-Id: <20210709093542.18718-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_023602_610210_A5888789 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

hisi_spi_nor_probe() invokes clk_disable_unprepare() on all paths after
successful call of clk_prepare_enable(), so, there is no need in one
more clk_disable_unprepare() in hisi_spi_nor_remove(). The patch fixes
that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 47fbf1d1e557..516e50269478 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -477,7 +477,6 @@ static int hisi_spi_nor_remove(struct platform_device *pdev)
 
 	hisi_spi_nor_unregister_all(host);
 	mutex_destroy(&host->lock);
-	clk_disable_unprepare(host->clk);
 	return 0;
 }
 
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
