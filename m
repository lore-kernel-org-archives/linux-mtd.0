Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n75-00063s-RW
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:16 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 17/20] [MTD] Make init_tqm_mtd function static
Date: Tue, 25 Nov 2008 02:55:08 +0200
Message-Id: <1227574511-23879-18-git-send-email-dmitri.vorobiev@movial.fi>
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

The init_tqm_mtd function does not need to be defined globally
in drivers/mtd/maps/tqm8xxl.c. Make it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/tqm8xxl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/tqm8xxl.c b/drivers/mtd/maps/tqm8xxl.c
index a5d3d85..6014698 100644
--- a/drivers/mtd/maps/tqm8xxl.c
+++ b/drivers/mtd/maps/tqm8xxl.c
@@ -109,7 +109,7 @@ static struct mtd_partition tqm8xxl_fs_partitions[] = {
 };
 #endif
 
-int __init init_tqm_mtd(void)
+static int __init init_tqm_mtd(void)
 {
 	int idx = 0, ret = 0;
 	unsigned long flash_addr, flash_size, mtd_size = 0;
-- 
1.5.3
