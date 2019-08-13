Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10144C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:26:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D428D20840
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 07:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eykoZKiE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9/1pWIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D428D20840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7UOeLEZvls7MzJmitPuGhShvd+nzo1fmTcgpVLXGXo=; b=eykoZKiEJUFxy+
	4LHt60HXnd6PdrBJdWEGpD3rCBSXIlcidIW0VMgJZXtxMMO40YyofD9DiIGTCVi5HzSs2HUKIJurK
	DGteJlVsAEyl2SpDbfhmneNX/DpJ4vicrJn9YCylF3IdXLSmaqBCKxZYSfdx7+HYYbS45pjvCuY5i
	GB8y/VHUlCNZap43yAfPcAJGgYCbaJHm+85WvXlP6AfGXdYF8tLCPEaVRQL60QTJJJLXCMnrN95MW
	/sC9orG9/itVpZFd7nEYy+xbMJJW4L5OFYtfZ+SMHwL/KutgBGEYOBVrUoKMm1aMHBhVeHlke8sgC
	PUuNYUMDYk4nkALMiqoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxRCR-0006vD-Qu; Tue, 13 Aug 2019 07:26:31 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxRBk-0006BF-75
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 07:25:49 +0000
Received: by mail-lj1-x243.google.com with SMTP id e27so5460630ljb.7
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K4Y5tCDnK20iML6mEYe6sATd5GFPG4ewvFPmnf/3SiE=;
 b=K9/1pWIe0LRgEBNwi9ZSb/AhbV2y4USCOsiuHT2NykUQRnv0oNzZkBycepdNCHaOs9
 5ieboiosuyfm1J87QsW45GlsSLiBsrCM1bNXi8U7WULlXp0i/BWrP+WRtwoSLbFNpOei
 pg1GLU2cXnSjgWoY7JyHWwHWMsmEtuIzH8Rfgs7GpjIttyZKxsIHNl+Gq8xm9gS7gzdk
 kE7vpJGJ2NkdOqMU8CMhVcwzN8C0cWB03ajCk5tXiw7cM7RQV4cSAnF7XGxF0slLHTLy
 OjryD2N0ErttFpe4ubgf9rFgz8mymvdVo2Di4/jRZ8HZb7CQp9ORoEbcC3el7PlFtR3I
 uIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K4Y5tCDnK20iML6mEYe6sATd5GFPG4ewvFPmnf/3SiE=;
 b=ZY5wxc4BT3eUsupTbuia4na29BLISmF4qg44J2IbVvzuDA+L+jgZ/TnsaQELPAR22F
 UL6vcz6j428LcviASXEDTQoWEyRjUaUEVxoyJFOEq5v6D+YQke7AC2hSIyC/sUd+YEde
 u0XEAUY+nb482STv6s8Fy22U06Zlj5HCsK+qFbxMrfGJFAZrvZADHQi/Lnq9u8piny4l
 Ol4i4gGDHmEnPzgpbG5h3iUQoqsrUyDFojfuEgUfuyN7SLJkTTGZlslYwk8SO3CVLzhB
 57ikQ4k6UVn26X/CAljUbJ7YJvIymJgRnJtxYL0bciNs4DvA9Bnj/2VuXK7wqbgVC/gx
 PWhA==
X-Gm-Message-State: APjAAAXmxUIBCwM1ZabXFFN82pUVd6IvDUWabhrrAMPbnxckzgKFId8G
 ui3+fO6FZ96gLKuSWPa7sdZX5Q==
X-Google-Smtp-Source: APXvYqyXIrCAi2fRNxZ2YXeG1qaRXS6w9+PTcV+G7xej9m4y8fYATTVDdSOVCgbu2Q81iB6rJqi0nQ==
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr20718422lja.220.1565681146223; 
 Tue, 13 Aug 2019 00:25:46 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
 by smtp.gmail.com with ESMTPSA id d22sm2004804lji.99.2019.08.13.00.25.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 00:25:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 3/5 v2] mtd: parsers: Move BCM63xx parser
Date: Tue, 13 Aug 2019 09:25:29 +0200
Message-Id: <20190813072531.4234-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813072531.4234-1-linus.walleij@linaro.org>
References: <20190813072531.4234-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_002548_562911_1B268569 
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
ChangeLog v1->v2:
- No change
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
