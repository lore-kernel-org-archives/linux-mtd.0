Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4712C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:26:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A421A20840
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rsC3THoA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4XzdX8f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A421A20840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cEOdUqBqzy1DiRQmejOK8YtwZ6IJ6YtJ+TpJ/cbQrI=; b=rsC3THoAqa+8Kz
	87853+5CiD6J9jcoURtAk8nVYWiMIqM2hTXfYqkOpD7QtlEs2ItdB2N8pXqVS3nyp5Od3VookMv+/
	DJwMeK6ASTS6inLChiqDoaYBy+0mqzU6Nv1hSD5jFS4dA03T3trmL2dpzK+bSyGf9V9pcIrRo0/sW
	4fLXBkTVvjfa0CxOU6RVZVbJcX51Mw5W23/cHBtQuZgabRnqMTMi1on9/zYlcP1KgzqRK1uZxGbqW
	YJ85WijCowuAvIyNTNsD8GJz20NC3Il4TSDQQP66gcKCp0FrTZLnQHGbpSUX2jAGCXsMV1uvqB1Z+
	uB4STf1OCgak7gPtiYJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxRCE-0006f1-TL; Tue, 13 Aug 2019 07:26:18 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxRBh-0006AH-KS
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 07:25:47 +0000
Received: by mail-lj1-x241.google.com with SMTP id f9so2081018ljc.13
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1pV4fnGH1vo1HyHkBapBW12JFh76kbsjW7yRRGtNp4=;
 b=d4XzdX8f/CWvK/ZpL1xcxZPDWH2m+9dgcfvFTl4EeHS2KRYknBu3X4KBALUD8Ccyao
 7fSYsOtS7weA2tXcpzG1h6Et03qysLYT+G5XsXS/vWglxPBKAyHaXnvVJEWPBPmfiK7l
 LLjPkzw79coqd5fDosRcQ63Yh39wvgXZ8MHpTG3IZCj0AO4uk8IhiRYLEcsXTKqie9Se
 TOSXC2sOMQONXZ6L/ZXTZhtLdn6SGHIzJuakNFvoDF02GszF7LQyH0sB07yQCUztQT3G
 iyNpQOy+oY0mdB1P1qrGbfTZDthn02x2p5CSUkFfmbAMdjpSY/nRIdjyxjphIpPBDpte
 L6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1pV4fnGH1vo1HyHkBapBW12JFh76kbsjW7yRRGtNp4=;
 b=pCh10FAwgyVPLVYmlK3isqEuhe7yl7vdrrJW4jj7ucL60ZoQc556oiaIlKTAH5Yq9U
 hQ4yaTfelJZjEhhRD3iVoTXkwmydeuOF+V1+6ttkQkD9wuITITL70yA5OoK0tdpx4Mw3
 HFTKHhiYgfzvBw6zmO6onB7uBNOqs6KaYg25qYoanUa8CKg+U4x5jKlhQ7MSxx+I+3my
 vHDBPLUjnoxNzX+zWfF1BNopDsQxBPrTH4HMKRG6Olw/NsUolTjCwudnzIJgY+yLt6iX
 0MhkIZ0XpWeyLtKdk2d/gReMVW85VHZZxeIFZYLV2igyy4uw9C83WjsmysMp/J52rMTS
 Da0w==
X-Gm-Message-State: APjAAAVGdSrhCAWBNKDvTtlMujjCD/xWVJT6ylg+oPEUFu9BJOtr25+s
 rbVV6PERqVRvJ4eqDXywnAqRc5W0+t6/kQ==
X-Google-Smtp-Source: APXvYqzjiFW/BJf5Ax9StmbfZyWbKG4p5phFAQYwGb4Y1RVWeus3e95xiZX0XuMYZ7FPifZ5HWdtNQ==
X-Received: by 2002:a2e:5dc6:: with SMTP id v67mr21178024lje.240.1565681143910; 
 Tue, 13 Aug 2019 00:25:43 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
 by smtp.gmail.com with ESMTPSA id d22sm2004804lji.99.2019.08.13.00.25.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 00:25:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/5 v2] mtd: parsers: Move BCM47xx parser
Date: Tue, 13 Aug 2019 09:25:28 +0200
Message-Id: <20190813072531.4234-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813072531.4234-1-linus.walleij@linaro.org>
References: <20190813072531.4234-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_002545_731167_3621D608 
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
ChangeLog v1->v2:
- No change
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
