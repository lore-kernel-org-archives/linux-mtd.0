Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPW56-000849-BA
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 09:42:47 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so343217bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 02:42:44 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH v3 10/10] ARM: sh-mobile: mackerel: Use hardware error
 correction
Date: Wed,  2 May 2012 11:41:50 +0200
Message-Id: <1335951710-9390-11-git-send-email-hechtb@gmail.com>
In-Reply-To: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
References: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
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
