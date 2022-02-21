Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D78C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAKY1zbqqYCEnpJy7N2aVDGi6sggXcM1kegym6v/xCc=; b=BjuXQ163Eb7WFo
	zdAY1cp/P37WB9wpgzesQeZ0g+t6R8EN5ZNza2QBJD1UGbqpebxeacnt2HafFa2OWz9GjAgH7Ua8o
	Uo4A5xBc+EwIxxBFk9CrgtHev7at94ikH/sIG60xiURAznVCsxzFiBHSaL6dNuCOl4jag5rzTYXxz
	o1QneIp8GsmBVwkItWbn3l931INQolaRBdCWA17naa6XWLlc1VIvN2LK8ElvsvGRMcDFHKBs4Eb0B
	5yr+84sWuFq2PgJQV39oG11daYV3dlsQoTFAmn4Yirr/t+lZMEEo7udps8lGfRQ4na1wVIHvrjMsn
	uRlMkCLUjq7YxOwDkhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4Ui-004ScP-4Y; Mon, 21 Feb 2022 08:56:32 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4R9-004QeJ-6Y
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:52:55 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ED9EB223F0;
 Mon, 21 Feb 2022 09:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hmo81Sb3vYtqKwqBd4CJg7BRHgMci0G5Rym0Baoee0U=;
 b=Cj4+KySZw3sulmGqPSfPjhZ0OLoSBRtGuq7rUQmGN65ntKdWtFCmARaS6GEtfSgjuF81kq
 wSRhf60y5iR0QpTi1+wINTCdsb8n7RGiZ2yRIrMp+rTj/CRBqyrqwVpQG4FVrga95n9Kdb
 ZIPw+WBYfZ9u5yy+XE1zEmKFpP+PlMo=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 04/32] mtd: spi-nor: esmt: unify function names
Date: Mon, 21 Feb 2022 09:52:08 +0100
Message-Id: <20220221085236.1452024-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005251_557188_C66CE806 
X-CRM114-Status: GOOD (  12.89  )
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

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/esmt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index ace1da221566..79e2408f4998 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info esmt_parts[] = {
+static const struct flash_info esmt_nor_parts[] = {
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
@@ -23,6 +23,6 @@ static const struct flash_info esmt_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_esmt = {
 	.name = "esmt",
-	.parts = esmt_parts,
-	.nparts = ARRAY_SIZE(esmt_parts),
+	.parts = esmt_nor_parts,
+	.nparts = ARRAY_SIZE(esmt_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
