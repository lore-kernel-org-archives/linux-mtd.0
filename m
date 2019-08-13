Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A30C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:27:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB8420842
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F8No01Cl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NUlUiHvg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CB8420842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gU8eMLz39uHhnD8/b7kv8vDNICL3dnhTYV++XrWylEM=; b=F8No01Cl0l0GG8
	JVW4sX7FGyRSuleU/nHeXqGGN6RlZJSJmKV/LgujXZGoGV2BVxWNBKH2EsSxIYtbc5Zl454sRYghX
	np0AGVQMS+7FJ8WtjpHfTpX2b0t6mINgg2e4nGeI69ZNqcejyTNltLUbedNBEPNIAQYT/fsau+3pJ
	BOw2JulFEfoSmkdheJjK6SNseR2oWmUB430vnlUoY+UnQRR+trMsXmaUKrAc3IU/okLjxhiAkXNFW
	ln2X3sP2NRFrz0YpoFl1d3PKvXtD3Hq+81dYGFWcTeOPPGmIcUH5dyT+xt1AF+M2fX8PLY+bAjg5S
	nXWoctav7UX4Jx30Rjbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxRCg-0007BX-F2; Tue, 13 Aug 2019 07:26:46 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxRBn-0006CZ-1i
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 07:25:52 +0000
Received: by mail-lj1-x244.google.com with SMTP id z17so12169385ljz.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 00:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oH0gsM6PSwK8sABlFGO6YPFcVYxGHhBovZ6wjjvm89E=;
 b=NUlUiHvgVHrjCZzkbVxA92fjQP1licClnbzO4niD+UYenUI7IDYdiq817EhSVlRHaM
 3fEwweRE0E3mTQdSGsiSuPqAPSNi03jzUkP2n3zxUt4Wj3H+rLrFxo2+DSiJ6bUiYoLX
 lA/iqDNcWgxuKdQvhY/isUN8VmaljSp87Zk/oB9Z6cQeDwYjZZ5VBHA15Wb6N/mAkQAg
 duoZEN/NhkDd7wipF61fakQsUjTcrH2CnY9wLr73FZTx/GdVWY9cY8toF51Yp2W/ye20
 w/F9SyZtFUa5jQn6YC5UbFqXX+m5PpgWAIn0HYYx5ui9L8+4SjRiIzFrsVBRr+8TCjQm
 wJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oH0gsM6PSwK8sABlFGO6YPFcVYxGHhBovZ6wjjvm89E=;
 b=FVHJx5p3x/vz8FALDFc1l63o1+K1KxAim57mig/pkeFZiH+PxsCrMNu+4h+W/Alww5
 9vzqIzGT2cSjHJJYws8p7skrQxZHqirLjtxmKtYPuDwrT6UX5Tv8+ekO3a4da4pv+Jza
 R91v26ute3B+vYCLD90MTR/NMrckNqI0+N864vsIuBOiTtieGuV734snfgqDeomvczdU
 +9o3ZQykIZbLW7IEodWzGSLVxrYwybEjS2tr/OydqQ8RAOt4jDyX5s0rfNaouTmVFUpU
 WibOLP0s6KpkHtcDm5hHYNabvxWsX8Ocwm1aNGOR1mzwWPGwSrNJR3dFtx1HAQ6gJms7
 jhLg==
X-Gm-Message-State: APjAAAXzP8Wh4btUbGh3MbdzX/ettuHyRoadAfS94TNJhoOcImcRdcb+
 1Vu3L7jUARlophJ1gP1xFfx3+A==
X-Google-Smtp-Source: APXvYqylKH5zfPmMk8Fh7M1BoZPpZogiEF6wpKcMbUPRZK150zu2Yhl5anYgAvT9f3wrRDqjlol8cA==
X-Received: by 2002:a2e:b4e6:: with SMTP id s6mr7550254ljm.169.1565681149313; 
 Tue, 13 Aug 2019 00:25:49 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
 by smtp.gmail.com with ESMTPSA id d22sm2004804lji.99.2019.08.13.00.25.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 00:25:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 4/5 v2] mtd: parsers: Move OF parser
Date: Tue, 13 Aug 2019 09:25:30 +0200
Message-Id: <20190813072531.4234-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813072531.4234-1-linus.walleij@linaro.org>
References: <20190813072531.4234-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_002551_168101_F601D615 
X-CRM114-Status: GOOD (  14.06  )
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
ChangeLog v1->v2:
- No change
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
