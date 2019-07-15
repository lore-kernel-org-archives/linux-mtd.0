Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CBFC7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1AC42086C
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U2yU2Kjc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWIpraAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1AC42086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALlBV1Y0vdqyhEASYn/LX43oCWEsZQcpMUpoyljgAVM=; b=U2yU2KjcJSdAJv
	/0DOw1Md+4yZddOloQMjblMSSPLE7qxgm7HP1CMoH5k2TQVtax6C4kmkHCGnEe5CUNwzhJsBG9JQd
	STqj9EUizKS0WIzQXXwy0z0RI/MoXIa5sTI9bwb4OW7aA63SRas3FyKPaoRWhhkyt/Ma88jYH6x1T
	r//5OiAXfL9Lin4bm3AEPjWUI3R+uZahmKddl0LGEEg0eF6V8t8sZzTGBkdcF1PgP+2UX+slFKwrB
	7emmUYHwJWF+cQ8BUc7eeXbVCiEPt3Dp0jdkscg89Y/Z4aE6uYLLZRx4Woe9LgzLBHXOGxIzJVTLB
	DuXQWGN4SpJSCdAcrIMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn8oq-0006b2-T2; Mon, 15 Jul 2019 21:47:37 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn8oQ-0006CL-1e
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 21:47:12 +0000
Received: by mail-lj1-x243.google.com with SMTP id v18so17788057ljh.6
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Gvoz6lWLHY3Yys84TfyGGpzK03sb4sFlA6zKbEOWpI=;
 b=MWIpraAzlOVHFizYwu6FKxGl+195l7bbDu/NtzAzvaA5Ry2fKfuwEjPYMbOvPSLzyd
 IE5qoOcdIIUHP/739l/qeRCHBXwKbErjIkmwmsjhL4JNunQYRXnVClqEeiz61Wb8ByJy
 U8zJJCawjn4ZHO175Fx0RamzFoyMDcSVsGsLCcJSTnfZkneyTlozeDS2I9LEZnV4/Oz1
 tzgxtoHwGqz+2epptu8cX1zYGjv63HxJzhhSv9OXNlBpEhPoYsGugp+poNGLlamQOOtG
 PebJYQerNpZyvM84hsorclGDH0nDM4iA3DxeQOCuTuKRRaEXRmh3Syq7JF0pZwqFhZWm
 gwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Gvoz6lWLHY3Yys84TfyGGpzK03sb4sFlA6zKbEOWpI=;
 b=g+mQJez3jMqSxIYIH0IVIZfgmtASlCFiEg5kGtPy7YZD0YHVI/XoF1MKlxZaRZlzT+
 Qezxkwn/rzYHUDsmHjoiPOXPkYFq8/Urfda6X46oMobUjsg1A+LU8unKooMT1B+zkM/Z
 vfg0iCmXlLTFTxBvldcm10qqBqKcc5RiHTlg+2TQ5BaBZQSHaHBTp1QzVLVoQ5kmjXVg
 hRso8/f5kLtOQEHZlPtQvx1iZKQD60FA0TL8efOxRKlZBL1NF4V7cO2esi1MLWxxVXu9
 n7RoTKOISCgKG1jN2xuRenNS6QZkDHoHuVmfA+8Jnu50N7ft8uqty3WRMQF17esv9GQ2
 +xfw==
X-Gm-Message-State: APjAAAVvtyBESEw7Xt/AlbO2drUvIR7TrFC6XPx/7Nxnt6v2gIXEgCDT
 QcV/by0jKuHtzJzFh2QTrzppgQ==
X-Google-Smtp-Source: APXvYqxXQnJaI7FdQzwecG8WBHr80tOKSkhDu3QLgFjM1f7XOA2Yqd+CIZRWOnCV0vuvS3GI652NSw==
X-Received: by 2002:a2e:9701:: with SMTP id r1mr15314659lji.12.1563227228289; 
 Mon, 15 Jul 2019 14:47:08 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id q2sm2457074lfj.25.2019.07.15.14.47.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:47:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/5] mtd: parsers: Move BCM47xx parser
Date: Mon, 15 Jul 2019 23:46:31 +0200
Message-Id: <20190715214634.31697-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715214634.31697-1-linus.walleij@linaro.org>
References: <20190715214634.31697-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_144710_366487_7EEB636B 
X-CRM114-Status: GOOD (  12.05  )
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

This moves the BCM47xx partition parser down into the
parser subdirectory. No functional change.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig                     | 7 -------
 drivers/mtd/Makefile                    | 1 -
 drivers/mtd/parsers/Kconfig             | 7 +++++++
 drivers/mtd/parsers/Makefile            | 1 +
 drivers/mtd/{ => parsers}/bcm47xxpart.c | 0
 5 files changed, 8 insertions(+), 8 deletions(-)
 rename drivers/mtd/{ => parsers}/bcm47xxpart.c (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index c86a1cac6121..c1feaf2da808 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -78,13 +78,6 @@ config MTD_BCM63XX_PARTS
 	  This provides partition parsing for BCM63xx devices with CFE
 	  bootloaders.
 
-config MTD_BCM47XX_PARTS
-	tristate "BCM47XX partitioning support"
-	depends on BCM47XX || ARCH_BCM_5301X
-	help
-	  This provides partitions parser for devices based on BCM47xx
-	  boards.
-
 menu "Partition parsers"
 source "drivers/mtd/parsers/Kconfig"
 endmenu
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 690d0b8e528a..bbc81595e693 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -10,7 +10,6 @@ mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
-obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
 obj-y				+= parsers/
 
 # 'Users' - code which presents functionality to userspace.
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index 3b3675b8d672..e5288b9bb8c5 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -4,6 +4,13 @@ config MTD_AR7_PARTS
 	help
 	  TI AR7 partitioning parser support
 
+config MTD_BCM47XX_PARTS
+	tristate "BCM47XX partitioning parser"
+	depends on BCM47XX || ARCH_BCM_5301X
+	help
+	  This provides partitions parser for devices based on BCM47xx
+	  boards.
+
 config MTD_PARSER_IMAGETAG
 	tristate "Parser for BCM963XX Image Tag format partitions"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 0bc06386bfcd..3e020c66af64 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTD_AR7_PARTS)		+= ar7part.o
+obj-$(CONFIG_MTD_BCM47XX_PARTS)		+= bcm47xxpart.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/parsers/bcm47xxpart.c
similarity index 100%
rename from drivers/mtd/bcm47xxpart.c
rename to drivers/mtd/parsers/bcm47xxpart.c
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
