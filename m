Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBA0C4360F
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE5C217F9
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A7avrY13";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="yOTP6sjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE5C217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HvJnlzaxS3TNkxmbq+kNtBYUB6DAQkP/WwlLxfRW8QY=; b=A7avrY13TaSpKo5u93jaM29ien
	6PCCe8D7vOYAQcCm3+jOXlOE1diAHxqU6Cmm8qqGOeCOonxg2GViz2hqqxzYC6J6cdAMXjpBvNiUk
	Fq/p0ONMApM5SUu0Ok4MkfRp3sFXSFHPkBrCGC1ZDhHvKTLaAM+ash97Q9d10dL/qmBZKkrhLXKom
	1KVPyiDDBK4hHkGw6E6DqKIj7+KVGptjgIVahjofn8uDwxbq9YaWrJnxNqxMq6U9/qDyMEeJMJf88
	WYvfkfohD3S/TLcbhx6GO6Ahn/9y2OY62hE27dw0lVNW7mUfF3T/NM0ZM4WKbzc+DC/VKRUA3wFFl
	HcWH/4ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6G98-0001mt-Dj; Tue, 19 Mar 2019 14:55:18 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G85-0007gv-Vt
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007252; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=gDUDq4fH7cr6soORQwPTp8LUhi9AzCrNBWRIaF3rbB0=;
 b=yOTP6sjLhB/b3EqWl/JDoM8CYTXRhi2y8gYWkfqhhBsdZz4evMnTFGi6WruJybeF7OhHWS
 Knxlbm+yu+ygf/x2F8LExpH1KdvYvlm6CyQCLNA8HnYrz+RIFpRWR4az9rGYlI6aq/6t8Y
 fc2ph8Lqli9gOzHAJFj8LLvMI6bFGMY=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 04/13] mtd: rawnand: Move drivers for Ingenic SoCs to
 subfolder
Date: Tue, 19 Mar 2019 15:53:54 +0100
Message-Id: <20190319145403.31627-5-paul@crapouillou.net>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075414_622776_45C020B0 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Before adding support for more SoCs and seeing the number of files for
these drivers grow, we move them to their own subfolder to keep it tidy.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch
    
    v3: No change
    
    v4: No change
    
    v5: No change
    
    v6: No change

 drivers/mtd/nand/raw/Kconfig                     | 14 +-------------
 drivers/mtd/nand/raw/Makefile                    |  3 +--
 drivers/mtd/nand/raw/ingenic/Kconfig             | 13 +++++++++++++
 drivers/mtd/nand/raw/ingenic/Makefile            |  2 ++
 drivers/mtd/nand/raw/{ => ingenic}/jz4740_nand.c |  0
 drivers/mtd/nand/raw/{ => ingenic}/jz4780_bch.c  |  0
 drivers/mtd/nand/raw/{ => ingenic}/jz4780_bch.h  |  0
 drivers/mtd/nand/raw/{ => ingenic}/jz4780_nand.c |  0
 8 files changed, 17 insertions(+), 15 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/ingenic/Kconfig
 create mode 100644 drivers/mtd/nand/raw/ingenic/Makefile
 rename drivers/mtd/nand/raw/{ => ingenic}/jz4740_nand.c (100%)
 rename drivers/mtd/nand/raw/{ => ingenic}/jz4780_bch.c (100%)
 rename drivers/mtd/nand/raw/{ => ingenic}/jz4780_bch.h (100%)
 rename drivers/mtd/nand/raw/{ => ingenic}/jz4780_nand.c (100%)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index e604625e2dfa..705863c6709a 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -470,19 +470,7 @@ config MTD_NAND_NUC900
 	  This enables the driver for the NAND Flash on evaluation board based
 	  on w90p910 / NUC9xx.
 
-config MTD_NAND_JZ4740
-	tristate "Support for JZ4740 SoC NAND controller"
-	depends on MACH_JZ4740 || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  Enables support for NAND Flash on JZ4740 SoC based boards.
-
-config MTD_NAND_JZ4780
-	tristate "Support for NAND on JZ4780 SoC"
-	depends on JZ4780_NEMC
-	help
-	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
-	  based boards, using the BCH controller for hardware error correction.
+source "drivers/mtd/nand/raw/ingenic/Kconfig"
 
 config MTD_NAND_FSMC
 	tristate "Support for NAND on ST Micros FSMC"
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 5a5a72f0793e..5552c4a9f2cf 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -45,8 +45,7 @@ obj-$(CONFIG_MTD_NAND_NUC900)		+= nuc900_nand.o
 obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
 obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
 obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
-obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
-obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
+obj-y					+= ingenic/
 obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
diff --git a/drivers/mtd/nand/raw/ingenic/Kconfig b/drivers/mtd/nand/raw/ingenic/Kconfig
new file mode 100644
index 000000000000..67806c87b2c4
--- /dev/null
+++ b/drivers/mtd/nand/raw/ingenic/Kconfig
@@ -0,0 +1,13 @@
+config MTD_NAND_JZ4740
+	tristate "Support for JZ4740 SoC NAND controller"
+	depends on MACH_JZ4740 || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Enables support for NAND Flash on JZ4740 SoC based boards.
+
+config MTD_NAND_JZ4780
+	tristate "Support for NAND on JZ4780 SoC"
+	depends on JZ4780_NEMC
+	help
+	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
+	  based boards, using the BCH controller for hardware error correction.
diff --git a/drivers/mtd/nand/raw/ingenic/Makefile b/drivers/mtd/nand/raw/ingenic/Makefile
new file mode 100644
index 000000000000..44c2ca053d24
--- /dev/null
+++ b/drivers/mtd/nand/raw/ingenic/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MTD_NAND_JZ4740) += jz4740_nand.o
+obj-$(CONFIG_MTD_NAND_JZ4780) += jz4780_nand.o jz4780_bch.o
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/ingenic/jz4740_nand.c
similarity index 100%
rename from drivers/mtd/nand/raw/jz4740_nand.c
rename to drivers/mtd/nand/raw/ingenic/jz4740_nand.c
diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
similarity index 100%
rename from drivers/mtd/nand/raw/jz4780_bch.c
rename to drivers/mtd/nand/raw/ingenic/jz4780_bch.c
diff --git a/drivers/mtd/nand/raw/jz4780_bch.h b/drivers/mtd/nand/raw/ingenic/jz4780_bch.h
similarity index 100%
rename from drivers/mtd/nand/raw/jz4780_bch.h
rename to drivers/mtd/nand/raw/ingenic/jz4780_bch.h
diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
similarity index 100%
rename from drivers/mtd/nand/raw/jz4780_nand.c
rename to drivers/mtd/nand/raw/ingenic/jz4780_nand.c
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
