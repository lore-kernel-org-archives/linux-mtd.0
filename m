Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0136EC7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A172086C
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZJpmzcI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q550e6BG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A172086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xPObIu0QmLH6S17gJMeoKM0DkW/HxpngZRkalIQuaM=; b=WZJpmzcIJ3nkso
	Xj733yrUO+8auG7AZmsyNU2EmD64rpR5b1zphkaiDxZ5VvSkOm3E0xsqXIe+kKr7jwiWKwtjJsut+
	LvA1nJyyoIXMle9ftlNtwGuVmaAqUg/++bsJDe40idKMzTjBOcEJcjcjN9TwvTM5tG4HzZD/1pfu1
	fg3ik6K1MK9j1qws5vo0KpCYbAt6sCXrM3Ru+B9Ic4qaLfAAG3MRqXr4m4lS9iwipnvzC+c1hl1M9
	KhkxGZUFVFqSsVWgrdszR98918v2ACx1udxPqVkwbEOZ1hZUw2+4u6M4x8fsrKxwYeCTgrF/Oc/dI
	Qd+Bd5evw+OlUdBTuong==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn8p8-0006pE-Jf; Mon, 15 Jul 2019 21:47:54 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn8oR-0006E9-R4
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 21:47:14 +0000
Received: by mail-lf1-x144.google.com with SMTP id u10so12073300lfm.12
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbcQRcT6iuS+FA0RcNkq6qGNeQ+0TsbgnavCbnJ4hZg=;
 b=Q550e6BGsMj/hx0CAxXYa0jsCq+ad6p43FVY6sPvp44TV5DVTQ/XkrpHN+2v9FFNRF
 UQVShV1urdFf/o/FKvAX1CQ4jKPSv9sgMXKacPUik2ivGdUo17xmYAq1S1Tb4Pqs6rf+
 zMrB8efCOsCW75bwDunxXgZoG0WbCNdUy4IkN3NvT2VUE03AR7MODC/t/gBgtBjnW/cs
 yOjBVU46qz1REGwThOU32RV56MoyUFAOmVJrhF/c/g3D42SDwns8MAg617GPja3y9RT2
 f0YD55mP+UoKQszNeMD/JfmMT8egk9uJva32ssagjxWprlTw8kW5/j9wc+fFsmmETbCc
 e/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbcQRcT6iuS+FA0RcNkq6qGNeQ+0TsbgnavCbnJ4hZg=;
 b=l/JfO3zi6J5H5eZYVfAR3leLuECNDK4Y0bhObzuCyUbKyJlRJlFJ33kRTOsCpRxi2E
 s6k6cqjPPXZSYcxFQGa4I1lkzCqT4zEl+EZFKYhj8yzs0PXR4Pi9HiL4B6F71LQDemJW
 xk+ZaxpfGhEIpPcyGGsHhXGorp0lkfJ0/igUpDRY0WPXTJe01Zyd2mSffzlGADsedZSF
 xErcvYTGsSjcqhv6jplNjmUrHMn5mRWPupPo4KCoN5N1w7/YK/9yMp/vmqoa4dXyMJf0
 7LWbYUamHmB3cjaUjiVoNXYFzkGcbM/9HfCA2RadizC8c9CZorYuU0Z1NYPxpQjbJ9a4
 QDQg==
X-Gm-Message-State: APjAAAXBLCSTbQSI6aa4xO74MGaMlyunVCMQ6KPanHNLMS4NdFU/x3bX
 SpLp+cH+ouY0Jrwn0EOWhFK8BQ==
X-Google-Smtp-Source: APXvYqzcV0FWjzv/7QXtdNUjxJ6+gjg2zXJCPm1KJJJKbN7FzWgaYs2nW2ZCa/0F7EEXsxCUIfVtFQ==
X-Received: by 2002:ac2:5636:: with SMTP id b22mr12302379lff.2.1563227230466; 
 Mon, 15 Jul 2019 14:47:10 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id q2sm2457074lfj.25.2019.07.15.14.47.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:47:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 3/5] mtd: parsers: Move BCM63xx parser
Date: Mon, 15 Jul 2019 23:46:32 +0200
Message-Id: <20190715214634.31697-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715214634.31697-1-linus.walleij@linaro.org>
References: <20190715214634.31697-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_144711_996164_AEC89F54 
X-CRM114-Status: GOOD (  13.12  )
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

This moves the BCM63xx partition parser down into the
parser subdirectory. No functional change.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig                     | 9 ---------
 drivers/mtd/Makefile                    | 1 -
 drivers/mtd/parsers/Kconfig             | 9 +++++++++
 drivers/mtd/parsers/Makefile            | 1 +
 drivers/mtd/{ => parsers}/bcm63xxpart.c | 0
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/mtd/{ => parsers}/bcm63xxpart.c (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index c1feaf2da808..5a833305e4c4 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -69,15 +69,6 @@ config MTD_OF_PARTS
 	  the partition map from the children of the flash node,
 	  as described in Documentation/devicetree/bindings/mtd/partition.txt.
 
-config MTD_BCM63XX_PARTS
-	tristate "BCM63XX CFE partitioning support"
-	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
-	select CRC32
-	select MTD_PARSER_IMAGETAG
-	help
-	  This provides partition parsing for BCM63xx devices with CFE
-	  bootloaders.
-
 menu "Partition parsers"
 source "drivers/mtd/parsers/Kconfig"
 endmenu
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index bbc81595e693..7b4dae4cf52d 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -9,7 +9,6 @@ mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
 obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
-obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
 obj-y				+= parsers/
 
 # 'Users' - code which presents functionality to userspace.
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index e5288b9bb8c5..e356b4311d4d 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -11,6 +11,15 @@ config MTD_BCM47XX_PARTS
 	  This provides partitions parser for devices based on BCM47xx
 	  boards.
 
+config MTD_BCM63XX_PARTS
+	tristate "BCM63XX CFE partitioning parser"
+	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
+	select CRC32
+	select MTD_PARSER_IMAGETAG
+	help
+	  This provides partition parsing for BCM63xx devices with CFE
+	  bootloaders.
+
 config MTD_PARSER_IMAGETAG
 	tristate "Parser for BCM963XX Image Tag format partitions"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 3e020c66af64..582def540880 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTD_AR7_PARTS)		+= ar7part.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)		+= bcm47xxpart.o
+obj-$(CONFIG_MTD_BCM63XX_PARTS)		+= bcm63xxpart.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
similarity index 100%
rename from drivers/mtd/bcm63xxpart.c
rename to drivers/mtd/parsers/bcm63xxpart.c
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
