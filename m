Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA938C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeB8unU98QbK7yJXwnSGn/dKSfANvPAUjhDnQZFao5k=; b=3Hqzs7msTwkeAS
	gYrEQtVH6r9NhxQqZFuIoZJGOzr7I/RrRQKzvzsdtcdjn6JjORqIe5vsgW4ksSo8StD3wq26QtUHQ
	GMwu9c8J2VXOQfEuDCH0TyJgsm9cTxxiT48dclPQOsY6iZOPL0V3ask8iTTXTlvAvUZj98hoWW7g/
	LizsTpzYtpbnLQql1bSvSbGXNALvejgbE65du/m5R4+oemHINNO3xTSDh09mHGx4WkeCCyUrLtAfc
	LoXpbfbQokpq7bfczqX9CgGXkOcLiLebHNd78YDxjAnz/Wh7QJK2+tY/wfcCHaG9Ob5S57lpCcBB4
	mD3+3GSKDRNgspmJ4D4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4dc-004Vmv-9a; Mon, 21 Feb 2022 09:05:44 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RE-004Qhm-1H
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:52:57 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4E850223E9;
 Mon, 21 Feb 2022 09:52:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azbyCn7H63CLfj7AEiVLfqfkqDigt6V0iDcOpCpZu90=;
 b=oiChbbiJvJXftHzTRNKSFG1UHrZR2m0zarw+YsG2KnGtbFaoFmbuqD7FhU6dZtwGEYH7vA
 vPxJuP73jXu4dvoBJTc+TaMFOYnp4qHDtT4JuCRJQ52OxihxxePOeZ2ZnuKAZH8dyKgg14
 AvBTAPeG0OugMwBo01TeeYyGr7nyPdc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 09/32] mtd: spi-nor: issi: unify function names
Date: Mon, 21 Feb 2022 09:52:13 +0100
Message-Id: <20220221085236.1452024-10-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005256_267314_52174030 
X-CRM114-Status: GOOD (  13.08  )
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
 drivers/mtd/spi-nor/issi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 23629b919ade..c012bc2486e1 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -29,7 +29,7 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
-static const struct flash_info issi_parts[] = {
+static const struct flash_info issi_nor_parts[] = {
 	/* ISSI */
 	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2)
 		NO_SFDP_FLAGS(SECT_4K) },
@@ -69,18 +69,18 @@ static const struct flash_info issi_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K) },
 };
 
-static void issi_default_init(struct spi_nor *nor)
+static void issi_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
 static const struct spi_nor_fixups issi_fixups = {
-	.default_init = issi_default_init,
+	.default_init = issi_nor_default_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_issi = {
 	.name = "issi",
-	.parts = issi_parts,
-	.nparts = ARRAY_SIZE(issi_parts),
+	.parts = issi_nor_parts,
+	.nparts = ARRAY_SIZE(issi_nor_parts),
 	.fixups = &issi_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
