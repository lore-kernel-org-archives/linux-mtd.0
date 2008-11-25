Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n75-000643-RQ
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:16 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 01/20] [MTD] Make lart_flash_init, lart_flash_exit static
Date: Tue, 25 Nov 2008 02:54:52 +0200
Message-Id: <1227574511-23879-2-git-send-email-dmitri.vorobiev@movial.fi>
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

The symbols lart_flash_init, lart_flash_exit are needlessly
defined global in drivers/mtd/devices/lart.c, so make them
static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/devices/lart.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index f4bda4c..578de1c 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -619,7 +619,7 @@ static struct mtd_partition lart_partitions[] = {
 };
 #endif
 
-int __init lart_flash_init (void)
+static int __init lart_flash_init (void)
 {
    int result;
    memset (&mtd,0,sizeof (mtd));
@@ -690,7 +690,7 @@ int __init lart_flash_init (void)
    return (result);
 }
 
-void __exit lart_flash_exit (void)
+static void __exit lart_flash_exit (void)
 {
 #ifndef HAVE_PARTITIONS
    del_mtd_device (&mtd);
@@ -705,5 +705,3 @@ module_exit (lart_flash_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Abraham vd Merwe <abraham@2d3d.co.za>");
 MODULE_DESCRIPTION("MTD driver for Intel 28F160F3 on LART board");
-
-
-- 
1.5.3
