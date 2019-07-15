Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0314CC7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BCC2086C
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZxN8HyWy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtNyIRY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8BCC2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvAJC1tT+BREKS9Jn9hbogmQNKuE/Aa4Q98H6bdVZLs=; b=ZxN8HyWyjNtfZL
	ojyYwtEUdn9LBQaZtfOcVVHrcZ0TMykQ+4UmuLHTVrWo0tNzyu9D0p+y8ndTycBBZ07E7biGiIDAL
	1R9u1XI9UmkTTKx4/9utXbk2AQDwrrr1GT72nOgCiL4Skn3+pw7CGHN+Im3L4o+YgLPa6yDCGe3FU
	ebtRevvPiP6gf6Su0oI0cjJvo1PMwYdHJLCB2d+5pzHYWEiGVj9AVXqX6c8yOlLOVH6T3ARR5JHfe
	b4DjuaYaWvea7jcdz+k61f3pZErSqw0Wd/r5svbtmnbfCPGsDnSg60TeeBh61NmvtMIJfnBvdECsW
	qhS1/jyXW+mlkjnAzoUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn8pe-0007If-0M; Mon, 15 Jul 2019 21:48:26 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn8oW-0006I2-L8
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 21:47:18 +0000
Received: by mail-lf1-x142.google.com with SMTP id x3so12153885lfc.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X32xFULzpIARGaDN55XXxBBAMB6Lt0HcUIzFIWUu2o4=;
 b=FtNyIRY3ivCTI8OV37E3jFox277CWEt/TwultlfE4xwG9hCKJPMHrPSpTaKPwzbiPd
 HZZW5Wt35ZOXajUDI6PjNoOaS3GNdUw/yTCmBHFVL97gzIS+jdNjMSlAnfTL/GoVblgY
 AYeF4qfiF8AZfnRuId56oJ+HCsPsOaGdxymjWu8o8rR49a8+48eWb8d6nHZwGQrrv7DN
 0YqfCAceoU/bf2qMzTZAD2Hqro1YXs4L3Hafk6qv4ejUo8bUGjPOOQKBLNbUe+j/eSCS
 LcanbPVGJIlT8OnkSlO9MWOJjHEKaKAhENX6Gc4gCkUUOWQNNLIG1Zt3A8CfK6OHYLpK
 pVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X32xFULzpIARGaDN55XXxBBAMB6Lt0HcUIzFIWUu2o4=;
 b=IqHL1tRY5w0Q5FfajDuX4k6bK5v73vMozKaOnteqSWR5onkaWohJ/7QNIkDmZUxmyr
 XX72F2WQnRyTgpyn2Wc+VyUdi5ruIqnnKt0VSoDc3TZvInJ7VEK02JNAGmWY6ty/PVH+
 xsKKjOwgIVBbWg1+oQ3TsE4ut6ZbTCk1PpOsHY2nx10hcwscPoEYJZCGCAjR4AFwgA7q
 pTw2J80xdxKNj9Z08VaBc1kAoq5L5ssdRGFVQ6XCPoC03iostZ+zTB7HUvQtXbXIoNWB
 2gn3CzVPupFqeZGPV2gjlJg08q2IfURuKBPQT4cNeUgT0/foLsboc+oulTqrIAz41suY
 t+YQ==
X-Gm-Message-State: APjAAAVT17sJFdyWzlVf0V3X6vBs8XlXfXCyGrZkDOs4CTnhKdIkqUiJ
 Zs+++Vl+scqQpsNXUXhopj+reQ==
X-Google-Smtp-Source: APXvYqyyJ/XS2KgLp2tmXl02c9Id2LVeqHji40806S3Mu4riYH42xDYuC3pm1QY5gGgG3l/ey9yDMw==
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr1372164lfp.61.1563227234775;
 Mon, 15 Jul 2019 14:47:14 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id q2sm2457074lfj.25.2019.07.15.14.47.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:47:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 5/5] mtd: parsers: Move CMDLINE parser
