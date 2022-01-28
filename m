Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06E6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVIBztIFL3XKIiCvaqS2eqciNo5019/VGOOtAYmMbgk=; b=K0+DTV1kVRstyR
	wVtVdIfrkPG6U7H7fp6ohYGGaC4EGKjhLxON9aYegVJJJ4MGZOIpFIEKTREIIvNBpO2yVD9VmXyOw
	7AAXzPrENjlscoQrEYqTt/Jsp5OpwbATLS1T/LO5h0DVbHC2bKHXD2TKGhrIv+haKUZpWDLXp5G3M
	XRy0ZgllmqBIPODkcPiiGt8oQGUs9oyyp7um+k51tOTVC1lY7/s9NxmyTXJ1Q1jKwHAQjNG2GrLDW
	mwmf0/J/vZEmk9mY3kWxlLyQKm4yb406GFfW4KGWuO8My2b1nlHmhcYK7ST1ShkGWQGaTlYtt5tQW
	nXzipJTDj8eQjxOw0j+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDUlT-0039AR-9i; Fri, 28 Jan 2022 17:10:23 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDUlO-00398b-TF
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 17:10:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 72FBC200008;
 Fri, 28 Jan 2022 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643389816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g9sdPvoFDy+anFluQspXTL8m0UmP2RL0czNxbmlMrMg=;
 b=YXhyz22LcHHjnzMJ6LwIP8Fx7MsHQS5EitCYsIcw7DhW7RWA9S7R+yUTG8maCZMpvyW+KY
 pmUXeNE0vPRyDS4TiE9lx3zHzGK8XwVaJ9IgmmIIBDg9FD/nyOJUKxvKJb07OenfGfLAu3
 N47x0d4b+GisC3hMsEJI3gPsVX/tAzp6sNokEgB1BWn4gXYnA+VzMHF4fofValGwvb7LZ8
 w4Y+PZMSaA5AYOK8W4cvqEWtbO7Px3CPiDCgaZxk3MWWizMwvq3/4JDZikQ/btO7yn/X46
 F8foYYVla4pdJAhPpjZ+xMRh+VEV26LcgLZVcffNlkK7zJ79Y+2zU1uD00XzQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Julien Su <juliensu@mxic.com.tw>,
 Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: nand: ecc: Rework Kconfig dependencies
Date: Fri, 28 Jan 2022 18:10:13 +0100
Message-Id: <20220128171013.1251796-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_091019_102882_9C192485 
X-CRM114-Status: GOOD (  10.55  )
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
In this case MTD_NAND_CORE=m is "valid" but will trigger link errors
such as the one below.

The cleanest way to handle the situation is to use a "depends on"
between MTD_NAND_ECC and MTD_NAND_CORE to avoid such situations.

While at modifying the MTD_NAND_ECC symbol, fix the spacing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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
