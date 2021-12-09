Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8CBC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJZS1yDmIF0wRFU99x25Mq2ixyQc2PDDvX4sS5s78Sg=; b=LqNw8pgV2tzU3R
	7nYE9h/YB3peNh+X/VfUFhaRm62nE0ZxHkDkNtGNeMC40GAX1gBJoHZgYmulnOLR00B5hw0uD6foR
	6oMw6J4/sYzMVDJiJlIOOerZg9N1KRuFm1EzG7Mh8Fv3nuF87QsOL2O5ixt+6p8sA50Mz2XcHc73j
	RSffeVR6QtixDxmi7plXjedwVXH8PRKufKw1pMxETbyoB9TXS43K0MO71AagueUM9sjRoSaYZkA/Z
	BFQCCscK9Os2fE7YECxemhDXGXcSpg+Czl+uB6Q5oUlJtfeBTDLB1g+MSMWjDjSnImVqDAZCtH0vr
	+VR858iwSXR/7hA8Lb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFN1-00FJlK-CV; Thu, 09 Dec 2021 09:05:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFMY-00FJaG-21
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:05:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C081CB82400;
 Thu,  9 Dec 2021 09:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3C2C341CC;
 Thu,  9 Dec 2021 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639040710;
 bh=5QCuzqHM21YzM/FzKde2w/D1g6ZloHN6p+IE4Gqk6DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rxk0jmWosXjEYMvBR2miC/9dX7bB1ZdqcNpX0983WEGSxaOZGNByAkKjwGDrssbmf
 m+FIIx602i5RPySVCVC1YZReGgDZPfwjy5wgddRaHXd56U1aQ53uopAvVxD7VCXHQx
 9PofJ0GPl/Km4deEr0oZeF+FzxZZoQ+UL5eA70aHZl/DuSzKcdCH6hXRGmB2uabzQW
 tUWwfDzul7Sysp/X12bFm74Y6bYBERxTwRKWsch4lABbsjWLZhZ17l23Dh9Mse7gKo
 hS3OXsXsTjB9hfOUOOXtr/PGPDxLX6Q2WZ1ljMjRxHqqg4/wKiEiL5CLwpcDOgd/bl
 it0vEJNPBQ7lg==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 2/6] mtd: rawnand: omap2: Allow build on K3 platforms
Date: Thu,  9 Dec 2021 11:04:54 +0200
Message-Id: <20211209090458.24830-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209090458.24830-1-rogerq@kernel.org>
References: <20211209090458.24830-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_010514_279760_A103C7DD 
X-CRM114-Status: GOOD (  11.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

K3 platforms come with GPMC. Enable GPMC build for
K3 platforms.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 67b7cb67c030..d719316467a1 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -40,7 +40,7 @@ config MTD_NAND_AMS_DELTA
 
 config MTD_NAND_OMAP2
 	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
-	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST
+	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
