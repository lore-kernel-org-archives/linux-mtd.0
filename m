Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC29C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbQx1eS1+3Z09be5fFQ0ET2ssQ5Q1EWvjoFqR8i9ezM=; b=AVJF+SOafJYEaW
	JoWgpk4WN7IlebDRjCFQ28IOkN88lnXBJRe5Ti7+87QjhfU9bfYWc3LCmEeLdV4trjfcEPhDaNqN/
	WalkVcexq+WdhBlvjdZgIdGiCwlS3Ay+nYdrzttMV4Bmg0npYqNifZJwulChTXPC1OvA1NPiCOOnh
	eXzJpDvSW8xqprMBfIZ8xTb/VE9HBsDjqn4IpJ/l2icpAGIIdptRdOrETUB/5eVyodV/dFLfyo6sO
	6Dl62g/QUWivqX6+bfMYARSBewct7ZU+J2fkJsLPayUccOI2jnfzDhQhaOEfd5BuvwSN99ZRN31Jr
	z558QzSFBaPtGDQJTt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMs6a-00Ecan-LE; Wed, 23 Feb 2022 13:54:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwF-00EZS1-Hy
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:19 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 86DA52244E;
 Wed, 23 Feb 2022 14:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxAfkU+dAADC9WLJJSEBdqTHjHBT9Wm1HMlwnh6ZASc=;
 b=GLdzsi7o0FckyrOA9byawxQwLSaCGSp0C/EOTYoWQB+k1mMFy6gQFVbZjV3vynRb05wTyR
 1h8Ma0YT0qlL0xPQ9ZPUkM4BYBzxAoj0g6GigkMo4mjGkc+Cs8/GnLXsHYQSiVNutTW4iV
 3hBsCMG+E8grCV7s/12HNINeDHMaYcw=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 10/32] mtd: spi-nor: macronix: unify function names
Date: Wed, 23 Feb 2022 14:43:36 +0100
Message-Id: <20220223134358.1914798-11-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054415_842030_427A9FF0 
X-CRM114-Status: GOOD (  11.59  )
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
 drivers/mtd/spi-nor/macronix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 97dba1ae7fb1..d81a4cb2812b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -32,7 +32,7 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
-static const struct flash_info macronix_parts[] = {
+static const struct flash_info macronix_nor_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
 		NO_SFDP_FLAGS(SECT_4K) },
@@ -102,19 +102,19 @@ static const struct flash_info macronix_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
-static void macronix_default_init(struct spi_nor *nor)
+static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
 }
 
-static const struct spi_nor_fixups macronix_fixups = {
-	.default_init = macronix_default_init,
+static const struct spi_nor_fixups macronix_nor_fixups = {
+	.default_init = macronix_nor_default_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_macronix = {
 	.name = "macronix",
-	.parts = macronix_parts,
-	.nparts = ARRAY_SIZE(macronix_parts),
-	.fixups = &macronix_fixups,
+	.parts = macronix_nor_parts,
+	.nparts = ARRAY_SIZE(macronix_nor_parts),
+	.fixups = &macronix_nor_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
