Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BCFC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEDB205F4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKqxE93F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8bbSTqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CEDB205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDlx9JIz/j5vhDo/sU2Ok8HnWLOMFZP1m5XyjIhQXVQ=; b=XKqxE93FtLp4+i
	F5J7HVCRBt+ISfCmWP0A3MQDt3vIiZSNPYqIs193ei6Patlc1/YSuACP1OaXqfFLpKREKf0kj5QhT
	L8PxEAkINkz+lDvMGEsSlXN3T5HNgdmQnevDskVUlQ6Wc0+qP/w1m45rvOUttTN5IclQgSSmEMWHc
	uUHwUYqdXK4uo5k4lGkt9mKnP1fsRAExYByEctrGsTZ07u/mbIFWsFQ2Gmntdv0JzYZIpVdSGhPFD
	AH3CjJVesJcVrQpudlofEQXGYkSQIFm6z2ZTqoD+BfTqYExBq790FE4X1ZliLLRdFOH3+vZiIyzt8
	8evfP0/6aqOK3DiQ0zlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCll-0000s3-72; Thu, 02 May 2019 14:33:05 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMClh-0000pk-Jr
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:33:03 +0000
Received: by mail-lf1-x144.google.com with SMTP id t11so2034889lfl.12
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLwpITDJbH5GI5CFlNLCDZnAvlJ2JECuaH3FVz5jQ5k=;
 b=B8bbSTqIqX7Z3Y/lOUkykw5zHh0zBSiJa0H00hD5qAIoS8iHZYC2RkYIHqbEt0f53l
 DJ0jfody6Gp/40F1UpsoMBlN6w/42tf9Css6hiKEz6okVgyZUdQbngtnpWCQ2I4pAPir
 o1nK1z+Qt/hkacbm1Vr5lshgYPVqYplOku7zPzNzVtS5i+xrF+Gw8+kpFddqFJgWAXER
 17QcN+srN7FchUd+l2dgkDHT5dzMLzgO+9P9vvr0V8or2O6k950RGv6wMYOikujbPsLc
 0jhBBGIcH+7qmqtlt2W6C2jn1fBngpVaWIToe+nUI5jxOO67z2xnJAjucpPu818PO0L6
 gCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLwpITDJbH5GI5CFlNLCDZnAvlJ2JECuaH3FVz5jQ5k=;
 b=toM9liV8jesRvtook3B4teUeFG6ST0Ns228kXRdTTK2EKamFCIgt5O92JzCjDEOR6I
 7LDj6KdNVuG8GjAvB+h14m0BRo4mI29LDsEpusqXZZDFdsjLomeZYXi5KhqXvCVNXY7/
 Fp7YmkcSzo2QKA7KjcFs5PENQVX3KauvcpOtgZPkWh7S5WXfpkWoycHf9ptuGw4hOaNV
 529FC/9n/qdUjlyPPt29cexIumypc8nrLMOx2Kq5nf3/MrrHq8PQokHGX6JS+URuRsXL
 gtTEw+RiRtxWf7RCTCLEMHYg8I+YsIAuZtxSJX2y08kFs4GXxQOIyI6wcSGRgJUHEwyw
 XFpw==
X-Gm-Message-State: APjAAAXgG+uznWrKjiSIbPIfbfz6ar/HmOH9tjWHwMpfrbJuQh5d8eLj
 OCSr4wXN6QuxP7x956WepY2gVA==
X-Google-Smtp-Source: APXvYqxdouSScIcbyXamQ2nQHYqDeBvJtlqQwTQcaPYEJ5wH/pqLU9ay/9bob/B+yUNTF4g8jtGa+w==
X-Received: by 2002:ac2:596d:: with SMTP id h13mr2347513lfp.35.1556807579576; 
 Thu, 02 May 2019 07:32:59 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id l79sm9430625lfe.92.2019.05.02.07.32.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 07:32:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 1/9 RESEND 2] mtd: afs: Move AFS partition parser to parsers
 subdir
Date: Thu,  2 May 2019 16:30:26 +0200
Message-Id: <20190502143034.16781-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502143034.16781-1-linus.walleij@linaro.org>
References: <20190502143034.16781-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_073301_649251_FA51400E 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This moves the AFS (ARM Firmware Suite) partition parser
for NOR flash down into the parsers subdirectory.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig             | 16 ----------------
 drivers/mtd/Makefile            |  1 -
 drivers/mtd/parsers/Kconfig     | 16 ++++++++++++++++
 drivers/mtd/parsers/Makefile    |  1 +
 drivers/mtd/{ => parsers}/afs.c |  0
 5 files changed, 17 insertions(+), 17 deletions(-)
 rename drivers/mtd/{ => parsers}/afs.c (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 79a8ff542883..55cacc1edcd4 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -60,22 +60,6 @@ config MTD_CMDLINE_PARTS
 
 	  If unsure, say 'N'.
 
-config MTD_AFS_PARTS
-	tristate "ARM Firmware Suite partition parsing"
-	depends on (ARM || ARM64)
-	help
-	  The ARM Firmware Suite allows the user to divide flash devices into
-	  multiple 'images'. Each such image has a header containing its name
-	  and offset/size etc.
-
-	  If you need code which can detect and parse these tables, and
-	  register MTD 'partitions' corresponding to each image detected,
-	  enable this option.
-
-	  You will still need the parsing functions to be called by the driver
-	  for your particular device. It won't happen automatically. The
-	  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
-
 config MTD_OF_PARTS
 	tristate "OpenFirmware partitioning information support"
 	default y
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 58fc327a5276..806287e80e84 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -9,7 +9,6 @@ mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
 obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
-obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index fccf1950e92d..419529318504 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -1,3 +1,19 @@
+config MTD_AFS_PARTS
+	tristate "ARM Firmware Suite partition parsing"
+	depends on (ARM || ARM64)
+	help
+	  The ARM Firmware Suite allows the user to divide flash devices into
+	  multiple 'images'. Each such image has a header containing its name
+	  and offset/size etc.
+
+	  If you need code which can detect and parse these tables, and
+	  register MTD 'partitions' corresponding to each image detected,
+	  enable this option.
+
+	  You will still need the parsing functions to be called by the driver
+	  for your particular device. It won't happen automatically. The
+	  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
+
 config MTD_PARSER_TRX
 	tristate "Parser for TRX format partitions"
 	depends on MTD && (BCM47XX || ARCH_BCM_5301X || COMPILE_TEST)
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index d8418bf6804a..f7a8fe66e2ca 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
 obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
diff --git a/drivers/mtd/afs.c b/drivers/mtd/parsers/afs.c
similarity index 100%
rename from drivers/mtd/afs.c
rename to drivers/mtd/parsers/afs.c
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
