Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB50C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43FC92071A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCiMveFx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YC95SYRz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43FC92071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWuhXfutMO7FG8JznYWFnw8N+t91chCDkbNXK+ROuIc=; b=WCiMveFx7x3PXP
	dd9n6C1lmoM8XUlmtUQ+5e76kyh2PujPm8ktHhYLqxfFLhHl/GYhJ/hXGCGn2GboRXzbwrfcIdYt1
	KYjPx8D5HEpCUYMV1k5CQ02qHKm+8pf4Lva4p1sTS4SbaDxPR59occMeqG8qWU5M68pSJdJ+uD0t9
	g1gWRFzOZ+IzqcaxSFrnclc74jvsV2/YFojtAyZjaxwPsEtJvlALSfevfm5NiFXn+XPjS9/1msgfY
	HIxgSLzix9YVzL9S+/E4BnR9qAupKIaRGPsFFOwPA6Ytf1Jy20wdMRIRN+cbjvfUeqEra7oEgMXXE
	w8MGxFw2vp/WVsx1xy0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd9I4-00048g-VD; Mon, 25 May 2020 09:21:00 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9Dq-00070I-Ig; Mon, 25 May 2020 09:16:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P9GXUu076795;
 Mon, 25 May 2020 04:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590398193;
 bh=yw3uCae+isK3AHGXPUAgu6JyO09SGQwwFtzMuvBbEew=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YC95SYRzE78CfpbDadyGOawCFBf/RQ2EiqkTUA+6RU3rIDYIEdyxvBQXuLi+tZKuh
 abd6rRxXhdKfNNRLYv7EhRjHQRrJhlzp01lECvC6DUIhdVXNpcRnVPDYvSA8GZM+Wg
 YPSjapBz7fez1NL3Twuuj3WFvoyh8m+Zlfc3zmZA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P9GXXc098415
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 May 2020 04:16:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 May 2020 04:16:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 May 2020 04:16:13 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P9FjA4034800;
 Mon, 25 May 2020 04:16:08 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v9 04/19] spi: spi-mtk-nor: reject DTR ops
Date: Mon, 25 May 2020 14:45:29 +0530
Message-ID: <20200525091544.17270-5-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200525091544.17270-1-p.yadav@ti.com>
References: <20200525091544.17270-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_021638_782993_9930FED2 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Double Transfer Rate (DTR) ops are added in spi-mem. But this controller
doesn't support DTR transactions. Since we don't use the default
supports_op(), which rejects all DTR ops, do that explicitly in our
supports_op().

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/spi/spi-mtk-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index d5f393871619..b08d8e9a8ee9 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -211,6 +211,12 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 	if (op->cmd.buswidth != 1)
 		return false;
 
+	/* DTR ops not supported. */
+	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
+		return false;
+	if (op->cmd.nbytes != 1)
+		return false;
+
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
 		if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
 			return true;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
