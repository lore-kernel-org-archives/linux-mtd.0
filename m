Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4372C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PfBltJKvS7WX77k0A94f2X+sEES2xnEtMweMQujVtc4=; b=uOXw3+olZcqzHz
	Odb2wqphxhj38CiUXVdoYgdUpemEWlbcaZJlJkMFD4IjNfsRdvUw7L0RRGIrrYd1h3bJwkV5AEWmC
	WVzHsNljBIdclUCbyf9DCsZs11Sf3QOiG3vTF/kAcWG67+XkLqnBQhXtByE7QOd11bxi12c9bh4EI
	H6RtRGcYlgOO/OPS8Bqzg5jCZBJjxAS3hvP2ggUfgaHpbjizxlaNtAEHyJS/G7PtkMh3Fcuz05JbV
	+QvZNJtoA/Qo8rJwbfVci02ugr5hI8ANk1g6Be0/w+M30tlUMdcrH8Bl1Og0mxc/RDOvwyy7fLCXf
	fhlT0UXlDei2dLsSB/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2dR-00FJih-G1; Thu, 27 Jan 2022 11:08:13 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2dO-00FJge-AV
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 11:08:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D5C160004;
 Thu, 27 Jan 2022 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643281687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K3bF25oTIJTDef2BiMF8aVdAYP/rtXQjl4bpjE4beY4=;
 b=QuMwRYoWZG8XZmpMzDwOEHJQuTGUgWYzoWZ92LwJXMXdLROdc4ndOm0zCaxGZKNdcGKsYS
 HqLTJO/FKwqFQHB6pRfr/eEEEUViK+hoHEAdUu7E8tKlvPIq/eNbahUOluxlY637UJ4NvC
 L0Mb5Q5Yh0LIR++E9X1t44HFiCvKA34Hq0+nVpph8WKGWmFcYGqnAC4fQsx0SzL2th5CaV
 /c5afRKPYEWHmB70J8Z+S61U43wtHBh/tGjd8Wa/NT5VJSn7wByu68z/YAJNVyV2TVzFw2
 dcAzDGZKOzUdKXC+u1aqpxLDwaRPxCC8cl8/wBnKCU5jWUwah4GrB3Au+dmgRQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: Fix misuses of of_match_node()
Date: Thu, 27 Jan 2022 12:08:02 +0100
Message-Id: <20220127110802.1064963-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030810_684559_E0F63D30 
X-CRM114-Status: GOOD (  11.63  )
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

On non-OF enabled platforms (CONFIG_OF is not set), of_match_node() will
expand to NULL. The of_device_id array pointed by the macro will then be
left unused. Let's mark the array __maybe_unused in this case to prevent
compiler warnings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 drivers/mtd/nand/raw/atmel/pmecc.c           | 2 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 4ecbaccf5526..0209f7462635 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1938,7 +1938,7 @@ static const struct atmel_smc_nand_ebi_csa_cfg sam9x60_ebi_csa = {
 	.nfd0_on_d16 = AT91_SFR_CCFG_NFD0_ON_D16,
 };
 
-static const struct of_device_id atmel_ebi_csa_regmap_of_ids[] = {
+static const struct of_device_id __maybe_unused atmel_ebi_csa_regmap_of_ids[] = {
 	{
 		.compatible = "atmel,at91sam9260-matrix",
 		.data = &at91sam9260_ebi_csa,
diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 43ebd78816c0..4d7dc8a9c373 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -920,7 +920,7 @@ static struct atmel_pmecc_caps sama5d2_caps = {
 	.correct_erased_chunks = true,
 };
 
-static const struct of_device_id atmel_pmecc_legacy_match[] = {
+static const struct of_device_id __maybe_unused atmel_pmecc_legacy_match[] = {
 	{ .compatible = "atmel,sama5d4-nand", &sama5d4_caps },
 	{ .compatible = "atmel,sama5d2-nand", &sama5d2_caps },
 	{ /* sentinel */ }
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index f75929783b94..7c0f02069ea0 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2914,7 +2914,7 @@ const struct dev_pm_ops brcmnand_pm_ops = {
 };
 EXPORT_SYMBOL_GPL(brcmnand_pm_ops);
 
-static const struct of_device_id brcmnand_of_match[] = {
+static const struct of_device_id __maybe_unused brcmnand_of_match[] = {
 	{ .compatible = "brcm,brcmnand-v2.1" },
 	{ .compatible = "brcm,brcmnand-v2.2" },
 	{ .compatible = "brcm,brcmnand-v4.0" },
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
