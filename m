Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40DAC76191
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F872086C
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c9mFqRCu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6x9FMyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79F872086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfJnBHqEJskE0ZH9u38mznp6bKC5Ms2eHKVwEAMr2oo=; b=c9mFqRCuUOtjTt
	DY0Zuto4OdA0nzlJiGH5eFuAaz/4XsCfvq6b3cq3T9KQ/jJMDzLBtlKNkgeBjKjs5JvEEP/1wpZXL
	s8BAeGv6/6EM4GsHfFOXO+ZBy7Fr4aOvBeN1NjqcD/1Zgtm/7SoISZUSECgGQ2lTDBjIlE1vmPxW0
	AD4ks4K8LIOza0I8XQ3MVqgV5lEf+XvokWmKIL4USiHjLD5JraeFwsdxigHXDBubJxRBsfHu/I+Mb
	XrLGp9w7eeSUuiHzPGhNatbOJeVjTcgbN3zK8wgLF4EUe5j9X4yLYLEWndQmjoj2IamSWWcv65LV1
	asrEt4vVuurpCuB/AEyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn8pM-00073X-TK; Mon, 15 Jul 2019 21:48:08 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn8oU-0006G4-5n
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 21:47:16 +0000
Received: by mail-lj1-x243.google.com with SMTP id z28so17848962ljn.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1cRcRaapjU5N1Df1kN08IAzOtzOWxj2FyeaHLFPjT4=;
 b=B6x9FMyUwROcLMo0+S96pLHVv1rZA/CYaYovvJ/hImmccWAdyTbbFbDWwCnXQ2NRln
 aEtlXxvzUYBblh/fkOwLChy8bXifd8WljOvuO/I5/QM5MNYU9mpLorPc26d+X7aFoRH8
 YPvfneLAvTAeEtHYSHnq7ec5tLnoQHSlpUhzDLCUMDqRFdZ3NyJaFrjyZ3F7KPLeD4Th
 AcNu6SjUNQzmQXKE2z4k58kEYCi1FGyOIW/6sMD4pWDZ9LMx0TcLcFnAsVN7RQ35D6RG
 ixHMjx2tDTPsj24bMaVU4P4zHb90l5kU5QXOkvre3fC7WmiDMitTJwWgScyOIDGb4RHM
 ZI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1cRcRaapjU5N1Df1kN08IAzOtzOWxj2FyeaHLFPjT4=;
 b=mpEcB1/1yRsT33e7CUXIWE2fwHxm00dFnOOvM9xKs34EnCETP9coxYW1RtMPilKZ9u
 Rckj26xAtHQRCGSx1fyQpFJK3ibXmymAOvt3/GfLaOnb69lxtXjrjhV7KI967QuDe8PM
 79IGJgR/ylYjBZQGv4ouGXRpoCMlawn3V/ex/9dtlAzDXGSG3mnx6CU+M5O+0vnS9ucX
 IedmXRIjJrn4HPtHRILLezU9SZpYl+FLvy2XhMxSx/qor1XOmbrh8DEJP07tjkxK23yf
 q746CFlKB6ICRtXkpMgFQAtg5oBI1O/fz/r0Ygn/QKCNjoMPLH5J4SvONc/QzIMHej/g
 5Syw==
X-Gm-Message-State: APjAAAVzw7BatOzTF8dIV/T66LCzHISQ9w7usNxWlUE+JcBE4CPchyuO
 sVlqocyMNjbOJAgSsndPOCwHnQ==
X-Google-Smtp-Source: APXvYqw2b+Z/HKEyKXdrEwuIj/z2ez3JNM1wwx/ioMXdvBxWd1QPCT3zZT7rB5d9fyfF410Uy7aEjg==
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr14617728ljk.90.1563227232737; 
 Mon, 15 Jul 2019 14:47:12 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id q2sm2457074lfj.25.2019.07.15.14.47.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:47:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 4/5] mtd: parsers: Move OF parser
Date: Mon, 15 Jul 2019 23:46:33 +0200
Message-Id: <20190715214634.31697-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715214634.31697-1-linus.walleij@linaro.org>
References: <20190715214634.31697-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_144714_386679_279DA30B 
X-CRM114-Status: GOOD (  14.10  )
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

This moves the OF/device tree partition parser down into the
parser subdirectory. No functional change.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig                |  9 ---------
 drivers/mtd/Makefile               |  1 -
 drivers/mtd/parsers/Kconfig        | 10 ++++++++++
 drivers/mtd/parsers/Makefile       |  1 +
 drivers/mtd/{ => parsers}/ofpart.c |  0
 5 files changed, 11 insertions(+), 10 deletions(-)
 rename drivers/mtd/{ => parsers}/ofpart.c (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5a833305e4c4..4833e5b640f7 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -60,15 +60,6 @@ config MTD_CMDLINE_PARTS
 
 	  If unsure, say 'N'.
 
-config MTD_OF_PARTS
-	tristate "OpenFirmware partitioning information support"
-	default y
-	depends on OF
-	help
-	  This provides a partition parsing function which derives
-	  the partition map from the children of the flash node,
-	  as described in Documentation/devicetree/bindings/mtd/partition.txt.
-
 menu "Partition parsers"
 source "drivers/mtd/parsers/Kconfig"
 endmenu
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 7b4dae4cf52d..d5f1fd696f87 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -7,7 +7,6 @@
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
-obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-y				+= parsers/
 
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index e356b4311d4d..2001d96cb82a 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -20,6 +20,16 @@ config MTD_BCM63XX_PARTS
 	  This provides partition parsing for BCM63xx devices with CFE
 	  bootloaders.
 
+config MTD_OF_PARTS
+	tristate "OpenFirmware (device tree) partitioning parser"
+	default y
+	depends on OF
+	help
+	  This provides a open firmware device tree partition parser
+	  which derives the partition map from the children of the
+	  flash memory node, as described in
+	  Documentation/devicetree/bindings/mtd/partition.txt.
+
 config MTD_PARSER_IMAGETAG
 	tristate "Parser for BCM963XX Image Tag format partitions"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 582def540880..69b2c5289f96 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_MTD_AR7_PARTS)		+= ar7part.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)		+= bcm47xxpart.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)		+= bcm63xxpart.o
+obj-$(CONFIG_MTD_OF_PARTS)		+= ofpart.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/parsers/ofpart.c
similarity index 100%
rename from drivers/mtd/ofpart.c
rename to drivers/mtd/parsers/ofpart.c
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
