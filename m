Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0658C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PogI7cmxgGzXngIVnaP5xqnbWgNUknFuClVBNF4vuKw=; b=F/0IratA0J6cPx
	lKzPgJQgBzO8X0OXP7SUWh3GoALF4SFD22dt0WDspdp9fkjNY64u0v491xe/wazlrwi2MlNE3Dcyn
	Kc82vM3b8TLtAA7Ei+Vc8LsBM5RUs6U74VMv1TNLclgrsKbXXrPQvLigJkwO1b4+OywH7GOMyTS6q
	d0iJYHT+Xf7GI74xpPq27qgF9DSijt0pshqHrVw3TgJFJnU+QSVUH0DjVZJvIF1aVloKHuicjnjqu
	RCYxV1EFydrpF/fTwn5fzO/Au8iBH+suSvsYbvY4sv6Yra1Zet6kaKIIUGf7N4jamG59JBB8GM1zh
	DMsB480vB41KyohdgW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEY0t-009cjd-6i; Mon, 31 Jan 2022 14:50:39 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEY0q-009cif-H7
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 14:50:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC4CF100008;
 Mon, 31 Jan 2022 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643640634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b0mmfBahzgQVkfQXL4J86ux2STA7HKcT8BZRh7HJBM8=;
 b=bLOih6/EnbBluq3bFYWaJYt661YsMw+OYhK4d7hciegaT8uDDQTujPAATseVlXyA6KgK2O
 rHYnHW0HetFHU079U8Afj5fNkKGT9PnOQHIZmClx9zF5Yz8ubD9WlfuERw+3/O1xCQD+Hp
 nRkhcXsdwOpYmDXnFq7CBpnNNdsawzwtE/vakzqz7esZ23PlxkTGaBe0i46erDn3nXtsE7
 dsyMvuVTPZf/K6LSNEJNyYR6lEl6XA5JsOtADTtAwgvKi6yqx1BG7F/3kTec/OrkQGhF+8
 C7J/3Dz0hdVlQvegc75uvxEsxUBl/O0O6s9ROU1wqE0myWgKqrxN9Wl47Ia3Hg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: nand: ecc: Rework Kconfig dependencies
Date: Mon, 31 Jan 2022 15:50:32 +0100
Message-Id: <20220131145032.17614-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_065036_908643_F6B3FC28 
X-CRM114-Status: GOOD (  10.76  )
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

Unlike "depends on", "select" does not enforce any type (y or m), which
can lead to the following situation:
* SPI_MXIC=y expects the NAND symbols to be built statically
* SPI_MXIC depends on MTD_NAND_ECC
* MTD_NAND_ECC selects MTD_NAND_CORE
In this case MTD_NAND_CORE=m is "valid" but will trigger 'undefined
reference' link errors.

The cleanest way to handle the situation is to use a "depends on"
between MTD_NAND_ECC and MTD_NAND_CORE to avoid such situations.

While at modifying the MTD_NAND_ECC symbol, fix the spacing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---

Changes in v2:
* Pratyush Ack.
* Stopped quoting a missing error log. Mentioned the 'undefined
  reference' link error instead.

 drivers/mtd/nand/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8431292ff49d..1b5f5bac3e6e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -12,13 +12,13 @@ source "drivers/mtd/nand/spi/Kconfig"
 menu "ECC engine support"
 
 config MTD_NAND_ECC
-       bool
-       select MTD_NAND_CORE
+	bool
+	depends on MTD_NAND_CORE
 
 config MTD_NAND_ECC_SW_HAMMING
 	bool "Software Hamming ECC engine"
+	depends on MTD_NAND_ECC
 	default y if MTD_RAW_NAND
-	select MTD_NAND_ECC
 	help
 	  This enables support for software Hamming error
 	  correction. This correction can correct up to 1 bit error
@@ -37,8 +37,8 @@ config MTD_NAND_ECC_SW_HAMMING_SMC
 
 config MTD_NAND_ECC_SW_BCH
 	bool "Software BCH ECC engine"
+	depends on MTD_NAND_ECC
 	select BCH
-	select MTD_NAND_ECC
 	default n
 	help
 	  This enables support for software BCH error correction. Binary BCH
@@ -48,7 +48,7 @@ config MTD_NAND_ECC_SW_BCH
 
 config MTD_NAND_ECC_MXIC
 	bool "Macronix external hardware ECC engine"
-	select MTD_NAND_ECC
+	depends on MTD_NAND_ECC
 	help
 	  This enables support for the hardware ECC engine from Macronix.
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
