Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SL9ur-0001bj-K5
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 09:14:12 +0000
Received: by wgbds1 with SMTP id ds1so488726wgb.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 02:14:07 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 9/9] ARM: sh-mobile: mackerel: Use hardware error correction
Date: Fri, 20 Apr 2012 11:13:50 +0200
Message-Id: <1334913230-23615-10-git-send-email-hechtb@gmail.com>
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

Use the built-in hardware error code correction of the sh_flctl.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 arch/arm/mach-shmobile/board-mackerel.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-shmobile/board-mackerel.c b/arch/arm/mach-shmobile/board-mackerel.c
index 1de1fb7..f8289f4 100644
--- a/arch/arm/mach-shmobile/board-mackerel.c
+++ b/arch/arm/mach-shmobile/board-mackerel.c
@@ -1003,6 +1003,7 @@ static struct sh_flctl_platform_data nand_flash_data = {
 	.flcmncr_val	= CLK_16B_12L_4H | TYPESEL_SET
 			| SHBUSSEL | SEL_16BIT | SNAND_E,
 	.use_holden	= 1,
+	.has_hwecc	= 1,
 };
 
 static struct platform_device nand_flash_device = {
-- 
1.7.5.4
