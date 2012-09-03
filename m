Received: from smtp29.msg.oleane.net ([62.161.4.29])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Z2c-00058J-Au
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 15:58:23 +0000
Received: from ic.fr (LDijon-156-65-26-47.w80-15.abo.wanadoo.fr
 [80.15.105.47])
 by smtp29.msg.oleane.net (MTA) with ESMTP id q83FwDx2009500
 for <linux-mtd@lists.infradead.org>; Mon, 3 Sep 2012 17:58:13 +0200
Received: from [192.168.4.56] (unknown [192.168.4.56])
 by ic.fr (Postfix) with ESMTPA id D200A223F2
 for <linux-mtd@lists.infradead.org>; Mon,  3 Sep 2012 18:18:41 +0200 (CEST)
Message-ID: <5044D395.9050607@ic.fr>
Date: Mon, 03 Sep 2012 17:58:13 +0200
From: =?ISO-8859-1?Q?C=E9dric_Cano?= <ccano@interfaceconcept.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] drivers/mtd/devices/m25p80.c: Fix return code of
 read/write mtd callbacks
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cédric Cano <ccano@interfaceconcept.com>

For SPI Flash devices, MTD read and write functions returns "1" if Flash 
is busy (this status is returned by "wait_till_ready" fnuction). This 
return code is not an error code: if device is busy, MTD read or write 
are successful with 1 byte length.

This patch fixes code returned by "wait_till_ready", "m25p80_erase", 
"m25p80_read", "m25p80_write" and "sst_write" functions: the error code 
is -EBUSY now.

C. Cano

Signed-off-by: Cédric Cano <ccano@interfaceconcept.com>

---
--- linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-08-26 
04:32:13.000000000 +0200
+++ linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-09-03 
17:35:16.159741656 +0200
@@ -199,7 +199,7 @@

      } while (!time_after_eq(jiffies, deadline));

-    return 1;
+    return -EBUSY;
  }

  /*
@@ -209,12 +209,15 @@
   */
  static int erase_chip(struct m25p *flash)
  {
+    int    ret;
+
      pr_debug("%s: %s %lldKiB\n", dev_name(&flash->spi->dev), __func__,
              (long long)(flash->mtd.size >> 10));

      /* Wait until finished previous write command. */
-    if (wait_till_ready(flash))
-        return 1;
+    ret = wait_till_ready(flash);
+    if (ret)
+        return ret;

      /* Send write enable, then erase commands. */
      write_enable(flash);
@@ -249,12 +252,15 @@
   */
  static int erase_sector(struct m25p *flash, u32 offset)
  {
+    int    ret;
+
      pr_debug("%s: %s %dKiB at 0x%08x\n", dev_name(&flash->spi->dev),
              __func__, flash->mtd.erasesize / 1024, offset);

      /* Wait until finished previous write command. */
-    if (wait_till_ready(flash))
-        return 1;
+    ret = wait_till_ready(flash);
+    if (ret)
+        return ret;

      /* Send write enable, then erase commands. */
      write_enable(flash);
@@ -283,6 +289,7 @@
      struct m25p *flash = mtd_to_m25p(mtd);
      u32 addr,len;
      uint32_t rem;
+    int ret;

      pr_debug("%s: %s at 0x%llx, len %lld\n", dev_name(&flash->spi->dev),
              __func__, (long long)instr->addr,
@@ -299,10 +306,11 @@

      /* whole-chip erase? */
      if (len == flash->mtd.size) {
-        if (erase_chip(flash)) {
+        ret = erase_chip(flash);
+        if (ret) {
              instr->state = MTD_ERASE_FAILED;
              mutex_unlock(&flash->lock);
-            return -EIO;
+            return ret;
          }

      /* REVISIT in some cases we could speed up erasing large regions
@@ -313,10 +321,11 @@
      /* "sector"-at-a-time erase */
      } else {
          while (len) {
-            if (erase_sector(flash, addr)) {
+            ret = erase_sector(flash, addr);
+            if (ret) {
                  instr->state = MTD_ERASE_FAILED;
                  mutex_unlock(&flash->lock);
-                return -EIO;
+                return ret;
              }

              addr += mtd->erasesize;
@@ -339,6 +348,7 @@
  static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
      size_t *retlen, u_char *buf)
  {
+    int ret;
      struct m25p *flash = mtd_to_m25p(mtd);
      struct spi_transfer t[2];
      struct spi_message m;
@@ -364,10 +374,11 @@
      mutex_lock(&flash->lock);

      /* Wait till previous write/erase is done. */
-    if (wait_till_ready(flash)) {
+    ret = wait_till_ready(flash);
+    if (ret) {
          /* REVISIT status return?? */
          mutex_unlock(&flash->lock);
-        return 1;
+        return ret;
      }

      /* FIXME switch to OPCODE_FAST_READ.  It's required for higher
@@ -396,6 +407,7 @@
  static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
      size_t *retlen, const u_char *buf)
  {
+    int ret;
      struct m25p *flash = mtd_to_m25p(mtd);
      u32 page_offset, page_size;
      struct spi_transfer t[2];
@@ -417,9 +429,10 @@
      mutex_lock(&flash->lock);

      /* Wait until finished previous write command. */
-    if (wait_till_ready(flash)) {
+    ret = wait_till_ready(flash);
+    if (ret) {
          mutex_unlock(&flash->lock);
-        return 1;
+        return ret;
      }

      write_enable(flash);
---
