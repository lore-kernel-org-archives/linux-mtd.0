Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B74C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc6AXs+8h0hcqUa6boGJ/D30Mw8lX4u+soKHKRgVH+Q=; b=ucSG/yOfC9cBUW
	jVp1RewGGQWtXuf+x7W5nGNnhK7PVA/pP0bN5a5MFvu0etfKB7pEmGPx1luxRC3BjIqpS/vAS18A6
	a81SuOnf1JRDUckRf6o2dk3pzvlDGSy/Qai9s9f7/8HAJvTx0XvKBsXje9oyRRjx93B78xyhdBVTD
	Eb39ERqH+HecLalli/CYvvGOq21ktA4EIRwZqIXQd0rC3Rmj8qRuZMSgiI4Yoq+5U+OM60fZeEYdw
	veJJIqpeOk3Ora2aLuaQVTJ8f+M22FUQL+E9NqWha8Beia7/hR/DG1rTfHtK5KWw5FF8RG+ccl0YJ
	bNzurslYLXABd3AwPw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4qg-004YwO-TB; Mon, 21 Feb 2022 09:19:15 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RH-004Qm3-Tz
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:53:01 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1F82F223E9;
 Mon, 21 Feb 2022 09:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1qkSskWvLmQEwC2wGrqzOG2oXtmYsBZ+OhFkXYPiXE=;
 b=hHPFfZ0EOSAkywDyaOJS6rgoFPXHhnmboaTJY6aTw1sx6m7zN2amzzh9djSoJ87wsr+j1a
 OaiU5IGHCdBCWcnlJqY42gatbUg6YG4Uij1D09w2f4ywfOv8QG94ExJTs/RNo4QRNjql2K
 aPSd8uH+ywIRIjWePrTOOsNNOgIsQ9E=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 20/32] mtd: spi-nor: guard _page_size parameter in
 S3AN_INFO()
Date: Mon, 21 Feb 2022 09:52:24 +0100
Message-Id: <20220221085236.1452024-21-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005300_163627_4CF36756 
X-CRM114-Status: GOOD (  10.41  )
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
