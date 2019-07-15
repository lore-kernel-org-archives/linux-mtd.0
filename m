Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AA0C76191
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79A12086C
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 21:47:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqxOubjJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xj88Vygb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79A12086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMsOaupqCu7i56SguZtlhDSHDzJX/77rTeRYjaK7JH8=; b=CqxOubjJqsVk95
	I5aW/e66UwctEQXBPVuZ1yol72ilcxkjqjb2zNgQ7KXHphuPnQNQV5Kamae/Sd3xyKMfG/Iwe0ZM6
	3qG7LR9CD48T6UPasp1PBBKpEAImB1f7bmLbB71oz6Qj6bHzlHA2LvPHD3scDrLHeFkRd9QohVTet
	A+FWvPbTUN5lVAAhujuPi9GP0++uoaHIaI99oKqSbtVl776vfe7RSR3mxKCFV6KHavs3Q9C1e2QX1
	Q0RguHOYgjr/xEeyeyCV9VM01Ypi0f6hFIx8d3BK4S/kocXMnRHkZhTeCb+EJVjWWbxD9rOmwepLg
	SAGXx2iB7tkk2xIJAXvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn8ob-0006MD-MH; Mon, 15 Jul 2019 21:47:21 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn8oN-0006Ai-JI
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 21:47:09 +0000
Received: by mail-lf1-x144.google.com with SMTP id r15so7201842lfm.11
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 14:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxZ6R3XIrg6gKgkJX9x7Ncu8nBSSZe1N1TWX7JOY6tw=;
 b=xj88VygbMOVUsDvelTdadNzbWFFNzea0P1Gn1baVkX2aXoAwcAw+tEfDJOr1YvP6D4
 JdXn6Na4Lsr5mb8vxtDwBDGj1yRLDFMXX69cXGRuJkjYzDT37RK7hHc6BY0kYCp+PjHv
 WfZNnDf+LBIlcp0Sm8T0abma+v+BGiJCrQSR3fll/TGQIQHHCc4Twulk4BJ/YNorbdOn
 sJ30S+tPJRxkLGJfZ2nvM7Q/IF+wXsmn58skPeAEmOUCAaH+ey2kStvMeBaIekdIigGS
 4mrnbI51jrKj1x1s9hT2RV1Nmr//cA08+SpRlTWDa9RG9R5QlaT0V3GXm0TQfildfa7r
 YkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxZ6R3XIrg6gKgkJX9x7Ncu8nBSSZe1N1TWX7JOY6tw=;
 b=STWk84Xdsfd41fnI51McG3yTZCHo4aFZP9aM5+oDCxHkipQ+zodZq3kpOz1BozcSAX
 SsP8Re9SF+9x3yYSKKpNTxWE71uFhedrBY2+TPhHQl37PKdf8jxFbH+kpG66VYudwFnE
 pVsAx6PtfUbH7Zaqm3+uv3tbF7n/dYNv2QxWttt2ZW2edzCwOexPXEw67XfmeE8DSsw1
 RZ8GQo29L0ATV0zaZcE9dxfETHeJYCOohsJvcyiVEQ053c5qShqn60zLLDoTA4lZBbia
 BZbFqFMPnGqxDv2hzfRTQLxjz4nuY5Dl9iDRMFWrwzfIzPZoQjwmIaeF+X+EhA33n+r7
 k5OA==
X-Gm-Message-State: APjAAAWWAmgXh7ALjj09wUXPYy5zf9EO4yRYCgQyal+7Bd01ISjuVex5
 1q8wIy/lPtAhrCDejQyzOm9BCw==
X-Google-Smtp-Source: APXvYqwOqwwhgvWpnLvXCK6ZmvJOypHA6YEwxOF/8qlTxveabEJjgVu6WSI1PlOUvVHNRqVKMxIWhw==
X-Received: by 2002:a19:f806:: with SMTP id a6mr12642061lff.102.1563227225918; 
 Mon, 15 Jul 2019 14:47:05 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id q2sm2457074lfj.25.2019.07.15.14.47.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:47:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/5] mtd: parsers: Move TI AR7 parser
Date: Mon, 15 Jul 2019 23:46:30 +0200
Message-Id: <20190715214634.31697-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715214634.31697-1-linus.walleij@linaro.org>
References: <20190715214634.31697-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_144707_790985_7779560B 
X-CRM114-Status: GOOD (  12.31  )
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

This moves the TI AR7 partition parser down into the
parser subdirectory. No functional change.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig                 | 5 -----
 drivers/mtd/Makefile                | 1 -
 drivers/mtd/parsers/Kconfig         | 5 +++++
 drivers/mtd/parsers/Makefile        | 1 +
 drivers/mtd/{ => parsers}/ar7part.c | 0
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/mtd/{ => parsers}/ar7part.c (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 80a6e2dcd085..c86a1cac6121 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -69,11 +69,6 @@ config MTD_OF_PARTS
 	  the partition map from the children of the flash node,
 	  as described in Documentation/devicetree/bindings/mtd/partition.txt.
 
-config MTD_AR7_PARTS
-	tristate "TI AR7 partitioning support"
-	help
-	  TI AR7 partitioning support
-
 config MTD_BCM63XX_PARTS
 	tristate "BCM63XX CFE partitioning support"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 62d649a959e2..690d0b8e528a 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -9,7 +9,6 @@ mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
 obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
-obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
 obj-y				+= parsers/
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index 176b75a375b1..3b3675b8d672 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -1,4 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config MTD_AR7_PARTS
+	tristate "TI AR7 partitioning parser"
+	help
+	  TI AR7 partitioning parser support
+
 config MTD_PARSER_IMAGETAG
 	tristate "Parser for BCM963XX Image Tag format partitions"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index dd566bdd16e2..0bc06386bfcd 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MTD_AR7_PARTS)		+= ar7part.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/parsers/ar7part.c
similarity index 100%
rename from drivers/mtd/ar7part.c
rename to drivers/mtd/parsers/ar7part.c
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
