Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCA3C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD38613A8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFD38613A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCAHrjQDmMdtXHGltIvacFmXr/mxteS3bNQ9Glx8Imo=; b=zYFOfiZN3nJvDi
	A+CBhzEucG7jQ5JCtZvceFLLb1k9sBONolE8gpYZ3h41al41WsDzJrWFvPxfBvcZVivBXHb4cRky+
	2O+StU/xYfQJ7hLHPNDMXaFltlF1VQK6dvBCzpK/xppGCuNkG+74mPhAGLQIAGTeJxiWeJ02c7mHg
	mnr5PHBEclaZekKcv/d2v6PHavegkZyV70XN9COu8AJOe91LeyKEfKkyqJjjQMkqZs0u3v0PUaCvC
	ZYsN/7E+F3QNfJi631rw6J1/jZP644yT21vjzIDPucS6oEGTkirAb0EGM9tKdQIbsrnSELgtjFdYC
	I1YBB3PlvPJ4EDqQ79Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCl8-004nyx-4I; Wed, 20 Oct 2021 14:40:02 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCa0-004kkS-3F
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 14:28:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5C0F52000D;
 Wed, 20 Oct 2021 14:28:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org,
 Mason Yang <masonccyang@mxic.com.tw>, Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH 14/18] spi: mxic: Fix the transmit path
Date: Wed, 20 Oct 2021 16:28:05 +0200
Message-Id: <20211020142809.349347-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020142809.349347-1-miquel.raynal@bootlin.com>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_072832_317106_02081D94 
X-CRM114-Status: GOOD (  11.16  )
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

By working with external hardware ECC engines, we figured out that
Under certain circumstances, it is needed for the SPI controller to
check INT_TX_EMPTY and INT_RX_NOT_EMPTY in both receive and transmit
path (not only in the receive path). The delay penalty being
negligible, move this code in the common path.

Fixes: b942d80b0a39 ("spi: Add MXIC controller driver")
Cc: stable@vger.kernel.org
Suggested-by: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Zhengxun Li <zhengxunli@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 45889947afed..03fce4493aa7 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -304,25 +304,21 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 
 		writel(data, mxic->regs + TXD(nbytes % 4));
 
+		ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
+					 sts & INT_TX_EMPTY, 0, USEC_PER_SEC);
+		if (ret)
+			return ret;
+
+		ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
+					 sts & INT_RX_NOT_EMPTY, 0,
+					 USEC_PER_SEC);
+		if (ret)
+			return ret;
+
+		data = readl(mxic->regs + RXD);
 		if (rxbuf) {
-			ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
-						 sts & INT_TX_EMPTY, 0,
-						 USEC_PER_SEC);
-			if (ret)
-				return ret;
-
-			ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
-						 sts & INT_RX_NOT_EMPTY, 0,
-						 USEC_PER_SEC);
-			if (ret)
-				return ret;
-
-			data = readl(mxic->regs + RXD);
 			data >>= (8 * (4 - nbytes));
 			memcpy(rxbuf + pos, &data, nbytes);
-			WARN_ON(readl(mxic->regs + INT_STS) & INT_RX_NOT_EMPTY);
-		} else {
-			readl(mxic->regs + RXD);
 		}
 		WARN_ON(readl(mxic->regs + INT_STS) & INT_RX_NOT_EMPTY);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
