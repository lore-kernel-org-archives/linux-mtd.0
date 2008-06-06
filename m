Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4eY7-0006U0-5Q
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 16:12:19 +0000
Received: from bagnes.atmel.com ([10.175.100.4])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id m56GBb8e003321
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2008 09:11:37 -0700 (PDT)
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org, kernel@avr32linux.org
Subject: [PATCH 5/8] avr32: move hsmc_init() to core_initcall
Date: Fri,  6 Jun 2008 18:04:55 +0200
Message-Id: <1212768298-13614-6-git-send-email-haavard.skinnemoen@atmel.com>
In-Reply-To: <1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
Cc: Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Andrew Victor <avictor.za@gmail.com>,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The board init code, typically running from postcore_initcall, may
need to set up SMC timings. We have to make sure the SMC driver is
ready before this happens.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 arch/avr32/mach-at32ap/hsmc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/avr32/mach-at32ap/hsmc.c b/arch/avr32/mach-at32ap/hsmc.c
index fa427ed..b2d9bc6 100644
--- a/arch/avr32/mach-at32ap/hsmc.c
+++ b/arch/avr32/mach-at32ap/hsmc.c
@@ -278,4 +278,4 @@ static int __init hsmc_init(void)
 {
 	return platform_driver_register(&hsmc_driver);
 }
-arch_initcall(hsmc_init);
+core_initcall(hsmc_init);
-- 
1.5.5.1
