Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HoN6EjFOBDEanKB/hL5mkK8MsX2svdFXPDfYRseTc0=; b=orD3IaBUXivasx
	oQiZmHKWhpHOX8ye0AIkuEgXxxPO05HM/MK51kQxr9OFS/lDYzGqZfOJQPA6exAQ2ghABmbqNRqnq
	awSL1UNpOv0PlWmwBH9YBagAsQ+f97HWOCH8kirvwuo3aDoh+oXya3RsN7IUY6eRuFsYxSw2NWitS
	Luvi7H0ztRnEDpBTI0dcVWcm4AiDtstkr1IiKut0IUjoTxGqX67GQDgfPzTr87K/Iv/NjESNnb7Sn
	HCRlMFp9mnoAeE0hukuZ5pOrd7YxX7bgzzzdcHioUWxmP/69eMMwdJeeLCaS2qgDZVCyD09j82CYw
	wlNSMnASUympIkOMILGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMryr-00Eac9-Dw; Wed, 23 Feb 2022 13:46:57 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwD-00EZRW-Ox
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:15 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0B3D4223F7;
 Wed, 23 Feb 2022 14:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/hqMmrzoRoWJwWZtaVFPrkzeSIrjpsXVnI5pXFm2mI=;
 b=rWHU3XMSc9yDw4CaREp4+r+PVuUFKynLVjbDw+k5HlZxM3X+Dhe728CMAX9eA4f9ZMxwlZ
 WabQzo+evyBYcRTXXieO2x/Y7G9vR+B8GOO2ARO94c19lUNfVAceQoydBkEtEksgLJYFVP
 HzKmWuYHKL+7JpJ8eowB4ujfj0u/6H0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 06/32] mtd: spi-nor: fujitsu: unify function names
Date: Wed, 23 Feb 2022 14:43:32 +0100
Message-Id: <20220223134358.1914798-7-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054414_037584_7B0AEB88 
X-CRM114-Status: GOOD (  12.69  )
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
 drivers/mtd/spi-nor/fujitsu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
index 5fa8f04f2e35..69cffc5c73ef 100644
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info fujitsu_parts[] = {
+static const struct flash_info fujitsu_nor_parts[] = {
 	/* Fujitsu */
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
@@ -16,6 +16,6 @@ static const struct flash_info fujitsu_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_fujitsu = {
 	.name = "fujitsu",
-	.parts = fujitsu_parts,
-	.nparts = ARRAY_SIZE(fujitsu_parts),
+	.parts = fujitsu_nor_parts,
+	.nparts = ARRAY_SIZE(fujitsu_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