Date: Mon, 15 Jul 2019 23:46:34 +0200
Message-Id: <20190715214634.31697-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715214634.31697-1-linus.walleij@linaro.org>
References: <20190715214634.31697-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_144716_724105_130A0A73 
X-CRM114-Status: GOOD (  16.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This moves the CMDLINE partition parser down into the
parser subdirectory. No functional change.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig                           | 37 -------------------
 drivers/mtd/Makefile                          |  1 -
 drivers/mtd/parsers/Kconfig                   | 37 +++++++++++++++++++
 drivers/mtd/parsers/Makefile                  |  1 +
 .../{cmdlinepart.c => parsers/mdlinepart.c}   |  0
 5 files changed, 38 insertions(+), 38 deletions(-)
 rename drivers/mtd/{cmdlinepart.c => parsers/mdlinepart.c} (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 4833e5b640f7..42d401ea60ee 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -23,43 +23,6 @@ config MTD_TESTS
 	  WARNING: some of the tests will ERASE entire MTD device which they
 	  test. Do not use these tests unless you really know what you do.
 
-config MTD_CMDLINE_PARTS
-	tristate "Command line partition table parsing"
-	depends on MTD
-	help
-	  Allow generic configuration of the MTD partition tables via the kernel
-	  command line. Multiple flash resources are supported for hardware where
-	  different kinds of flash memory are available.
-
-	  You will still need the parsing functions to be called by the driver
-	  for your particular device. It won't happen automatically. The
-	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
-	  example.
-
-	  The format for the command line is as follows:
-
-	  mtdparts=<mtddef>[;<mtddef]
-	  <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
-	  <partdef> := <size>[@offset][<name>][ro]
-	  <mtd-id>  := unique id used in mapping driver/device
-	  <size>    := standard linux memsize OR "-" to denote all
-	  remaining space
-	  <name>    := (NAME)
-
-	  Due to the way Linux handles the command line, no spaces are
-	  allowed in the partition definition, including mtd id's and partition
-	  names.
-
-	  Examples:
-
-	  1 flash resource (mtd-id "sa1100"), with 1 single writable partition:
-	  mtdparts=sa1100:-
-
-	  Same flash, but 2 named partitions, the first one being read-only:
-	  mtdparts=sa1100:256k(ARMboot)ro,-(root)
-
-	  If unsure, say 'N'.
-
 menu "Partition parsers"
 source "drivers/mtd/parsers/Kconfig"
 endmenu
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index d5f1fd696f87..56cc60ccc477 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -7,7 +7,6 @@
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
-obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-y				+= parsers/
 
 # 'Users' - code which presents functionality to userspace.
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index 2001d96cb82a..f98363c9b363 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -20,6 +20,43 @@ config MTD_BCM63XX_PARTS
 	  This provides partition parsing for BCM63xx devices with CFE
 	  bootloaders.
 
+config MTD_CMDLINE_PARTS
+	tristate "Command line partition table parsing"
+	depends on MTD
+	help
+	  Allow generic configuration of the MTD partition tables via the kernel
+	  command line. Multiple flash resources are supported for hardware where
+	  different kinds of flash memory are available.
+
+	  You will still need the parsing functions to be called by the driver
+	  for your particular device. It won't happen automatically. The
+	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
+	  example.
+
+	  The format for the command line is as follows:
+
+	  mtdparts=<mtddef>[;<mtddef]
+	  <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
+	  <partdef> := <size>[@offset][<name>][ro]
+	  <mtd-id>  := unique id used in mapping driver/device
+	  <size>    := standard linux memsize OR "-" to denote all
+	  remaining space
+	  <name>    := (NAME)
+
+	  Due to the way Linux handles the command line, no spaces are
+	  allowed in the partition definition, including mtd id's and partition
+	  names.
+
+	  Examples:
+
+	  1 flash resource (mtd-id "sa1100"), with 1 single writable partition:
+	  mtdparts=sa1100:-
+
+	  Same flash, but 2 named partitions, the first one being read-only:
+	  mtdparts=sa1100:256k(ARMboot)ro,-(root)
+
+	  If unsure, say 'N'.
+
 config MTD_OF_PARTS
 	tristate "OpenFirmware (device tree) partitioning parser"
 	default y
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 69b2c5289f96..b0c5f62f9e85 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_MTD_AR7_PARTS)		+= ar7part.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)		+= bcm47xxpart.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)		+= bcm63xxpart.o
+obj-$(CONFIG_MTD_CMDLINE_PARTS)		+= cmdlinepart.o
 obj-$(CONFIG_MTD_OF_PARTS)		+= ofpart.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/parsers/mdlinepart.c
similarity index 100%
rename from drivers/mtd/cmdlinepart.c
rename to drivers/mtd/parsers/mdlinepart.c
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
