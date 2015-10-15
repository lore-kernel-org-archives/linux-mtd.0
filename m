Received: from mail-lb0-f182.google.com ([209.85.217.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmiHr-0005MQ-Cz
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 13:09:40 +0000
Received: by lbbpp2 with SMTP id pp2so39335707lbb.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 06:09:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Harkin <ryan.harkin@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 02/10] mtd: enable AFS selection for ARM64
Date: Thu, 15 Oct 2015 15:08:45 +0200
Message-Id: <1444914533-27782-3-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ARM use their special partitions also on the ARM64 architecture
reference designs, so enable this for ARM64.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index a03ad2951c7b..42cc953309f1 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -112,7 +112,7 @@ config MTD_CMDLINE_PARTS
 
 config MTD_AFS_PARTS
 	tristate "ARM Firmware Suite partition parsing"
-	depends on ARM
+	depends on (ARM || ARM64)
 	---help---
 	  The ARM Firmware Suite allows the user to divide flash devices into
 	  multiple 'images'. Each such image has a header containing its name
-- 
2.4.3
