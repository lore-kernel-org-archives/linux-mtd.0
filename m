Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SL9ui-0001Y8-31
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 09:14:00 +0000
Received: by werp11 with SMTP id p11so7261649wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 02:13:59 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 2/9] ARM: sh-mobile: mackerel: Add error IRQ resource
Date: Fri, 20 Apr 2012 11:13:43 +0200
Message-Id: <1334913230-23615-3-git-send-email-hechtb@gmail.com>
In-Reply-To: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
References: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Supply the platform data for the FLSTEI error IRQ.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 arch/arm/mach-shmobile/board-mackerel.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-shmobile/board-mackerel.c b/arch/arm/mach-shmobile/board-mackerel.c
index 8758f94..1de1fb7 100644
--- a/arch/arm/mach-shmobile/board-mackerel.c
+++ b/arch/arm/mach-shmobile/board-mackerel.c
@@ -990,7 +990,11 @@ static struct resource nand_flash_resources[] = {
 		.start	= 0xe6a30000,
 		.end	= 0xe6a3009b,
 		.flags	= IORESOURCE_MEM,
-	}
+	},
+	[1] = {
+		.start	= evt2irq(0x0d80), /* flstei: status error irq */
+		.flags	= IORESOURCE_IRQ,
+	},
 };
 
 static struct sh_flctl_platform_data nand_flash_data = {
-- 
1.7.5.4
