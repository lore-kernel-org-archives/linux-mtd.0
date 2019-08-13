Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7D5C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAA820665
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/QsVpe9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxnvTS6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAA820665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dv7exyP77X3M0yaRLDpsVyH7lvoVGbN+iB39kuJ0LvU=; b=e/QsVpe9jnRhdX
	Q3GwTqV1GGOnGe9QJ4UCWPROMNuo2SBT97gYBmbRdrAOiCjXWTf/E9S7XTxXJ++8K3XaAYvKCpXjT
	feQ/laO7rp4Bv0KMVlZFmpHhxoJ1ROzyTngHIIoqOn5qzewNtjiC/nM4RieVBHtD6nB2khpp4mMZ2
	UOfyJKXOmQ40l0dv3xBgZnONLXYqa6XMGSkBgkOsoivY4ZEJjqXaFbqGtSks7eoLqWmIIO6JXA25J
	W4E62x0hhLn2c43ZnXLpmbZ2B2kMncXcCVoiO/cBIw2TphJAzqtM/5YhdYx20hi0itHmeiXQ42too
	ujAJa3cP6IQwEcq5CjGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxRC0-0006OY-CM; Tue, 13 Aug 2019 07:26:04 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxRBe-00069L-SY
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 07:25:44 +0000
Received: by mail-lj1-x242.google.com with SMTP id x4so8475203ljj.6
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 00:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BhW9djIrniDsvzTOEKc5+aGZKs9ynnBhRyFirbRww+0=;
 b=rxnvTS6qf+lOevzPUeGpFl4CuoFuohDB2TKy3kRfx7cHoI3PA9TEC3RFAgSHISfKQA
 INIsr7QLYVuqi89V6cstC7WpYGVwa/wjpKN7oeMxFihxq8PjjPRsFvfRLxWmzuFNNHFJ
 zldk9UTUlyH3Rs0Iwafr2XRhf0nBNyuweqTHvsbR6bLDvZAX3iAL0C2LJT0S+SzSyU48
 OMy5F1mp7KRbQfhm4ePXNCxKkMSGmUmvlkl2nb1t3hWgmhuYDbfPiYwSvgYsQQ81y4Zs
 7FRR0cEkj059BF8jEUmSitrNdBsz1uYVlk/yqGf578pe+Hh7O+qVo9/KFbetT57lePzk
 4dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BhW9djIrniDsvzTOEKc5+aGZKs9ynnBhRyFirbRww+0=;
 b=juwIZpvPwYXecnroOaccZ9jKw724AuPTv5qB7Ooz3oheZcMcPtPD/+D0I9fJYiptHr
 3s0p/AY7HH0LQuc/R35zofBeVTvSSsqo3Lh+Kt/ZD3aXHtZ3Ckc3+Ii7A18s9leJ+bjf
 ML8MqkOAUpge1aoxacqha26krsinp48ekkWeecO6SrLT5cz302pZP4pXLOuZSVphGe1x
 Tw9TgNeDiBkFtIhovlmKrvZ/cRPK3X6U3lX7XhzYdmdlqH6815kuJoxI7hDH7nf1trxH
 RkOtw0pcunXWpFfbk/DedYjqykO1QLdfyNWcw2Zz8jBktS+Xe3V6Rh/dkiNf+3QjCH2n
 vnCA==
X-Gm-Message-State: APjAAAUTVolYlENQQkRzTa19A6AqjgcJKQQMex4OUgmMYz6rKTrJupMA
 CMdr8YQnTcUOoOa5qtGCe7gCag==
X-Google-Smtp-Source: APXvYqwEC4bihKcB7jCGauV8Rslq1N4/laKrsRaoJUYj9grQQk32+PJKF6yh1kFNP7V9I4GnOZYbjw==
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr14656523ljh.148.1565681141167; 
 Tue, 13 Aug 2019 00:25:41 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
 by smtp.gmail.com with ESMTPSA id d22sm2004804lji.99.2019.08.13.00.25.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 00:25:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/5 v2] mtd: parsers: Move TI AR7 parser
Date: Tue, 13 Aug 2019 09:25:27 +0200
Message-Id: <20190813072531.4234-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813072531.4234-1-linus.walleij@linaro.org>
References: <20190813072531.4234-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_002542_929777_5680DC2A 
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
ChangeLog v1->v2:
- No change
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
