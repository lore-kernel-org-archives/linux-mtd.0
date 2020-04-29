Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397B2C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 22:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E6C2076B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 22:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cdj+4dG4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E6C2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGtn2qw3B0DGG2hf6R8o4YDY3xeBU78Rex0sYUosn8s=; b=Cdj+4dG4VKnWLX
	y5ny+M7KqhRrjx5JxfmK9Ee+cYOw4qndpqiW0WOhJM0dBZPJMvT6AfCUPWrR/iD9wPUSh+X/0oUTD
	KHjDXY9kAwAash53Lt9yIPEg2tHwp/X3FhOM9iRgyBCrBzzy3VbH/MPnvlGYtdDLJkL+EikDxKNNz
	V7clyinDJ+k2igoYJzXaxVGJGNXy9MQUPwlue0OU9zss5AL7u6Yq9aJbkmMxN8KOV0BMvS7g6bvDG
	/TkQsONu1fdQoAUngg89T8WivFpeEq/gz8sPlMZmQHgL+pfKK0TnqB1PUNymH1a8bJda4hz6LkfH7
	zbxfUckckja/zvMGDiPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTvFY-0004fV-29; Wed, 29 Apr 2020 22:32:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTvFL-0004Ta-Ou; Wed, 29 Apr 2020 22:32:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 632492A1751;
 Wed, 29 Apr 2020 23:31:59 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] ARM: pxa: Stop selecting CONFIG_MTD_NAND_CM_X270
Date: Thu, 30 Apr 2020 00:31:33 +0200
Message-Id: <20200429223134.789322-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429223134.789322-1-boris.brezillon@collabora.com>
References: <20200429223134.789322-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_153203_944180_353A924C 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mike Rapoport <mike@compulab.co.il>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that the NAND is handled through the gen_nand driver we can stop
selecting CONFIG_MTD_NAND_CM_X270.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 arch/arm/configs/cm_x2xx_defconfig | 1 -
 arch/arm/configs/pxa_defconfig     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/configs/cm_x2xx_defconfig b/arch/arm/configs/cm_x2xx_defconfig
index fa997ae2673e..08ebb993d34a 100644
--- a/arch/arm/configs/cm_x2xx_defconfig
+++ b/arch/arm/configs/cm_x2xx_defconfig
@@ -59,7 +59,6 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PXA2XX=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPIO=m
-CONFIG_MTD_NAND_CM_X270=y
 CONFIG_MTD_NAND_PLATFORM=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index b817c57f05f1..f829b0b7866d 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -194,7 +194,6 @@ CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
 CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
 CONFIG_MTD_NAND_SHARPSL=m
 CONFIG_MTD_NAND_MARVELL=m
-CONFIG_MTD_NAND_CM_X270=m
 CONFIG_MTD_NAND_TMIO=m
 CONFIG_MTD_NAND_BRCMNAND=m
 CONFIG_MTD_NAND_PLATFORM=m
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
