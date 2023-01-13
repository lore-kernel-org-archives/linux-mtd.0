Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BA2C678D7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeYY8/rzUSC9ac3G/1p96//1w6oVoP4FC2IOx14x6y4=; b=D9TvPU6Xflel/Q
	jUSOkQGquetX2vHqu51cvU/86eDNoPwV4yafJonZr12sl9C7b+PT4uX+MDUWn6SEPHlg5OVL+8Me5
	rrhYFh7G5MK1PywaM7Qs2EZs8rICYz5+H2Uxh04cNWuyp7XHCvJDx/wLRJAEADAGstdg30X6ErZUO
	NHObQDVBFNrNH/HOkj3ODmWioOo7vYXB5zmrpbrTAPUZPeijD00OgnQ8R9C/tWIyXuVZ335xxjQZ6
	J+WafpnZMQl7N5/vVYy3TX8R3czAyP6nLueCA4GElOBLIRD7SVUw03bzvjHFkB3lp3EED9f8A/9bA
	K1C5Gah6tSsOqJfMctiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDWe-000naF-5B; Fri, 13 Jan 2023 06:26:52 +0000
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDUo-000m9z-Df; Fri, 13 Jan 2023 06:24:59 +0000
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
Subject: [PATCH 22/22] drivers: platform: remove early_platform_cleanup
Date: Fri, 13 Jan 2023 07:23:39 +0100
Message-Id: <20230113062339.1909087-23-hch@lst.de>
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

This weak stub was only overriden by the now remove sh architecture.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/base/platform.c         | 4 ----
 include/linux/platform_device.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 968f3d71eeab2e..eb3feabf6c2f53 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1506,14 +1506,10 @@ struct device *platform_find_device_by_driver(struct device *start,
 }
 EXPORT_SYMBOL_GPL(platform_find_device_by_driver);
 
-void __weak __init early_platform_cleanup(void) { }
-
 int __init platform_bus_init(void)
 {
 	int error;
 
-	early_platform_cleanup();
-
 	error = device_register(&platform_bus);
 	if (error) {
 		put_device(&platform_bus);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 894939a74dd20f..86692f730e3a12 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -352,7 +352,4 @@ extern int platform_pm_restore(struct device *dev);
 #define USE_PLATFORM_PM_SLEEP_OPS
 #endif
 
-/* For now only SuperH uses it */
-void early_platform_cleanup(void);
-
 #endif /* _PLATFORM_DEVICE_H_ */
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
