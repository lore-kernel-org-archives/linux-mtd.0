Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjgLK-0007Ua-Vc
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 01:47:23 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so55174pab.6
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2013 18:47:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] mtd: cfi_cmdset_0002: remove unnecessary initialization
Date: Mon,  3 Jun 2013 18:46:44 -0700
Message-Id: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These timeout initializations are arbitrary and pointless. We simply
overwrite them with new values anyway. (In one case, the variable is not
ever even used, so we kill it.)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 89b9d68..6c85f61 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1146,7 +1146,6 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
 	DECLARE_WAITQUEUE(wait, current);
-	unsigned long timeo = jiffies + HZ;
 	struct cfi_private *cfi = map->fldrv_priv;
 
  retry:
@@ -1160,7 +1159,6 @@ static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chi
 
 		schedule();
 		remove_wait_queue(&chip->wq, &wait);
-		timeo = jiffies + HZ;
 
 		goto retry;
 	}
@@ -1228,7 +1226,7 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
 	/*
 	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
 	 * have a max write time of a few hundreds usec). However, we should
@@ -1466,7 +1464,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
 	/* see comments in do_write_oneword() regarding uWriteTimeo. */
 	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
 	int ret = -EIO;
@@ -1900,7 +1898,7 @@ static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
@@ -1990,7 +1988,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
 
-- 
1.8.2.3
