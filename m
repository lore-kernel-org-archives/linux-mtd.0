Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9AEE7D0CF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD5uXSOW1W/MV32A+0glpx1LzT6WUBUSHvoSDl/YzeQ=; b=a35Hy+6Je+QixF
	rkE3NrjxqMFrGkx1UPdDWB5lNTKnPfRvSaEiC718mCFtXAaEhJ4ZqBHEHPHDXgG32UwNzuJClE0S5
	HR1nInLRdtPEEU7X5DbMYCbR9Lt89QnZogopQ1WbGc32TXMRwFQok5NRgTExtZWcAm+J/LkCkBfM3
	grzMpcummCxAz3DY+ATfJyRAhxP1Lfiw0KDnUWZVC+xr32Hb+68iDlZq6wLSl85K6SecCBC2a9gMp
	NZfRZZy1qGoOdpIHE5XHZhqZvOp6xFRnIUaveXHHiER1QiIqoYjQPA3Y6azgeMVln3Aa5pkN+Ppob
	kzCtrTFknjmXkU2HWsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZSG-0081dN-0u;
	Fri, 22 Sep 2023 06:15:56 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZSC-0081al-17
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 06:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BTlcmFnnfxEfNUisgi/VE1hSD2DIqTeGV9pSI5JKow0=; b=N7OCC2
	yEDAZZBCJomsG+N7CW92pSkN0zXqQa+hKpd0yENypzbHd92rvRbmHB2DTvhSS1S+
	fWaxLWYyVXd8SRun71cQwd++pqYdggI5rvLT7oAe8kv/4toA0tQkcpGbBV9h59uf
	Sof4gkRIZSemZJs+2zKA/oT7JWTyECdJZ+mmUrDLGsvjsaeF8k5JKqHRKpUlWNtt
	wq2RcBxmrbH7bpbxWzC3Hmz4Wfb7hXNtyaLYjvbqhvtr6yu8jR29xJW/1vUkjrxI
	m1odKgtZEPAJCBLj/fJLsTIZxL6WVCZ5HiDuAIYh3xrQGXmXi9Dy+otjhqSzzdwD
	xsshjicSVtlBAE3w==
Received: (qmail 1269071 invoked from network); 22 Sep 2023 08:15:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 08:15:41 +0200
X-UD-Smtp-Session: l3s3148p1@E3mxiewF9JkujntX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mips@vger.kernel.org
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Russell King <linux@armlinux.org.uk>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Date: Fri, 22 Sep 2023 08:15:23 +0200
Message-Id: <20230922061530.3121-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_231552_677872_2587C14C 
X-CRM114-Status: GOOD (  10.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

AR7 is going to be removed from the Kernel, so remove its support for
MTD.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes since v1:
* added ack

 arch/arm/configs/pxa_defconfig |   1 -
 drivers/mtd/parsers/Kconfig    |   5 --
 drivers/mtd/parsers/Makefile   |   1 -
 drivers/mtd/parsers/ar7part.c  | 129 ---------------------------------
 4 files changed, 136 deletions(-)
 delete mode 100644 drivers/mtd/parsers/ar7part.c

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 23c131b0854b..9e81b1849e4c 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -100,7 +100,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
-CONFIG_MTD_AR7_PARTS=m
 CONFIG_MTD_CMDLINE_PARTS=m
 CONFIG_MTD_OF_PARTS=m
 CONFIG_MTD_AFS_PARTS=m
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index 60738edcd5d5..da03ab6efe04 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -1,9 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config MTD_AR7_PARTS
-	tristate "TI AR7 partitioning parser"
-	help
-	  TI AR7 partitioning parser support
-
 config MTD_BCM47XX_PARTS
 	tristate "BCM47XX partitioning parser"
 	depends on BCM47XX || ARCH_BCM_5301X
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 0e70b621a1d8..9b00c62b837a 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_MTD_AR7_PARTS)		+= ar7part.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)		+= bcm47xxpart.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)		+= bcm63xxpart.o
 obj-$(CONFIG_MTD_BRCM_U_BOOT)		+= brcm_u-boot.o
diff --git a/drivers/mtd/parsers/ar7part.c b/drivers/mtd/parsers/ar7part.c
deleted file mode 100644
index 8cd683711ac6..000000000000
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
