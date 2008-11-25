Received: from smtp.movial.fi ([62.236.91.34])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1L4n78-000501-NU
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:21 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 20/20] [MTD] Make init_sbc82xx_flash function static
Date: Tue, 25 Nov 2008 02:55:11 +0200
Message-Id: <1227574511-23879-21-git-send-email-dmitri.vorobiev@movial.fi>
In-Reply-To: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
References: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function init_sbc82xx_flash is needlessly defined global in
drivers/mtd/maps/wr_sbc82xx_flash.c, and this patch makes it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/wr_sbc82xx_flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/wr_sbc82xx_flash.c b/drivers/mtd/maps/wr_sbc82xx_flash.c
index 413b0cf..933a2b6 100644
--- a/drivers/mtd/maps/wr_sbc82xx_flash.c
+++ b/drivers/mtd/maps/wr_sbc82xx_flash.c
@@ -74,7 +74,7 @@ do {								\
 	}							\
 } while (0);
 
-int __init init_sbc82xx_flash(void)
+static int __init init_sbc82xx_flash(void)
 {
 	volatile memctl_cpm2_t *mc = &cpm2_immr->im_memctl;
 	int bigflash;
-- 
1.5.3
