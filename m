Return-Path: <SRS0=gdbt=6D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CF6C38A30
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 12:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E966D206D9
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 12:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XJMcDdlP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E966D206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3uusd+PDXEWUCCXN5DixywuBpDJdaHBKLgLK5R+n5s=; b=XJMcDdlP/mTtNW
	2mL0cUwMQyB42CGdeMWKVFwZrK/zmfWB5oAtI5872qi+9D7VYkJJM/ayLKie4FZE0/9B1NYn1plKR
	A5e4WYjMYJYJYotoNHsGD4y0b5t8/pK+kywSRAXl591CoSomM4QKXlWFZyh3QHzYUw77biYsz7xpN
	8ZRrcvf4kfZh2+i96E75Q2K+X1gffmP8bYmmAaPgJ1aRBThd7e1euux4uHT9q5v96JcNTDQXnaiJ3
	98X8CXCbQyWA2z53AqAEWxj5zllZ0IX+1hlwcvRcDQkAwmvLfGHEkxQhwjO0FA4YC+EJKp8OXRwon
	ObpA4jcraBgHXVpOLwow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ9T1-0000LX-9h; Sun, 19 Apr 2020 12:54:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ9QM-0005wi-CU
 for linux-mtd@lists.infradead.org; Sun, 19 Apr 2020 12:51:54 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B9EDB2A0D95;
 Sun, 19 Apr 2020 13:51:47 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 9/9] mtd: rawnand: bcm47xx: Move the driver to
 drivers/mtd/nand/raw/
Date: Sun, 19 Apr 2020 14:51:40 +0200
Message-Id: <20200419125140.1307309-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419125140.1307309-1-boris.brezillon@collabora.com>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_055150_584496_FCEDF797 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that we have a single we can move it to the directory where all
single source file drivers live.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/Makefile                            | 1 +
 drivers/mtd/nand/raw/{bcm47xxnflash => }/bcm47xxnflash.c | 0
 drivers/mtd/nand/raw/bcm47xxnflash/Makefile              | 2 --
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename drivers/mtd/nand/raw/{bcm47xxnflash => }/bcm47xxnflash.c (100%)
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/Makefile

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2d136b158fb7..703d696c2d61 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
 obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
 obj-$(CONFIG_MTD_NAND_MESON)		+= meson_nand.o
 obj-$(CONFIG_MTD_NAND_CADENCE)		+= cadence-nand-controller.o
+obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.c b/drivers/mtd/nand/raw/bcm47xxnflash.c
similarity index 100%
rename from drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.c
rename to drivers/mtd/nand/raw/bcm47xxnflash.c
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/Makefile b/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
deleted file mode 100644
index 71a953078799..000000000000
--- a/drivers/mtd/nand/raw/bcm47xxnflash/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
