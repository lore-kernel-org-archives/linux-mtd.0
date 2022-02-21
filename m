Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3398BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzFMyhvQV/p9QkIl5B4Mu+CLb5wuHa7Uh6HRnq0wY30=; b=s+gkkGLswsoKFM
	yaG3iF1i51NvFpFkQAOmnHoEU+kLvzsa4mMUEfKI1jeE7yTzZMqbwE+pAnsc+7M9ND8e01dk533Ba
	qFwirTBGpOtdX1Cc5O3MaJ822dPgVa5BXF0ofhpoeCv551p4psTJv45R03KURqTJ34BlgKL35y86P
	2ZdAlg5qnTpqk+9CFV2qi3lU3+XWvZf5qtxH6LRQfXQ1+qaYMqPUtqbU72bTyR9kRX6AhWef3f0XA
	7YRcW8hiojRXSfrTfm125LoxlPUz+Q6q1q8EDNOG/wI20kSJahHxqVKiwfgg8VKY1ZX8cvka33VV5
	rH+NC/yTsOgA4vGi8S2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM7al-005axO-So; Mon, 21 Feb 2022 12:15:00 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7US-005Xte-Ru
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:31 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 814C42244E;
 Mon, 21 Feb 2022 13:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WD1vGyp4iR05geI+YfJuk9fStbZhOUnh6WycbPwBqbQ=;
 b=LMb/K8clKIqRh64dE3GLsOr3k796ypeCrz/pnGZr+XxEuEX7TG5ls5SOZEpbnWvynSEkXd
 A6R40m1SE/mk5ZnPKa+ErC1XR0qt9CJnnVldwcXbbAKpxXoNk1MEWnkVl+hKUl1zn6iNvp
 mTmb7Y5bEatOs9u5Ehfx79T+BKnIXYs=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 10/32] mtd: spi-nor: macronix: unify function names
Date: Mon, 21 Feb 2022 13:07:47 +0100
Message-Id: <20220221120809.1531502-11-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040829_513700_84371DB9 
X-CRM114-Status: GOOD (  11.76  )
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
