Received: from mordell.elzevir.fr ([92.243.3.74])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDsXB-0005ln-0C
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 11:33:46 +0000
From: =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
To: kamlakant.patel@broadcom.com
Cc: gregkh@linuxfoundation.org, manonuevo@micron.com,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
Subject: [PATCH 3/4] staging: mt29f: clean up existing kernel-doc
Date: Tue, 29 Dec 2015 12:32:21 +0100
Message-Id: <1451388742-22964-3-git-send-email-mpg@elzevir.fr>
In-Reply-To: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
References: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The existing kerneldoc blocs had a few issues:
- some of them didn't start with /**
- some used -- instead of - to separate the short description
- some descriptions had text looking like section headers
- some descriptions started with "to" while some used the imperative: use the
  imperative everywhere
- some had a "with:" at the end of the shortdesc that didn't make sense once
  formatted by kernel-docs
- two argument names where out of sync with the prototype

Signed-off-by: Manuel Pégourié-Gonnard <mpg@elzevir.fr>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 62 +++++++++++++--------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index c4a3236dd566..a1baad110477 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -63,8 +63,8 @@ static struct nand_ecclayout spinand_oob_64 = {
 };
 #endif
 
-/*
- * spinand_cmd - to process a command to send to the SPI Nand
+/**
+ * spinand_cmd - process a command to send to the SPI Nand
  * Description:
  *    Set up the command buffer to send to the SPI controller.
  *    The command buffer has to initialized to 0.
@@ -110,10 +110,10 @@ static int spinand_cmd(struct spi_device *spi, struct spinand_cmd *cmd)
 	return spi_sync(spi, &message);
 }
 
-/*
- * spinand_read_id- Read SPI Nand ID
+/**
+ * spinand_read_id - Read SPI Nand ID
  * Description:
- *    Read ID: read two ID bytes from the SPI Nand device
+ *    read two ID bytes from the SPI Nand device
  */
 static int spinand_read_id(struct spi_device *spi_nand, u8 *id)
 {
@@ -135,8 +135,8 @@ static int spinand_read_id(struct spi_device *spi_nand, u8 *id)
 	return retval;
 }
 
