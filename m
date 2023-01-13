Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE96C61DB3
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ew7fu4Uem8GS4IYaIluWRt5yAfZYTbSHcsxcyUaLnw=; b=emEz7Xilwh8oMP
	daibh6CX1ouWZtz3wYBmczKdK4o7VHtHvaUflQ8luE3zcd5iRLN25NXDhR3fta6aN8xR1WdO6Kie/
	036Px7dkKSLSDyrzn73E60u1QtcOq3S5+rizfn0k9C8zxWxL7WpNrX4fa7ntZRml3n2WSYWMqKrbb
	LdU3t3SMefqlCxEA1Rd09ULuGJikLsmFyekFBtNFQ8MFe8hkBYnae6MOn/74axGr0vToFqR+Grb36
	3rCudSApWYjQgL5uiW9rayMLElRICAvZ7xnwUwZ7K1H4GpXJ/yI+NpjK2zGgZVsvAa9nEknY2+xfJ
	PyXasjJ/jGZWofVtO8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDTp-000lRf-Bj; Fri, 13 Jan 2023 06:23:57 +0000
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDTf-000lNa-NO; Fri, 13 Jan 2023 06:23:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
Date: Fri, 13 Jan 2023 07:23:19 +0100
Message-Id: <20230113062339.1909087-3-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
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

USB_OHCI_SH is a dummy option that never builds any code, remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/host/Kconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 8d799d23c476e1..ca5f657c092cf4 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -548,17 +548,6 @@ config USB_OHCI_HCD_SSB
 
 	  If unsure, say N.
 
-config USB_OHCI_SH
-	bool "OHCI support for SuperH USB controller (DEPRECATED)"
-	depends on SUPERH || COMPILE_TEST
-	select USB_OHCI_HCD_PLATFORM
-	help
-	  This option is deprecated now and the driver was removed, use
-	  USB_OHCI_HCD_PLATFORM instead.
-
-	  Enables support for the on-chip OHCI controller on the SuperH.
-	  If you use the PCI OHCI controller, this option is not necessary.
-
 config USB_OHCI_EXYNOS
 	tristate "OHCI support for Samsung S5P/Exynos SoC Series"
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
