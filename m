Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7250C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797FD610C7
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 797FD610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xcf0a1CtLZZDmxjrQnsYz1CUv63k4Qcqfv5yKxxQfg=; b=OSeOVph31EyDJf
	TWlXUwxxwo4LYF1JhTdWTfYlMjNetWLpU7vj18/eTMeNfN8Rs7eiYJodaI94U6IFN5bQTwhPNgHH4
	hV9/jXgGJLKTo6gj7CKr8ZMWIcnVMPwtdObL8uzXScU5fT0MS6dFFLSwKgnS3pyF3LBL8y3GNFGkv
	b02/0jNkftK5aN7lTuizpgqD79BZk/pwVZCkXcwyADzRylcWfymBvwPorqKTQHyQur4ZYgCHOZLI7
	y34FTlnUj6ga2YMPd9JGxCA0jBO0qsvaau0GRWPzbjRAf51sm4VtMC2B30V1wEVXNHWpRO6XGND+G
	o/SzussREIT/AoEhuQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgW0w-00Beju-A4; Fri, 29 Oct 2021 17:50:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfI-00BZFH-Ql; Fri, 29 Oct 2021 17:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528460; x=1667064460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrMkp/GTIjttWk0qBjvR6yqNdz5X7AordpfdaAGDFk0=;
 b=weDB5tvrfUuWPIgtSQm9d9aKnKtRyCpCudPzqPB729JX4NgG7/fpJw96
 EyHeG/xVE31801L5B2rNMNkhd4KatEVXDYGEmm8vpz7TinnAg6xHNiZWX
 nCZd8SKsweHQfL0nrYwSgk5f6l3Vp3wrdSyXxTa7LAzOioS8Lc2D8nghc
 aN97+Js1wOzN3IwK/unB6nTNmTkYc210fDIrUdeggjnYX+9EHS0PY1fMm
 XlND8ZSXxi2O2eVt+6OTFTy/5xop9mHw3QVfed0pmVLSiAW92D79BdAjG
 FGXpxyHboXMNkwe/dEQLyBE60UKNCX2+GmTG9KFbgz6iesmWd5JMiZH4x g==;
IronPort-SDR: nBApBf+xRYYTtmQccCFPm335CURKEeb9ckZ/wF49gmDKm+JsTGh/FBIduplekcjSTmtWrbKmqR
 4ZxVbtKugYzS0lqJPIO5mn6YQgEf0kT8NmA5zt1h6E2U0mLxEb15jyqakfv3e382O6XXp83FHs
 tLQsUl4pypq1M3xxZuaKYz0mtRpdAJBHHYGyzGfFzNw30y+PoDRxZK6r6AGuUuftacPXM8mNs8
 1JeAjVaQsvQPR3rHhf7AJxWHRlswZ16pB6YVdd6orwn5O+Q9UF21jgX/9W8p6MqSWuCtzeWgec
 ATLAe+MgzQWpR0UT6NDtcGTt
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063397"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 11/25] mtd: spi-nor: spansion: Use manufacturer late_init()
Date: Fri, 29 Oct 2021 20:26:19 +0300
Message-ID: <20211029172633.886453-12-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102740_933983_437D2714 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

spansion_post_sfdp_fixups() was called regardless if the flash defined
SFDP tables or not. A better place for this kind of parameters init is
in manufacturer's late_init() hook. post_sfdp() should be called only
when SFDP is defined. No functional change in this patch.

Instead of doing the 4b opcodes settings at manufacturer level, thus
also for every flash that will be introduced, this should be done
just where it is needed, per flash. I'll let this for other patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ee82dcd75310..a3ea0135f7b1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -276,7 +276,7 @@ static const struct flash_info spansion_parts[] = {
 	},
 };
 
-static void spansion_post_sfdp_fixups(struct spi_nor *nor)
+static void spansion_late_init(struct spi_nor *nor)
 {
 	if (nor->params->size <= SZ_16M)
 		return;
@@ -288,7 +288,7 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 }
 
 static const struct spi_nor_fixups spansion_fixups = {
-	.post_sfdp = spansion_post_sfdp_fixups,
+	.late_init = spansion_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_spansion = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
