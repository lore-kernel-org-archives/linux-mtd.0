Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN2p6-000054-Nw
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 14:04:01 +0000
Received: by mail-wi0-f177.google.com with SMTP id hj13so103151wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 07:04:00 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH v2 10/10] ARM: sh-mobile: mackerel: Use hardware error
 correction
Date: Wed, 25 Apr 2012 16:03:38 +0200
Message-Id: <1335362618-4559-11-git-send-email-hechtb@gmail.com>
In-Reply-To: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
References: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
