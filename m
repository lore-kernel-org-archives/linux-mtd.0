Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIiUl-0005eq-DO
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 18:14:28 +0000
Received: by mail-vc0-f177.google.com with SMTP id hy4so4181715vcb.22
 for <linux-mtd@lists.infradead.org>; Sat, 16 Aug 2014 11:14:05 -0700 (PDT)
MIME-Version: 1.0
Sender: jergarff@gmail.com
Date: Sat, 16 Aug 2014 12:14:05 -0600
Message-ID: <CAKbvp-NuFWzCCT+eo-WO47kazNuHbcA4KxhjDLYGR9p9Jh9FRg@mail.gmail.com>
Subject: [PATCH] spi-nor: Fix for Freescale i.MX6 reboot issue when using a
 N25Q00A boot device.
From: Jeremy Garff <jer@jers.net>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is my first submission to the linux-mtd list.  I found and fixed
a issue related to the i.MX6 when using a N25Q00A spi-nor as the boot
device.  The following is a patch and more detailed description.  As
this is my first submission to this list, so please let me know you
have any questions or concerns.

Thanks,

Jeremy

[PATCH] mtd: DETAILEDTARGET: spi-nor

When rebooting on a i.MX6 platform with a N25Q00A, the Freescale bootrom
is unable to read from the flash to load U-boot.  The N25Q00A has no
physical reset line, and the spi-nor driver leaves it in a state that
prevents the bootrom from being able to use it.

This patch adds a shutdown callback used when setting the USE_SHUTDOWN_RESET
flag.  The shutdown handler then performs a soft reset of the device.  This
patch only sets the callback for the n25q00.  It's not known if the shutdown
handler works with other spi-nor devices, so to be safe it's only used by
the n25q00 for now.

[From: Jeremy Garff <jer@jers.net>]


diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ed7e0a1b..ca7caad 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -244,6 +244,14 @@ static int m25p_remove(struct spi_device *spi)
  return mtd_device_unregister(&flash->mtd);
 }

+static void m25p_shutdown(struct spi_device *spi)
+{
+ struct m25p *flash = spi_get_drvdata(spi);
+    struct spi_nor *nor = &flash->spi_nor;
+
+    if (nor->shutdown)
+        nor->shutdown(nor);
+}

 static struct spi_driver m25p80_driver = {
  .driver = {
@@ -253,6 +261,7 @@ static struct spi_driver m25p80_driver = {
  .id_table = spi_nor_ids,
  .probe = m25p_probe,
  .remove = m25p_remove,
+    .shutdown = m25p_shutdown,

  /* REVISIT: many of these chips have deep power-down modes, which
  * should clearly be entered on suspend() to minimize power use.
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b5ad6be..d7b5aa8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -448,6 +448,7 @@ struct flash_info {
 #define SPI_NOR_DUAL_READ 0x20    /* Flash supports Dual Read */
 #define SPI_NOR_QUAD_READ 0x40    /* Flash supports Quad Read */
 #define USE_FSR 0x80 /* use flag status register */
+#define USE_SHUTDOWN_RESET 0x100  /* needs reset on shutdown */
 };

 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags) \
@@ -536,7 +537,7 @@ const struct spi_device_id spi_nor_ids[] = {
  { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
  { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
  { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
- { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },
+ { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR |
USE_SHUTDOWN_RESET) },

  /* PMC */
  { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
@@ -916,6 +917,17 @@ static int spi_nor_check(struct spi_nor *nor)
  return 0;
 }

+static void spi_nor_shutdown(struct spi_nor *nor)
+{
+    // Wait for any final commands
+    (void)wait_till_ready(nor);
+
+    nor->write_reg(nor, SPINOR_OP_RSTEN, NULL, 0, 0);
+    nor->write_reg(nor, SPINOR_OP_RSTMEM, NULL, 0, 0);
+
+    (void)read_sr(nor);  // Force the previous async commands to complete
+}
+
 int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
  enum read_mode mode)
 {
@@ -1018,6 +1030,9 @@ int spi_nor_scan(struct spi_nor *nor, const
struct spi_device_id *id,
     nor->wait_till_ready == spi_nor_wait_till_ready)
  nor->wait_till_ready = spi_nor_wait_till_fsr_ready;

+    if (info->flags & USE_SHUTDOWN_RESET)
+        nor->shutdown = spi_nor_shutdown;
+
  /* prefer "small sector" erase if possible */
  if (info->flags & SECT_4K) {
  nor->erase_opcode = SPINOR_OP_BE_4K;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9e6294f..b7cce8a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -36,6 +36,10 @@
 #define SPINOR_OP_RDCR 0x35 /* Read configuration register */
 #define SPINOR_OP_RDFSR 0x70 /* Read flag status register */

+/* Reset opcodes */
+#define SPINOR_OP_RSTEN     0x66    /* Reset enable command */
+#define SPINOR_OP_RSTMEM    0x99    /* Reset device, follows reset enable */
+
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ4 0x13 /* Read data bytes (low frequency) */
 #define SPINOR_OP_READ4_FAST 0x0c /* Read data bytes (high frequency) */
@@ -180,6 +184,7 @@ struct spi_nor {
  void (*write)(struct spi_nor *nor, loff_t to,
  size_t len, size_t *retlen, const u_char *write_buf);
  int (*erase)(struct spi_nor *nor, loff_t offs);
+    void (*shutdown)(struct spi_nor *nor);

  void *priv;
 };
