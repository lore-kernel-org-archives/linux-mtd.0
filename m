Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE702C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E75921019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFt95yhJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVhn7JtC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E75921019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDlx9JIz/j5vhDo/sU2Ok8HnWLOMFZP1m5XyjIhQXVQ=; b=AFt95yhJNr4LHN
	thDf6Lrmier2wuM0D/l1c0U2s7nmVw9hnu2pv+SaWjuSYtDiVrlFf0QivUZT9VE11GUA4C091w58l
	WxvPY98oGrNxvLrjwMuuRpwkhTSV0Xyzsn+8fZGaOSC6Iqhy9b6bhmWXjV6zf0Adw2QZE5JE5H1nE
	HvjYZqbL14SW0Wi9+cG1zw0blZrQQD3cHSf9Qcnq92YrLp/5qOQdmgvuje91wUhiJrwHAi0I7TpGZ
	50Ia43IOXYPVGdWCdMNspI0S5Qssh5r1SzNxSkKvLB54eCIamBW5Zaxy1TWyyoc3epdiKwAcWXNiO
	5Ll9bs6FwYzC4/bOF4bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmHew-0002at-Je; Wed, 23 Jan 2019 12:29:34 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmHel-0002Od-4H
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 12:29:26 +0000
Received: by mail-lj1-x243.google.com with SMTP id c19-v6so1769275lja.5
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2019 04:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLwpITDJbH5GI5CFlNLCDZnAvlJ2JECuaH3FVz5jQ5k=;
 b=FVhn7JtCzef4bq0PFqNTu87x2o2JCQvM1T3HhiflNpCKFkjsgnbQQ1kSDI18meSREf
 u5ozA3y1RmQH07au2Wede7XspScNvIgVdrG1/Py9Vygq/3HSgsIUTY8UQacaxgrC2uya
 MioaaWPrhVLm3KiSrJxCsFKC5eJq1ebWW3MSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLwpITDJbH5GI5CFlNLCDZnAvlJ2JECuaH3FVz5jQ5k=;
 b=l4BinnI7vvG23PVt+ohGretx6aJkCmpebjHihVGS+bRPJInNNo3bQX5Jk8OmAgclAx
 2wuUnhg/hBn89QyFFuNi9kf4nCJeTnl5AlIAMk8mGHYS7hZf1KpF1spNb0NZAi1GPd8x
 2EeJ/GVln3PuqruPoLvjI38FUEsapCTnWy0UvAgB7DmxHsoOpLJt5lp45TlOVaMXX2GU
 yawCov6ojG2qiHiWUZcByeEsSPJBDMSKMu7cpe3peNBCaboOqZxkd46F/AQNVX2ObxOH
 j6knlm6IgV9S2+8GIAk7k3Slnfeh4uMcMH0+vy0AOvzZCX0KC9Hw3lipSQpGnb7Qk7Bv
 qZBg==
X-Gm-Message-State: AJcUukdbD+eAe7xi4sfpKOEZdIu7jXCzkVJnJhw3YZfO95TnAT6H4AlD
 i3CI5Vg23SEm4BFxItcB71TeSA==
X-Google-Smtp-Source: ALg8bN6YZ5aImQPUkhMEHMiA69K6O8IX5z8LSRXWtyueESOnpQ6r5aCx9am6wkOBwB8ZIHXrppcHew==
X-Received: by 2002:a2e:9e95:: with SMTP id
 f21-v6mr1793307ljk.128.1548246561130; 
 Wed, 23 Jan 2019 04:29:21 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id q2sm475935lfa.63.2019.01.23.04.29.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Jan 2019 04:29:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: afs: Move AFS partition parser to parsers subdir
Date: Wed, 23 Jan 2019 13:29:08 +0100
Message-Id: <20190123122910.19024-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123122910.19024-1-linus.walleij@linaro.org>
References: <20190123122910.19024-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_042923_168372_9616F669 
X-CRM114-Status: GOOD (  15.09  )
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
