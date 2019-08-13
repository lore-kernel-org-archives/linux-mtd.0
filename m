Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B448EC41514
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:27:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FEE20578
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RRwc0O2z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IH9LfnOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FEE20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mT60e7Dz5VnLAJi2lsn7D56sv+lIWjvNZt/BdZVdQc=; b=RRwc0O2z3iaJ+z
	mNav4F37ghv/ce2ofRPOW7mn+PBJrckGR63DY6miF4q7w4Fsh3W3LDoM/Se3+j3ThLmSXjot0WOiA
	1AQk7Xba8PvU1BeT+L0WpVMQA8wxeNX6uPmXvA1w7ere6RIdHa3u7lhcJUhdHF6ufvJvgYyrTWlhQ
	c4New8iTIvGCOWmOYloVH+CUrUhczWW+B5xkp8T0jfUkSl0WPlp/RYP4Bw/yF3h6+hRqAomW3jGVM
	TDmBdTyws25udmkOcoIutLvlX6CpCrlAmFlb7QqZHjammd7W0fcSpHSuljJimxkaYb5WLkVeUS2ks
	oocBNggbSWoFMgq373fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxRCx-0007Ux-DD; Tue, 13 Aug 2019 07:27:03 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxRBo-0006ES-ME
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 07:25:54 +0000
Received: by mail-lj1-x242.google.com with SMTP id z17so12169457ljz.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vn5zvX9DdwAHxdUX2rYE/kNuVfc34jr/gvNkS1Cau+M=;
 b=IH9LfnOl4RuB/Rvej9L0FLak3ES1qn7vmtna+7Y2pnY9TYh34ivlEXajPMfeWmCIkG
 fjE85vT1f018Y44ZoLYQ9HvrxkErA2qcq2acinVRzljQDKDokMcciqt9Gv5RyXw8pw6/
 ZHF/NFjB4X/AItGAjgvx/F8nsWfrB5ZsXo3qiZ9+lQ48hID+mZWsv0ABRxDyq0oYv/6M
 ajo+uvb7TC/i5vK1LMIxX6KHVXoCtU/U3ZKecoAjN1qUWcVqvAM15v9PTR5a881GIHFG
 S1zz5DuGcPqoz8DQEiDnovQskazkBhzh+6qi17Lyi0nblPmS/6dK5vAETYae9/pVoXrH
 fgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vn5zvX9DdwAHxdUX2rYE/kNuVfc34jr/gvNkS1Cau+M=;
 b=XOYq95jtylNCx9pCazR85DwObJIyaQhrX9bUhr9T3j2wsfITHSJY18PjuGwLWiKOKh
 0uK8/eIPyr+hFDBP1AS0kpSYfX7gHO6BsW64SsTiFpLBSkX3nBN1Iyd1AJ2usPRrsi3C
 +5KHjGD8pQOWWLAGZF23Fva3omzDGM3JhXFvzUpBlcF7afcFqf7HKraQw0gwDM2jsHJF
 nHcpqZWHqPfRQ/wb6/7wkzzIilMG/uGOp8ByGyoqiUxi8xWaap15gXb68274OnT8fxT/
 fbDiaj5arWI6BzrgMmxDr5PQak5SBKTLuG9vqVaiA/6+UkisBV9i2HwAnT/VHq0t7AU1
 x0FA==
X-Gm-Message-State: APjAAAU2ROqpZcbp8vw9RfLB5wvsuvPbZ3drc540+VOlXIf3ATJekLai
 3QDwC2j8ZUCEViOPGoe7DbvuO/l5ovV84Q==
X-Google-Smtp-Source: APXvYqxCIcrrqyGDcDFp0mBLxY6o13Hk2SJin1BCAxNmfzsXsSgSu/Bqr3rcumIBNQR3hzq7ctQTMw==
X-Received: by 2002:a2e:331a:: with SMTP id d26mr1133284ljc.86.1565681151340; 
 Tue, 13 Aug 2019 00:25:51 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
 by smtp.gmail.com with ESMTPSA id d22sm2004804lji.99.2019.08.13.00.25.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 00:25:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 5/5 v2] mtd: parsers: Move CMDLINE parser
Date: Tue, 13 Aug 2019 09:25:31 +0200
Message-Id: <20190813072531.4234-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813072531.4234-1-linus.walleij@linaro.org>
References: <20190813072531.4234-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_002552_864251_2326FEB4 
X-CRM114-Status: GOOD (  16.49  )
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
ChangeLog v1->v2:
- Fix compile error because of wrong name of moved file.
---
 drivers/mtd/Kconfig                     | 37 -------------------------
 drivers/mtd/Makefile                    |  1 -
 drivers/mtd/parsers/Kconfig             | 37 +++++++++++++++++++++++++
 drivers/mtd/parsers/Makefile            |  1 +
 drivers/mtd/{ => parsers}/cmdlinepart.c |  0
 5 files changed, 38 insertions(+), 38 deletions(-)
 rename drivers/mtd/{ => parsers}/cmdlinepart.c (100%)

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
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
similarity index 100%
rename from drivers/mtd/cmdlinepart.c
rename to drivers/mtd/parsers/cmdlinepart.c
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
