Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n7A-0006Mi-M8
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:21 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 10/20] [MTD] Make init_mbx function static
Date: Tue, 25 Nov 2008 02:55:01 +0200
Message-Id: <1227574511-23879-11-git-send-email-dmitri.vorobiev@movial.fi>
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

The function init_mbx can become static, because it is not used
outside the file drivers/mtd/maps/mbx860.c. This patch adds the
needed keyword.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/mbx860.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/mbx860.c b/drivers/mtd/maps/mbx860.c
index 706f673..0eb5a7c 100644
--- a/drivers/mtd/maps/mbx860.c
+++ b/drivers/mtd/maps/mbx860.c
@@ -55,7 +55,7 @@ struct map_info mbx_map = {
 	.bankwidth = 4,
 };
 
-int __init init_mbx(void)
+static int __init init_mbx(void)
 {
 	printk(KERN_NOTICE "Motorola MBX flash device: 0x%x at 0x%x\n", WINDOW_SIZE*4, WINDOW_ADDR);
 	mbx_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE * 4);
-- 
1.5.3