-/*
- * spinand_read_status- send command 0xf to the SPI Nand status register
+/**
+ * spinand_read_status - send command 0xf to the SPI Nand status register
  * Description:
  *    After read, write, or erase, the Nand device is expected to set the
  *    busy status.
@@ -188,7 +188,7 @@ static int wait_till_ready(struct spi_device *spi_nand)
 }
 
 /**
- * spinand_get_otp- send command 0xf to read the SPI Nand OTP register
+ * spinand_get_otp - send command 0xf to read the SPI Nand OTP register
  * Description:
  *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
  *   Enable chip internal ECC, set the bit to 1
@@ -212,7 +212,7 @@ static int spinand_get_otp(struct spi_device *spi_nand, u8 *otp)
 }
 
 /**
- * spinand_set_otp- send command 0x1f to write the SPI Nand OTP register
+ * spinand_set_otp - send command 0x1f to write the SPI Nand OTP register
  * Description:
  *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
  *   Enable chip internal ECC, set the bit to 1
@@ -238,7 +238,7 @@ static int spinand_set_otp(struct spi_device *spi_nand, u8 *otp)
 
 #ifdef CONFIG_MTD_SPINAND_ONDIEECC
 /**
- * spinand_enable_ecc- send command 0x1f to write the SPI Nand OTP register
+ * spinand_enable_ecc - send command 0x1f to write the SPI Nand OTP register
  * Description:
  *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
  *   Enable chip internal ECC, set the bit to 1
@@ -283,7 +283,7 @@ static int spinand_disable_ecc(struct spi_device *spi_nand)
 }
 
 /**
- * spinand_write_enable- send command 0x06 to enable write or erase the
+ * spinand_write_enable - send command 0x06 to enable write or erase the
  * Nand cells
  * Description:
  *   Before write and erase the Nand cells, the write enable has to be set.
@@ -313,9 +313,9 @@ static int spinand_read_page_to_cache(struct spi_device *spi_nand, u16 page_id)
 	return spinand_cmd(spi_nand, &cmd);
 }
 
-/*
- * spinand_read_from_cache- send command 0x03 to read out the data from the
- * cache register(2112 bytes max)
+/**
+ * spinand_read_from_cache - send command 0x03 to read out the data from the
+ * cache register (2112 bytes max)
  * Description:
  *   The read can specify 1 to 2112 bytes of data read at the corresponding
  *   locations.
@@ -341,15 +341,15 @@ static int spinand_read_from_cache(struct spi_device *spi_nand, u16 page_id,
 	return spinand_cmd(spi_nand, &cmd);
 }
 
-/*
- * spinand_read_page-to read a page with:
+/**
+ * spinand_read_page - read a page
  * @page_id: the physical page number
  * @offset:  the location from 0 to 2111
  * @len:     number of bytes to read
  * @rbuf:    read buffer to hold @len bytes
  *
  * Description:
- *   The read includes two commands to the Nand: 0x13 and 0x03 commands
+ *   The read includes two commands to the Nand - 0x13 and 0x03 commands
  *   Poll to read status to wait for tRD time.
  */
 static int spinand_read_page(struct spi_device *spi_nand, u16 page_id,
@@ -408,11 +408,11 @@ static int spinand_read_page(struct spi_device *spi_nand, u16 page_id,
 	return ret;
 }
 
-/*
- * spinand_program_data_to_cache--to write a page to cache with:
+/**
+ * spinand_program_data_to_cache - write a page to cache
  * @byte_id: the location to write to the cache
  * @len:     number of bytes to write
- * @rbuf:    read buffer to hold @len bytes
+ * @wbuf:    write buffer holding @len bytes
  *
  * Description:
  *   The write command used here is 0x84--indicating that the cache is
@@ -439,7 +439,7 @@ static int spinand_program_data_to_cache(struct spi_device *spi_nand,
 }
 
 /**
- * spinand_program_execute--to write a page from cache to the Nand array with
+ * spinand_program_execute - write a page from cache to the Nand array
  * @page_id: the physical page location to write the page.
  *
  * Description:
@@ -462,11 +462,11 @@ static int spinand_program_execute(struct spi_device *spi_nand, u16 page_id)
 }
 
 /**
- * spinand_program_page--to write a page with:
+ * spinand_program_page - write a page
  * @page_id: the physical page location to write the page.
  * @offset:  the location from the cache starting from 0 to 2111
  * @len:     the number of bytes to write
- * @wbuf:    the buffer to hold the number of bytes
+ * @buf:     the buffer holding @len bytes
  *
  * Description:
  *   The commands used here are 0x06, 0x84, and 0x10--indicating that
@@ -550,7 +550,7 @@ static int spinand_program_page(struct spi_device *spi_nand,
 }
 
 /**
- * spinand_erase_block_erase--to erase a page with:
+ * spinand_erase_block_erase - erase a page
  * @block_id: the physical block location to erase.
  *
  * Description:
@@ -573,7 +573,7 @@ static int spinand_erase_block_erase(struct spi_device *spi_nand, u16 block_id)
 }
 
 /**
- * spinand_erase_block--to erase a page with:
+ * spinand_erase_block - erase a page
  * @block_id: the physical block location to erase.
  *
  * Description:
@@ -813,7 +813,7 @@ static void spinand_cmdfunc(struct mtd_info *mtd, unsigned int command,
 }
 
 /**
- * spinand_lock_block- send write register 0x1f command to the Nand device
+ * spinand_lock_block - send write register 0x1f command to the Nand device
  *
  * Description:
  *    After power up, all the Nand blocks are locked.  This function allows
@@ -840,12 +840,12 @@ static int spinand_lock_block(struct spi_device *spi_nand, u8 lock)
 	return ret;
 }
 
-/*
+/**
  * spinand_probe - [spinand Interface]
  * @spi_nand: registered device driver.
  *
  * Description:
- *   To set up the device driver parameters to make the device available.
+ *   Set up the device driver parameters to make the device available.
  */
 static int spinand_probe(struct spi_device *spi_nand)
 {
@@ -920,12 +920,12 @@ static int spinand_probe(struct spi_device *spi_nand)
 	return mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
 }
 
-/*
- * spinand_remove: Remove the device driver
+/**
+ * spinand_remove - remove the device driver
  * @spi: the spi device.
  *
  * Description:
- *   To remove the device driver parameters and free up allocated memories.
+ *   Remove the device driver parameters and free up allocated memories.
  */
 static int spinand_remove(struct spi_device *spi)
 {
-- 
2.6.4
