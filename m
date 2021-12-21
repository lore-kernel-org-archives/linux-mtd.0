Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A54C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYX8VYy7PxWyC6Ig0MsX1lD8zwRG8b+m35xcz2pyWms=; b=tY6NLgdHJizF/t
	WMaVjkpYMUAijnlIAM7i9/w+PyFcxlw7BLWwbKph4Sa3ZYe9vvs6e86Fq86Xlp2PYKGKINJDCttgy
	aQ8JGz6/WEE59oQD/1M4N+uLudbBQfyQgHk8a3oyGsNt3N0USftCQ1uh7TaNyEdfT4Z0G1S0V8t0E
	C0Z+PT9fOZItMbISoj5crXV1548m+h/q5oLEdVJCWW0HqDAYNBOvHeg9CbSG2xiL8BZeJKHJHd6Yx
	7t8WiXhTPK3BBCPwdAqJNApFUM4k0ZwR3MLUQTHu24wky50uA8FzTKDZQf60AVze3OTSlaDAdfydP
	yXoUmEMq00f86n9PZF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzf2t-006vKx-W0; Tue, 21 Dec 2021 13:19:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzf24-006v5t-KA
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 13:18:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56E1FB816A7;
 Tue, 21 Dec 2021 13:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27243C36AEB;
 Tue, 21 Dec 2021 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640092699;
 bh=rmNCe/Fcv2Cch+PQTMUw4LOnj/3R7KOxvik2UJk4xCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEIoMBrrKnxFBsjjGjh+jvTnZ/d73gaJabQeSpd+S2Ca2PwMsYNNELGBItT1QPg7Y
 2I+CR++g4v7Udhme+dzwaT94Q8yUqdPJn9zMMgJLbSRZagbWtjPM7RsmLvFriYHiSj
 Lwn/duPfkwmi7k8y7un0OQ34F2MKktBhmnpczr+zaEdZlXBpGmvAid1Kr7vGqbMqHD
 kumI7u3W6+S8eULAF5ywElvzwozEGUKddGcHIC8h4Nw4nqDJU7x3XSjixQ7nPOD6qE
 bSBI7wWVzrZowFMP7ssHjruyqArqJpnr8ZeXVZTAC1veUwC/DsWiBZPSDth6UqXEBy
 pv+wgGOWX9oNw==
From: Roger Quadros <rogerq@kernel.org>
To: krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 4/4] mtd: rawnand: omap2: Select GPMC device driver for
 ARCH_K3
Date: Tue, 21 Dec 2021 15:17:57 +0200
Message-Id: <20211221131757.2030-5-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_051820_824414_3CE4CD20 
X-CRM114-Status: GOOD (  10.13  )
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

The GPMC device driver is required for NAND controller
to work on K3 Architecture. Select it if required.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 67b7cb67c030..587f20c6184f 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -42,6 +42,7 @@ config MTD_NAND_OMAP2
 	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
 	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST
 	depends on HAS_IOMEM
+	select OMAP_GPMC if ARCH_K3
 	help
 	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
 	  and Keystone platforms.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
