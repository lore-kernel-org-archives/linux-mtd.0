Received: from smtp07.msg.oleane.net ([62.161.4.7])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8ZN3-0007oM-0d
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 16:19:29 +0000
Received: from ic.fr (LDijon-156-65-26-47.w80-15.abo.wanadoo.fr
 [80.15.105.47])
 by smtp07.msg.oleane.net (MTA) with ESMTP id q83GJR0k014204
 for <linux-mtd@lists.infradead.org>; Mon, 3 Sep 2012 18:19:27 +0200
Received: from [192.168.4.56] (unknown [192.168.4.56])
 by ic.fr (Postfix) with ESMTPA id 9E6B6223F2
 for <linux-mtd@lists.infradead.org>; Mon,  3 Sep 2012 18:39:55 +0200 (CEST)
Message-ID: <5044D88F.2060003@ic.fr>
Date: Mon, 03 Sep 2012 18:19:27 +0200
From: =?ISO-8859-1?Q?C=E9dric_Cano?= <ccano@interfaceconcept.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] drivers/mtd/devices/m25p80.c: Fix whole device erase
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

There are two ways to erase SPI Flash devices: sector per sector or the 
entire Flash (used when MTD partition is the whole Flash).

When the whole Flash is erased, the SPI command is sent to the device 
and the erase function ends. Then, when another access (read, write or 
erase) is done, a  wait of busy is performed that fails because of Flash 
erase time (can be more than 30s in case of whole erase).

This patch removes chip erase and use only sector per sector erase to 
erase the chip. When erase is performed, Flash accesses can be done.

C. Cano

Signed-off-by: Cédric Cano <ccano@interfaceconcept.com>
---

--- linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-09-03 
18:03:35.787723207 +0200
+++ linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-09-03 
18:01:17.455724709 +0200
@@ -202,31 +202,6 @@
      return -EBUSY;
  }

-/*
- * Erase the whole flash memory
- *
- * Returns 0 if successful, non-zero otherwise.
- */
-static int erase_chip(struct m25p *flash)
-{
-    pr_debug("%s: %s %lldKiB\n", dev_name(&flash->spi->dev), __func__,
-            (long long)(flash->mtd.size >> 10));
-
-    /* Wait until finished previous write command. */
-    if (wait_till_ready(flash))
-        return 1;
-
-    /* Send write enable, then erase commands. */
-    write_enable(flash);
-
-    /* Set up command buffer. */
-    flash->command[0] = OPCODE_CHIP_ERASE;
-
-    spi_write(flash->spi, flash->command, 1);
-
-    return 0;
-}
-
  static void m25p_addr2cmd(struct m25p *flash, unsigned int addr, u8 *cmd)
  {
      /* opcode is in cmd[0] */
@@ -301,33 +276,17 @@

      mutex_lock(&flash->lock);

-    /* whole-chip erase? */
-    if (len == flash->mtd.size) {
-        ret = erase_chip(flash);
+    /* "sector"-at-a-time erase */
+    while (len) {
+        ret = erase_sector(flash, addr);
          if (ret) {
              instr->state = MTD_ERASE_FAILED;
              mutex_unlock(&flash->lock);
              return ret;
          }

-    /* REVISIT in some cases we could speed up erasing large regions
-     * by using OPCODE_SE instead of OPCODE_BE_4K.  We may have set up
-     * to use "small sector erase", but that's not always optimal.
-     */
-
-    /* "sector"-at-a-time erase */
-    } else {
-        while (len) {
-            ret = erase_sector(flash, addr)
-            if (ret) {
-                instr->state = MTD_ERASE_FAILED;
-                mutex_unlock(&flash->lock);
-                return ret;
-            }
-
-            addr += mtd->erasesize;
-            len -= mtd->erasesize;
-        }
+        addr += mtd->erasesize;
+        len -= mtd->erasesize;
      }

      mutex_unlock(&flash->lock);
---
