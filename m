Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaLTA-0000wL-9m
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 08:45:24 +0000
Received: by mail-pb0-f45.google.com with SMTP id uo5so10590404pbc.18
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 01:44:59 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: st_spi_fsm: correct type issues
Date: Wed, 16 Apr 2014 01:43:01 -0700
Message-Id: <1397637782-26843-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compile-testing for a 64-bit arch uncovers several bad casts:

    In file included from include/linux/linkage.h:4:0,
                     from include/linux/kernel.h:6,
                     from drivers/mtd/devices/st_spi_fsm.c:15:
    drivers/mtd/devices/st_spi_fsm.c: In function ‘stfsm_read_fifo’:
    drivers/mtd/devices/st_spi_fsm.c:758:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
    ...

Use uintptr_t instead of uint32_t, since it's guaranteed to be
pointer-sized.

We also see this warning, if size_t is not 32 bits wide:

    In file included from drivers/mtd/devices/st_spi_fsm.c:15:0:
    drivers/mtd/devices/st_spi_fsm.c: In function ‘stfsm_mtd_write’:
    include/linux/kernel.h:712:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
      (void) (&_min1 == &_min2);  \
                     ^
    drivers/mtd/devices/st_spi_fsm.c:1704:11: note: in expansion of macro ‘min’
       bytes = min(FLASH_PAGESIZE - page_offs, len);
               ^

Just use min_t() to force the type conversion, since we don't really
want to upgrade 'page_offs' and 'bytes' to size_t; they only should be
handling <= 256 byte offsets.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 7cc49ba78f68..f97fe144077d 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -755,7 +755,7 @@ static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf, uint32_t size)
 
 	dev_dbg(fsm->dev, "Reading %d bytes from FIFO\n", size);
 
-	BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
+	BUG_ON((((uintptr_t)buf) & 0x3) || (size & 0x3));
 
 	while (remaining) {
 		for (;;) {
@@ -779,7 +779,7 @@ static int stfsm_write_fifo(struct stfsm *fsm, const uint32_t *buf,
 
 	dev_dbg(fsm->dev, "writing %d bytes to FIFO\n", size);
 
-	BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
+	BUG_ON((((uintptr_t)buf) & 0x3) || (size & 0x3));
 
 	writesl(fsm->base + SPI_FAST_SEQ_DATA_REG, buf, words);
 
@@ -1474,7 +1474,7 @@ static int stfsm_read(struct stfsm *fsm, uint8_t *buf, uint32_t size,
 	read_mask = (data_pads << 2) - 1;
 
 	/* Handle non-aligned buf */
-	p = ((uint32_t)buf & 0x3) ? (uint8_t *)page_buf : buf;
+	p = ((uintptr_t)buf & 0x3) ? (uint8_t *)page_buf : buf;
 
 	/* Handle non-aligned size */
 	size_ub = (size + read_mask) & ~read_mask;
@@ -1496,7 +1496,7 @@ static int stfsm_read(struct stfsm *fsm, uint8_t *buf, uint32_t size,
 	}
 
 	/* Handle non-aligned buf */
-	if ((uint32_t)buf & 0x3)
+	if ((uintptr_t)buf & 0x3)
 		memcpy(buf, page_buf, size);
 
 	/* Wait for sequence to finish */
@@ -1538,7 +1538,7 @@ static int stfsm_write(struct stfsm *fsm, const uint8_t *buf,
 	write_mask = (data_pads << 2) - 1;
 
 	/* Handle non-aligned buf */
-	if ((uint32_t)buf & 0x3) {
+	if ((uintptr_t)buf & 0x3) {
 		memcpy(page_buf, buf, size);
 		p = (uint8_t *)page_buf;
 	} else {
@@ -1701,7 +1701,7 @@ static int stfsm_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	while (len) {
 		/* Write up to page boundary */
-		bytes = min(FLASH_PAGESIZE - page_offs, len);
+		bytes = min_t(size_t, FLASH_PAGESIZE - page_offs, len);
 
 		ret = stfsm_write(fsm, b, bytes, to);
 		if (ret)
-- 
1.8.3.2
