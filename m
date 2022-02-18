Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDE7C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc6AXs+8h0hcqUa6boGJ/D30Mw8lX4u+soKHKRgVH+Q=; b=UWRvm96L0KrL8b
	Ti8twvCF5CZrFPCyDjp+NlwgWiZbSDHuD7Wt3+rxHbzt+8+rjEUeZz0Q7cP0yJDFB6TxnvI3qFIn0
	MxNX/urfJMyAIbPP91P4DwjDJp58X6dcI2zp4BpIE4dlnG35bBckSdMPlx/g0jlssWPbrjsiI+uIy
	HYM2P3Ut8g+ywF3seoVNCTrjYwMa2rOQvGlPvpMB7m27RAWfin4oRRwzdKb68we/N+GJxjezMq8WE
	LYuDnh55l6Gpkhqwud+XxvNMwKvLIUAaHo64uNyLzAl1EoMLroOi3kauJvUVCOuonlLWsdlxuAHLP
	mpNhGyT8wAQK54Q7dedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL1rc-00E6Wy-LE; Fri, 18 Feb 2022 11:55:53 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yq-00E1RS-DZ
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:31 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C2E5E22481;
 Fri, 18 Feb 2022 12:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1qkSskWvLmQEwC2wGrqzOG2oXtmYsBZ+OhFkXYPiXE=;
 b=XSz4LNMbooEbXcRQOseQgXnotQJAnFwsndRLU+lCPy6C4JE4ii9/k2xvT8PDEuhZM98Nyo
 5mRBSlX58/b1EAos/8XFaMo4seIBFDzxiElRWPRFavoN27PrD81OVBgD4U1aPZ3jp7qXlP
 SiqwW7VAM00pT+JyY2pezsLkp1it4es=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 20/32] mtd: spi-nor: guard _page_size parameter in
 S3AN_INFO()
Date: Fri, 18 Feb 2022 12:35:55 +0100
Message-Id: <20220218113607.1360020-21-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033628_647354_92D021D2 
X-CRM114-Status: GOOD (  10.06  )
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

The _page_size marco parameter was missing parentheses around it. Add
them.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 446218b0e017..3c37b46d60d5 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -469,9 +469,9 @@ struct flash_info {
 			(_jedec_id) & 0xff				\
 			},						\
 		.id_len = 3,						\
-		.sector_size = (8*_page_size),				\
+		.sector_size = (8 * (_page_size)),			\
 		.n_sectors = (_n_sectors),				\
-		.page_size = _page_size,				\
+		.page_size = (_page_size),				\
 		.addr_width = 3,					\
 		.flags = SPI_NOR_NO_FR | SPI_NOR_XSR_RDY,
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
