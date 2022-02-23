Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B109C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLc+FJS5ycFCd88Rk0lHIQ9pYnIrntunnG1S9H1mv1Y=; b=xbN36Ho3qYhkNJ
	pCthPQlqLmlJ+rkBWnn+UzXVXfpVft23nQNKLpuxGAfM9u1o3Om5CIk8soB3Evy3OzhWzhV/zn1ZG
	32wlO2Ms3MdLfrl81WdiOoxoTIfGQ9w8mXDjLehTd9dpBWjBr/Y1OPyWlbEYDcuc7j9fynHF/rFf5
	yCCtLte6WARTaZWWCLre9iOVmKKEMdiTbTy9nDnwVHMXC4UrOlS9pbFx/0BkqK7F2I03lShTdIH7L
	OyINUaK2zHXGwN+0hi25BMSsqGb9CNk+MoA0rYCGaicqpOMp8L5kSFAPCWlG0qBYPfCtgcVpuw5DO
	hPMJqIeFu5OHboky8qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrwh-00EZiN-Na; Wed, 23 Feb 2022 13:44:43 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwA-00EZPY-Ue
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:13 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C703A223EF;
 Wed, 23 Feb 2022 14:44:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8kj4z85YfDGYN2RrUp3+LkianQys9bzXdTacdc1Pnc=;
 b=AxsuG8vXO9+h5o+EyNbLQvDDVbifVrpxYWBmO4JuUcu83pLI42vriNP8abeqE1Ih7Up2Pk
 VPrqFnxR5JE6nI7Y+agHg8dLtKbuoCS45CKYW+Aadd4naEBNO+kqMFuTcvljxu86ic6XNz
 TgzQXAMaMYAdElA6IixeV0FFloAMM+I=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 03/32] mtd: spi-nor: eon: unify function names
Date: Wed, 23 Feb 2022 14:43:29 +0100
Message-Id: <20220223134358.1914798-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054411_577888_2DD701EC 
X-CRM114-Status: GOOD (  12.95  )
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
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/eon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index 4f3ee6331f37..8c1c57530281 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info eon_parts[] = {
+static const struct flash_info eon_nor_parts[] = {
 	/* EON -- en25xxx */
 	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64)
 		NO_SFDP_FLAGS(SECT_4K) },
@@ -32,6 +32,6 @@ static const struct flash_info eon_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_eon = {
 	.name = "eon",
-	.parts = eon_parts,
-	.nparts = ARRAY_SIZE(eon_parts),
+	.parts = eon_nor_parts,
+	.nparts = ARRAY_SIZE(eon_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
