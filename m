Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJjHh-0000mW-V9
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2003 00:55:02 +0000
Sender: ahennessy@mvista.com
Message-ID: <3FB18390.3846C928@mvista.com>
Date: Tue, 11 Nov 2003 16:49:20 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3F984931.E6409ED7@mvista.com>
	<1066981292.29915.584.camel@hades.cambridge.redhat.com>
	<3F9D6328.547A39A6@mvista.com>
	<1067284806.16241.2.camel@imladris.demon.co.uk>
	<3F9D8384.ABC9FD4@mvista.com>
	<1067288106.16391.5.camel@imladris.demon.co.uk>
	<1067293762.17740.0.camel@imladris.demon.co.uk>
Content-Type: multipart/mixed;
 boundary="------------BE86F1651CE9EF596226829F"
cc: linux-mtd@lists.infradead.org
Subject: Re: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a multi-part message in MIME format.
--------------BE86F1651CE9EF596226829F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

David Woodhouse wrote:

> On Mon, 2003-10-27 at 13:17 -0800, Alice Hennessy wrote:
> > Thanks for the quick response.  I'll weigh the massage effort with any
> > future maintenance effort saved.
>
> Bear in mind I'm happy enough to make changes to the generic NAND
> interface if they're going to be useful in general.
>
> --
> dwmw2
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

I've attached the current driver for review, possibly as a standalone
driver.  As you can
see from the patch,   the current placement of the driver is in the
drivers/mtd/nand
directory and it replaces the generic nand.c if configured to the
customized board.
This was to make use of nand_ecc.c and nand_ids.c.    Also, the supporting
files
stw_flash.h and stw_flash.c  are currently under the board's directories
but can be massaged to
go anywhere necessary.     This board's nand flash, as I've stated in
previous emails,
has a completely different hardware interface than the standard nand flash
and this makes
using the generic nand.c difficult.   Any opinions on how this fits in
would be appreciated.

Alice

--------------BE86F1651CE9EF596226829F
Content-Type: text/plain; charset=us-ascii;
 name="stw_nand.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="stw_nand.patch"

diff -Nu head.orig/drivers/mtd/nand/Makefile head/drivers/mtd/nand/Makefile
--- head.orig/drivers/mtd/nand/Makefile	2003-09-16 10:32:52.000000000 -0700
+++ head/drivers/mtd/nand/Makefile	2003-09-23 15:10:30.000000000 -0700
@@ -3,17 +3,24 @@
 #
 # $Id: Makefile.common,v 1.1 2003/05/21 15:00:04 dwmw2 Exp $
 
+ifdef CONFIG_MTD_NAND_STW
+nand-base	:= stw_nand.o
+else
+nand-base	:= nand.o
+endif
+
 ifeq ($(PATCHLEVEL),4)
 O_TARGET			:= nandlink.o
-export-objs			:= nand.o nand_ecc.o nand_ids.o
+export-objs			:= $(nand-base) nand_ecc.o nand_ids.o
 endif
 
-obj-$(CONFIG_MTD_NAND)		+= nand.o nand_ecc.o
+obj-$(CONFIG_MTD_NAND)		+= $(nand-base) nand_ecc.o
 obj-$(CONFIG_MTD_NAND_SPIA)	+= spia.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)	+= autcpu12.o
 obj-$(CONFIG_MTD_NAND_EDB7312)  += edb7312.o
 obj-$(CONFIG_MTD_NAND_TX4925NDFMC)  += tx4925ndfmc.o
 obj-$(CONFIG_MTD_NAND_TX4938NDFMC)  += tx4938ndfmc.o
+obj-$(CONFIG_MTD_NAND_STW)	+= stw_nand_init.o
 obj-$(CONFIG_MTD_NAND_IDS)	+= nand_ids.o
 
 -include $(TOPDIR)/Rules.make
diff -Nu head.orig/drivers/mtd/nand/stw_nand.c head/drivers/mtd/nand/stw_nand.c
--- head.orig/drivers/mtd/nand/stw_nand.c	1969-12-31 16:00:00.000000000 -0800
+++ head/drivers/mtd/nand/stw_nand.c	2003-09-25 10:22:11.000000000 -0700
@@ -0,0 +1,1662 @@
+/*
+ *  drivers/mtd/stw_nand.c
+ *
+ *  Copyright (C) 2000 Steven J. Hill (sjhill@cotw.com)
+ *
+ *  Copyright (C) 2003, Metro Link, Inc., All rights reserved
+ *
+ * $Id: stw_nand.c,v 1.3 2003/09/17 23:55:12 ahj Exp $
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+/*
+ * This driver is dramatically changed to fit ATI's implementation of
+ * the NAND flash controller which is based on a "pflash" state machine
+ * instead of the GPIO pin direct-access mode.
+ *
+ * Copyright (C) 2002-2003 ATI Technologies Inc.
+ *                               Chin Zhou (czhou@ati.com)
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/ioport.h>
+#include <linux/interrupt.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#ifdef CONFIG_MTD_NAND_ECC
+#include <linux/mtd/nand_ecc.h>
+#endif
+
+#include <asm/io.h>
+#include <asm/ati/xilleon.h>
+#include <asm/ati/stw_flash.h>
+
+
+/* Strategies for NAND invalid block handling */
+
+/*
+  Block Erase:  
+    - Never erase invalid blocks.
+    - Update invalid block table (IBT) if a new invalid block is detected.
+
+  Read/Write:
+    - Update IBT if any new invalid blocks are found.
+    - Logical-physical block mapping for invalid block replacement.
+    - ECC correction for 1-bit error.
+*/
+
+/*
+   Logical-physical block mapping table scheme:
+   - Create logical block table which links to valid good blocks,
+     skip invalid blocks;
+   - Make sure to have contineous logical partitions;
+   - adjust the offset of logical blocks to the offset of the valid physical blocks.
+
+   Invalid Block Tables (IBT) and special purpose blocks in NAND
+   - First two good blocks are used for invalid block tables (IBT)
+   - Third good block is used for MMON Linux boot lines for dual-boot
+     Linux kernel images.
+   - Each special purpose block has its own magic number.
+*/
+
+/* Error in WR/RD operations according to Samsung specifications */
+/*
+   - Erase failure:
+       Status read after Erase, do block replacement, update IBT.
+   - Program failure:
+       Status read after Program, do block replacement, using L-P table.
+   - Verify after Program (read back):
+       ECC correction or block replacement.
+   - Read error:
+       ECC correction for single bit error.
+*/
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+extern uint32_t nand_logic_block[2*STW_MAX_NUM_BLOCKS];
+extern uint8_t  nand_phy_block[2*STW_MAX_NUM_BLOCKS];
+#endif
+
+
+uint32_t  adj_offset, lb_num;
+uint32_t  poffset;
+
+/* START OPTIMIZED PAGE BUFFER WITH DWORD NAND READ ACCESS */
+
+unsigned char fast_pflash_pagebuf[512];
+unsigned int  fast_pflash_pagenum = 0xFFFFFFFF;
+
+#define FAST_PFLASH_WRITE_8( x, y ) { \
+  fast_pflash_pagenum = 0xFFFFFFFF; /* invalidate cache */ \
+  PFLASH_WRITE_8( (x), (y) ); \
+}
+
+unsigned char FAST_PFLASH_READ_8( unsigned int offset )
+{
+  unsigned int pagenum = offset >> 9;
+
+  if( fast_pflash_pagenum != pagenum ) {
+    /* request is outside of current cached page */
+    unsigned int idx;
+    unsigned int pmem = (offset & 0xFFFFFE00);
+
+    for( idx = 0; idx < 512; idx += 4, pmem += 4 ) {
+      *((unsigned int*)(fast_pflash_pagebuf + idx)) =
+	                            PFLASH_READ_32( pmem );
+    }
+    fast_pflash_pagenum = pagenum;
+  }
+
+  /* fulfill request from current cached page */
+  return fast_pflash_pagebuf[offset & 0x1FF];
+}
+
+/* END OPTIMIZED PAGE BUFFER WITH DWORD NAND READ ACCESS */
+
+
+/*
+ * NAND low-level MTD interface functions
+ */
+
+extern int pflashClearStateMachine(void);
+extern int pflash_oob_enable(uint32_t timeout);
+
+static int nand_read (struct mtd_info *mtd, 
+		      loff_t from, 
+		      size_t len,
+		      size_t *retlen,
+		      u_char *buf);
+
+static int nand_read_ecc (struct mtd_info *mtd,
+			  loff_t from,
+			  size_t len,
+			  size_t *retlen,
+			  u_char *buf,
+			  u_char *oob_buf,
+			  struct nand_oobinfo *oobsel);
+
+static int nand_read_oob (struct mtd_info *mtd,
+			  loff_t from,
+			  size_t len,
+			  size_t *retlen,
+			  u_char *buf);
+
+static int nand_write (struct mtd_info *mtd,
+		       loff_t to, size_t len,
+		       size_t *retlen, const u_char *buf);
+
+static int nand_write_ecc (struct mtd_info *mtd,
+			   loff_t to,
+			   size_t len,
+			   size_t *retlen,
+			   const u_char *buf,
+			  u_char *oob_buf,
+			  struct nand_oobinfo *oobsel);
+
+static int nand_write_oob (struct mtd_info *mtd,
+			   loff_t to,
+			   size_t len,
+			   size_t *retlen,
+			   const u_char *buf);
+
+static int nand_erase (struct mtd_info *mtd,
+		       struct erase_info *instr);
+
+static void nand_sync (struct mtd_info *mtd);
+
+
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+
+static uint32_t stw_nand_block_map(uint32_t *offset);
+
+static int getAdjOffset(int x)
+{
+    poffset = x;
+    return stw_nand_block_map(&poffset);
+}
+#else
+#define getAdjOffset(x) (x)
+#endif
+
+/*******************************************************************/
+
+/* 
+   Supported command for the STW NAND device are:
+       NAND_CMD_READ0
+       NAND_CMD_READ1
+       NAND_CMD_READOOB    0x50
+       NAND_CMD_SEQIN      0x80
+       NAND_CMD_PAGEPROG   0x10
+
+       NAND_CMD_ERASE1     0x60
+       NAND_CMD_STATUS     0x70
+       NAND_CMD_READID     0x90
+       NAND_CMD_RESET      0xff
+
+
+   Comments on the ATI's pflash state-machine implementation:
+   Need to clear read_cycle and write_cycle bits for the
+   read/write transition; transitions between the main and
+   OOB areas, to set/reset SPARE_EN of the PFLASH_CNTL.
+
+   Register accesses always need 32-bit Dword, while PCU NAND 
+   flash access can be in Byte/word/dword.
+
+   READID:
+   STATUS:
+    - set PFLASH_BE_ADDR  because of 2 device CS;
+    - writeREG32 (command, PFLASH_CNTL);
+
+    - readREG32 (PFLASH_ID_STAT_DATA);   (for STATUS and READID);
+
+   RESET:
+   ERASE1:
+
+    - set PFLASH_BE_ADDR  because of 2 device CS;
+    - writeREG32 (command, PFLASH_CNTL);
+
+   READ0/READ1:
+    - readPCU8/16/32(PCU_NAND_MAIN_ADDR);
+
+   READOOB:
+    - writeREG32 ( cmmand, PFLASH_CNTL )  (set the SPARE_EN);
+    - readPCU8/16/32 (PCU_NAND_OOD_ADDR);
+
+   WRITEOOB:
+    - writeREG32 ( cmmand, PFLASH_CNTL )  (set the SPARE_EN);
+    - writePCU8/16/32 (PCU_NAND_OOD_ADDR, byte/word/dword0;
+
+   PAGEPROG:
+    - writePCU8/16/32 (PCU_NAND_MAIN_ADDR, byte/word/dword);
+
+    - ATI hardware implementation is based on automatic page-program:
+      NAND controller issue 80h command first, then issue 10h command
+      either when clear_state_machine or address reach the end of the page.
+*/
+
+/**************************************************************************/
+
+/*
+ * Send command to NAND device, ATI's hardware implementation.
+ */
+static void nand_command (struct mtd_info *mtd,
+			  unsigned command,
+			  int column,
+			  int page_addr,
+			  CHIP_SEL chipsel,
+			  uint32_t timeout)
+{
+
+  uint32_t blk_address;
+  uint32_t regVal;
+  uint32_t status;
+
+  switch (command) {
+
+  case NAND_CMD_RESET:
+	  pflashClearStateMachine();
+	  blk_address = pflashGetChipStartOffset(chipsel);
+	  regVal = blk_address >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT;
+	  SETFLD_REGMM32(PFLASH_BE_ADDR, BLOCK_ERASE_ADDR, regVal); 
+	  SETFLD_REGMM32(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_RESET); 
+	  status = pflashWaitCMDTriggerDone();
+	  break;
+
+  case NAND_CMD_READID:
+	  pflashClearStateMachine();
+	  blk_address = pflashGetChipStartOffset(chipsel);
+	  regVal = blk_address >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT;
+	  SETFLD_REGMM32(PFLASH_BE_ADDR, BLOCK_ERASE_ADDR, regVal); 
+	  SETFLD_REGMM32(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_ID_READ); 
+	  status = pflashWaitCMDTriggerDone();
+	  if(status == PFLASH_OK)
+	    {
+	      while(GETFLD_REGMM32(PFLASH_STATUS, ID_READ_DONE) == 0)
+		{
+		  udelay(1000);
+		  if(--timeout == 0)
+		    {
+		      printk("nand_command: timeout waiting for ID_READ.\n");
+		      return;
+		    }
+		}
+	
+	    }
+	  break;
+
+  case NAND_CMD_STATUS:
+	  /*
+	  pflashClearStateMachine();
+	  blk_address = pflash_get_chip_start_address(chipsel);
+	  regVal = blk_address >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT;
+	  SETFLD_REGMM32(PFLASH_BE_ADDR, BLOCK_ERASE_ADDR, regVal); 
+	  SETFLD_REGMM32(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_READ_STATUS); 
+	  status = pflashWaitCMDTriggerDone();
+	  */
+	  break;
+
+  case NAND_CMD_ERASE1:
+	  /*
+	  pflashClearStateMachine();
+	  blk_address = pflash_get_chip_start_address(chipsel);
+	  regVal = blk_address >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT;
+	  SETFLD_REGMM32(PFLASH_BE_ADDR, BLOCK_ERASE_ADDR, regVal); 
+	  SETFLD_REGMM32(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_BLOCK_ERASE); 
+	  status = pflashWaitCMDTriggerDone();
+	  */
+	  break;
+	
+  default:
+	  printk(KERN_INFO "Unknown NAND command is issued.\n");
+	  break;
+
+  }
+  udelay (10);
+}
+
+/*
+ * NAND read
+ */
+static int nand_read (struct mtd_info *mtd,
+		      loff_t from,
+		      size_t len,
+		      size_t *retlen,
+		      u_char *buf)
+{
+  return nand_read_ecc (mtd, from, len, retlen, buf, NULL, NULL);
+}
+
+/*
+ * NAND read with ECC
+ */
+static int nand_read_ecc (struct mtd_info *mtd,
+			  loff_t from,
+			  size_t len,
+			  size_t *retlen,
+			  u_char *buf,
+			  u_char *oob_buf,
+			  struct nand_oobinfo *oobsel)
+{
+  int j, col, page, state;
+  int erase_state = 0;
+  struct nand_chip *this = mtd->priv;
+  DECLARE_WAITQUEUE(wait, current);
+#ifdef CONFIG_MTD_NAND_ECC
+  u_char *data_poi;
+  int ecc_result;
+  size_t blockoffset;
+  u_char ecc_calc[6];
+  u_char ecc_code[6];
+#endif
+
+  DEBUG ( MTD_DEBUG_LEVEL2,
+	  "nand_read_ecc: from = 0x%08x, len = %i\n",
+	  (unsigned int) from, (int) len );
+
+  /* Do not allow reads past end of device */
+  if ((from + len) > (mtd->size) ) {
+    DEBUG ( MTD_DEBUG_LEVEL0,
+	    "nand_read_ecc: Attempt read beyond end of device\n" );
+    *retlen = 0;
+    return -EINVAL;
+  }
+
+  /* Grab the lock and see if the device is available */
+ retry:
+  spin_lock_bh (&this->chip_lock);
+  switch (this->state) {
+  case FL_READY:
+    this->state = FL_READING;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  case FL_ERASING:
+    this->state = FL_READING;
+    erase_state = 1;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  default:
+    set_current_state (TASK_UNINTERRUPTIBLE);
+    add_wait_queue (&this->wq, &wait);
+    spin_unlock_bh (&this->chip_lock);
+    schedule();
+    remove_wait_queue (&this->wq, &wait);
+    goto retry;
+  };
+
+  /* First we calculate the starting page */
+  page = from >> this->page_shift;
+
+  /* Get raw starting column */
+  col = from & (mtd->oobblock - 1);
+
+  /* State machine for devices having pages larger than 256 bytes */
+  state = (col < mtd->eccsize) ? 0 : 1;
+
+  /* Calculate column address within ECC block context */
+  col = (col >= mtd->eccsize) ? (col - mtd->eccsize) : col;
+
+  /* Initialize return value */
+  *retlen = 0;
+
+  pflashClearStateMachine();
+
+  /* Loop until all data read */
+  while (*retlen < len) {
+
+#ifdef CONFIG_MTD_NAND_ECC
+    int need_copy;
+
+    /* 
+     * If the read is half-page aligned and takes up a full half-page,
+     * we read into return buffer directly; otherwise, we have to read
+     * into data buffer due and copy later.  We also modify 'blockoffset' so
+     * that adding blockoffset to 'from' will align the beginning of the
+     * read.
+     */
+    if (!col && (len - *retlen) >= mtd->eccsize) {
+      data_poi = &buf[*retlen];
+      blockoffset = *retlen;
+      need_copy = 0;
+    }
+    else  {
+      data_poi = this->data_buf;
+      blockoffset = *retlen - col;
+      need_copy = 1;
+    }
+
+    DEBUG ( MTD_DEBUG_LEVEL3, "blockoffset=0x%x, *retlen=0x%x\n",
+	    blockoffset, *retlen );
+
+    /* Read in a block big enough for ECC */
+    pflashClearStateMachine();
+    for (j=0 ; j < mtd->eccsize; j++) {
+      adj_offset = getAdjOffset(from+blockoffset+j);
+      data_poi[j]= FAST_PFLASH_READ_8(adj_offset);
+    }
+
+    /* Calculate the ECC and verify/correct 1 bit */
+    if (!state) {
+      for (j=0 ; j<3 ; j++){
+	pflash_oob_enable(10);
+	adj_offset = getAdjOffset(from+blockoffset+j);
+	ecc_code[j] = PFLASH_READ_8(adj_offset);
+      }
+
+      nand_calculate_ecc (mtd, data_poi, &ecc_calc[0]);
+      ecc_result = nand_correct_data (mtd, data_poi,
+				      &ecc_code[0], &ecc_calc[0]);
+
+      DEBUG ( MTD_DEBUG_LEVEL3,
+	      "nand_read_ecc: ecc0=0x%x ecc1=0x%x ecc2=0x%x\n",
+	      ecc_code[0], ecc_code[1], ecc_code[2]);
+      DEBUG ( MTD_DEBUG_LEVEL3,
+	      "nand_read_ecc: cecc0=0x%x cecc1=0x%x cecc2=0x%x\n",
+	      ecc_calc[0], ecc_calc[1], ecc_calc[2]);
+    }
+    else {
+      pflash_oob_enable(10);
+      adj_offset = getAdjOffset(from+blockoffset-mtd->eccsize+SPARE_AREA_U256_ECC0_OFFSET);
+      ecc_code[3]= PFLASH_READ_8(adj_offset);
+
+      pflash_oob_enable(10);
+      adj_offset = getAdjOffset(from+blockoffset-mtd->eccsize+SPARE_AREA_U256_ECC1_OFFSET);
+      ecc_code[4] = PFLASH_READ_8(adj_offset);
+
+      pflash_oob_enable(10);
+      adj_offset = getAdjOffset(from+blockoffset-mtd->eccsize+SPARE_AREA_U256_ECC2_OFFSET);
+      ecc_code[5] = PFLASH_READ_8(adj_offset);
+      pflashClearStateMachine();
+
+      nand_calculate_ecc (mtd, data_poi, &ecc_calc[3]);
+      ecc_result = nand_correct_data (mtd, data_poi,
+				      &ecc_code[3], &ecc_calc[3]);
+
+      DEBUG ( MTD_DEBUG_LEVEL3,
+	      "nand_read_ecc: ecc3=0x%x ecc4=0x%x ecc5=0x%x\n",
+	      ecc_code[3], ecc_code[4], ecc_code[5]);
+      DEBUG ( MTD_DEBUG_LEVEL3,
+	      "nand_read_ecc: cecc3=0x%x cecc4=0x%x cecc5=0x%x\n",
+	      ecc_calc[3], ecc_calc[4], ecc_calc[5]);
+    }
+
+    if (ecc_result == -1) {
+      DEBUG (MTD_DEBUG_LEVEL2,
+	     "nand_read_ecc: " \
+	     "Failed ECC read, page 0x%08x\n", page);
+      spin_lock_bh (&this->chip_lock);
+      if (erase_state)
+	this->state = FL_ERASING;
+      else
+	this->state = FL_READY;
+      wake_up (&this->wq);
+      spin_unlock_bh (&this->chip_lock);
+      return -EIO;
+    }
+
+    /* Read the data from ECC data buffer into return buffer */
+    if (need_copy) {
+      for (j=col; (j < mtd->eccsize) && (*retlen < len); j++)
+	buf[(*retlen)++] = data_poi[j];
+    } else {
+      *retlen += mtd->eccsize;
+    }
+#else  /* CONFIG_MTD_NAND_ECC */
+
+    /* Read the data directly into the return buffer */
+    if ((*retlen + (mtd->eccsize - col)) >= len) {
+      while (*retlen < len){
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+	poffset =   from+(*retlen);
+	adj_offset = stw_nand_block_map(&poffset);
+#else
+	adj_offset = from+(*retlen);
+#endif
+	buf[(*retlen)++] = FAST_PFLASH_READ_8(adj_offset);
+      }
+      /* We're done */
+      continue;
+    }
+    else
+      for (j=col ; j < mtd->eccsize; j++) {
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+	poffset =   from+(*retlen);
+	adj_offset = stw_nand_block_map(&poffset);
+#else
+	adj_offset = from+(*retlen);
+#endif
+	buf[(*retlen)++] = FAST_PFLASH_READ_8(adj_offset);
+      }
+
+#endif  /* CONFIG_MTD_NAND_ECC */
+
+    /*
+     * If the amount of data to be read is greater than
+     * (256 - col), then all subsequent reads will take
+     * place on page or half-page (in the case of 512 byte
+     * page devices) aligned boundaries and the column
+     * address will be zero. Setting the column address to
+     * to zero after the first read allows us to simplify
+     * the reading of data and the if/else statements above.
+     */
+    if (col)
+      col = 0x00;
+
+    /* Increment page address */
+    if ( (mtd->oobblock == 256) || state )
+      page++;
+
+    /* Toggle state machine */
+    if (mtd->oobblock == 512)
+      state = state ? 0 : 1;
+  }
+
+  /* Wake up anyone waiting on the device */
+  spin_lock_bh (&this->chip_lock);
+  if (erase_state)
+    this->state = FL_ERASING;
+  else
+    this->state = FL_READY;
+  wake_up (&this->wq);
+  spin_unlock_bh (&this->chip_lock);
+
+  DEBUG ( MTD_DEBUG_LEVEL2,
+	  "nand_read_ecc(end): from = 0x%08x, len = %d\n",
+	  (unsigned int) from, (int) *retlen );
+
+  /* Return OK */
+  return 0;
+
+}
+
+/*
+ * NAND read out-of-band
+ */
+static int nand_read_oob (struct mtd_info *mtd,
+			  loff_t from,
+			  size_t len,
+			  size_t *retlen,
+			  u_char *buf)
+{
+  int j, col, i;
+  int erase_state = 0;
+  struct nand_chip *this = mtd->priv;
+  DECLARE_WAITQUEUE(wait, current);
+
+  DEBUG ( MTD_DEBUG_LEVEL2,
+	  "nand_read_oob: from = 0x%08x, len = %i\n",
+	  (unsigned int) from, (int) len );
+
+  /* Do not allow reads past end of device */
+  if ((from + len) > (mtd->size) ) {
+    DEBUG ( MTD_DEBUG_LEVEL0,
+	    "nand_read_oob: Attempt read beyond end of device\n" );
+    *retlen = 0;
+    return -EINVAL;
+  }
+
+  /* Grab the lock and see if the device is available */
+retry:
+  spin_lock_bh (&this->chip_lock);
+  switch (this->state) {
+  case FL_READY:
+    this->state = FL_READING;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  case FL_ERASING:
+    this->state = FL_READING;
+    erase_state = 1;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  default:
+    set_current_state (TASK_UNINTERRUPTIBLE);
+    add_wait_queue (&this->wq, &wait);
+    spin_unlock_bh (&this->chip_lock);
+    schedule();
+    remove_wait_queue (&this->wq, &wait);
+    goto retry;
+  };
+
+
+  /* Mask to get column */
+  col = from & 0x0f;
+
+  /* Assuming no ECC on oob data. Not used in nand.c -- ahj */
+  /* Loop until all data read */
+  i = 0;
+  while (i < len) {
+    int thislen = (mtd->oobsize - col) & (mtd->oobsize - 1);
+    if (!thislen)
+      thislen = mtd->oobsize;
+    thislen = min_t(int, thislen, len);
+    j = 0;
+    while (j < thislen) {
+      pflash_oob_enable(10);
+      adj_offset = getAdjOffset(from+i+j);
+      buf[i + j++] = PFLASH_READ_8(adj_offset);
+    }
+    i += thislen;
+    col += thislen;
+    /* Delay between pages */
+    udelay (this->chip_delay);
+  }
+  pflashClearStateMachine();
+
+  /* Wake up anyone waiting on the device */
+  spin_lock_bh (&this->chip_lock);
+  if (erase_state)
+    this->state = FL_ERASING;
+  else
+    this->state = FL_READY;
+  wake_up (&this->wq);
+  spin_unlock_bh (&this->chip_lock);
+
+  /* Return OK */
+  *retlen = i;
+  return 0;
+
+}
+
+/*
+ * NAND write
+ */
+static int nand_write (struct mtd_info *mtd,
+		       loff_t to,
+		       size_t len,
+		       size_t *retlen,
+		       const u_char *buf)
+{
+  return nand_write_ecc (mtd, to, len, retlen, buf, NULL, NULL);
+}
+
+
+/*
+ * NAND write with ECC
+ */
+static int nand_write_ecc (struct mtd_info *mtd,
+			   loff_t to,
+			   size_t len,
+			   size_t *retlen,
+			   const u_char *buf,
+			   u_char *oob_buf,
+			   struct nand_oobinfo *oobsel)
+{
+#define NOTALIGNED(x) (x & (mtd->oobblock-1)) != 0
+  int i,j, page, col, cnt;
+  struct nand_chip *this = mtd->priv;
+  DECLARE_WAITQUEUE(wait, current);
+
+#ifdef CONFIG_MTD_NAND_ECC
+  int ecc_bytes = (mtd->oobblock == 512) ? 6 : 3;
+  u_char ecc_code[6];
+#endif
+
+  DEBUG (MTD_DEBUG_LEVEL2,
+	 "nand_write_ecc: to = 0x%08x, len = 0x%x\n",
+	 (unsigned int) to, (int) len);
+
+  /* Do not allow write past end of page */
+  if ((to + len) > mtd->size) {
+    DEBUG (MTD_DEBUG_LEVEL0,
+	   "nand_write_ecc: Attempted write past end of device\n");
+    return -EINVAL;
+  }
+
+  /* reject writes, which are not page aligned */	
+  if (NOTALIGNED (to)) {
+	  printk (KERN_NOTICE "nand_write_ecc: Attempt to write not page aligned data\n");
+	  return -EINVAL;
+  }
+
+
+ retry:
+  /* Grab the lock and see if the device is available */
+  spin_lock_bh (&this->chip_lock);
+  switch (this->state) {
+  case FL_READY:
+    this->state = FL_WRITING;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  default:
+    set_current_state (TASK_UNINTERRUPTIBLE);
+    add_wait_queue (&this->wq, &wait);
+    spin_unlock_bh (&this->chip_lock);
+    schedule();
+
+    remove_wait_queue (&this->wq, &wait);
+    goto retry;
+  };
+
+  /* Shift to get page */
+  page = ((int) to) >> this->page_shift;
+
+  /* Get the starting column */
+  /* This will always be zero if we are writting on a page boundary. */
+  col = to & (mtd->oobblock - 1);
+
+  /* Initialize return length value */
+  *retlen = 0;
+
+  DEBUG( MTD_DEBUG_LEVEL3, "nand_write_ecc col: %x page: %x\n",
+	 col, page );
+
+  /* Loop until all data is written */
+  while (*retlen < len) {
+    /* Write data into buffer */
+    if ((col + len) >= mtd->oobblock)
+      for(i=col, cnt=0 ; i < mtd->oobblock ; i++, cnt++)
+	this->data_buf[i] = buf[(*retlen + cnt)];
+    else
+      for(i=col, cnt=0 ; cnt < (len - *retlen) ; i++, cnt++)
+	this->data_buf[i] = buf[(*retlen + cnt)];
+
+    /* Write post-padding bytes into buffer.  Can happen only if length
+     * isn't a multiple of page size.  Must happen before we calculate
+     * the ecc values.  -- assumption is that memory following the
+     * written space is all 0xff.  If not, we would need to read in that
+     * memory here.   For now, we'll assume we only write to a page once
+     * w/o erasing.  */
+    if ((col + (len - *retlen)) < mtd->oobblock) {
+      for(i=(col + cnt) ; i < mtd->oobblock ; i++)
+	this->data_buf[i] = 0xff;
+    }
+
+#ifdef CONFIG_MTD_NAND_ECC
+    /* Zero out the ECC array */
+    for (i=0 ; i < 6 ; i++)
+      ecc_code[i] = 0x00;
+
+    /* Calculate and write the first ECC. */
+    if ((col < mtd->eccsize) &&
+	((col + (len - *retlen)) >= mtd->eccsize)) {
+
+      DEBUG( MTD_DEBUG_LEVEL3, "NAND_ECC write_ecc - col=%x\n", col);
+
+      /*  This loop should never happen on a page boundary. */
+      for (i=0 ; i < col ; i++) {
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+	poffset   = to-col+i;
+	adj_offset = stw_nand_block_map(&poffset);
+#else
+	adj_offset = to-col+i;
+#endif
+	this->data_buf[i] = FAST_PFLASH_READ_8(adj_offset);
+
+      }
+      nand_calculate_ecc (mtd, &this->data_buf[0], &ecc_code[0]);
+      DEBUG( MTD_DEBUG_LEVEL3, "ecc_code L256: 0x%x 0x%x 0x%x\n",
+	     ecc_code[0], ecc_code[1], ecc_code[2]);
+
+      /* pay attention to the OOB offset for the ECC data */
+      for (i=0 ; i<3 ; i++)
+	this->data_buf[(mtd->oobblock + i)] = ecc_code[i];
+    }
+
+    /* Calculate and write the second ECC if we have enough data */
+    /* In the original code, 'enough data' meant a full page.  I believe
+     * the correct meaning would be any data on the second half of the
+     * page would require ecc values. */
+    if ((mtd->oobblock == 512) && ((col + (len - *retlen)) > mtd->eccsize)) {
+      nand_calculate_ecc (mtd, &this->data_buf[256], &ecc_code[3]);
+
+	    /* pay attention to the OOB offset for the ECC data */
+      this->data_buf[(mtd->oobblock + SPARE_AREA_U256_ECC0_OFFSET)]
+	= ecc_code[3];
+      this->data_buf[(mtd->oobblock + SPARE_AREA_U256_ECC1_OFFSET)]
+	= ecc_code[4];
+      this->data_buf[(mtd->oobblock + SPARE_AREA_U256_ECC2_OFFSET)]
+	= ecc_code[5];
+
+      DEBUG( MTD_DEBUG_LEVEL3, "ecc_code U256: 0x%x 0x%x 0x%x\n",
+	     ecc_code[3], ecc_code[4], ecc_code[5]);
+      DEBUG( MTD_DEBUG_LEVEL3, "bad block marker: 0x%x\n",
+	     this->data_buf[mtd->oobblock+SPARE_AREA_VALID_BLOCK_OFFSET]);
+
+    }
+		
+    /* Write ones */
+    this->data_buf[516] = 0xff;
+    this->data_buf[mtd->oobblock+SPARE_AREA_VALID_BLOCK_OFFSET] = 0xff;
+    for (i=(ecc_bytes+2) ; i < mtd->oobsize ; i++)
+      this->data_buf[(mtd->oobblock + i)] = 0xff;
+#else
+    /* Write ones */
+    for (i=mtd->oobblock ; i < (mtd->oobblock + mtd->oobsize) ; i++)
+      this->data_buf[i] = 0xff;
+    /*  Fake ECC values for jffs2 */
+    this->data_buf[mtd->oobblock + SPARE_AREA_L256_ECC0_OFFSET] = 0x54;
+    this->data_buf[mtd->oobblock + SPARE_AREA_U256_ECC0_OFFSET] = 0x42;
+#endif
+
+    /* Write pre-padding bytes into buffer -- should never happen
+     * as long as we write only on page boundaries.  */
+    for (i=0 ; i < col ; i++)
+      this->data_buf[i] = 0xff;
+
+    /* Write out complete page of data */
+    pflashClearStateMachine(); 
+    for (i=0 ; i < (mtd->oobblock + mtd->oobsize) ; i++) {
+      if(i>=mtd->oobblock) {
+	j = i-mtd->oobblock;
+        adj_offset = getAdjOffset(to-col+j+(*retlen));
+	pflash_oob_enable(10);
+      }
+      else {
+        adj_offset = getAdjOffset(to-col+i+(*retlen));
+      }
+      FAST_PFLASH_WRITE_8( (adj_offset), this->data_buf[i] );
+    }
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+    /*
+     * The NAND device assumes that it is always writing to
+     * a cleanly erased page. Hence, it performs its internal
+     * write verification only on bits that transitioned from
+     * 1 to 0. The device does NOT verify the whole page on a
+     * byte by byte basis. It is possible that the page was
+     * not completely erased or the page is becoming unusable
+     * due to wear. The read with ECC would catch the error
+     * later when the ECC page check fails, but we would rather
+     * catch it early in the page write stage. Better to write
+     * no data than invalid data.
+     */
+
+    pflashClearStateMachine();		
+
+    DEBUG ( MTD_DEBUG_LEVEL3,
+	    "NAND_VERIFY_WRITE - col=0x%x, cnt=0x%x, *retlen=0x%x\n",
+	    col, cnt, *retlen );
+
+    /* Loop through and verify the data */
+    for (i=col ; i < cnt ; i++) {
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+      poffset =   to-col+i+(*retlen);
+      adj_offset = stw_nand_block_map(&poffset);
+#else
+      adj_offset = to-col+i+(*retlen);
+#endif
+      if (this->data_buf[i] != FAST_PFLASH_READ_8(adj_offset)) {
+	DEBUG (MTD_DEBUG_LEVEL0,
+	       "nand_write_ecc: " \
+	       "Failed write verify, page 0x%08x, " \
+	       "%6i bytes were succesful\n",
+	       page, *retlen);
+
+	spin_lock_bh (&this->chip_lock);
+	this->state = FL_READY;
+	wake_up (&this->wq);
+	spin_unlock_bh (&this->chip_lock);
+	return -EIO;
+      }
+    }
+
+#ifdef CONFIG_MTD_NAND_ECC
+      /*
+       * We also want to check that the ECC bytes wrote
+       * correctly for the same reasons stated above.
+       */
+      /* READ OOB */
+      pflash_oob_enable(10);
+      for (i=0 ; i < (ecc_bytes-2) ; i++) {
+	pflash_oob_enable(10);
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+	poffset =   to+i;
+	adj_offset = stw_nand_block_map(&poffset);
+#else
+	adj_offset = to+i;
+#endif
+	if ((PFLASH_READ_8(adj_offset) != ecc_code[i]) && ecc_code[i]) {
+	  DEBUG (MTD_DEBUG_LEVEL0,
+		 "nand_write_ecc: Failed ECC write " \
+		 "verify, page 0x%08x, " \
+		 "%6i bytes were succesful, ecc_code[%x]=0x%0x\n",
+		 page, i, i, ecc_code[i]);
+
+	  spin_lock_bh (&this->chip_lock);
+	  this->state = FL_READY;
+	  wake_up (&this->wq);
+	  spin_unlock_bh (&this->chip_lock);
+	  return -EIO;
+	}
+      }
+
+      pflash_oob_enable(10);
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+      poffset   = to + SPARE_AREA_U256_ECC1_OFFSET;
+      adj_offset = stw_nand_block_map(&poffset);
+#else
+      adj_offset = to + SPARE_AREA_U256_ECC1_OFFSET;
+#endif
+	if ((PFLASH_READ_8(adj_offset) != ecc_code[4]) && ecc_code[4]) {
+	  DEBUG (MTD_DEBUG_LEVEL0,
+		 "nand_write_ecc: Failed ECC write " \
+		 "verify, page 0x%08x, " \
+		 "%6i bytes were succesful, ecc_code[%x]=0x%0x\n",
+		 page, 4, 4, ecc_code[4]);
+
+	  spin_lock_bh (&this->chip_lock);
+	  this->state = FL_READY;
+	  wake_up (&this->wq);
+	  spin_unlock_bh (&this->chip_lock);
+	  return -EIO;
+	}
+
+	pflash_oob_enable(10);
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+	poffset   = to + SPARE_AREA_U256_ECC2_OFFSET;
+	adj_offset = stw_nand_block_map(&poffset);
+#else
+	adj_offset = to + SPARE_AREA_U256_ECC2_OFFSET;
+#endif
+	if ((PFLASH_READ_8(adj_offset) != ecc_code[5]) && ecc_code[5]) {
+	  DEBUG (MTD_DEBUG_LEVEL0,
+		 "nand_write_ecc: Failed ECC write " \
+		 "verify, page 0x%08x, " \
+		 "%6i bytes were succesful, ecc_code[%x]=0x%0x\n",
+		 page, 5, 5, ecc_code[5]);
+
+	  spin_lock_bh (&this->chip_lock);
+	  this->state = FL_READY;
+	  wake_up (&this->wq);
+	  spin_unlock_bh (&this->chip_lock);
+	  return -EIO;
+	}
+
+	pflashClearStateMachine();
+#endif
+#endif
+	
+	/*
+	 * If we are writing a large amount of data and/or it
+	 * crosses page or half-page boundaries, we set the
+	 * the column to zero. It simplifies the program logic.
+	 */
+	if (col)
+	  col = 0x00;
+
+	/* Update written bytes count */
+	*retlen += cnt;
+
+	/* Increment page address */
+	page++;
+
+	pflashClearStateMachine();
+
+  }  /* while len loop */
+
+
+  /* Wake up anyone waiting on the device */
+  spin_lock_bh (&this->chip_lock);
+  this->state = FL_READY;
+  wake_up (&this->wq);
+  spin_unlock_bh (&this->chip_lock);
+
+  /* Return OK */
+  *retlen = len;
+  return 0;
+
+#undef NOTALIGNED
+}
+
+
+/* This code was lifted from writev.c in the fs/jffs2 directory.
+ * Quick and dirty way to do the write.  At some point we may replace it to
+ * be a little more efficient.  */
+static int mtd_fake_writev_ecc(struct mtd_info *mtd,
+			       const struct iovec *vecs, unsigned long count,
+			       loff_t to, size_t * retlen, u_char *eccbuf,
+			       struct nand_oobinfo *oobsel)
+{
+  size_t totlen = 0, thislen;
+  unsigned char outbuf[512];
+  unsigned char *bufp;
+  int ret = 0;
+  int vecndx = 0;
+  int writelen;
+
+
+  /* Loop until all iovecs' data has been written */
+  while (count) {
+  DEBUG (MTD_DEBUG_LEVEL2,
+	 "mtd_fake_writev_ecc: to = 0x%08x, len = 0x%x\n",
+	 (unsigned int) to, (int) vecs->iov_len);
+
+    /*  Just skip any vectors whose size is zero */
+    if (vecs->iov_len == 0 || vecs->iov_base == NULL) {
+      count--;
+      vecs++;
+      continue;
+    }
+
+    /*
+     *  Check, if the tuple gives us enough data for a full page write or if
+     *  this is the last vector.  If so, we can use the iov direct, else we
+     *  have to copy into data_buf.
+     */
+    if (vecs->iov_len >= mtd->oobblock || count == 1) {
+      bufp = (u_char *) &vecs->iov_base[vecndx];
+      writelen = min_t(int, mtd->oobblock, vecs->iov_len - vecndx) ;
+      vecndx += writelen;
+
+      /* Check, if we have to switch to the next tuple */
+      if (vecndx >= (int) vecs->iov_len) {
+	vecs++;
+	vecndx = 0;
+	count--;
+      }
+    } else {
+      int cnt = 0;
+      /*
+       * Read data out of each tuple until we have a full page
+       * to write or we've read all the tuples.
+       */
+      DEBUG (MTD_DEBUG_LEVEL2,
+	     "mtd_fake_writev_ecc(1): to = 0x%08x, len = 0x%x ",
+	     (unsigned int) to+totlen, (int) vecs->iov_len);
+      DEBUG (MTD_DEBUG_LEVEL2,
+	     "count = %d, ndx = 0x%x\n", count, vecndx);
+      while ((cnt < mtd->oobblock) && count > 0) {
+	if (vecs->iov_base != NULL && vecs->iov_len) {
+	  outbuf[cnt++] = ((u_char *) vecs->iov_base)[vecndx++];
+	  /* Check, if we have to switch to the next tuple */
+	  if (vecndx >= (int) vecs->iov_len) {
+	    vecs++;
+	    vecndx = 0;
+	    count--;
+	    DEBUG (MTD_DEBUG_LEVEL2,
+		   "mtd_fake_writev_ecc(2): to = 0x%08x, len = 0x%x ",
+		   (unsigned int) to+totlen, (int) vecs->iov_len);
+	    DEBUG (MTD_DEBUG_LEVEL2,
+		   "count = %d, cnt = 0x%x\n", count, cnt);
+	  }
+	} else {
+	  vecs++;
+	  count--;
+	  DEBUG (MTD_DEBUG_LEVEL2,
+		 "mtd_fake_writev_ecc(3): to = 0x%08x, len = 0x%x ",
+		 (unsigned int) to+totlen, (int) vecs->iov_len);
+	  DEBUG (MTD_DEBUG_LEVEL2,
+		 "count = %d, cnt = 0x%x\n", count, cnt);
+	}
+      }
+      writelen = cnt;
+      bufp = outbuf;
+    }
+
+    /* We use the same function for write and writev !) */
+    ret = mtd->write_ecc(mtd, to+totlen, writelen, &thislen, bufp, eccbuf, oobsel);
+
+    if (ret != 0) {
+      DEBUG (MTD_DEBUG_LEVEL2,
+	 "mtd_fake_writev_ecc **** FAILED: to = 0x%08x, len = 0x%x\n",
+	 (unsigned int) to+totlen, (int) writelen);
+      return ret;
+    }
+
+    /* Update written bytes count */
+    totlen += writelen;;
+
+  }
+
+  if (retlen)
+    *retlen = totlen;
+
+  DEBUG (MTD_DEBUG_LEVEL2,
+     "mtd_fake_writev_ecc **** SUCCEEDED: to = 0x%08x, len = %d\n",
+     	(unsigned int)to, (int)totlen);
+  return 0;
+}
+
+/*
+ * NAND write with iovec
+ */
+static int nand_writev (struct mtd_info *mtd, const struct iovec *vecs, unsigned long count,
+		loff_t to, size_t * retlen)
+{
+	return (mtd_fake_writev_ecc (mtd, vecs, count, to, retlen, NULL, 0));
+}
+
+/*
+ * NAND write out-of-band
+ */
+static int nand_write_oob (struct mtd_info *mtd,
+			   loff_t to,
+			   size_t len,
+			   size_t *retlen,
+			   const u_char *buf)
+{
+  int column, page, i;
+  struct nand_chip *this = mtd->priv;
+  DECLARE_WAITQUEUE(wait, current);
+
+  DEBUG (MTD_DEBUG_LEVEL2, "nand_write_oob: to = 0x%08x, len = %i\n", (unsigned int) to, (int) len);
+
+  /* Shift to get page */
+  page = ((int) to) >> this->page_shift;
+
+  /* Mask to get column */
+  column = to & 0x1f;
+
+  /* Initialize return length value */
+  *retlen = 0;
+
+  /* Do not allow write past end of page */
+  if ((column + len) > mtd->oobsize) {
+	  DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: Attempt to write past end of page\n");
+	  return -EINVAL;
+  }
+
+  /* Do not allow write past end of page */
+  if ((to + len) > mtd->size) {
+    DEBUG (MTD_DEBUG_LEVEL0,
+	   "nand_write_oob: Attempted write past end of device\n");
+    return -EINVAL;
+  }
+
+retry:
+  /* Grab the lock and see if the device is available */
+  spin_lock_bh (&this->chip_lock);
+  switch (this->state) {
+  case FL_READY:
+    this->state = FL_WRITING;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  default:
+    set_current_state (TASK_UNINTERRUPTIBLE);
+    add_wait_queue (&this->wq, &wait);
+    spin_unlock_bh (&this->chip_lock);
+    schedule();
+
+    remove_wait_queue (&this->wq, &wait);
+    goto retry;
+  };
+
+
+  DEBUG( MTD_DEBUG_LEVEL3, "nand_write_oob col: %x page: %x\n",
+	 column, page );
+
+  /* Prepad with 0xff */
+  for (i=0; i < column; i++) {
+    pflash_oob_enable(10);
+    adj_offset = getAdjOffset(to-column+i);
+    PFLASH_WRITE_8(adj_offset, 0xff);
+    /* printk(KERN_INFO "oobwrite: 0x%x -> 0x%x\n", 
+              0xff, adj_offset); 
+    */
+  }
+
+  /* Write data into buffer */
+  for (i=0; i < len; i++) {
+    pflash_oob_enable(10);
+    adj_offset = getAdjOffset(to+i);
+    PFLASH_WRITE_8(adj_offset, buf[i]);
+    /* printk(KERN_INFO "oobwrite: 0x%x -> 0x%x\n", 
+              buf[i], adj_offset); 
+    */
+  }
+
+  /* Postpad with 0xff */
+  for (i=0; i < mtd->oobsize - (len + column); i++) {
+    pflash_oob_enable(10);
+    adj_offset = getAdjOffset(to+column+i);
+    PFLASH_WRITE_8(adj_offset, 0xff);
+    /* printk(KERN_INFO "oobwrite: 0x%x -> 0x%x\n", 
+       0xff, adj_offset); 
+    */
+  }
+  pflashClearStateMachine();
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+  /*
+   * The NAND device assumes that it is always writing to
+   * a cleanly erased page. Hence, it performs its internal
+   * write verification only on bits that transitioned from
+   * 1 to 0. The device does NOT verify the whole page on a
+   * byte by byte basis. It is possible that the page was
+   * not completely erased or the page is becoming unusable
+   * due to wear. The read with ECC would catch the error
+   * later when the ECC page check fails, but we would rather
+   * catch it early in the page write stage. Better to write
+   * no data than invalid data.
+   */
+
+  DEBUG ( MTD_DEBUG_LEVEL3,
+	  "NAND_VERIFY_WRITE - col=0x%x, len=0x%x\n",
+	  column, len );
+  /* Loop through and verify the data. */
+  for (i=0 ; i < len ; i++) {
+    unsigned char read;
+    pflash_oob_enable(10);
+    adj_offset = to+i;
+    read = PFLASH_READ_8(adj_offset);
+    if (buf[i] != read) {
+      DEBUG (MTD_DEBUG_LEVEL0,
+	     "nand_write_oob: "
+	     "Failed write verify, page 0x%08x, "
+	     "Wrote %x, got %x, "
+	     "%6i bytes were succesful\n",
+	     page, buf[i], read, i);
+
+      spin_lock_bh (&this->chip_lock);
+      this->state = FL_READY;
+      wake_up (&this->wq);
+      spin_unlock_bh (&this->chip_lock);
+      *retlen = i;
+      return -EIO;
+    }
+  }
+  pflashClearStateMachine();
+
+#endif
+
+
+  /* Wake up anyone waiting on the device */
+  spin_lock_bh (&this->chip_lock);
+  this->state = FL_READY;
+  wake_up (&this->wq);
+  spin_unlock_bh (&this->chip_lock);
+
+  /* Return OK */
+  *retlen = len;
+  return 0;
+
+}
+
+/*
+ * NAND erase a block, do not erase special and invalid blocks which marked as
+ * non-zero values in IBTs.
+ */
+static int nand_erase (struct mtd_info *mtd,
+		       struct erase_info *instr)
+{
+
+  int page, len, status, pages_per_block,ret;
+  struct nand_chip *this = mtd->priv;
+  CHIP_SEL   erase_cs;
+  uint32_t   start_addr, pflash_be_num, pflash_be_addr;
+  uint32_t   trial_num = 10;
+  u_char marker;
+
+
+  DECLARE_WAITQUEUE(wait, current);
+
+  DEBUG (MTD_DEBUG_LEVEL2,
+	 "nand_erase: start = 0x%08x, len = %i\n",
+	 (unsigned int) instr->addr, (unsigned int) instr->len);
+
+  /* Start address must align on block boundary */
+  if (instr->addr & (mtd->erasesize - 1)) {
+    DEBUG (MTD_DEBUG_LEVEL0,
+	   "nand_erase: Unaligned address\n");
+    return -EINVAL;
+  }
+
+  /* Length must align on block boundary */
+  if (instr->len & (mtd->erasesize - 1)) {
+    DEBUG (MTD_DEBUG_LEVEL0,
+	   "nand_erase: Length not block aligned\n");
+    return -EINVAL;
+  }
+
+  /* Do not allow erase past end of device */
+  if ((instr->len + instr->addr) > mtd->size) {
+    DEBUG (MTD_DEBUG_LEVEL0,
+	   "nand_erase: Erase past end of device\n");
+    return -EINVAL;
+  }
+
+retry:
+  /* Grab the lock and see if the device is available */
+  spin_lock_bh (&this->chip_lock);
+
+  switch (this->state) {
+  case FL_READY:
+    this->state = FL_ERASING;
+    break;
+
+  default:
+    set_current_state (TASK_UNINTERRUPTIBLE);
+    add_wait_queue (&this->wq, &wait);
+    spin_unlock_bh (&this->chip_lock);
+    schedule();
+
+    remove_wait_queue (&this->wq, &wait);
+    goto retry;
+  };
+
+  /* Shift to get first page */
+  page = (int) (instr->addr >> this->page_shift);
+
+  /* Calculate pages in each block */
+  pages_per_block = mtd->erasesize / mtd->oobblock;
+
+
+  /* Loop through the pages */
+  len = instr->len;
+  start_addr = instr->addr;
+  pflashClearStateMachine();
+
+  instr->state = MTD_ERASING;
+  while (len) {
+    if ( start_addr < PFLASH_NAND_CS1_OFFSET )
+      erase_cs = CS0;
+    else
+      erase_cs = CS1;
+
+#ifdef CONFIG_STW5X226_NAN
+    erase_cs = CS1;
+#endif
+
+    /* erase the blocks, ATI's state-machine mode */
+    pflash_be_addr = start_addr >>
+      PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT;
+    pflash_be_num = pflash_be_addr >>
+      STW_NAND_BLOCK_NUM_SHIFT;
+
+    DEBUG (MTD_DEBUG_LEVEL3,
+	   "pflash_be_addr: %x pflash_be_num: %x erase_cs: %x\n",
+	   pflash_be_addr, pflash_be_num, erase_cs);
+
+    /* Add bad block checking here, do not erase it
+       if a special and invalid block detected.
+    */
+#ifndef CONFIG_NAND_BAD_BLOCK_CHECK
+    pflash_oob_enable(10);
+    marker = PFLASH_READ_8(start_addr+SPARE_AREA_VALID_BLOCK_OFFSET);
+    pflashClearStateMachine();
+    if (marker == 0xff)
+#else
+    if (pflashIsBlockInvalid(erase_cs, pflash_be_num, 0) == 0 )
+#endif
+    {
+      /* set the address */
+      SETFLD_REGMM32(PFLASH_BE_ADDR,BLOCK_ERASE_ADDR, pflash_be_addr);
+      /* trigger the block erase */
+      SETFLD_REGMM32(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_BLOCK_ERASE); 
+      status = pflashWaitCMDTriggerDone();
+      
+      /* 
+	 check erase failure
+      */
+      if(status == PFLASH_OK) {
+	while(GETFLD_REGMM32(PFLASH_STATUS, BLOCK_ERASE_DONE) == 0) {
+	  udelay(1000);
+	  if (--trial_num == 0) {
+	    printk(KERN_WARNING "timeout waiting for BLOCK_ERASE_DONE\n");
+#ifndef CONFIG_NAND_BAD_BLOCK_CHECK
+	    /*
+	       marking this block invalid in IBTs for block relpacement
+	    */
+	    if (pflashSetBlockInvalid(erase_cs, pflash_be_num)) {
+	      printk(KERN_ERR "set_block_invalid failed.\n");
+	    }
+#endif
+	    return(PFLASH_BLOCK_ERASE_NOT_DONE);
+	  }
+	}
+	status = pflashGetStatus(erase_cs);
+	SETFLD_REGMM32(PFLASH_STATUS, BLOCK_ERASE_DONE, 0x0);
+	pflashClearStateMachine();
+      }
+    }
+    else{
+      /* report invalid blocks for display purpose, do NOT erase it */
+      printk(KERN_INFO "...IB at: 0x%x(block: 0x%x)...\n",
+	     start_addr, pflash_be_num);
+    }
+
+    /* Increment page address and decrement length */
+    len -= mtd->erasesize;
+    /* increment to next block */
+    start_addr += mtd->erasesize;
+    page += pages_per_block;
+
+    /* Release the spin lock */
+    spin_unlock_bh (&this->chip_lock);
+
+  erase_retry:
+    /* Check the state and sleep if it changed */
+    spin_lock_bh (&this->chip_lock);
+    if (this->state == FL_ERASING) {
+      continue;
+    }
+    else {
+      set_current_state (TASK_UNINTERRUPTIBLE);
+      add_wait_queue (&this->wq, &wait);
+      spin_unlock_bh (&this->chip_lock);
+      schedule();
+
+      remove_wait_queue (&this->wq, &wait);
+      goto erase_retry;
+    }
+  }
+  instr->state = MTD_ERASE_DONE;
+  spin_unlock_bh (&this->chip_lock);
+
+  ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;;
+  /* Do call back function */
+  if (!ret && instr->callback)
+    instr->callback (instr);
+
+	/* The device is ready */
+  spin_lock_bh (&this->chip_lock);
+  this->state = FL_READY;
+  spin_unlock_bh (&this->chip_lock);
+
+  /* Return OK */
+  return ret;
+}
+
+/*
+ * NAND sync
+ */
+static void nand_sync (struct mtd_info *mtd)
+{
+  struct nand_chip *this = mtd->priv;
+  DECLARE_WAITQUEUE(wait, current);
+
+  DEBUG (MTD_DEBUG_LEVEL3, "nand_sync: called\n");
+
+retry:
+  /* Grab the spinlock */
+  spin_lock_bh(&this->chip_lock);
+
+  /* See what's going on */
+  switch(this->state) {
+  case FL_READY:
+  case FL_SYNCING:
+    this->state = FL_SYNCING;
+    spin_unlock_bh (&this->chip_lock);
+    break;
+
+  default:
+    /* Not an idle state */
+    add_wait_queue (&this->wq, &wait);
+    spin_unlock_bh (&this->chip_lock);
+    schedule ();
+
+    remove_wait_queue (&this->wq, &wait);
+    goto retry;
+  }
+
+  /* Lock the device */
+  spin_lock_bh (&this->chip_lock);
+
+  /* Set the device to be ready again */
+  if (this->state == FL_SYNCING) {
+    this->state = FL_READY;
+    wake_up (&this->wq);
+  }
+
+  /* Unlock the device */
+  spin_unlock_bh (&this->chip_lock);
+
+}
+
+
+/*
+ * Scan for the NAND devices using ATI's state machine implementation.
+ */
+int nand_scan (struct mtd_info *mtd, int maxchips)
+{
+  int i, id, nand_maf_id, nand_dev_id;
+  struct nand_chip *this = mtd->priv;
+
+
+  /* Send the command for reading device ID */
+#ifdef CONFIG_STW5X226
+#ifdef CONFIG_STW5X226_NAN
+  nand_command (mtd, NAND_CMD_READID, 0x00, -1, CS1, 0);
+#else
+  nand_command (mtd, NAND_CMD_READID, 0x00, -1, CS0, 0);
+#endif
+#else
+  nand_command (mtd, NAND_CMD_READID, 0x00, -1, CS0, 0);
+#endif
+
+  id = GETFLD_REGMM32(PFLASH_ID_STAT_DATA, PF_ID_DATA);
+  SETFLD_REGMM32(PFLASH_STATUS, ID_READ_DONE, 0x0);
+  pflashClearStateMachine();
+  nand_maf_id = (id & 0xff);
+  nand_dev_id = (id >> 8);
+
+  /* Read manufacturer and device IDs */
+  /*
+    printk("NAND ChipID: %x  %x  %x\n", id, nand_maf_id, nand_dev_id);
+    printk("NAND ChipId: %x ChipId String: %s\n",
+    pflash_get_chipID(0,10), pflash_get_chipID_string(0));
+    id = pflash_get_chipID(0, 10);
+    nand_maf_id = (id & 0xff);
+    nand_dev_id = (id >> 8);
+  */
+
+	/* Print and store flash device information */
+
+  for (i = 0; nand_flash_ids[i].name != NULL; i++) {
+    if (nand_dev_id == nand_flash_ids[i].id && !mtd->size) {
+      mtd->name = nand_flash_ids[i].name;
+      mtd->erasesize = nand_flash_ids[i].erasesize;
+      mtd->size = 2 * (1 << nand_flash_ids[i].chipshift);
+      mtd->eccsize = 256;
+      this->chipshift = nand_flash_ids[i].chipshift;
+      if (nand_flash_ids[i].page256) {
+	mtd->oobblock = 256;
+	mtd->oobsize = 8;
+	this->page_shift = 8;
+      } else {
+	mtd->oobblock = 512;
+	mtd->oobsize = 16;
+	this->page_shift = 9;
+      }
+      /* Try to identify manufacturer */
+      for (i = 0; nand_manuf_ids[i].id != 0x0; i++) {
+	if (nand_manuf_ids[i].id == nand_maf_id)
+	  break;
+      }
+      printk (KERN_INFO "NAND device: Manufacturer ID:"
+      " 0x%02x, Chip ID: 0x%02x (%s %s)\n", nand_maf_id, nand_dev_id,
+      nand_manuf_ids[i].name , mtd->name);
+      break;
+    }
+  }
+
+
+  /* Initialize state and spinlock */
+  this->state = FL_READY;
+  init_waitqueue_head(&this->wq);
+  spin_lock_init(&this->chip_lock);
+
+  /* Print warning message for no device */
+  if (!mtd->size) {
+    printk (KERN_WARNING "No NAND device found!!!\n");
+    return 1;
+  }
+
+  /* Fill in remaining MTD driver data */
+  mtd->type = MTD_NANDFLASH;
+  mtd->flags = MTD_CAP_NANDFLASH | MTD_ECC;
+  mtd->ecctype = MTD_ECC_SW;
+  mtd->erase = nand_erase;
+  mtd->point = NULL;
+  mtd->unpoint = NULL;
+  mtd->read = nand_read;
+  mtd->write = nand_write;
+  mtd->read_ecc = nand_read_ecc;
+  mtd->write_ecc = nand_write_ecc;
+  mtd->read_oob = nand_read_oob;
+  mtd->write_oob = nand_write_oob;
+  mtd->sync = nand_sync;
+  mtd->readv = NULL;
+  mtd->writev = nand_writev;
+  mtd->writev_ecc = mtd_fake_writev_ecc;
+  mtd->lock = NULL;
+  mtd->unlock = NULL;
+  mtd->suspend = NULL;
+  mtd->resume = NULL;
+
+  return 0;
+}
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+static uint32_t stw_nand_block_map(uint32_t *offset)
+{
+  uint32_t  loc_adj_off;
+
+  /* check if offset adjust is needed */
+  lb_num = (*offset) >> BLOCK_NUM_TOTAL_SHIFT;
+  if ( nand_logic_block[lb_num] < lb_num ) {
+    printk(KERN_WARNING "block mapping failed!\n");
+    return -EINVAL;
+  }
+  else {
+    loc_adj_off = (*offset) +
+      ( ( nand_logic_block[lb_num]-lb_num ) << BLOCK_NUM_TOTAL_SHIFT );
+  }
+
+  /* for debugging purpose */
+  /*
+  printk(KERN_INFO "offset: 0x%x adj_off: 0x%x lblock: 0x%x pblock: 0x%x\n",
+	 *offset, loc_adj_off, lb_num, nand_logic_block[lb_num] );
+	 */
+
+  return loc_adj_off;
+
+}
+#endif
+EXPORT_SYMBOL(nand_scan);
+
+
+
+
+
+
+
+
+
+
diff -Nu head.orig/drivers/mtd/nand/stw_nand_init.c head/drivers/mtd/nand/stw_nand_init.c
--- head.orig/drivers/mtd/nand/stw_nand_init.c	1969-12-31 16:00:00.000000000 -0800
+++ head/drivers/mtd/nand/stw_nand_init.c	2003-09-23 10:44:06.000000000 -0700
@@ -0,0 +1,333 @@
+/*
+  Copyright (C) 2003  Chin Zhou (czhou@ati.com), ATI Technologies Inc.
+
+  Copyright (C) 2003, Metro Link, Inc., All rights reserved
+
+  This program is free software; you can redistribute it and/or
+  modify it under the terms of the GNU General Public License
+  as published by the Free Software Foundation; version 2
+  of the License, June 1991.
+
+  This program is distributed in the hope that it will be useful,
+  but WITHOUT ANY WARRANTY; without even the implied warranty of
+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+  GNU General Public License for more details.
+
+  You should have received a copy of the GNU General Public License
+  along with this program; if not, write to the Free Software
+  Foundation, Inc., 59 Temple Place - Suite 330, Boston, 
+  MA  02111-1307, USA.
+*/
+
+/*
+ *  drivers/mtd/nand/stw_nand_init.c
+ *
+ *  Descriptions:
+ *
+ *  An initialization module for the MTD NAND flash device which is used 
+ *  on the ATI STW systems.  This driver is based on ATI's specific
+ *  NAND/PFLASH controller state machine, and provide basic interface 
+ *  between the device specific layer and standard MTD-NAND layer. 
+ *
+ */
+
+/*
+ * Support for NAND flash modules on ATI Xilleon Set Top Wonder
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+#include <linux/interrupt.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/ioport.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/ati/xilleon.h>
+#include <asm/ati/stw_flash.h>
+
+#ifdef CONFIG_MTD_NAND_ECC
+#include <linux/mtd/nand_ecc.h>
+#endif
+
+#define NAND_FLASH_FS_TEST
+
+extern void dump_mtd_info(struct mtd_info *mtd);
+extern void dump_nand_chip_info(struct nand_chip *this);
+extern int pflashReadInvalidBlockTable(void);
+extern void stw_flashinfo (int *flashsize, int *default_num);
+
+/* STW NAND flash related */
+
+#ifdef CONFIG_STW5X226_NAN
+#define NUM_PARTITIONS           3
+#else
+#define NUM_PARTITIONS           5
+#endif
+
+#define NAND_ROOT_FS_OFFSET      4*1024*1024
+#define NAND_ROOT_FS_SIZE        8*1024*1024
+
+#define NAND_STW_OFFSET          0
+#define NAND_STW_SIZE            2*16*1024*1024
+
+
+/* MTD structure for STW */
+static struct mtd_info *stw_nand_mtd = NULL;
+
+/*
+ * Define partitions for flash device, need to be block-aligned
+ */
+const static struct mtd_partition partition_info[] = {
+#if defined (NAND_FLASH_FS_TEST)
+        { name: "MTD NAND partition 0",
+	  offset: 2*16*1024,
+	  size: (2*1024*1024-2*16*1024)},
+	{ name: "MTD NAND partition 1 - root FS1",
+	  offset: 2*1024*1024,
+	  size: 4*1024*1024},
+	{ name: "MTD NAND partition 2 - root FS2",
+	  offset: 6*1024*1024,
+	  size: 4*1024*1024 },
+	{ name: "MTD NAND partition 3",
+	  offset: 29*1024*1024,
+	  size: (2*1024*1024 - (16*1024))},
+	{ name: "MTD NAND partition 4",
+	  offset: (31*1024*1024 - (16*1024)),
+	  size: 16*1024 }
+#else
+#ifdef CONFIG_STW5X226_NAN
+        { name: "MTD NAND partition 0",
+          offset: (16*1024*1024+2*16*1024),
+          size: (2*1024*1024-2*16*1024)},
+        { name: "MTD NAND partition 1",
+	  offset: (16*1024*1024+2*1024*1024),
+	  size: 2*1024*1024},
+	{ name: "MTD NAND partition 2 - root FS",
+	  offset: (16*1024*1024+NAND_ROOT_FS_OFFSET),
+	  size: NAND_ROOT_FS_SIZE }
+#else
+	{ name: "MTD NAND partition 0",
+	  offset: 2*16*1024,
+	  size: (2*1024*1024-2*16*1024)},
+	{ name: "MTD NAND partition 1",
+	  offset: 2*1024*1024,
+	  size: 2*1024*1024},
+	{ name: "MTD NAND partition 2 - root FS",
+	  offset: NAND_ROOT_FS_OFFSET,
+	  size: NAND_ROOT_FS_SIZE },
+	{ name: "MTD NAND partition 3",
+	  offset: 29*1024*1024,
+	  size: (2*1024*1024 - (16*1024))},
+	{ name: "MTD NAND partition 4",
+	  offset: (31*1024*1024 - (16*1024)),
+	  size: 16*1024 }
+#endif
+#endif
+};
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+/* start block 0 */
+uint32_t nand_logic_block[2*STW_MAX_NUM_BLOCKS];
+uint8_t  nand_phy_block[2*STW_MAX_NUM_BLOCKS];
+#endif
+
+/*
+ * Main initialization routine
+ */
+int __init stw_nand_init (void)
+{
+
+  struct nand_chip *this;
+  uint32_t stw_bb=0, bi, lcount, gcount, nb;
+  uint32_t pf_block_start, pf_block_end;
+  uint8_t  np;
+
+  u32 flashsize, defnum;
+
+  printk(KERN_INFO "STW NAND Flash initializing...\n");
+
+  /* Allocate memory for MTD device structure and private data */
+  stw_nand_mtd = kmalloc (sizeof(struct mtd_info) 
+			 + sizeof (struct nand_chip), GFP_KERNEL);
+  if (!stw_nand_mtd) {
+    printk ("Unable to allocate memory for NAND MTD.\n");
+    return -ENOMEM;
+  }
+
+  /* Get pointer to private data */
+  this = (struct nand_chip *) (&stw_nand_mtd[1]);
+
+  /* Initialize structures */
+  memset((char *) stw_nand_mtd, 0, sizeof(struct mtd_info));
+  memset((char *) this, 0, sizeof(struct nand_chip));
+
+  /* Link the private data with the MTD structure */
+  stw_nand_mtd->priv = this;
+
+#ifdef CONFIG_STW5X226
+  stw_flashinfo(&flashsize, &defnum);
+  pflashInit();
+#endif
+
+#ifdef CONFIG_STW4X225
+  pflashInit();
+#endif
+
+  /* Scan to find existance of the device */
+  if (nand_scan (stw_nand_mtd, 2)) {
+    kfree (stw_nand_mtd);
+    return -ENXIO;
+  }
+
+  /* for debug purpose */
+  dump_mtd_info(stw_nand_mtd);
+  dump_nand_chip_info(this);
+
+  /* Allocate memory for internal data buffer */
+  this->data_buf = kmalloc (sizeof(u_char) * 
+			    (stw_nand_mtd->oobblock + stw_nand_mtd->oobsize), 
+			    GFP_KERNEL);
+  if (!this->data_buf) {
+    printk ("Unable to allocate NAND data buffer for STW.\n");
+    kfree (stw_nand_mtd);
+    return -ENOMEM;
+  }
+
+
+#ifdef CONFIG_NAND_BAD_BLOCK_CHECK
+  /* 
+     Create logical and physical blocks mapping table to make sure 
+     the logical blocks used by the root file system are always good.
+     
+     NOTES: IBTs are created, check the block magic number, and IBTs
+     before erasing any blocks. Make sure do not erase invalid and 
+     special blocks/
+
+  */
+
+  /* Read IBTs, the tables should be created by MMON or EJTAG program */
+  if (pflashReadInvalidBlockTable()){
+    printk(KERN_WARNING "stw_nand_init - IBT not found.\n"); 
+  }
+  
+  /* detect special and bad blocks, using IBTs */
+  printk(KERN_INFO "Creating logical block table...\n");
+  for (bi=0; bi<STW_MAX_NUM_BLOCKS; bi++) {
+    /* check attributes of the block */
+    if ( pflashIsBlockInvalid(CS0, bi, 0) == 0 ) {
+      nand_phy_block[bi] = PFLASH_VALID_BLOCK_VALUE;
+    }
+    else {
+      /* printk(KERN_INFO "Special or invalid block detected - cs: %x block: 0x%x.\n",
+	 CS0, bi); */
+      nand_phy_block[bi] = PFLASH_INVALID_BLOCK_VALUE;
+    }
+
+    if ( pflashIsBlockInvalid(CS1, bi, 0) == 0 ) {
+      nand_phy_block[bi+STW_MAX_NUM_BLOCKS] = PFLASH_VALID_BLOCK_VALUE;
+    }
+    else {
+      /* printk(KERN_INFO "Special or invalid block detected - cs: %x block: 0x%x.\n",
+	 CS1, bi);*/
+      nand_phy_block[bi+STW_MAX_NUM_BLOCKS] = PFLASH_INVALID_BLOCK_VALUE;
+    }
+  }
+  
+  /* then, create the logical - valid physical block mapping table */
+  /*
+  fs_block_start = (NAND_ROOT_FS_OFFSET >> BLOCK_NUM_TOTAL_SHIFT);
+  fs_block_end = fs_block_start + 
+                   (NAND_ROOT_FS_SIZE >> BLOCK_NUM_TOTAL_SHIFT);
+  */
+
+  pf_block_start = (NAND_STW_OFFSET >> BLOCK_NUM_TOTAL_SHIFT);
+  pf_block_end = pf_block_start + 
+                   (NAND_STW_SIZE >> BLOCK_NUM_TOTAL_SHIFT);
+
+  /* printk(KERN_INFO "Block_start: 0x%x block end: 0x%x\n", 
+     pf_block_start, pf_block_end); */
+
+  for ( lcount = 0; lcount < 2*STW_MAX_NUM_BLOCKS; lcount++ ){
+    nand_logic_block[lcount]=lcount;
+  }
+
+  stw_bb = 0;
+  gcount = 0;
+  for ( lcount = pf_block_start; lcount < pf_block_end; lcount++ ) {
+    if ( (lcount+stw_bb) >= 2*STW_MAX_NUM_BLOCKS ) {
+      printk(KERN_INFO "Reach the capacity of valid blocks (total: 0x%3x).\n", lcount);
+      break;
+    }
+    if ( nand_phy_block[lcount] == PFLASH_VALID_BLOCK_VALUE ) {
+      nand_logic_block[gcount] = lcount;
+      gcount++;
+    }
+    else {
+      stw_bb++;
+      /* printk(KERN_INFO "Special or invalid physical block: 0x%3x, total: 0x%x\n", 
+	 lcount, stw_bb); */
+    }
+  }
+
+  for (np=0; np<NUM_PARTITIONS; np++) {
+    nb = (partition_info[np].offset >> BLOCK_NUM_TOTAL_SHIFT);
+    printk(KERN_INFO "NAND partition %x logical block: 0x%3x physical block: 0x%3x\n", 
+	   np, nb, nand_logic_block[nb]);
+  }
+
+  printk(KERN_INFO "Creating logical block table done.\n");
+#endif
+
+
+  /* Register the partitions */
+  add_mtd_partitions(stw_nand_mtd, 
+		     (struct mtd_partition*) partition_info, 
+		     (int)NUM_PARTITIONS);
+
+  printk(KERN_INFO "STW NAND Flash devices initialization done.\n");
+	
+  /* Return OK */
+  return 0;
+
+}
+module_init(stw_nand_init);
+
+/*
+ * Clean up routine
+ */
+#ifdef MODULE
+static void __exit stw_nand_cleanup (void)
+{
+
+  struct nand_chip *this = (struct nand_chip *) &stw_nand_mtd[1];
+
+  /* Unregister the device */
+  del_mtd_device (stw_nand_mtd);
+  del_mtd_partitions(stw_nand_mtd);
+
+  /* Free internal data buffer */
+  kfree (this->data_buf);
+
+  /* Free the MTD device structure */
+  kfree (stw_nand_mtd);
+}
+module_exit(stw_nand_cleanup);
+#endif
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("czhou@ati.com");
+MODULE_DESCRIPTION("STW NAND flash device interface");
+
+
+
diff -Nu head.orig/include/asm-mips/ati/stw_flash.h head/include/asm-mips/ati/stw_flash.h
--- head.orig/include/asm-mips/ati/stw_flash.h	1969-12-31 16:00:00.000000000 -0800
+++ head/include/asm-mips/ati/stw_flash.h	2003-09-23 10:44:06.000000000 -0700
@@ -0,0 +1,251 @@
+#ifndef STW_FLASH_H
+#define STW_FLASH_H
+
+
+
+#define SPARE_AREA_L256_ECC0_OFFSET     0x0
+#define SPARE_AREA_L256_ECC1_OFFSET     0x1
+#define SPARE_AREA_L256_ECC2_OFFSET     0x2
+#define SPARE_AREA_U256_ECC0_OFFSET     0x3
+#define SPARE_AREA_VALID_BLOCK_OFFSET   0x5
+#define SPARE_AREA_U256_ECC1_OFFSET     0x6
+#define SPARE_AREA_U256_ECC2_OFFSET     0x7
+#define SPARE_AREA_VALID_BLOCK_VALUE    0xFF
+
+
+#define STW_MAX_NUM_BLOCKS              0x400
+#define STW_NAND_BLOCK_NUM_SHIFT        0x5
+#define BLOCK_NUM_TOTAL_SHIFT           (STW_NAND_BLOCK_NUM_SHIFT + \
+                                         PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT) 
+#define PFLASH_NAND_CS1_OFFSET          0x01000000
+
+
+
+
+/* NOR flash bases */
+#define NFLASH0_APER    0
+#define NFLASH0_BASE    0x00000000
+#define NFLASH1_APER    0
+#define NFLASH1_BASE    0x00400000
+
+
+
+
+/* The following portion is ported from ATI pmon pflash.h */
+
+
+#define  uint32   uint32_t
+#define  UINT32   uint32_t
+#define  int32    int32_t
+#define  uint8    uint8_t
+
+#define  GETFLD   GETFLD_REGMM32
+#define  SETFLD   SETFLD_REGMM32    
+#define  GETREG   GETREG_REGMM32
+#define  SETREG   SETREG_REGMM32
+
+#define  GETMEM_PFLASHMM8    GETMEM_PFLASH_8  
+#define  SETMEM_PFLASHMM8    SETMEM_PFLASH_8
+#define  GETMEM_PFLASHMM32   GETMEM_PFLASH_32
+#define  SETMEM_PFLASHMM32   SETMEM_PFLASH_32
+
+
+#define  GETMEM_SFLASHMM8    GETMEM_SFLASH_8
+#define  SETMEM_SFLASHMM8    SETMEM_SFLASH_8
+#define  GETMEM_SFLASHMM32   GETMEM_SFLASH_32
+
+#define  SETMEM_PCU0MM8
+#define  SETMEM_PCU1MM8
+#define  SETMEM_PCU2MM8
+#define  SETMEM_PCU3MM8
+#define  SETMEM_PCU4MM8
+#define  SETMEM_PCU5MM8
+
+#define  SETMEM_PCU0MM16
+#define  SETMEM_PCU1MM16
+#define  SETMEM_PCU2MM16
+#define  SETMEM_PCU3MM16
+#define  SETMEM_PCU4MM16
+#define  SETMEM_PCU5MM16
+
+#define  SETMEM_PCU0MM32
+#define  SETMEM_PCU1MM32
+#define  SETMEM_PCU2MM32
+#define  SETMEM_PCU3MM32
+#define  SETMEM_PCU4MM32
+#define  SETMEM_PCU5MM32
+
+
+#define  GETMEM_PCU0MM8
+#define  GETMEM_PCU1MM8
+#define  GETMEM_PCU2MM8
+#define  GETMEM_PCU3MM8
+#define  GETMEM_PCU4MM8
+#define  GETMEM_PCU5MM8
+
+#define  GETMEM_PCU0MM16
+#define  GETMEM_PCU1MM16
+#define  GETMEM_PCU2MM16
+#define  GETMEM_PCU3MM16
+#define  GETMEM_PCU4MM16
+#define  GETMEM_PCU5MM16
+
+#define  GETMEM_PCU0MM32
+#define  GETMEM_PCU1MM32
+#define  GETMEM_PCU2MM32
+#define  GETMEM_PCU3MM32
+#define  GETMEM_PCU4MM32
+#define  GETMEM_PCU5MM32
+
+
+#define PFF_ECC            (1<<0)
+#define PFF_VERIFY         (1<<1)
+#define PFF_ALLOW_ALL      (1<<2) /* debug only - will erase ibt */
+#define PFF_ALLOW_MB       (1<<3) /* internal only - will erase mb */
+#define PFF_ALLOW_IBT      (1<<4) /* internal only - will erase ibt */
+
+#define PFLASH_PAGE_SIZE    0x200
+#define PFLASH_VALID_BLOCK_VALUE        0xff
+#define PFLASH_INVALID_BLOCK_VALUE      0xbd
+
+
+/* flash numbers */
+#define NFLASH0_NUM              0
+#define NFLASH1_NUM              1
+#define PFLASH0_NUM              8
+#define PFLASH1_NUM              9
+#define SFLASH_NUM               10
+
+#define PFLASH0_MASK             (1<<PFLASH0_NUM)
+#define PFLASH1_MASK             (1<<PFLASH1_NUM)
+#define SFLASH_MASK              (1<<SFLASH_NUM)
+
+
+
+/************************************************************************/
+
+typedef enum
+{
+    CS0,
+    CS1,
+    CS_INVALID
+}
+CHIP_SEL;
+
+
+enum
+{
+    PFLASH_CMD_BLOCK_ERASE=1,
+    PFLASH_CMD_RESET=2,
+    PFLASH_CMD_READ_STATUS=3,
+    PFLASH_CMD_ID_READ =4,
+};
+
+
+enum
+{
+    PFLASH_OK=0,
+    PFLASH_NOT_FOUND,
+    PFLASH_TIME_OUT,
+    PFLASH_SEPROM_BUSY,
+    PFLASH_CMD_TRIG_BUSY,
+    PFLASH_ID_STAT_DATA_ERROR,
+    PFLASH_STATUS_ERROR,
+    PFLASH_BLOCK_ERASE_NOT_DONE,
+    PFLASH_RESET_NOT_DONE,
+    PFLASH_BLOCK_INVALID,
+    PFLASH_VERIFY_FAILED,
+    PFLASH_READY_BUSY_TRANSITION_MISSED,
+    PFLASH_IBT_NOT_FOUND,
+    PFLASH_LAST_ERROR
+};
+
+/************************************************************************/
+
+int pflashInit(void);
+int pflashGetPcuMode(void);
+uint32 pflashGetChipID(CHIP_SEL chipsel);
+uint32 pflashGetTotalBlocks(void);
+uint32 pflashGetTotalPages(void);
+uint32 pflashGetBlockSizeInBytes(void);
+uint32 pflashGetChipStartOffset(CHIP_SEL chipsel);
+uint32 pflashGetBlockStartOffset(CHIP_SEL chipsel, uint32 block);
+int pflashChipErase(CHIP_SEL chipsel, uint32 flags);
+int pflashChipWrite(CHIP_SEL chipsel, uint32 block_start, char *addr, uint32 size, uint32 flags);
+int pflashChipRead(CHIP_SEL chipsel, uint32 block_start, uint32 blocks, char *addr, uint32 flags);
+int pflashBlockErase(CHIP_SEL chipsel, uint32 block, uint32 flags);
+int pflashBlockEraseVerify(CHIP_SEL chipsel, uint32 block);
+int pflashBlockRead(CHIP_SEL chipsel, uint32 block, char *buffer, uint32 flags);
+int pflashBlockWrite(CHIP_SEL chipsel, uint32 block, char *buffer,  uint32 flags);
+int pflashBlockVerify(CHIP_SEL chipsel, uint32 block, char *buffer, uint32 flags);
+int pflashPageRead(CHIP_SEL chipsel, uint32 block, uint32 page, char *buffer, uint32 flags);
+int pflashPageWrite(CHIP_SEL chipsel, uint32 block, uint32 page, char *buffer, uint32 flags);
+int pflashPageVerify(CHIP_SEL chipsel, uint32 block, uint32 page, char *buffer, uint32 flags);
+int pflashWaitCMDTriggerDone(void);
+int pflashGetStatus(CHIP_SEL chipsel);
+int pflashClearStateMachine(void);
+char *pflashGetIdString(CHIP_SEL chipsel);
+uint32 pflashGetChipSize(CHIP_SEL chipsel);
+int pflashIsBlockInvalid(CHIP_SEL chipsel, uint32 block, uint32 flags);
+int pflashSetBlockInvalid(CHIP_SEL chipsel, uint32 block);
+int pflashAutoExec(void);
+int pflashSetAutoExec(char *command, uint32 *rblock);
+char *pflashGetAutoExec(uint32 *rblock);
+int pflashGetBufferSize(uint32 imagesize);
+
+
+int sflashInit(void);
+int sflashGetPcuMode(void);
+char *sflashGetIdString(void);
+int sflashGetChipSize(void);
+int sflashGetBlockSize(int block);
+int sflashGetTotalBlocks(void);
+int sflashGetBlockStartOffset(UINT32 block);
+int sflashChipErase(void);
+int sflashBlockErase(int block);
+int sflashBlockEraseVerify(uint32 block);
+int sflashChipWrite(uint32 block_start, char *addr, uint32 size);
+int sflashBlockWrite(uint32 block, char *data);
+int sflashBlockVerify(uint32 block, char *buffer);
+int sflashChipRead(uint32 block_start, char *addr, uint32 blocks);
+int sflashBlockRead(uint32 block, char *data);
+int sflashCheckIdleAndSoftReset(void);
+int sflashCheckStatusRegister(void);
+int sflashCheckWriteInProgress(uint32 timeout);
+void sflashReadEnableSequence(void);
+int sflashGetBufferSize(uint32 imagesize);
+
+
+
+#endif /* STW_FLASH_H */
diff -Nu head.orig/arch/mips/ati/xilleon/stw_flash.c head/arch/mips/ati/xilleon/stw_flash.c
--- head.orig/arch/mips/ati/xilleon/stw_flash.c	1969-12-31 16:00:00.000000000 -0800
+++ head/arch/mips/ati/xilleon/stw_flash.c	2003-09-23 10:44:06.000000000 -0700
@@ -0,0 +1,3423 @@
+/*
+ *  Module name: stw_flash.c
+ *
+ *  Descriptions:
+ *
+ *  This driver is ported from ATI pmon pflash.c, nflash.c, and sflash.c.
+ *
+ *  A hardware specific device (low-level) driver for the NAND, NOR, 
+ *  and serial flash devices.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/ioport.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/ati/xilleon.h>
+#include <asm/ati/stw_flash.h>
+
+#ifdef CONFIG_MTD_NAND_ECC
+#include <linux/mtd/nand_ecc.h>
+#endif
+
+
+/* NAND Flash */
+
+#ifndef PFLASH_DEFAULT_CMD_TRIGGER_TIMEOUT
+#define PFLASH_DEFAULT_CMD_TRIGGER_TIMEOUT 10
+#endif
+
+#ifndef PFLASH_DEFAULT_GET_STATUS_TIMEOUT
+#define PFLASH_DEFAULT_GET_STATUS_TIMEOUT 10
+#endif
+
+#ifndef PFLASH_DEFAULT_GET_CHIP_ID_TIMEOUT
+#define PFLASH_DEFAULT_GET_CHIP_ID_TIMEOUT 10
+#endif
+
+#ifndef PFLASH_DEFAULT_CLEAR_STATE_MACHINE_TIMEOUT
+#define PFLASH_DEFAULT_CLEAR_STATE_MACHINE_TIMEOUT 10
+#endif
+
+#ifndef PFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT
+#define PFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT 10
+#endif
+
+#ifndef FLASH_MS_TIMER_COUNT
+#define FLASH_MS_TIMER_COUNT 1000
+#endif
+
+
+
+/************************************************************************/
+
+#define SAMSUNG_ID          0xEC
+#define SAMSUNG_K9F6408Q0C  0x39
+#define SAMSUNG_K9F6408U0C  0xE6
+#define SAMSUNG_K9F6408U0B  0xE6
+#define SAMSUNG_K9F2808Q0C  0x33
+#define SAMSUNG_K9F2808U0C  0x73
+#define SAMSUNG_K9F2816Q0C  0x43
+#define SAMSUNG_K9F2816U0C  0x53
+#define SAMSUNG_K9F2808Q0B  0x33
+#define SAMSUNG_K9F2808U0B  0x73
+#define SAMSUNG_K9F5608Q0B  0x35
+#define SAMSUNG_K9F5608U0B  0x75
+#define SAMSUNG_K9F5616Q0B  0x45
+#define SAMSUNG_K9F5616U0B  0x55
+#define SAMSUNG_K9F5608U0A  0x75
+#define SAMSUNG_K9F1208Q0A  0x36
+#define SAMSUNG_K9F1208U0A  0x76
+#define SAMSUNG_K9F1216Q0A  0x46
+#define SAMSUNG_K9F1216U0A  0x56
+
+#define TOSHIBA_ID          0x98
+#define TOSHIBA_TC58V16BFT  0xEA
+#define TOSHIBA_TC58V32AFT  0xE5
+#define TOSHIBA_TC58V64AFT  0xE6
+#define TOSHIBA_TC58V64BFT  0xE6
+#define TOSHIBA_TC58128FT   0x73
+#define TOSHIBA_TC58128AFT  0x73
+#define TOSHIBA_TC58256FT   0x75
+#define TOSHIBA_TC58256AFT  0x75
+#define TOSHIBA_TH58512FT   0x76
+#define TOSHIBA_TH58100FT   0x79
+
+#define AMD_ID              0x01
+#define AMD_AM30LV0064D     0xE6
+
+#define PFLASH_CMD_TRIGGER_BLOCK_ERASE  0x1
+#define PFLASH_CMD_TRIGGER_STATUS_RESET 0x2
+#define PFLASH_CMD_TRIGGER_STATUS_READ  0x3
+#define PFLASH_CMD_TRIGGER_ID_READ      0x4
+
+#define SPARE_AREA_ECC0_L_OFFSET       0x0
+#define SPARE_AREA_ECC1_L_OFFSET       0x1
+#define SPARE_AREA_ECC2_L_OFFSET       0x2
+#define SPARE_AREA_ECC0_U_OFFSET       0x3
+#define SPARE_AREA_VALID_BLOCK_OFFSET  0x5
+#define SPARE_AREA_ECC1_U_OFFSET       0x6
+#define SPARE_AREA_ECC2_U_OFFSET       0x7
+
+#define SPARE_AREA_VALID_BLOCK_VALUE   0xFF
+
+#define IBT_GOOD_BLOCK          0x00000000
+#define IBT_FACTORY_BAD_BLOCK   0x000000FF
+#define IBT_DETECTED_BAD_BLOCK  0x0000FF00
+#define IBT_TABLE_0_BLOCK       0x00FF0000
+#define IBT_TABLE_1_BLOCK       0xFF000000
+#define IBT_MONITOR_BOOT_BLOCK  0xFFFF0000
+
+#define IBT_UNKNOWN_BLOCK  (-1)
+
+#define MAKE_MAGIC(a,b,c,d) (((a)<<0)|((b)<<8)|((c)<<16)|((d)<<24))
+
+#define MONITORBOOT_MAGIC  MAKE_MAGIC('M','O','N','0')
+
+#define MEG 0x100000
+
+/************************************************************************/
+
+/* NOR flash */
+
+#ifndef NFLASH_DEFAULT_WRITE_TIMEOUT
+#define NFLASH_DEFAULT_WRITE_TIMEOUT 1
+#endif
+
+#ifndef NFLASH_DEFAULT_CHIP_ERASE_TIMEOUT
+#define NFLASH_DEFAULT_CHIP_ERASE_TIMEOUT 15000
+#endif
+
+#ifndef NFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT
+#define NFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT 400
+#endif
+
+#define KILO     0x400
+
+#define NFF_CORE (1<<0)
+#define NFF_USER (1<<1)
+
+#define NFT_AT49xV16x4  0xC0
+#define NFT_AT49xV16x4T 0xC2
+#define NFT_AT49xV32x   0xC8
+#define NFT_AT49xV32xT  0xC9
+#define NFT_AT29LV320D  0xF9
+#define NFT_AT29LV320DT 0xF6
+#define NFT_AT29LV64xD  0x22D7
+
+
+static int nflashExists(uint32 aper, uint32 baseoffset);
+static int nflashWaitToComplete(uint32 aper, uint32 baseoffset, uint32 chipoffset, uint32 timeout);
+static int nflashWrite8(uint32 aper, uint32 baseoffset, uint32 chipoffset, uint32 value);
+static int nflashWrite16(uint32 aper, uint32 baseoffset, uint32 chipoffset, uint32 value);
+static uint32 nflashRead8(uint32 aper, uint32 baseoffset, uint32 chipoffset);
+static uint32 nflashRead16(uint32 aper, uint32 baseoffset, uint32 chipoffset);
+static uint32 nflashRead32(uint32 aper, uint32 baseoffset, uint32 chipoffset);
+
+
+/************************************************************************/
+
+/* Serial Flash */
+
+#ifndef SFLASH_DEFAULT_WRITE_TIMEOUT
+#define SFLASH_DEFAULT_WRITE_TIMEOUT 1
+#endif
+
+#ifndef SFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT
+#define SFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT 3000
+#endif
+
+#ifndef SFLASH_DEFAULT_CHIP_ERASE_TIMEOUT
+#define SFLASH_DEFAULT_CHIP_ERASE_TIMEOUT 6000
+#endif
+
+#ifndef SFLASH_DEFAULT_SOFT_RESET_TIMEOUT
+#define SFLASH_DEFAULT_SOFT_RESET_TIMEOUT 1
+#endif
+
+#ifndef SFLASH_DEFAULT_STATUS_TIMEOUT
+#define SFLASH_DEFAULT_STATUS_TIMEOUT 1
+#endif
+
+
+/************************************************************************/
+
+/* NAND flash */
+
+typedef struct
+{
+    uint32 magic;
+    uint32 checksum; // currently unused
+    uint32 timestamp;
+    uint32 table[2048];
+}
+IBT_DATA;
+
+/************************************************************************/
+
+
+#ifndef CONFIG_STW4X225
+uint32 sck_prescale;
+#endif
+
+static int sflash_exists;
+static int sflash_pcu_mode = PCU_MODE_SFLASH_SEPST10;
+
+static uint32 pflash_exists;
+static uint32 pflash_mask, flash_mask;
+static uint32 ibt_found;
+static int32 ibt_cs = CS_INVALID;
+static int32 ibt_block0 = IBT_UNKNOWN_BLOCK;
+static int32 ibt_block1 = IBT_UNKNOWN_BLOCK;
+static int pflash_pcu_mode = PCU_MODE_PFLASH_32MBIT;
+
+static char blockbuffer[16384];
+
+static union
+{
+char array[16384];
+IBT_DATA data;
+}
+ibt;
+
+/************************************************************************/
+
+static int pflashGetSpare8(uint32 offset, uint8 *data);
+static int pflashSetSpare8(uint32 offset, uint32 data);
+static int pflashIsBlockFactoryInvalid(CHIP_SEL chipsel, uint32 block);
+static int pflashFindInvalidBlockTable(void);
+static int pflashWriteInvalidBlockTables(void);
+static int pflashWriteInvalidBlockTable0(void);
+static int pflashWriteInvalidBlockTable1(void);
+static int pflashCreateInvalidBlockTable(void);
+
+int pflashReadInvalidBlockTable(void);
+
+/************************************************************************/
+
+int pflashInit(void)
+{
+    uint32 r;
+    uint32 size = 0;
+    uint32 size0 = 0;
+    uint32 size1 = 0;
+
+#ifdef CONFIG_STW5X226
+    pcuSetMode(PCU_MODE_PFLASH_32MBIT);
+#endif
+
+    // detect if pflash exists
+    pflash_mask = 0;
+    pflash_exists = (pflashClearStateMachine() == 0);
+
+    if(pflash_exists)
+    {
+        if(size1 = pflashGetChipSize(CS1))
+        {
+            size = size1;
+            ibt_cs = CS1;
+            pflash_mask |= (1<<PFLASH1_NUM);
+        }
+
+        if(size0 = pflashGetChipSize(CS0))
+        {
+            size = size0;
+            ibt_cs = CS0;
+            pflash_mask |= (1<<PFLASH0_NUM);
+        }
+
+
+
+	printk("pflash size: 0x%x  size0: 0x%x size1: 0x%x\n", size, size0, size1);
+
+        // reenable pflash registers for detected size chip
+        switch(size)
+        {
+        case 4*MEG:
+            pflash_pcu_mode = PCU_MODE_PFLASH_32MBIT;
+            r = GETREG_REGMM32(PFLASH_CNTL);
+            MODIFYFLD(r, PFLASH_CNTL, PF32MBIT_EN, 1);
+            MODIFYFLD(r, PFLASH_CNTL, PF64MBIT_EN, 0);
+            MODIFYFLD(r, PFLASH_CNTL, PF128MBIT_EN, 0); 
+            SETREG_REGMM32(PFLASH_CNTL, r); 
+            break;
+
+        case 8*MEG:
+            pflash_pcu_mode = PCU_MODE_PFLASH_64MBIT;
+            r = GETREG_REGMM32(PFLASH_CNTL);
+            MODIFYFLD(r, PFLASH_CNTL, PF32MBIT_EN, 0);
+            MODIFYFLD(r, PFLASH_CNTL, PF64MBIT_EN, 1);
+            MODIFYFLD(r, PFLASH_CNTL, PF128MBIT_EN, 0); 
+            SETREG_REGMM32(PFLASH_CNTL, r); 
+            break;
+
+        case 16*MEG:
+            pflash_pcu_mode = PCU_MODE_PFLASH_128MBIT;
+            r = GETREG_REGMM32(PFLASH_CNTL);
+            MODIFYFLD(r, PFLASH_CNTL, PF32MBIT_EN, 0);
+            MODIFYFLD(r, PFLASH_CNTL, PF64MBIT_EN, 0);
+            MODIFYFLD(r, PFLASH_CNTL, PF128MBIT_EN, 1); 
+            SETREG_REGMM32(PFLASH_CNTL, r); 
+            break;
+        }
+
+#ifdef CONFIG_STW5X226
+	pcuSetMode(pflashGetPcuMode());
+#endif
+
+        if(pflashFindInvalidBlockTable())
+        {
+	  printk("WARNING: pflashInit: pflash is disabled\n");
+	  return 0;
+        }
+    }
+
+    return pflash_mask;
+}
+
+/************************************************************************/
+
+int pflashGetPcuMode(void)
+{
+    return pflash_pcu_mode;
+}
+
+/************************************************************************/
+
+uint32 pflashGetTotalBlocks(void)
+{
+    if(pflash_exists)
+    {
+        if (GETFLD(PFLASH_CNTL,PF32MBIT_EN))
+        {
+            return 512;
+        }
+        else if (GETFLD(PFLASH_CNTL,PF64MBIT_EN))
+        {
+            return 1024;
+        }
+        else if (GETFLD(PFLASH_CNTL,PF128MBIT_EN))
+        {
+            return 1024;
+        }
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+uint32 pflashGetTotalPages(void)
+{
+    if(pflash_exists)
+    {
+        if (GETFLD(PFLASH_CNTL,PF32MBIT_EN))
+        {
+            return 16;
+        }
+        else if (GETFLD(PFLASH_CNTL,PF64MBIT_EN))
+        {
+            return 16;
+        }
+        else if (GETFLD(PFLASH_CNTL,PF128MBIT_EN))
+        {
+            return 32;
+        }
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+uint32 pflashGetBlockSizeInBytes(void)
+{
+    if(pflash_exists)
+    {
+        if (GETFLD(PFLASH_CNTL,PF32MBIT_EN))
+        {
+            return 8192;
+        }
+        else if (GETFLD(PFLASH_CNTL,PF64MBIT_EN))
+        {
+            return 8192;
+        }
+        else if (GETFLD(PFLASH_CNTL,PF128MBIT_EN))
+        {
+            return 16384;
+        }
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+uint32 pflashGetChipStartOffset(CHIP_SEL chipsel)
+{
+    if(pflash_exists)
+    {
+        if(chipsel == CS1)
+        {
+            if (GETFLD(PFLASH_CNTL,PF32MBIT_EN))
+            {
+                return 0x00400000;
+            }
+            else if (GETFLD(PFLASH_CNTL,PF64MBIT_EN))
+            {
+                return 0x00800000;
+            }
+            else if (GETFLD(PFLASH_CNTL,PF128MBIT_EN))
+            {
+                return 0x01000000;
+            }
+            else // some other device is selected in STRAPS_VALUE register
+            {
+                printk("\nERROR: pflashGetChipStartOffset: no pflash devices found\n");
+
+                return 0xFFFFFFFF; //error
+            }
+        }
+    }
+
+    return 0x00000000;
+}
+
+/************************************************************************/
+
+uint32 pflashGetBlockStartOffset(CHIP_SEL chipsel, uint32 block)
+{    
+    if(pflash_exists)
+    {
+        return pflashGetChipStartOffset(chipsel) + (block * pflashGetBlockSizeInBytes());
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int pflashChipErase(CHIP_SEL chipsel, uint32 flags)
+{
+    uint32 block;
+    uint32 blocks = pflashGetTotalBlocks();
+    int error = 0;
+
+    if((flags & PFF_ALLOW_ALL) || (pflashFindInvalidBlockTable() == 0))
+    {
+        for(block=0; block<blocks; block++)
+        {
+            if(pflashIsBlockInvalid(chipsel, block, flags) == 0)
+            {
+	      printk(".");
+
+                if(pflashBlockErase(chipsel, block, flags))
+                {
+                    printk("ERROR: pflashChipErase: unable to erase block %d\n", block);
+                    
+                    error = -1;
+                }
+                else
+                {
+                    if((flags & PFF_VERIFY) && pflashBlockEraseVerify(chipsel, block))
+                    {
+                        printk("ERROR: pflashChipErase: verify failed on block %d\n", block);
+
+                        error = -1;
+                    }
+                }
+            }
+            else
+            {
+	      printk("B");
+            }
+        }
+
+        printk("\n");
+    }
+
+    return error;
+}
+
+/************************************************************************/
+
+int pflashBlockErase(CHIP_SEL chipsel, uint32 block, uint32 flags)
+{
+    uint32 status=PFLASH_OK;
+    uint32 timeout;
+
+    if(pflash_exists)
+    {
+        if(pflashFindInvalidBlockTable() == 0)
+        {
+            if(pflashIsBlockInvalid(chipsel, block, flags))
+            {
+                printk("\nERROR: pflashBlockErase: attempt to erase invalid block %d\n", block);
+
+                return(PFLASH_BLOCK_INVALID);
+            }
+            else
+            {
+                pflashClearStateMachine();
+
+                // set the address
+                SETFLD(PFLASH_BE_ADDR,BLOCK_ERASE_ADDR, pflashGetBlockStartOffset(chipsel, block) >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT);
+                // trigger the block erase command
+                SETFLD(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_TRIGGER_BLOCK_ERASE);
+                // wait until done
+                status = pflashWaitCMDTriggerDone();
+
+                if(status == PFLASH_OK)
+                {
+                    timeout = PFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT * FLASH_MS_TIMER_COUNT;
+
+                    while(GETFLD(PFLASH_STATUS, BLOCK_ERASE_DONE) == 0)
+                    {
+                        if(--timeout == 0)
+                        {
+                            printk("\nERROR: pflashBlockErase: timeout waiting for BLOCK_ERASE_DONE on block %d\n", block);
+
+                            return(PFLASH_BLOCK_ERASE_NOT_DONE);
+                        }
+
+                        udelay(1000);
+                    }
+
+                    status = pflashGetStatus(chipsel);
+
+                    if(status)
+                    {
+                        printk("\nERROR: pflashBlockErase: bad status on block %d\n", block);
+                    }
+
+                    SETFLD(PFLASH_STATUS, BLOCK_ERASE_DONE, 0x0);
+
+                    pflashClearStateMachine();
+                }
+            }
+        }
+        else
+        {
+            printk("\nERROR: pflashBlockErase: invalid block table not found\n");
+
+            status= PFLASH_IBT_NOT_FOUND;
+        }
+    }
+
+    return(status);
+}
+
+/************************************************************************/
+
+int pflashBlockEraseVerify(CHIP_SEL chipsel, uint32 block)
+{
+    uint32 status=0;
+    uint32 offset;
+    uint32 blocksize;
+    uint32 chipoffset;
+    uint32 blockoffset;
+    uint32 actual;
+
+    if(pflash_exists)
+    {
+        chipoffset = pflashGetChipStartOffset(chipsel);
+        blocksize = pflashGetBlockSizeInBytes();
+        blockoffset = block * blocksize;
+
+        pflashClearStateMachine();
+
+        for(offset=0; offset<blocksize; offset+=4)
+        {
+            actual = GETMEM_PFLASHMM32(chipoffset + blockoffset + offset);
+
+            if(actual != 0xFFFFFFFF)
+            {
+                printk("\nERROR: pflashBlockEraseVerify: chip=%d, block=%d, offset=%d, actual=0x%08X\n", chipsel, block, offset, actual);
+
+                status = PFLASH_VERIFY_FAILED;
+                break;
+            }
+        }
+
+        pflashClearStateMachine();
+    }
+
+    return status;
+}
+
+/************************************************************************/
+
+int pflashPageRead(CHIP_SEL chipsel, uint32 block, uint32 page, char *buffer, uint32 flags)
+{
+    uint32 offset;
+    uint32 chipoffset;
+    uint32 blockoffset;
+    uint32 pageoffset;
+    uint32 blocksize;
+    uint32 *p = (uint32 *) buffer;
+#ifdef CONFIG_MTD_NAND_ECC
+    uint8 read_ecc[3];
+    uint8 calc_ecc[3];
+#endif
+
+    if(pflash_exists)
+    {
+        blocksize = pflashGetBlockSizeInBytes();
+        chipoffset = pflashGetChipStartOffset(chipsel);
+        blockoffset = block * blocksize;
+        pageoffset = page * PFLASH_PAGE_SIZE;
+
+        pflashClearStateMachine();
+
+        for(offset=0; offset<PFLASH_PAGE_SIZE; offset+=4)
+        {
+            *p++ = GETMEM_PFLASHMM32(chipoffset + blockoffset + pageoffset + offset);
+
+            //if (block < 4) {
+	    //if (page < 2) {
+	    //printk("chipoff=%08X, blockoff=%04X, pageoff=%04X, off=%04X, value=%08X\n", 
+	    //chipoffset, blockoffset, pageoffset, offset, *(p-1));
+	    //printk("KSEG1: 0x%x APER_PCU_BASE: 0x%x  PFLASH_BASE: 0x%x\n",
+	    //KSEG1, APER_PCU_BASE, PFLASH_BASE); 
+	    //}
+        }
+
+        pflashClearStateMachine();
+
+#ifdef CONFIG_MTD_NAND_ECC
+        if(flags & PFF_ECC)
+        {
+            // lower half of page
+            nand_calculate_ecc(NULL, buffer, calc_ecc);
+
+            pflashGetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC0_L_OFFSET, &read_ecc[0]);
+            pflashGetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC1_L_OFFSET, &read_ecc[1]);
+            pflashGetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC2_L_OFFSET, &read_ecc[2]);
+
+            //printk("\n[L] read_ecc = %02X %02X %02X    calc_ecc = %02X %02X %02X\n", read_ecc[0], read_ecc[1], read_ecc[2], calc_ecc[0], calc_ecc[1], calc_ecc[2]);
+
+            if(nand_correct_data(NULL, buffer, read_ecc, calc_ecc) == -1)
+            {
+                printk("\nERROR: pflashPageRead: ECC correction error: chip=%d, block=%d, page=%d (lower)\n", chipsel, block, page);
+
+                return -1;
+            }
+
+            // upper half of page
+            nand_calculate_ecc(NULL, buffer+(PFLASH_PAGE_SIZE/2), calc_ecc);
+
+            pflashGetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC0_U_OFFSET, &read_ecc[0]);
+            pflashGetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC1_U_OFFSET, &read_ecc[1]);
+            pflashGetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC2_U_OFFSET, &read_ecc[2]);
+
+            //printk("[U] read_ecc = %02X %02X %02X    calc_ecc = %02X %02X %02X\n", read_ecc[0], read_ecc[1], read_ecc[2], calc_ecc[0], calc_ecc[1], calc_ecc[2]);
+
+            if(nand_correct_data(NULL, buffer+(PFLASH_PAGE_SIZE/2), read_ecc, calc_ecc) == -1)
+            {
+                printk("\nERROR: pflashPageRead: ECC correction error: chip=%d, block=%d, page=%d (upper)\n", chipsel, block, page);
+
+                return -1;
+            }
+        }
+#endif
+
+        return 0;
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int pflashBlockRead(CHIP_SEL chipsel, uint32 block, char *buffer, uint32 flags)
+{
+    uint32 blocksize;
+    uint32 page;
+
+    if(pflash_exists)
+    {
+        blocksize = pflashGetBlockSizeInBytes();
+
+        for(page=0; page<(blocksize/PFLASH_PAGE_SIZE); page++)
+        {
+            if(pflashPageRead(chipsel, block, page, buffer, flags))
+            {
+                return -1;
+            }
+
+            buffer += PFLASH_PAGE_SIZE;
+        }
+
+        return 0;
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int pflashChipRead(CHIP_SEL chipsel, uint32 block_start, uint32 blocks, char *addr, uint32 flags)
+{
+    uint32 blocksize;
+    uint32 totalblocks;
+    uint32 block;
+    uint32 blocksremaining;
+
+    blocksize = pflashGetBlockSizeInBytes();
+    totalblocks = pflashGetTotalBlocks();
+    blocksremaining = blocks;
+
+    printk("Reading %d blocks starting at %d...\n", blocks, block_start);
+
+    for(block=block_start; blocksremaining && (block<totalblocks); block++)
+    {
+        if(pflashIsBlockInvalid(chipsel, block, 0))
+        {
+	  printk("B");
+        }
+        else
+        {
+	  printk(".");
+
+            if(pflashBlockRead(chipsel, block, addr, flags)) break;
+
+            addr += blocksize;
+            blocksremaining -= 1;
+        }
+    }
+
+    printk("\n%d blocks read.\n", blocks-blocksremaining);
+
+    return 0;
+}
+
+/************************************************************************/
+
+int pflashPageWrite(CHIP_SEL chipsel, uint32 block, uint32 page, char *buffer, uint32 flags)
+{
+    uint32 offset;
+    uint32 blocksize;
+    uint32 chipoffset;
+    uint32 pageoffset;
+    uint32 blockoffset;
+    uint32 status=0;
+#ifdef CONFIG_MTD_NAND_ECC
+    uint8 calc_ecc_lower[3];
+    uint8 calc_ecc_upper[3];
+#endif
+
+    if(pflash_exists)
+    {
+        if(!(flags & PFF_ALLOW_IBT))
+        {
+            if(pflashFindInvalidBlockTable() == 0)
+            {
+                if(pflashIsBlockInvalid(chipsel, block, flags))
+                {
+                    printk("\nERROR: pflashPageWrite: attempt to write to an invalid block\n");
+
+                    return -1;
+                }
+            }
+        }
+
+        chipoffset = pflashGetChipStartOffset(chipsel);
+        blocksize = pflashGetBlockSizeInBytes();
+        blockoffset = block * blocksize;
+        pageoffset = page * PFLASH_PAGE_SIZE;
+
+#ifdef CONFIG_MTD_NAND_ECC
+        if(flags & PFF_ECC)
+        {
+            nand_calculate_ecc(NULL, buffer, calc_ecc_lower);
+            nand_calculate_ecc(NULL, buffer+(PFLASH_PAGE_SIZE/2), calc_ecc_upper);
+        }
+#endif
+
+        pflashClearStateMachine();
+
+        for(offset=0; offset<PFLASH_PAGE_SIZE; offset+=4)
+        {
+            SETMEM_PFLASHMM32(chipoffset + blockoffset + pageoffset + offset, *((uint32 *)buffer)++);
+        }
+
+        status = pflashGetStatus(chipsel);
+
+        pflashClearStateMachine();
+
+#ifdef CONFIG_MTD_NAND_ECC
+        if(flags & PFF_ECC)
+        {
+            // update ecc
+            pflashSetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC0_L_OFFSET, calc_ecc_lower[0]);
+            pflashSetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC1_L_OFFSET, calc_ecc_lower[1]);
+            pflashSetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC2_L_OFFSET, calc_ecc_lower[2]);
+            pflashSetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC0_U_OFFSET, calc_ecc_upper[0]);
+            pflashSetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC1_U_OFFSET, calc_ecc_upper[1]);
+            pflashSetSpare8(chipoffset + blockoffset + pageoffset + SPARE_AREA_ECC2_U_OFFSET, calc_ecc_upper[2]);
+        }
+#endif
+    }
+
+    return status;
+}
+
+
+int pflashBlockWrite(CHIP_SEL chipsel, uint32 block, char *buffer, uint32 flags)
+{
+    uint32 blocksize;
+    uint32 page;
+
+    if(pflash_exists)
+    {
+        if(!(flags & PFF_ALLOW_IBT))
+        {
+            if(pflashFindInvalidBlockTable() == 0)
+            {
+                if(pflashIsBlockInvalid(chipsel, block, flags))
+                {
+                    printk("\nERROR: pflashBlockWrite: attempt to write to an invalid block\n");
+
+                    return -1;
+                }
+            }
+        }
+
+        blocksize = pflashGetBlockSizeInBytes();
+
+        for(page=0; page<(blocksize/PFLASH_PAGE_SIZE); page++)
+        {
+            if(pflashPageWrite(chipsel, block, page, buffer, flags))
+            {
+                return -1;
+            }
+
+            buffer += PFLASH_PAGE_SIZE;
+        }
+
+        return 0;
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int pflashChipWrite(CHIP_SEL chipsel, uint32 block_start, char *addr, uint32 size, uint32 flags)
+{
+    uint32 block;
+    uint32 blocks;
+    uint32 blocksize;
+    uint32 totalblocks;
+    uint32 blocksremaining;
+    char *p;
+
+    totalblocks = pflashGetTotalBlocks();
+    blocksize = pflashGetBlockSizeInBytes();
+    blocks = (size+blocksize-1) / blocksize;
+
+    printk("Erasing %d blocks starting at %d...\n", blocks, block_start);
+
+    blocksremaining = blocks;
+
+    for(block=block_start; blocksremaining && (block<totalblocks); block++)
+    {
+        if(pflashIsBlockInvalid(chipsel, block, 0))
+        {
+            printk("B"); 
+        }
+        else
+        {
+	  printk(".");
+
+            if(pflashBlockErase(chipsel, block, 0)) break;
+
+            blocksremaining -= 1;
+        }
+    }
+
+
+    printk("\n");
+    printk("Verifying %d blocks starting at %d...\n", blocks, block_start);
+
+    blocksremaining = blocks;
+
+    for(block=block_start; blocksremaining && (block<totalblocks); block++)
+    {
+        if(pflashIsBlockInvalid(chipsel, block, 0))
+        {
+	  printk("B");
+        }
+        else
+        {
+            if(pflashBlockEraseVerify(chipsel, block))
+            {
+	      printk("!");
+	      pflashSetBlockInvalid(chipsel, block);
+	      continue;
+            }
+            else
+            {
+	      printk(".");
+            }
+
+            blocksremaining -= 1;
+        }
+    }
+
+    printk("\n");
+    printk("Writing %d blocks starting at %d...\n", blocks, block_start);
+
+    blocksremaining = blocks;
+    p = addr;
+
+    for(block=block_start; blocksremaining && (block<totalblocks); block++)
+    {
+        if(pflashIsBlockInvalid(chipsel, block, 0))
+        {
+	  printk("B");
+        }
+        else
+        {
+	  printk(".");
+
+            if(pflashBlockWrite(chipsel, block, p, flags)) break;
+
+            p += blocksize;
+            blocksremaining -= 1;
+        }
+    }
+
+    printk("\n");
+    printk("Verifying %d blocks starting at %d...\n", blocks, block_start);
+
+    blocksremaining = blocks;
+    p = addr;
+
+    for(block=block_start; blocksremaining && (block<totalblocks); block++)
+    {
+        if(pflashIsBlockInvalid(chipsel, block, 0))
+        {
+	  printk("B");
+        }
+        else
+        {
+            if(pflashBlockVerify(chipsel, block, p, flags))
+            {
+	      printk("!");
+                pflashSetBlockInvalid(chipsel, block);
+
+                printk("\nERROR: pflashChipWrite: aborted\n");
+
+                return -1;
+            }
+            else
+            {
+	      printk(".");
+            }
+
+            p += blocksize;
+            blocksremaining -= 1;
+        }
+    }
+
+    printk("\n");
+    printk("%d blocks written.\n", blocks-blocksremaining);
+
+    return 0;
+}
+
+/************************************************************************/
+
+int pflashPageVerify(CHIP_SEL chipsel, uint32 block, uint32 page, char *buffer, uint32 flags)
+{
+    static char pagebuffer[PFLASH_PAGE_SIZE];
+    uint32 offset;
+    uint8 actual;
+    uint8 expected;
+    int error;
+
+    if(pflash_exists)
+    {
+        if((error = pflashPageRead(chipsel, block, page, pagebuffer, flags)))
+        {
+            return error;
+        }
+
+        for(offset=0; offset<PFLASH_PAGE_SIZE; offset++)
+        {
+            actual = pagebuffer[offset];
+            expected = buffer[offset];
+
+            if(actual != expected)
+            {
+                printk("\nERROR: pflashPageVerify: chip=%d, block=%d, page=%d, offset=%d, actual=0x%02X, expected=0x%02X\n", chipsel, block, page, offset, actual, expected);
+
+                return PFLASH_VERIFY_FAILED;
+            }
+        }
+
+        return 0;
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int pflashBlockVerify(CHIP_SEL chipsel, uint32 block, char *buffer, uint32 flags)
+{
+    uint32 blocksize;
+    uint32 page;
+    int error;
+
+    if(pflash_exists)
+    {
+        blocksize = pflashGetBlockSizeInBytes();
+
+        for(page=0; page<(blocksize/PFLASH_PAGE_SIZE); page++)
+        {
+            if((error = pflashPageVerify(chipsel, block, page, buffer, flags)))
+            {
+                return error;
+            }
+
+            buffer += PFLASH_PAGE_SIZE;
+        }
+
+        return 0;
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int pflashGetStatus(CHIP_SEL chipsel)
+{
+    uint32 status=PFLASH_OK;
+    uint32 timeout;
+
+    if(pflash_exists)
+    {
+        pflashClearStateMachine();
+
+        // set the address
+        SETFLD(PFLASH_BE_ADDR, BLOCK_ERASE_ADDR, pflashGetChipStartOffset(chipsel) >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT);
+        // trigger the status read command
+        SETFLD(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_TRIGGER_STATUS_READ);
+        // wait until complete
+        status = pflashWaitCMDTriggerDone();
+
+        if(status == PFLASH_OK)
+        {
+            timeout = PFLASH_DEFAULT_GET_STATUS_TIMEOUT * FLASH_MS_TIMER_COUNT;
+
+            while(!(GETFLD(PFLASH_STATUS, STATUS_RD_DONE)))
+            {
+                if(--timeout == 0)
+                {
+                    printk("\nERROR: pflashGetStatus: timeout waiting for STATUS_RD_DONE\n");
+
+                    return PFLASH_TIME_OUT;
+                }
+
+                udelay(1000);
+            }
+
+            if(status = GETFLD(PFLASH_STATUS, STATUS_ERROR))
+            {
+                printk("\nERROR: pflashGetStatus: PFLASH_STATUS=%08X\n", status);
+
+                SETFLD(PFLASH_STATUS, STATUS_ERROR, 0x0);
+
+                status = PFLASH_STATUS_ERROR;
+            }
+
+            SETFLD(PFLASH_STATUS, STATUS_RD_DONE, 0x0); // reset the done flag
+
+            pflashClearStateMachine();
+        }
+    }
+
+    return status;
+}
+
+/************************************************************************/
+
+int pflashClearStateMachine(void)
+{
+    uint32 data;
+    uint32 timeout;
+
+    timeout = PFLASH_DEFAULT_CLEAR_STATE_MACHINE_TIMEOUT * FLASH_MS_TIMER_COUNT;
+
+    // Wait for SEPROM_BUSY to go low
+    while(GETFLD(SFLASH_CNTL2_STATUS, SEPROM_BUSY))
+    {
+        if(--timeout == 0)
+        {
+            printk("\nERROR: pflashClearStateMachine: timeout waiting for SEPROM_BUSY\n");
+
+            return(PFLASH_SEPROM_BUSY);
+        }
+
+        udelay(1000);
+    }
+
+    // Clear The Read/Write cycle of state machine
+    data = GETREG(PFLASH_CNTL);
+    MODIFYFLD(data, PFLASH_CNTL, CMD_TRIG,    0);
+    MODIFYFLD(data, PFLASH_CNTL, READ_CYCLE,  0);
+    MODIFYFLD(data, PFLASH_CNTL, WRITE_CYCLE, 0);
+    MODIFYFLD(data, PFLASH_CNTL, SPARE_EN, 0);	
+    SETREG(PFLASH_CNTL, data);
+
+    // Clear the status
+    SETREG(PFLASH_STATUS, 0);
+
+    return 0;
+}
+
+/************************************************************************/
+
+int pflashWaitCMDTriggerDone(void)
+{
+    uint32 timeout;
+
+    if(pflash_exists)
+    {
+        timeout = PFLASH_DEFAULT_CMD_TRIGGER_TIMEOUT * FLASH_MS_TIMER_COUNT;
+
+        while(GETFLD(PFLASH_CNTL, CMD_TRIG) != 0)
+        {
+            if(--timeout == 0)
+            {
+                printk("\nERROR: pflashWaitCMDTriggerDone: timeout waiting for CMD_TRIG\n");
+
+                return(PFLASH_CMD_TRIG_BUSY);
+            }
+
+            udelay(1000);
+        }
+    }
+
+    return PFLASH_OK;
+}
+
+/************************************************************************/
+
+uint32 pflashGetChipID(CHIP_SEL chipsel)
+{
+    uint32 status = PFLASH_OK;
+    uint32 id = 0;
+    uint32 timeout;
+
+    if(pflash_exists)
+    {
+        pflashClearStateMachine();
+
+        // set the address
+        SETFLD(PFLASH_BE_ADDR, BLOCK_ERASE_ADDR, pflashGetChipStartOffset(chipsel) >> PFLASH_BE_ADDR__BLOCK_ERASE_ADDR__SHIFT);
+        // trigger the ID read command
+        SETFLD(PFLASH_CNTL, CMD_TRIG, PFLASH_CMD_TRIGGER_ID_READ);
+        // wait until complete
+        status = pflashWaitCMDTriggerDone();
+
+        if(status == PFLASH_OK)
+        {
+            timeout = PFLASH_DEFAULT_GET_CHIP_ID_TIMEOUT * FLASH_MS_TIMER_COUNT;
+
+            while(GETFLD(PFLASH_STATUS, ID_READ_DONE) == 0)
+            {
+                if(--timeout == 0)
+                {
+                    printk("\nERROR: pflashGetChipID: timeout waiting for ID_READ_DONE\n");
+
+                    return 0;
+                }
+
+                udelay(1000);
+            }
+
+            id = GETFLD(PFLASH_ID_STAT_DATA, PF_ID_DATA);
+
+            SETFLD(PFLASH_STATUS, ID_READ_DONE, 0x0);
+
+            pflashClearStateMachine();
+        }
+    }
+
+    return id;
+}
+
+/************************************************************************/
+
+char *pflashGetIdString(CHIP_SEL chipsel)
+{
+    uint32 id;
+    static char s[32];
+
+    if(pflash_exists)
+    {
+        id = pflashGetChipID(chipsel);
+
+        switch(id & 0xFF)
+        {
+        case SAMSUNG_ID:
+            strcpy(s, "Samsung ");
+
+            switch((id & 0xFF00) >> 8)
+            {
+            case SAMSUNG_K9F6408Q0C:  strcat(s, "K9F6408Q0");  break;
+            case SAMSUNG_K9F6408U0C:  strcat(s, "K9F6408U0");  break;
+            case SAMSUNG_K9F2808Q0C:  strcat(s, "K9F2808Q0");  break;
+            case SAMSUNG_K9F2808U0C:  strcat(s, "K9F2808U0");  break;
+            case SAMSUNG_K9F2816Q0C:  strcat(s, "K9F2816Q0");  break;
+            case SAMSUNG_K9F2816U0C:  strcat(s, "K9F2816U0");  break;
+            case SAMSUNG_K9F5608Q0B:  strcat(s, "K9F5608Q0");  break;
+            case SAMSUNG_K9F5608U0B:  strcat(s, "K9F5608U0");  break;
+            case SAMSUNG_K9F5616Q0B:  strcat(s, "K9F5616Q0");  break;
+            case SAMSUNG_K9F5616U0B:  strcat(s, "K9F5616U0");  break;
+            case SAMSUNG_K9F1208Q0A:  strcat(s, "K9F1208Q0");  break;
+            case SAMSUNG_K9F1208U0A:  strcat(s, "K9F1208U0");  break;
+            case SAMSUNG_K9F1216Q0A:  strcat(s, "K9F1216Q0");  break;
+            case SAMSUNG_K9F1216U0A:  strcat(s, "K9F1216U0");  break;
+            default:                  strcat(s, "unknown");    break;
+            }
+            break;
+
+        case TOSHIBA_ID:
+            strcpy(s, "Toshiba ");
+
+            switch((id & 0xFF00) >> 8)
+            {
+            case TOSHIBA_TC58V16BFT:  strcat(s, "TC58V16FT");  break;
+            case TOSHIBA_TC58V32AFT:  strcat(s, "TC58V32FT");  break;
+            case TOSHIBA_TC58V64AFT:  strcat(s, "TC58V64FT");  break;
+            case TOSHIBA_TC58128FT :  strcat(s, "TC58128FT");  break;
+            case TOSHIBA_TC58256FT :  strcat(s, "TC58256FT");  break;
+            case TOSHIBA_TH58512FT :  strcat(s, "TH58512FT");  break;
+            case TOSHIBA_TH58100FT :  strcat(s, "TH58100FT");  break;
+            default:                  strcat(s, "unknown");    break;
+            }
+            break;
+
+        case AMD_ID:
+            strcpy(s, "AMD ");
+
+            switch((id & 0xFF00) >> 8)
+            {
+            case AMD_AM30LV0064D:     strcat(s, "AM30LV0064"); break;
+            default:                  strcat(s, "unknown");    break;
+            }
+            break;
+
+        default:
+            strcpy(s, "Unknown");
+            break;
+        }
+    }
+    else
+    {
+        strcpy(s, "Not found");
+    }
+
+    return s;
+}
+
+/************************************************************************/
+
+uint32 pflashGetChipSize(CHIP_SEL chipsel)
+{
+    uint32 id;
+    int size;
+
+    id = pflashGetChipID(chipsel);
+    size = 0;
+
+    switch(id & 0xFF)
+    {
+    case SAMSUNG_ID:
+        switch((id & 0xFF00) >> 8)
+        {
+        case SAMSUNG_K9F6408Q0C:  size =   8*MEG;  break;
+        case SAMSUNG_K9F6408U0C:  size =   8*MEG;  break;
+        case SAMSUNG_K9F2808Q0C:  size =  16*MEG;  break;
+        case SAMSUNG_K9F2808U0C:  size =  16*MEG;  break;
+        case SAMSUNG_K9F2816Q0C:  size =  16*MEG;  break;
+        case SAMSUNG_K9F2816U0C:  size =  16*MEG;  break;
+        case SAMSUNG_K9F5608Q0B:  size =  32*MEG;  break;
+        case SAMSUNG_K9F5608U0B:  size =  32*MEG;  break;
+        case SAMSUNG_K9F5616Q0B:  size =  32*MEG;  break;
+        case SAMSUNG_K9F5616U0B:  size =  32*MEG;  break;
+        case SAMSUNG_K9F1208Q0A:  size =  64*MEG;  break;
+        case SAMSUNG_K9F1208U0A:  size =  64*MEG;  break;
+        case SAMSUNG_K9F1216Q0A:  size =  64*MEG;  break;
+        case SAMSUNG_K9F1216U0A:  size =  64*MEG;  break;
+        }
+        break;
+
+    case TOSHIBA_ID:
+        switch((id & 0xFF00) >> 8)
+        {
+        case TOSHIBA_TC58V16BFT:  size =   2*MEG;  break;
+        case TOSHIBA_TC58V32AFT:  size =   4*MEG;  break;
+        case TOSHIBA_TC58V64AFT:  size =   8*MEG;  break;
+        case TOSHIBA_TC58128FT :  size =  16*MEG;  break;
+        case TOSHIBA_TC58256FT :  size =  32*MEG;  break;
+        case TOSHIBA_TH58512FT :  size =  64*MEG;  break;
+        case TOSHIBA_TH58100FT :  size = 128*MEG;  break;
+        }
+        break;
+
+    case AMD_ID:
+        switch((id & 0xFF00) >> 8)
+        {
+        case AMD_AM30LV0064D:     size =  8*MEG;  break;
+        }
+        break;
+    }
+
+    //printk("DEBUG - pflashGetChipSize - chipId: 0x%x size: 0x%x\n", id, size);
+
+    return size;
+}
+
+/************************************************************************/
+
+int pflashIsBlockInvalid(CHIP_SEL chipsel, uint32 block, uint32 flags)
+{
+    if((ibt_cs == CS0) && (chipsel == CS1)) block += pflashGetTotalBlocks();
+
+    if(flags & PFF_ALLOW_ALL) return 0; // debug only - will erase ibt
+   
+    if(ibt.data.table[block] == IBT_GOOD_BLOCK) return 0;
+
+    if(flags & PFF_ALLOW_IBT)
+    {
+        if(ibt.data.table[block] == IBT_TABLE_0_BLOCK) return 0;
+        if(ibt.data.table[block] == IBT_TABLE_1_BLOCK) return 0;
+    }
+
+    if(flags & PFF_ALLOW_MB)
+    {
+        if(ibt.data.table[block] == IBT_MONITOR_BOOT_BLOCK) return 0;
+    }
+
+    return 1;
+}
+
+/************************************************************************/
+
+int pflashSetBlockInvalid(CHIP_SEL chipsel, uint32 block)
+{
+    if((ibt_cs == CS0) && (chipsel == CS1)) block += pflashGetTotalBlocks();
+
+    if(ibt.data.table[block] == IBT_GOOD_BLOCK)
+    {
+        ibt.data.table[block] = IBT_DETECTED_BAD_BLOCK;
+    }
+
+    return pflashWriteInvalidBlockTables();
+}
+
+/************************************************************************/
+
+int pflashSetAutoExec(char *command, uint32 *rblock)
+{
+    uint32 block;
+    uint32 total_blocks;
+
+    total_blocks = pflashGetTotalBlocks();
+
+    // search for an existing monitor boot block
+    if(pflashGetAutoExec(&block) == 0)
+    {
+        printk("Creating autoexec block...\n");
+
+        // create a new monitor boot block in the first available good block
+        for(block=0; block<total_blocks; block++)
+        {
+            if(pflashIsBlockInvalid(ibt_cs, block, PFF_ALLOW_MB) == 0)
+            {
+                ibt.data.table[block] = IBT_MONITOR_BOOT_BLOCK;
+
+                if(pflashWriteInvalidBlockTables())
+                {
+                    printk("ERROR: pflashSetAutoExec: unable to create autoexec block\n");
+
+                    return -1;
+                }
+
+                break;
+            }
+        }
+    }
+    else
+    {
+        printk("Updating autoexec block...\n");
+    }
+
+    if(block == total_blocks)
+    {
+        printk("ERROR: pflashSetAutoExec: unable to create autoexec block\n");
+    }
+    else
+    {
+        if(pflashBlockErase(ibt_cs, block, PFF_ALLOW_MB) == 0)
+        {
+            if(pflashBlockEraseVerify(ibt_cs, block) == 0)
+            {
+                memset(blockbuffer, 0, sizeof(blockbuffer));
+
+                *((uint32 *) blockbuffer) = MONITORBOOT_MAGIC;
+
+                strncpy(&blockbuffer[4], command, sizeof(blockbuffer)-5);
+
+                if(pflashBlockWrite(ibt_cs, block, blockbuffer, PFF_ECC | PFF_ALLOW_MB) == 0)
+                {
+                    if(pflashBlockVerify(ibt_cs, block, blockbuffer, PFF_ECC) == 0)
+                    {
+                        *rblock = block;
+
+                        return 0;
+                    }
+                    else
+                    {
+                        printk("ERROR: pflashSetAutoExec: autoexec block verify error\n");
+                    }
+                }
+                else
+                {
+                    printk("ERROR: pflashSetAutoExec: unable to write autoexec block\n");
+                }
+            }
+            else
+            {
+                printk("ERROR: pflashSetAutoExec: autoexec block erase verify error\n");
+            }
+        }
+        else
+        {
+            printk("ERROR: pflashSetAutoExec: unable to erase autoexec block\n");
+        }
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+char * pflashGetAutoExec(uint32 *rblock)
+{
+    uint32 block;
+    uint32 total_blocks;
+
+    total_blocks = pflashGetTotalBlocks();
+
+    // search for an existing monitor boot block
+    for(block=0; block<total_blocks; block++)
+    {
+        if(ibt.data.table[block] == IBT_MONITOR_BOOT_BLOCK)
+        {
+            if(pflashBlockRead(ibt_cs, block, blockbuffer, PFF_ECC) == 0)
+            {
+                if(*((uint32 *) blockbuffer) == MONITORBOOT_MAGIC)
+                {
+                    *rblock = block;
+
+                    return &blockbuffer[4];
+                }
+            }
+        }
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int pflashGetBufferSize(uint32 imagesize)
+{
+    uint32 block_size = pflashGetBlockSizeInBytes();
+
+    return ((imagesize + block_size - 1) / block_size) * block_size;
+}
+
+/************************************************************************/
+
+static int pflashGetSpare8(uint32 offset, uint8 *data)
+{
+    pflashClearStateMachine();
+    SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 1);
+    *data = GETMEM_PFLASHMM8(offset);
+    SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 0);
+    pflashClearStateMachine();
+
+    return 0;
+}
+
+/************************************************************************/
+
+static int pflashSetSpare8(uint32 offset, uint32 data)
+{
+    pflashClearStateMachine();
+    SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 1);
+    SETMEM_PFLASHMM8(offset, data);
+    SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 0);
+    pflashClearStateMachine();
+
+    return 0;
+}
+
+/************************************************************************/
+// This function is currently for Samsung NAND flash only
+
+static int pflashIsBlockFactoryInvalid(CHIP_SEL chipsel, uint32 block)
+{
+    uint8 page0_value;
+    uint8 page1_value;
+    uint32 start_offset;
+
+    // TODO: add check for Toshiba and use its algorithm
+
+    start_offset = pflashGetBlockStartOffset(chipsel, block);
+
+    pflashGetSpare8(start_offset + SPARE_AREA_VALID_BLOCK_OFFSET, &page0_value);
+    pflashGetSpare8(start_offset + SPARE_AREA_VALID_BLOCK_OFFSET + PFLASH_PAGE_SIZE, &page1_value);
+
+    if((page0_value != SPARE_AREA_VALID_BLOCK_VALUE) || (page1_value != SPARE_AREA_VALID_BLOCK_VALUE))
+    {
+        //printk("WARNING: pflashIsBlockFactoryInvalid: bad block=%d, page0=0x%02X, page1=0x%02X\n", block, page0_value, page1_value);
+
+        return PFLASH_BLOCK_INVALID;
+    }
+    else
+    {
+        return PFLASH_OK;
+    }
+}
+
+/************************************************************************/
+
+static int pflashCreateInvalidBlockTable(void)
+{
+    uint32 block;
+    uint32 total_blocks;
+
+    //printk("Creating pflash invalid block table...\n");
+
+    ibt_block0 = IBT_UNKNOWN_BLOCK;
+    ibt_block1 = IBT_UNKNOWN_BLOCK;
+
+    total_blocks = pflashGetTotalBlocks();
+
+    ibt.data.timestamp = 0;
+
+    if(ibt_cs == CS0) // pflash exists on CS0
+    {
+        for(block=0; block<total_blocks; block++)
+        {
+            if(pflashIsBlockFactoryInvalid(CS0, block) == PFLASH_BLOCK_INVALID)
+            {
+                printk("WARNING: pflashCreateInvalidBlockTable: pflash chip 0 block %d is invalid\n", block);
+
+                ibt.data.table[block] = IBT_FACTORY_BAD_BLOCK;
+            }
+            else
+            {
+                ibt.data.table[block] = IBT_GOOD_BLOCK;
+
+                if(ibt_block0 == IBT_UNKNOWN_BLOCK)
+                    ibt_block0 = block;
+                else if(ibt_block1 == IBT_UNKNOWN_BLOCK)
+                    ibt_block1 = block;
+            }
+        }
+
+        if(pflash_mask & (1<<PFLASH1_NUM)) // pflash exists on CS1
+        {
+            for(block=0; block<total_blocks; block++)
+            {
+                if(pflashIsBlockFactoryInvalid(CS1, block) == PFLASH_BLOCK_INVALID)
+                {
+                    printk("WARNING: pflashCreateInvalidBlockTable: pflash chip 1 block %d is invalid\n", block);
+
+                    ibt.data.table[total_blocks+block] = IBT_FACTORY_BAD_BLOCK;
+                }
+                else
+                {
+                    ibt.data.table[total_blocks+block] = IBT_GOOD_BLOCK;
+
+/*
+                    if(ibt_block0 == IBT_UNKNOWN_BLOCK)
+                        ibt_block0 = total_blocks+block;
+                    else if(ibt_block1 == IBT_UNKNOWN_BLOCK)
+                        ibt_block1 = total_blocks+block;
+*/
+                }
+            }
+        }
+    }
+    else if(ibt_cs == CS1) // pflash exists only on CS1
+    {
+        for(block=0; block<total_blocks; block++)
+        {
+            if(pflashIsBlockFactoryInvalid(CS1, block) == PFLASH_BLOCK_INVALID)
+            {
+                printk("WARNING: pflashCreateInvalidBlockTable: pflash chip 1 block %d is invalid\n", block);
+
+                ibt.data.table[block] = IBT_FACTORY_BAD_BLOCK;
+            }
+            else
+            {
+                ibt.data.table[block] = IBT_GOOD_BLOCK;
+
+                if(ibt_block0 == IBT_UNKNOWN_BLOCK)
+                    ibt_block0 = block;
+                else if(ibt_block1 == IBT_UNKNOWN_BLOCK)
+                    ibt_block1 = block;
+            }
+        }
+    }
+    else
+    {
+        printk("ERROR: pflashCreateInvalidBlockTable: unable to create table\n");
+
+        return -1;
+    }
+
+    ibt.data.table[ibt_block0] = IBT_TABLE_0_BLOCK;
+    ibt.data.table[ibt_block1] = IBT_TABLE_1_BLOCK;
+
+    ibt_found = 1;
+
+    return pflashWriteInvalidBlockTables();
+}
+
+/************************************************************************/
+
+static int pflashWriteInvalidBlockTables(void)
+{
+    int retval = 0;
+
+    ibt.data.timestamp += 1;
+
+    if(pflashWriteInvalidBlockTable0()) retval = -1;
+    if(pflashWriteInvalidBlockTable1()) retval = -1;
+
+    return retval;
+}
+
+/************************************************************************/
+
+static int pflashWriteInvalidBlockTable0(void)
+{
+    if(ibt_block0 != IBT_UNKNOWN_BLOCK)
+    {
+        //printk("Erasing block %d...\n", ibt_block0);
+
+        if(pflashBlockErase(ibt_cs, ibt_block0, PFF_ALLOW_IBT))
+        {
+            printk("ERROR: pflashWriteInvalidBlockTable0: unable to erase chip %d block %d\n", ibt_cs, ibt_block0);
+
+            return -1;
+        }
+        else
+        {
+            //printk("Writing pflash invalid block table 0 to block %d...\n", ibt_block0);
+
+            ibt.data.magic = MAKE_MAGIC('I','B','T','0');
+
+            if(pflashBlockWrite(ibt_cs, ibt_block0, ibt.array, PFF_ECC | PFF_ALLOW_IBT))
+            {
+                printk("ERROR: pflashWriteInvalidBlockTable0: unable to write chip %d block %d\n", ibt_cs, ibt_block0);
+
+                return -1;
+            }
+            else
+            {
+                if(pflashBlockVerify(ibt_cs, ibt_block0, ibt.array, PFF_ECC))
+                {
+                    printk("ERROR: pflashWriteInvalidBlockTable0: verify error\n");
+
+                    return -1;
+                }
+            }
+        }
+    }
+    else
+    {
+        printk("ERROR: pflashWriteInvalidBlockTable0: block not found\n");
+
+        return -1;
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+static int pflashWriteInvalidBlockTable1(void)
+{
+    if(ibt_block1 != IBT_UNKNOWN_BLOCK)
+    {
+        //printk("Erasing block %d...\n", ibt_block1);
+
+        if(pflashBlockErase(ibt_cs, ibt_block1, PFF_ALLOW_IBT))
+        {
+            printk("ERROR: pflashWriteInvalidBlockTable1: unable to erase chip %d block %d\n", ibt_cs, ibt_block1);
+
+            return -1;
+        }
+        else
+        {
+            //printk("Writing pflash invalid block table 1 to block %d...\n", ibt_block1);
+
+            ibt.data.magic = MAKE_MAGIC('I','B','T','1');
+
+            if(pflashBlockWrite(ibt_cs, ibt_block1, ibt.array, PFF_ECC | PFF_ALLOW_IBT))
+            {
+                printk("ERROR: pflashWriteInvalidBlockTable1: unable to write chip %d block %d\n", ibt_cs, ibt_block1);
+
+                return -1;
+            }
+            else
+            {
+                if(pflashBlockVerify(ibt_cs, ibt_block1, ibt.array, PFF_ECC))
+                {
+                    printk("ERROR: pflashWriteInvalidBlockTable1: verify error\n");
+
+                    return -1;
+                }
+            }
+        }
+    }
+    else
+    {
+        printk("ERROR: pflashWriteInvalidBlockTable1: block not found\n");
+
+        return -1;
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int pflashReadInvalidBlockTable(void)
+{
+    uint32 block;
+    char pagebuffer[PFLASH_PAGE_SIZE];
+    char pagebuffer1[PFLASH_PAGE_SIZE];
+    uint32 total_blocks;
+    uint32 ibt_timestamp0 = 0;
+    uint32 ibt_timestamp1 = 0;
+    int status;
+
+    ibt_block0 = IBT_UNKNOWN_BLOCK;
+    ibt_block1 = IBT_UNKNOWN_BLOCK;
+
+    total_blocks = pflashGetTotalBlocks();
+
+    // search for the invalid block tables by looking for the magic numbers (IBT0/1)
+    for(block=0; block<total_blocks; block++)
+    {
+        status = pflashPageRead(ibt_cs, block, 0, pagebuffer, PFF_ECC);
+        pflashPageRead(ibt_cs, block, 1, pagebuffer1, 0); // required 
+	
+	/* X226 debugging */
+	//printk("pflashReadIBT - total block: 0x%x  block: 0x%x\n", total_blocks, block);
+
+        if(status == 0)
+        {
+	  //if(block < 10) printk("block %d magic='%c%c%c%c'\n", block, pagebuffer[0], pagebuffer[1], pagebuffer[2], pagebuffer[3]);
+
+            if(pagebuffer[0] == 'I' && pagebuffer[1] == 'B' && pagebuffer[2] == 'T')
+            {
+                if(pagebuffer[3] == '0')
+                    ibt_block0 = block;
+                else if(pagebuffer[3] == '1')
+                    ibt_block1 = block;
+
+                if((ibt_block0 != IBT_UNKNOWN_BLOCK) && (ibt_block1 != IBT_UNKNOWN_BLOCK))
+                {
+                    break;
+                }
+            }
+        }
+    }
+
+    // attempt to read invalid block table #0
+    if(ibt_block0 != IBT_UNKNOWN_BLOCK)
+    {
+        printk("Reading pflash invalid block table 0 at block %d...\n", ibt_block0);
+
+        if(pflashBlockRead(ibt_cs, ibt_block0, ibt.array, PFF_ECC) == 0)
+        {
+            ibt_timestamp0 = ibt.data.timestamp;
+        }
+        else
+        {
+            printk("WARNING: pflashReadInvalidBlockTable: unable to read table 0\n");
+        }
+    }
+    else
+    {
+        printk("WARNING: pflashReadInvalidBlockTable: table 0 not found\n");
+    }
+
+    // attempt to read invalid block table #1
+    if(ibt_block1 != IBT_UNKNOWN_BLOCK)
+    {
+        printk("Reading pflash invalid block table 1 at block %d...\n", ibt_block1);
+
+        if(pflashBlockRead(ibt_cs, ibt_block1, ibt.array, PFF_ECC) == 0)
+        {
+            ibt_timestamp1 = ibt.data.timestamp;
+        }
+        else
+        {
+            printk("WARNING: pflashReadInvalidBlockTable: unable to read table 1\n");
+        }
+    }
+    else
+    {
+        printk("WARNING: pflashReadInvalidBlockTable: table 1 not found\n");
+    }
+
+    if(ibt_timestamp0 || ibt_timestamp1)
+    {
+        if(ibt_timestamp0 < ibt_timestamp1)
+        {
+            // read table #1 data
+            if(pflashBlockRead(ibt_cs, ibt_block1, ibt.array, PFF_ECC) == 0)
+            {
+                // overwrite table #0 with table #1 data
+                pflashWriteInvalidBlockTable0();
+
+                return 0;
+            }
+        }
+        else if(ibt_timestamp0 > ibt_timestamp1)
+        {
+            // read table #0 data
+            if(pflashBlockRead(ibt_cs, ibt_block0, ibt.array, PFF_ECC) == 0)
+            {
+                // overwrite table #1 with table #0 data
+                pflashWriteInvalidBlockTable1();
+
+                return 0;
+            }
+        }
+        else
+        {
+            // read table #0 data
+            if(pflashBlockRead(ibt_cs, ibt_block0, ibt.array, PFF_ECC) == 0)
+            {
+                return 0;
+            }
+        }
+    }
+
+    // neither invalid block table could be read
+    return -1;
+}
+
+/************************************************************************/
+
+static int pflashFindInvalidBlockTable(void)
+{
+    if(!ibt_found)
+    {
+        if(pflashReadInvalidBlockTable())
+        {
+            printk("\nWARNING: pflashFindInvalidBlockTable: unable to find table - creating it...\n");
+
+            if(pflashCreateInvalidBlockTable())
+            {
+                printk("ERROR: pflashFindInvalidBlockTable: unable to create table\n");
+
+                return -1;
+            }
+        }
+
+        ibt_found = 1;
+    }
+
+    return 0;
+}
+
+
+/*****************************************************************************/
+
+int pflash_oob_enable(uint32_t timeout)
+{
+  uint32_t data;
+
+  /* Wait for SEPROM_BUSY to go low */
+  while(GETFLD_REGMM32(SFLASH_CNTL2_STATUS, SEPROM_BUSY)) {
+    udelay(1000);
+
+    if(--timeout == 0) {
+      printk(KERN_INFO "\nERROR: timeout waiting for SEPROM_BUSY\n");
+      return(PFLASH_SEPROM_BUSY);
+    }
+  }
+
+  /* Clear The Read/Write cycle of state machine */
+  data = GETREG_REGMM32(PFLASH_CNTL);
+  MODIFYFLD(data, PFLASH_CNTL, CMD_TRIG,    0);
+  MODIFYFLD(data, PFLASH_CNTL, READ_CYCLE,  0);
+  MODIFYFLD(data, PFLASH_CNTL, WRITE_CYCLE, 0);
+  MODIFYFLD(data, PFLASH_CNTL, SPARE_EN, 1);
+  SETREG_REGMM32(PFLASH_CNTL, data);
+
+  /* Clear the status */
+  SETREG_REGMM32(PFLASH_STATUS, 0);
+
+  return 0;
+}
+
+
+/*****************************************************************************/
+
+int pflash_get_spare8( uint32_t offset, 
+		       uint8_t *data )
+{
+
+  pflashClearStateMachine();
+  SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 1);
+  *data = PFLASH_READ_8(offset);
+  SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 0);
+  pflashClearStateMachine();
+  /* printk(KERN_INFO "pflash_get_spare8 - offset: %x  data: %x\n", 
+     offset, *data); */
+
+  return 0;
+}
+
+
+/*****************************************************************************/
+
+int pflash_set_spare8( uint32_t offset, 
+		       uint32_t data )
+{
+
+  pflashClearStateMachine();
+  SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 1);
+  PFLASH_WRITE_8(offset, data);
+  SETFLD_REGMM32(PFLASH_CNTL, SPARE_EN, 0);
+  pflashClearStateMachine();
+  return 0;
+
+}
+
+
+/************************************************************************/
+
+void dump_nand_chip_info (struct nand_chip *this)
+{
+
+  DEBUG (MTD_DEBUG_LEVEL3, "nand_chip struct:\n");
+  DEBUG (MTD_DEBUG_LEVEL3, "IO_ADDR: \n");
+  DEBUG (MTD_DEBUG_LEVEL3, "CTRL_ADDR: \n");
+  DEBUG (MTD_DEBUG_LEVEL3, "CLE: \n");
+  DEBUG (MTD_DEBUG_LEVEL3, "ALE: \n");
+  DEBUG (MTD_DEBUG_LEVEL3, "NCE: \n");
+  DEBUG (MTD_DEBUG_LEVEL3, "chip_lock: 0x%x\n", this->chip_lock);
+  DEBUG (MTD_DEBUG_LEVEL3, "wait_queue: 0x%x\n", this->wq);
+  DEBUG (MTD_DEBUG_LEVEL3, "nand_state: 0x%x\n", this->state);
+  DEBUG (MTD_DEBUG_LEVEL3, "page_shift: 0x%x\n", this->page_shift);
+
+#ifdef CONFIG_MTD_NAND_ECC
+  DEBUG (MTD_DEBUG_LEVEL3, "ecc_code_buf: 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n", 
+	 this->ecc_code_buf[0], this->ecc_code_buf[1], this->ecc_code_buf[2], 
+	 this->ecc_code_buf[3], this->ecc_code_buf[4], this->ecc_code_buf[5]);
+#endif
+
+}
+
+
+/*****************************************************************************/
+
+void dump_mtd_info (struct mtd_info *mtd)
+{
+
+  DEBUG (MTD_DEBUG_LEVEL3, "mtd_info struct:\n");
+  DEBUG (MTD_DEBUG_LEVEL3, "type: 0x%x\n", mtd->type);
+  DEBUG (MTD_DEBUG_LEVEL3, "flags: 0x%x\n", mtd->flags);
+  DEBUG (MTD_DEBUG_LEVEL3, "total size: 0x%x\n", mtd->size);
+  DEBUG (MTD_DEBUG_LEVEL3, "erasesize: 0x%x\n", mtd->erasesize);
+  DEBUG (MTD_DEBUG_LEVEL3, "oobblock: 0x%x\n", mtd->oobblock);
+  DEBUG (MTD_DEBUG_LEVEL3, "oobsize: 0x%x\n", mtd->oobsize);
+  DEBUG (MTD_DEBUG_LEVEL3, "ecctype: 0x%x\n", mtd->ecctype );
+  DEBUG (MTD_DEBUG_LEVEL3, "eccsize: 0x%x\n", mtd->eccsize);
+  DEBUG (MTD_DEBUG_LEVEL3, "NAND name: %s\n", mtd->name);
+  DEBUG (MTD_DEBUG_LEVEL3, "index: 0x%x\n", mtd->index);
+  DEBUG (MTD_DEBUG_LEVEL3, "number of erase regions: 0x%x\n", mtd->numeraseregions);
+  DEBUG (MTD_DEBUG_LEVEL3, "mtd->read: 0x%x\n", mtd->read);
+  DEBUG (MTD_DEBUG_LEVEL3, "mtd->read_oob: 0x%x\n", mtd->read_oob);
+
+}
+
+/************************************************************************************/
+
+/* NOR Flash functions */
+
+int nflashInit(void)
+{
+    uint32 flash_mask = 0;
+
+    pcuSetMode(PCU_MODE_FLEXBUS);
+
+#ifdef NFLASH0_NUM
+    if(nflashExists(NFLASH0_APER, NFLASH0_BASE)) flash_mask |= (1<<NFLASH0_NUM);
+#endif
+#ifdef NFLASH1_NUM
+    if(nflashExists(NFLASH1_APER, NFLASH1_BASE)) flash_mask |= (1<<NFLASH1_NUM);
+#endif
+#ifdef NFLASH2_NUM
+    if(nflashExists(NFLASH2_APER, NFLASH2_BASE)) flash_mask |= (1<<NFLASH2_NUM);
+#endif
+#ifdef NFLASH3_NUM
+    if(nflashExists(NFLASH3_APER, NFLASH3_BASE)) flash_mask |= (1<<NFLASH3_NUM);
+#endif
+#ifdef NFLASH4_NUM
+    if(nflashExists(NFLASH4_APER, NFLASH4_BASE)) flash_mask |= (1<<NFLASH4_NUM);
+#endif
+#ifdef NFLASH5_NUM
+    if(nflashExists(NFLASH5_APER, NFLASH5_BASE)) flash_mask |= (1<<NFLASH5_NUM);
+#endif
+#ifdef NFLASH6_NUM
+    if(nflashExists(NFLASH6_APER, NFLASH6_BASE)) flash_mask |= (1<<NFLASH6_NUM);
+#endif
+#ifdef NFLASH7_NUM
+    if(nflashExists(NFLASH7_APER, NFLASH7_BASE)) flash_mask |= (1<<NFLASH7_NUM);
+#endif
+
+    return flash_mask;
+}
+
+/************************************************************************/
+
+uint32 nflashGetType(uint32 aper, uint32 baseoffset)
+{
+    uint32 type;
+
+    pcuFlexBusWrite8(aper, baseoffset+(0x5555<<1), 0xAA);
+    pcuFlexBusWrite8(aper, baseoffset+(0x2AAA<<1), 0x55);
+    pcuFlexBusWrite8(aper, baseoffset+(0x5555<<1), 0x90);
+
+    type = pcuFlexBusRead8(aper, baseoffset+(1<<1));
+
+    pcuFlexBusWrite8(aper, baseoffset+(0x88), 0xF0);
+
+    return type;
+}
+
+uint32 nflashGetSize(uint32 type)
+{
+    switch(type)
+    {
+    case NFT_AT49xV16x4: return 2*MEG;
+    case NFT_AT49xV32x:  return 4*MEG;
+    case NFT_AT29LV320D: return 4*MEG;
+    case NFT_AT29LV64xD: return 8*MEG;
+    }
+
+    return 0;
+}
+
+
+static int nflashExists(uint32 aper, uint32 baseoffset)
+{
+    uint32 type;
+
+    type = nflashGetType(aper, baseoffset);
+
+    if((type == NFT_AT49xV16x4) || (type == NFT_AT49xV32x) || (type == NFT_AT29LV320D))
+        return 1;
+    else
+        return 0;
+}
+
+
+/************************************************************************************/
+
+
+/* Serial Flash */
+
+
+int sflashInit(void)
+{
+    uint32 flash_mask = 0;
+
+    // assume sflash exists only if strapped for sflash boot
+    switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:          sflash_pcu_mode = PCU_MODE_SFLASH_SEPST05;  sflash_exists = 1; break;
+    case STRAPS__BOOTROM_SEL__ST_M25P10:          sflash_pcu_mode = PCU_MODE_SFLASH_SEPST10;  sflash_exists = 1; break;
+    case STRAPS__BOOTROM_SEL__ST_M25P20:          sflash_pcu_mode = PCU_MODE_SFLASH_SEPST20;  sflash_exists = 1; break;
+    case STRAPS__BOOTROM_SEL__ST_M25P40:          sflash_pcu_mode = PCU_MODE_SFLASH_SEPST40;  sflash_exists = 1; break;
+    case STRAPS__BOOTROM_SEL__ST_M25P80:          sflash_pcu_mode = PCU_MODE_SFLASH_SEPST80;  sflash_exists = 1; break;
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011: sflash_pcu_mode = PCU_MODE_SFLASH_SEPISSI;  sflash_exists = 1; break;
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:    sflash_pcu_mode = PCU_MODE_SFLASH_SEPATMEL; sflash_exists = 1; break;
+    }
+
+    if(sflash_exists)
+    {
+        pcuSetMode(sflash_pcu_mode);
+
+        sflashCheckIdleAndSoftReset();
+        sflashReadEnableSequence();
+
+        flash_mask |= (1<<SFLASH_NUM);
+    }
+
+    return flash_mask;
+}
+
+/************************************************************************/
+
+int sflashGetPcuMode(void)
+{
+    return sflash_pcu_mode;
+}
+
+/************************************************************************/
+
+char *sflashGetIdString(void)
+{
+    switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:          return "ST Microelectronics M25P05";
+    case STRAPS__BOOTROM_SEL__ST_M25P10:          return "ST Microelectronics M25P10";
+    case STRAPS__BOOTROM_SEL__ST_M25P20:          return "ST Microelectronics M25P20";
+    case STRAPS__BOOTROM_SEL__ST_M25P40:          return "ST Microelectronics M25P40";
+    case STRAPS__BOOTROM_SEL__ST_M25P80:          return "ST Microelectronics M25P80";
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011: return "NEXFLASH NX25F011";
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:    return "ATMEL AT25F1024";
+    }
+
+    return "Unknown";
+}
+
+/************************************************************************/
+
+int sflashGetChipSize(void)
+{
+    switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:          return 64*1024;
+    case STRAPS__BOOTROM_SEL__ST_M25P10:          return 128*1024;
+    case STRAPS__BOOTROM_SEL__ST_M25P20:          return 256*1024;
+    case STRAPS__BOOTROM_SEL__ST_M25P40:          return 512*1024;
+    case STRAPS__BOOTROM_SEL__ST_M25P80:          return 1024*1024;
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011: return 132*1024;
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:    return 128*1024;
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int sflashGetBlockSize(int block)
+{
+    switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:          return 0x8000;
+    case STRAPS__BOOTROM_SEL__ST_M25P10:          return 0x8000;
+    case STRAPS__BOOTROM_SEL__ST_M25P20:          return 0x10000;
+    case STRAPS__BOOTROM_SEL__ST_M25P40:          return 0x10000;
+    case STRAPS__BOOTROM_SEL__ST_M25P80:          return 0x10000;
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011: return 0x2100;
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:    return 0x8000;
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int sflashGetTotalBlocks(void)
+{
+    switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:          return 2;
+    case STRAPS__BOOTROM_SEL__ST_M25P10:          return 4;
+    case STRAPS__BOOTROM_SEL__ST_M25P20:          return 4;
+    case STRAPS__BOOTROM_SEL__ST_M25P40:          return 8;
+    case STRAPS__BOOTROM_SEL__ST_M25P80:          return 16;
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011: return 16;
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:    return 4;
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int sflashGetBlockStartOffset(UINT32 block)
+{
+    switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:          return block * 0x8000;
+    case STRAPS__BOOTROM_SEL__ST_M25P10:          return block * 0x8000;
+    case STRAPS__BOOTROM_SEL__ST_M25P20:          return block * 0x10000;
+    case STRAPS__BOOTROM_SEL__ST_M25P40:          return block * 0x10000;
+    case STRAPS__BOOTROM_SEL__ST_M25P80:          return block * 0x10000;
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011: return 0;
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:    return 0;
+    }
+
+    return 0;
+}
+
+/************************************************************************/
+
+int sflashChipErase(void)
+{
+    UINT32 regVal;
+    UINT32 timeout;
+
+    if(sflash_exists)
+    {
+        regVal = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x0);
+#ifdef CONFIG_STW4X225
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+        SETREG(SFLASH_CNTL1,regVal);
+
+        SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x6);
+        SETMEM_SFLASHMM8(0x0,0x0);
+
+        if(sflashCheckIdleAndSoftReset()) return -1;
+
+        regVal = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x0);
+#ifdef CONFIG_STW4X225
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+        SETREG(SFLASH_CNTL1,regVal);
+
+        SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0xC7); //chip erase command
+        SETMEM_SFLASHMM8(0x0,0x0); //command trigger
+
+        if(sflashCheckIdleAndSoftReset()) return -1;
+
+        regVal=GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x0);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x3);
+#ifdef CONFIG_STW4X225
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+        SETREG(SFLASH_CNTL1,regVal);
+
+        SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x0);
+
+#ifdef CONFIG_STWX225
+        regVal = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x1);
+        SETREG(SFLASH_CNTL1,regVal);
+        SETFLD(SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE,0x0);
+#endif
+
+        switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+        {
+        case STRAPS__BOOTROM_SEL__ST_M25P05: timeout =  6000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P10: timeout =  4000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P20: timeout =  6000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P40: timeout = 10000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P80: timeout = 20000; break;
+        default:                             timeout = SFLASH_DEFAULT_CHIP_ERASE_TIMEOUT; break;
+        }
+
+        if(sflashCheckWriteInProgress(timeout)) return -1;
+        if(sflashCheckStatusRegister())  return -1;
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashChipErase: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashBlockErase(int block)
+{
+    UINT32 regVal;
+    UINT32 timeout;
+
+    if(sflash_exists)
+    {
+        regVal = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x0);
+#ifdef CONFIG_X225
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+        SETREG(SFLASH_CNTL1,regVal);
+
+        SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x6);
+
+        SETMEM_SFLASHMM8(0x0,0x0);
+
+        if(sflashCheckStatusRegister()) return -1; 
+        if(sflashCheckIdleAndSoftReset()) return -1;
+
+        regVal = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x1);
+        //MODIFYFLD(regVal,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x0);
+#ifdef CONFIG_STW4X225
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+        SETREG(SFLASH_CNTL1,regVal);
+
+        regVal=GETREG(SFLASH_CNTL2_STATUS);
+        MODIFYFLD(regVal,SFLASH_CNTL2_STATUS,SEC_COMMAND, 0xD8);
+        MODIFYFLD(regVal,SFLASH_CNTL2_STATUS,SECTOR_ERASE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL2_STATUS,SECTOR_TO_ERASE, block);
+
+        SETMEM_SFLASHMM8(0x0,0x0);
+
+        if(sflashCheckStatusRegister()) return -1; 
+        if(sflashCheckIdleAndSoftReset()) return -1;
+
+        regVal=GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x0);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x3);
+#ifdef CONFIG_STW4X225
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+        SETREG(SFLASH_CNTL1,regVal);
+
+        SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x0);
+
+#ifdef CONFIG_STW4X225
+        regVal = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x1);
+        SETREG(SFLASH_CNTL1,regVal);
+        SETFLD(SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE,0x0);
+#endif
+
+        switch((GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK))
+        {
+        case STRAPS__BOOTROM_SEL__ST_M25P05: timeout = 3000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P10: timeout = 2000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P20: timeout = 3000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P40: timeout = 3000; break;
+        case STRAPS__BOOTROM_SEL__ST_M25P80: timeout = 3000; break;
+        default:                             timeout = SFLASH_DEFAULT_BLOCK_ERASE_TIMEOUT; break;
+        }
+
+        if(sflashCheckWriteInProgress(timeout)) return -1;
+        if(sflashCheckStatusRegister()) return -1; 
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashBlockErase: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashBlockEraseVerify(uint32 block)
+{
+    uint32 offset;
+    uint32 blocksize;
+    uint32 blockoffset;
+    uint8 actual;
+
+    if(sflash_exists)
+    {
+        blocksize = sflashGetBlockSize(block);
+        blockoffset = sflashGetBlockStartOffset(block);
+
+        sflashReadEnableSequence();
+
+        for(offset=0; offset<blocksize; offset++)
+        {
+            actual = GETMEM_SFLASHMM8(blockoffset + offset);
+
+            if(actual != 0xFF)
+            {
+                printk("\nERROR: sflashBlockEraseVerify: block=%d, offset=%d, actual=0x%02X, expected=0xFF\n", block, offset, actual);
+                return -1;
+            }
+        }
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashBlockEraseVerify: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashChipWrite(uint32 block_start, char *addr, uint32 size)
+{
+    uint32 block;
+    uint32 blocks;
+    uint32 blocksize;
+    uint32 totalblocks;
+    uint32 blocksremaining;
+
+    if(sflash_exists)
+    {
+        totalblocks = sflashGetTotalBlocks();
+        blocksize = sflashGetBlockSize(0);
+        blocks = blocksremaining = (size+blocksize-1) / blocksize;
+
+        printk("Erasing chip...\n");
+
+        if(sflashChipErase() == 0)
+        {
+            printk("Writing/verifying %d blocks starting at %d...\n", blocks, block_start);
+
+            for(block=block_start; blocksremaining && (block<totalblocks); block++)
+            {
+                printk("block %d: ", block);
+
+                printk("W");
+                if(sflashBlockWrite(block, addr)) break;
+
+                printk("V");
+                if(sflashBlockVerify(block, addr)) break;
+
+                addr += blocksize;
+                blocksremaining -= 1;
+
+                printk("\n");
+            }
+
+            printk("\n");
+        }
+
+        printk("%d blocks written.\n", blocks-blocksremaining);
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashChipWrite: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+sflashChipRead(uint32 block_start, char *addr, uint32 blocks)
+{
+    uint32 blocksize;
+    uint32 totalblocks;
+    uint32 block;
+    uint32 blocksremaining;
+
+    if(sflash_exists)
+    {
+        blocksize = sflashGetBlockSize(0);
+        totalblocks = blocksremaining = sflashGetTotalBlocks();
+
+        for(block=block_start; blocks && (block<totalblocks); block++)
+        {
+            sflashBlockRead(block, addr);
+
+            printk(".");
+
+            addr += blocksize;
+            blocksremaining -= 1;
+        }
+
+        printk("\n%d blocks read.\n", blocks-blocksremaining);
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashChipRead: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+#define BURST_SIZE 128
+
+int sflashBlockWrite(uint32 block, char *data) 
+{
+    uint32 offset;
+    uint32 regVal;
+    uint32 i;
+    uint32 blocksize = sflashGetBlockSize(block);
+    uint32 blockoffset = sflashGetBlockStartOffset(block);
+
+    if(sflash_exists)
+    {
+        for(offset=0; offset<blocksize; offset+=BURST_SIZE)
+        {
+            if(!(offset & 0x3FF)) { printk("."); }
+
+            //pre-write sequence
+            regVal = GETREG(SFLASH_CNTL1);
+            MODIFYFLD(regVal,SFLASH_CNTL1,WRITE_ENABLE, 0x1);
+            MODIFYFLD(regVal,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 0x1);
+            MODIFYFLD(regVal,SFLASH_CNTL1,READ_STATUS, 0x0);
+            MODIFYFLD(regVal,SFLASH_CNTL1,BYTE_CNT, 0x0);
+#ifdef CONFIG_STW4X225
+            MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+            MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+            SETREG(SFLASH_CNTL1,regVal);
+
+            SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x6);
+
+            SETMEM_SFLASHMM8(0x0,0x0);
+
+            if(sflashCheckStatusRegister()) return -1;
+            if(sflashCheckIdleAndSoftReset()) return -1;
+
+            //set up the byte count
+            regVal=GETREG(SFLASH_CNTL1);
+            MODIFYFLD(regVal,SFLASH_CNTL1, WRITE_ENABLE, 0x0);
+            MODIFYFLD(regVal,SFLASH_CNTL1, BCNT_OVER_WTE_EN, 0x1);
+            MODIFYFLD(regVal,SFLASH_CNTL1, BYTE_CNT, BURST_SIZE-1); // 0x0 for 1 byte
+            SETREG(SFLASH_CNTL1,regVal);
+
+            SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x0); //Write Enable Finished
+
+            for(i=0; i<BURST_SIZE; i++)
+                SETMEM_SFLASHMM8(blockoffset + offset + i, *data++);
+
+            if(sflashCheckWriteInProgress(SFLASH_DEFAULT_WRITE_TIMEOUT)) return -1;
+            if(sflashCheckStatusRegister()) return -1;
+            if(sflashCheckIdleAndSoftReset()) return -1;
+        }
+
+        sflashReadEnableSequence();
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashBlockWrite: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashBlockVerify(uint32 block, char *buffer)
+{
+    uint32 offset;
+    uint32 blocksize;
+    uint32 blockoffset;
+    uint8 actual;
+    uint8 expected;
+
+    if(sflash_exists)
+    {
+        blocksize = sflashGetBlockSize(block);
+        blockoffset = sflashGetBlockStartOffset(block);
+
+        sflashReadEnableSequence();
+
+        for(offset=0; offset<blocksize; offset++)
+        {
+            actual = GETMEM_SFLASHMM8(blockoffset + offset);
+            expected = *buffer++;
+
+            if(actual != expected)
+            {
+                printk("\nERROR: sflashBlockVerify: block=%d, offset=%d, actual=0x%02X, expected=%02X\n", block, offset, actual, expected);
+                return -1;
+            }
+        }
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashBlockWriteVerify: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashBlockRead(uint32 block, char *data) 
+{
+    uint32 offset;
+    uint32 blocksize;
+    uint32 blockoffset;
+    uint32 *p = (uint32 *) data;
+
+    if(sflash_exists)
+    {
+        blocksize = sflashGetBlockSize(block);
+        blockoffset = sflashGetBlockStartOffset(block);
+
+        sflashReadEnableSequence();
+
+        for(offset=0; offset<blocksize; offset+=4)
+        {
+            *p++ = GETMEM_SFLASHMM32(blockoffset + offset);
+        }
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashBlockRead: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashCheckIdleAndSoftReset(void)
+{
+    return 0;
+}
+
+/************************************************************************/
+
+int sflashCheckStatusRegister(void)
+{
+    UINT32 timeout;
+
+    if(sflash_exists)
+    {
+        timeout = SFLASH_DEFAULT_STATUS_TIMEOUT * FLASH_MS_TIMER_COUNT;
+
+        while (1)
+        {
+            if((GETFLD(SFLASH_CNTL2_STATUS,SFLASH_BUSY) |
+                GETFLD(SFLASH_CNTL2_STATUS,ROMPARIF_BUSY) |
+                GETFLD(SFLASH_CNTL2_STATUS,PARIF_BUSY) |
+                GETFLD(SFLASH_CNTL2_STATUS,PARIFROM_BUSY) |
+                GETFLD(SFLASH_CNTL2_STATUS,READY_BUSY) |
+                GETFLD(SFLASH_CNTL2_STATUS,SEPROM_BUSY)) == 0)
+            {
+                return 0;
+            }
+
+            if (timeout-- == 0)
+            {
+                printk("ERROR: sflashCheckStatusRegister timeout\n");
+                return -1;
+            }
+
+            udelay(1000);
+        }
+    }
+    else
+    {
+        printk("ERROR: sflashCheckStatusRegister: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+int sflashCheckWriteInProgress(uint32 timeout)
+{
+    UINT32 reg;
+
+    if(sflash_exists)
+    {
+        timeout *= FLASH_MS_TIMER_COUNT;
+
+        while(1)
+        {
+            reg = GETREG(SFLASH_CNTL1);
+            MODIFYFLD(reg,SFLASH_CNTL1,WRITE_ENABLE, 0x0);
+            MODIFYFLD(reg,SFLASH_CNTL1,BCNT_OVER_WTE_EN, 0x1);
+            MODIFYFLD(reg,SFLASH_CNTL1,READ_STATUS, 0x1);
+            MODIFYFLD(reg,SFLASH_CNTL1,BYTE_CNT, 0x0);
+#ifdef CONFIG_STW4X225
+            MODIFYFLD(reg,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+            MODIFYFLD(reg,SFLASH_CNTL1,SCK_PRESCALE, 0x2);
+#endif
+            SETREG(SFLASH_CNTL1,reg);
+
+            SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x5);
+
+            reg = GETMEM_SFLASHMM8(0x0);
+
+            SETFLD(SFLASH_CNTL2_STATUS,SEC_COMMAND, 0x0);
+            SETFLD(SFLASH_CNTL1,READ_STATUS,0x0);
+
+            if(!(reg & 0x1))
+            {
+                return 0;
+            }
+
+            if(timeout-- == 0)
+            {
+                printk("ERROR: sflashCheckWriteInProgress timeout\n");
+                return -1;
+            }
+
+            udelay(1000);
+        }
+
+        return 0;
+    }
+    else
+    {
+        printk("ERROR: sflashCheckWriteInProgress: sflash not initialized\n");
+    }
+
+    return -1;
+}
+
+/************************************************************************/
+
+void sflashReadEnableSequence(void)
+{
+#ifdef CONFIG_STW4X225
+    UINT32 regVal;
+
+    regVal = GETREG(SFLASH_CNTL1);
+    MODIFYFLD(regVal,SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+    MODIFYFLD(regVal,SFLASH_CNTL1,SCK_PRESCALE, 0x1);
+    SETREG(SFLASH_CNTL1,regVal);
+
+    SETFLD(SFLASH_CNTL1,WTRIG_PRE_FLD_SCK_PRESCALE, 0x0);
+#endif
+}
+
+/************************************************************************/
+
+int sflashGetBufferSize(uint32 imagesize)
+{
+    if(sflash_exists)
+    {
+        uint32 block_size = sflashGetBlockSize(0);
+
+        return ((imagesize + block_size - 1) / block_size) * block_size;
+    }
+    else
+    {
+        printk("ERROR: sflashBlockEraseVerify: sflash not initialized\n");
+
+        return 0;
+    }
+}
+
+
+
+void stw_flashinfo (int *flashsize, int *default_num)
+{
+    uint32 bootrom_straps;
+
+    *flashsize = 0;
+    *default_num = 0;
+
+    bootrom_straps = GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK;
+
+    switch(bootrom_straps)
+    {
+    case STRAPS__BOOTROM_SEL__NAND_32Mb:
+    case STRAPS__BOOTROM_SEL__NAND_64Mb:
+    case STRAPS__BOOTROM_SEL__NAND_128Mb:
+      printk("STW5X226 DEBUG - bootstrap: NAND flash\n");
+      flash_mask |= pflashInit();
+      if(flash_mask & (1<<PFLASH1_NUM))
+        {
+	  *flashsize = pflashGetChipSize(CS1);
+	  *default_num = PFLASH1_NUM;
+        }
+        else if(flash_mask & (1<<PFLASH0_NUM))
+        {
+	  *flashsize = pflashGetChipSize(CS0);
+	  *default_num = PFLASH0_NUM;
+        }
+        break;
+
+    case STRAPS__BOOTROM_SEL__ST_M25P80:
+    case STRAPS__BOOTROM_SEL__ST_M25P10:
+    case STRAPS__BOOTROM_SEL__ST_M25P05:
+    case STRAPS__BOOTROM_SEL__ST_M25P20:
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011:
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:
+    case STRAPS__BOOTROM_SEL__ST_M25P40:
+      printk("STW5X226 DEBUG - bootstrap: Serial flash.\n");
+        flash_mask |= pflashInit();
+	if(flash_mask & (1<<PFLASH1_NUM))
+        {
+	  *flashsize = pflashGetChipSize(CS1);
+	  *default_num = PFLASH1_NUM;
+        }
+        else if(flash_mask & (1<<PFLASH0_NUM))
+        {
+	  *flashsize = pflashGetChipSize(CS0);
+	  *default_num = PFLASH0_NUM;
+        }
+        break;
+
+    case STRAPS__BOOTROM_SEL__NOR_8:
+    case STRAPS__BOOTROM_SEL__NOR_16:
+      printk("STW5X226 DEBUG - bootstrap: NOR flash.\n");
+      nflashInit();
+      flash_mask |= pflashInit();
+
+      if(flash_mask & (1<<PFLASH1_NUM))
+        {
+	  *flashsize = pflashGetChipSize(CS1);
+	  *default_num = PFLASH1_NUM;
+        }
+      else if(flash_mask & (1<<PFLASH0_NUM))
+        {
+	  *flashsize = pflashGetChipSize(CS0);
+	  *default_num = PFLASH0_NUM;
+        }
+        break;
+    }
+
+    // switch to flexbus mode as default
+    //pcuSetMode(PCU_MODE_FLEXBUS);
+    //printk("STW5X226 DEBUG - flash size: 0x%x default number: 0x%x\n", *flashsize, *default_num);
+
+}
+
+
+/* PCU routines */
+
+int pcuSetMode(int mode)
+{
+    static uint32 old_pcu_mode = PCU_MODE_NONE;
+
+#if !defined(CONFIG_STWX220) && !defined(CONFIG_STW4X225)
+    uint32 reg;
+#endif
+
+    //printk("X226 DEBUG - pcuSetMode - mode: 0x%x\n", mode);
+
+    if(mode == old_pcu_mode) return 0;
+
+    old_pcu_mode = mode;
+
+    switch(mode)
+    {
+    case PCU_MODE_FLEXBUS:
+
+#ifndef CONFIG_STWX220
+        // turn off sflash aperture
+        SETFLD_REGMM32(APER_PCU_SFLASH_CNTL, APERSIZE, 0);
+
+        // turn off pflash aperture
+        SETFLD_REGMM32(APER_PCU_PFLASH_CNTL, APERSIZE, 0);
+
+        // disable sflash registers
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN))  SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN,  0);
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN))  SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN,  0);
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN))  SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN,  0);
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN)) SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+#ifndef CONFIG_STW4X225
+        if(GETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN)) SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 0);
+#endif
+
+        // disable pflash registers
+        SETFLD_REGMM32(PFLASH_CNTL, PF32MBIT_EN, 0);
+        SETFLD_REGMM32(PFLASH_CNTL, PF64MBIT_EN, 0);
+        SETFLD_REGMM32(PFLASH_CNTL, PF128MBIT_EN, 0);
+
+        // set flexbus muxing to flexbus (nflash)
+        SETREG_REGMM32(FBUS_SELECT, 0x0);
+#endif
+
+        // board specific switch to flexbus
+        sbdSelectFlexBus();
+
+        // turn on flexbus apertures (if size is not zero)
+        SETFLD_REGMM32(APER_PCU_FBC0_ADDR, BASE_ADDRESS, FBC0BASE>>16);
+        SETFLD_REGMM32(APER_PCU_FBC0_ADDR, BASE_OUT, 0x00000000);
+        SETFLD_REGMM32(APER_PCU_FBC0_CNTL, APERSIZE, FBC0SIZE);
+        SETFLD_REGMM32(APER_PCU_FBC1_ADDR, BASE_ADDRESS, FBC1BASE>>16);
+        SETFLD_REGMM32(APER_PCU_FBC1_ADDR, BASE_OUT, 0x00000000);
+        SETFLD_REGMM32(APER_PCU_FBC1_CNTL, APERSIZE, FBC1SIZE);
+        SETFLD_REGMM32(APER_PCU_FBC2_ADDR, BASE_ADDRESS, FBC2BASE>>16);
+        SETFLD_REGMM32(APER_PCU_FBC2_ADDR, BASE_OUT, 0x00000000);
+        SETFLD_REGMM32(APER_PCU_FBC2_CNTL, APERSIZE, FBC2SIZE);
+        SETFLD_REGMM32(APER_PCU_FBC3_ADDR, BASE_ADDRESS, FBC3BASE>>16);
+        SETFLD_REGMM32(APER_PCU_FBC3_ADDR, BASE_OUT, 0x00000000);
+        SETFLD_REGMM32(APER_PCU_FBC3_CNTL, APERSIZE, FBC3SIZE);
+        SETFLD_REGMM32(APER_PCU_FBC4_ADDR, BASE_ADDRESS, FBC4BASE>>16);
+        SETFLD_REGMM32(APER_PCU_FBC4_ADDR, BASE_OUT, 0x00000000);
+        SETFLD_REGMM32(APER_PCU_FBC4_CNTL, APERSIZE, FBC4SIZE);
+        SETFLD_REGMM32(APER_PCU_FBC5_ADDR, BASE_ADDRESS, FBC5BASE>>16);
+        SETFLD_REGMM32(APER_PCU_FBC5_ADDR, BASE_OUT, 0x00000000);
+        SETFLD_REGMM32(APER_PCU_FBC5_CNTL, APERSIZE, FBC5SIZE);
+
+        return 0;
+
+#ifndef CONFIG_STWX220
+    case PCU_MODE_SFLASH_SEPST05:
+    case PCU_MODE_SFLASH_SEPST10:
+    case PCU_MODE_SFLASH_SEPST20:
+    case PCU_MODE_SFLASH_SEPST40:
+    case PCU_MODE_SFLASH_SEPST80:
+    case PCU_MODE_SFLASH_SEPISSI:
+    case PCU_MODE_SFLASH_SEPATMEL:
+
+        // turn off flexbus (nflash) apertures
+        SETFLD_REGMM32(APER_PCU_FBC0_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC1_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC2_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC3_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC4_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC5_CNTL, APERSIZE, 0);
+
+        // turn off pflash aperture
+        SETFLD_REGMM32(APER_PCU_PFLASH_CNTL, APERSIZE, 0);
+
+        // disable pflash registers
+        SETFLD_REGMM32(PFLASH_CNTL, PF32MBIT_EN, 0);
+        SETFLD_REGMM32(PFLASH_CNTL, PF64MBIT_EN, 0);
+        SETFLD_REGMM32(PFLASH_CNTL, PF128MBIT_EN, 0);
+
+        // set flexbus muxing to sflash
+        SETREG_REGMM32(FBUS_SELECT, 0x4);
+
+        // board specific switch to serial flash
+        sbdSelectSerialFlash(mode);
+
+        // enable sflash registers
+        switch(mode)
+        {
+        case PCU_MODE_SFLASH_SEPST05:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+#ifndef CONFIG_STW4X225
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 0);
+#endif
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 1);
+            break;
+        case PCU_MODE_SFLASH_SEPST10:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+#ifndef CONFIG_STW4X225
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 0);
+#endif
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 1);
+            break;
+#ifndef CONFIG_STW4X225
+        case PCU_MODE_SFLASH_SEPST20:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 1);
+            break;
+        case PCU_MODE_SFLASH_SEPST40:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 1);
+            break;
+        case PCU_MODE_SFLASH_SEPST80:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 1);
+            break;
+#endif
+        case PCU_MODE_SFLASH_SEPISSI:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+#ifndef CONFIG_STW4X225
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 0);
+#endif
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 1);
+            break;
+        case PCU_MODE_SFLASH_SEPATMEL:
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN, 0);
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN, 0);
+#ifndef CONFIG_STW4X225
+            SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 0);
+#endif
+            SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 1);
+            break;
+        }
+
+#ifndef CONFIG_STW4X225
+        reg = GETREG(SFLASH_CNTL1);
+        MODIFYFLD(reg, SFLASH_CNTL1, WTRIG_PRE_FLD_SCK_PRESCALE, 0x1);
+        MODIFYFLD(reg, SFLASH_CNTL1, SCK_PRESCALE, sck_prescale);
+        SETREG(SFLASH_CNTL1, reg);
+#endif
+
+        // turn on sflash aperture
+        SETFLD_REGMM32(APER_PCU_SFLASH_CNTL, APERSIZE, 0xB);
+
+        return 0;
+#endif
+
+#ifndef CONFIG_STWX220
+    case PCU_MODE_PFLASH_32MBIT: 
+    case PCU_MODE_PFLASH_64MBIT: 
+    case PCU_MODE_PFLASH_128MBIT:
+
+        // turn off flexbus (nflash) apertures
+        SETFLD_REGMM32(APER_PCU_FBC0_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC1_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC2_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC3_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC4_CNTL, APERSIZE, 0);
+        SETFLD_REGMM32(APER_PCU_FBC5_CNTL, APERSIZE, 0);
+
+        // turn off sflash aperture
+        SETFLD_REGMM32(APER_PCU_SFLASH_CNTL, APERSIZE, 0);
+
+        // disable sflash registers
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN))  SETFLD_REGMM32(SFLASH_CNTL1, SEPST05_EN,  0);
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN))  SETFLD_REGMM32(SFLASH_CNTL1, SEPST10_EN,  0);
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN))  SETFLD_REGMM32(SFLASH_CNTL1, SEPISSI_EN,  0);
+        if(GETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN)) SETFLD_REGMM32(SFLASH_CNTL1, SEPATMEL_EN, 0);
+#ifndef CONFIG_STW4X225
+        if(GETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN)) SETFLD_REGMM32(SFLASH_CNTL2_STATUS, ST25P80_EN, 0);
+#endif
+
+        // set flexbus muxing to pflash
+        SETREG_REGMM32(FBUS_SELECT, 0x8);
+
+        // board specific switch to nand flash
+        sbdSelectNandFlash(mode);
+
+        // enable pflash registers for 32Mb chip
+        switch(mode)
+        {
+        case PCU_MODE_PFLASH_32MBIT:
+            SETFLD_REGMM32(PFLASH_CNTL, PF64MBIT_EN, 0);
+            SETFLD_REGMM32(PFLASH_CNTL, PF128MBIT_EN, 0);
+            SETFLD_REGMM32(PFLASH_CNTL, PF32MBIT_EN, 1);
+            break;
+        case PCU_MODE_PFLASH_64MBIT:
+            SETFLD_REGMM32(PFLASH_CNTL, PF32MBIT_EN, 0);
+            SETFLD_REGMM32(PFLASH_CNTL, PF128MBIT_EN, 0);
+            SETFLD_REGMM32(PFLASH_CNTL, PF64MBIT_EN, 1);
+            break;
+        case PCU_MODE_PFLASH_128MBIT:
+            SETFLD_REGMM32(PFLASH_CNTL, PF32MBIT_EN, 0);
+            SETFLD_REGMM32(PFLASH_CNTL, PF64MBIT_EN, 0);
+            SETFLD_REGMM32(PFLASH_CNTL, PF128MBIT_EN, 1);
+            break;
+        }
+
+        // turn on pflash aperture
+        SETFLD_REGMM32(APER_PCU_PFLASH_CNTL, APERSIZE, 0xB);
+
+        return 0;
+#endif
+    }
+
+    return -1;
+}
+
+
+
+
+/*****************************************************************************/
+
+int pcuInit(void)
+{
+    uint32 r;
+
+    printk("pcuInit start...\n");
+
+#if !defined(CONFIG_STWX220) && !defined(CONFIG_STW4X225)
+    sck_prescale = GETFLD_REGMM32(SFLASH_CNTL1, SCK_PRESCALE);
+#endif
+
+    SETREG_REGMM32(FBC_MSTORE0,  FBC_MSTORE0_VAL);
+    SETREG_REGMM32(FBC_MSTORE1,  FBC_MSTORE1_VAL);
+    SETREG_REGMM32(FBC_MSTORE2,  FBC_MSTORE2_VAL);
+    SETREG_REGMM32(FBC_MSTORE3,  FBC_MSTORE3_VAL);
+    SETREG_REGMM32(FBC_MSTORE4,  FBC_MSTORE4_VAL);
+    SETREG_REGMM32(FBC_MSTORE5,  FBC_MSTORE5_VAL);
+    SETREG_REGMM32(FBC_MSTORE6,  FBC_MSTORE6_VAL);
+    SETREG_REGMM32(FBC_MSTORE7,  FBC_MSTORE7_VAL);
+    SETREG_REGMM32(FBC_MSTORE8,  FBC_MSTORE8_VAL);
+    SETREG_REGMM32(FBC_MSTORE9,  FBC_MSTORE9_VAL);
+    SETREG_REGMM32(FBC_MSTORE10, FBC_MSTORE10_VAL);
+    SETREG_REGMM32(FBC_MSTORE11, FBC_MSTORE11_VAL);
+    SETREG_REGMM32(FBC_MSTORE12, FBC_MSTORE12_VAL);
+    SETREG_REGMM32(FBC_MSTORE13, FBC_MSTORE13_VAL);
+    SETREG_REGMM32(FBC_MSTORE14, FBC_MSTORE14_VAL);
+    SETREG_REGMM32(FBC_MSTORE15, FBC_MSTORE15_VAL);
+    SETREG_REGMM32(FBC_MSTORE16, FBC_MSTORE16_VAL);
+    SETREG_REGMM32(FBC_MSTORE17, FBC_MSTORE17_VAL);
+    SETREG_REGMM32(FBC_MSTORE18, FBC_MSTORE18_VAL);
+    SETREG_REGMM32(FBC_MSTORE19, FBC_MSTORE19_VAL);
+    SETREG_REGMM32(FBC_MSTORE20, FBC_MSTORE20_VAL);
+    SETREG_REGMM32(FBC_MSTORE21, FBC_MSTORE21_VAL);
+    SETREG_REGMM32(FBC_MSTORE22, FBC_MSTORE22_VAL);
+    SETREG_REGMM32(FBC_MSTORE23, FBC_MSTORE23_VAL);
+    SETREG_REGMM32(FBC_MSTORE24, FBC_MSTORE24_VAL);
+    SETREG_REGMM32(FBC_MSTORE25, FBC_MSTORE25_VAL);
+    SETREG_REGMM32(FBC_MSTORE26, FBC_MSTORE26_VAL);
+    SETREG_REGMM32(FBC_MSTORE27, FBC_MSTORE27_VAL);
+    SETREG_REGMM32(FBC_MSTORE28, FBC_MSTORE28_VAL);
+    SETREG_REGMM32(FBC_MSTORE29, FBC_MSTORE29_VAL);
+    SETREG_REGMM32(FBC_MSTORE30, FBC_MSTORE30_VAL);
+    SETREG_REGMM32(FBC_MSTORE31, FBC_MSTORE31_VAL);
+    SETREG_REGMM32(FBC_MSTORE32, FBC_MSTORE32_VAL);
+    SETREG_REGMM32(FBC_MSTORE33, FBC_MSTORE33_VAL);
+    SETREG_REGMM32(FBC_MSTORE34, FBC_MSTORE34_VAL);
+    SETREG_REGMM32(FBC_MSTORE35, FBC_MSTORE35_VAL);
+    SETREG_REGMM32(FBC_MSTORE36, FBC_MSTORE36_VAL);
+    SETREG_REGMM32(FBC_MSTORE37, FBC_MSTORE37_VAL);
+    SETREG_REGMM32(FBC_MSTORE38, FBC_MSTORE38_VAL);
+    SETREG_REGMM32(FBC_MSTORE39, FBC_MSTORE39_VAL);
+    SETREG_REGMM32(FBC_MSTORE40, FBC_MSTORE40_VAL);
+    SETREG_REGMM32(FBC_MSTORE41, FBC_MSTORE41_VAL);
+    SETREG_REGMM32(FBC_MSTORE42, FBC_MSTORE42_VAL);
+    SETREG_REGMM32(FBC_MSTORE43, FBC_MSTORE43_VAL);
+    SETREG_REGMM32(FBC_MSTORE44, FBC_MSTORE44_VAL);
+    SETREG_REGMM32(FBC_MSTORE45, FBC_MSTORE45_VAL);
+    SETREG_REGMM32(FBC_MSTORE46, FBC_MSTORE46_VAL);
+    SETREG_REGMM32(FBC_MSTORE47, FBC_MSTORE47_VAL);
+    SETREG_REGMM32(FBC_MSTORE48, FBC_MSTORE48_VAL);
+    SETREG_REGMM32(FBC_MSTORE49, FBC_MSTORE49_VAL);
+    SETREG_REGMM32(FBC_MSTORE50, FBC_MSTORE50_VAL);
+    SETREG_REGMM32(FBC_MSTORE51, FBC_MSTORE51_VAL);
+    SETREG_REGMM32(FBC_MSTORE52, FBC_MSTORE52_VAL);
+    SETREG_REGMM32(FBC_MSTORE53, FBC_MSTORE53_VAL);
+    SETREG_REGMM32(FBC_MSTORE54, FBC_MSTORE54_VAL);
+    SETREG_REGMM32(FBC_MSTORE55, FBC_MSTORE55_VAL);
+    SETREG_REGMM32(FBC_MSTORE56, FBC_MSTORE56_VAL);
+    SETREG_REGMM32(FBC_MSTORE57, FBC_MSTORE57_VAL);
+    SETREG_REGMM32(FBC_MSTORE58, FBC_MSTORE58_VAL);
+    SETREG_REGMM32(FBC_MSTORE59, FBC_MSTORE59_VAL);
+    SETREG_REGMM32(FBC_MSTORE60, FBC_MSTORE60_VAL);
+    SETREG_REGMM32(FBC_MSTORE61, FBC_MSTORE61_VAL);
+    SETREG_REGMM32(FBC_MSTORE62, FBC_MSTORE62_VAL);
+    SETREG_REGMM32(FBC_MSTORE63, FBC_MSTORE63_VAL);
+
+    r = WC_GETREG_REGMM32(FBC_APER0_CNTL);
+    WC_MODIFYFLD(r, FBC_APER0_CNTL, WRITEVEC, FBC0_WRITEVEC);
+    WC_MODIFYFLD(r, FBC_APER0_CNTL, READVEC, FBC0_READVEC);
+    WC_SETREG_REGMM32(FBC_APER0_CNTL, r);
+
+    r = WC_GETREG_REGMM32(FBC_APER1_CNTL);
+    WC_MODIFYFLD(r, FBC_APER1_CNTL, WRITEVEC, FBC1_WRITEVEC);
+    WC_MODIFYFLD(r, FBC_APER1_CNTL, READVEC, FBC1_READVEC);
+    WC_MODIFYFLD(r, FBC_APER1_CNTL, DBUSWIDTH, FBC1_DBUSWIDTH);
+    WC_MODIFYFLD(r, FBC_APER1_CNTL, ABUSLATCH, FBC1_ABUSLATCH);
+    WC_SETREG_REGMM32(FBC_APER1_CNTL, r);
+
+    r = WC_GETREG_REGMM32(FBC_APER2_CNTL);
+    WC_MODIFYFLD(r, FBC_APER2_CNTL, WRITEVEC, FBC2_WRITEVEC);
+    WC_MODIFYFLD(r, FBC_APER2_CNTL, READVEC, FBC2_READVEC);
+    WC_MODIFYFLD(r, FBC_APER2_CNTL, DBUSWIDTH, FBC2_DBUSWIDTH);
+    WC_MODIFYFLD(r, FBC_APER2_CNTL, ABUSLATCH, FBC2_ABUSLATCH);
+    WC_SETREG_REGMM32(FBC_APER2_CNTL, r);
+
+    r = WC_GETREG_REGMM32(FBC_APER3_CNTL);
+    WC_MODIFYFLD(r, FBC_APER3_CNTL, WRITEVEC, FBC3_WRITEVEC);
+    WC_MODIFYFLD(r, FBC_APER3_CNTL, READVEC, FBC3_READVEC);
+    WC_MODIFYFLD(r, FBC_APER3_CNTL, DBUSWIDTH, FBC3_DBUSWIDTH);
+    WC_MODIFYFLD(r, FBC_APER3_CNTL, ABUSLATCH, FBC3_ABUSLATCH);
+    WC_SETREG_REGMM32(FBC_APER3_CNTL, r);
+
+    r = WC_GETREG_REGMM32(FBC_APER4_CNTL);
+    WC_MODIFYFLD(r, FBC_APER4_CNTL, WRITEVEC, FBC4_WRITEVEC);
+    WC_MODIFYFLD(r, FBC_APER4_CNTL, READVEC, FBC4_READVEC);
+    WC_MODIFYFLD(r, FBC_APER4_CNTL, DBUSWIDTH, FBC4_DBUSWIDTH);
+    WC_MODIFYFLD(r, FBC_APER4_CNTL, ABUSLATCH, FBC4_ABUSLATCH);
+    WC_SETREG_REGMM32(FBC_APER4_CNTL, r);
+
+    r = WC_GETREG_REGMM32(FBC_APER5_CNTL);
+    WC_MODIFYFLD(r, FBC_APER5_CNTL, WRITEVEC, FBC5_WRITEVEC);
+    WC_MODIFYFLD(r, FBC_APER5_CNTL, READVEC, FBC5_READVEC);
+    WC_MODIFYFLD(r, FBC_APER5_CNTL, DBUSWIDTH, FBC5_DBUSWIDTH);
+    WC_MODIFYFLD(r, FBC_APER5_CNTL, ABUSLATCH, FBC5_ABUSLATCH);
+    WC_SETREG_REGMM32(FBC_APER5_CNTL, r);
+
+    pcuSetMode(PCU_MODE_FLEXBUS);
+
+    return 0;
+}
+
+int pcuFlexBusGetWidth(int aper)
+{
+    switch(aper)
+    {
+    case 0: return (GETFLD_REGMM32(FBC_APER0_CNTL, DBUSWIDTH) ? 16 : 8);
+    case 1: return (GETFLD_REGMM32(FBC_APER1_CNTL, DBUSWIDTH) ? 16 : 8);
+    case 2: return (GETFLD_REGMM32(FBC_APER2_CNTL, DBUSWIDTH) ? 16 : 8);
+    case 3: return (GETFLD_REGMM32(FBC_APER3_CNTL, DBUSWIDTH) ? 16 : 8);
+    case 4: return (GETFLD_REGMM32(FBC_APER4_CNTL, DBUSWIDTH) ? 16 : 8);
+    case 5: return (GETFLD_REGMM32(FBC_APER5_CNTL, DBUSWIDTH) ? 16 : 8);
+    }
+
+    return 0;
+}
+
+/*****************************************************************************/
+
+void pcuFlexBusWrite8(uint32 aper, uint32 offset, uint32 value)
+{
+    switch(aper)
+    {
+    case 0: SETMEM_PCU0MM8(offset, value); break;
+    case 1: SETMEM_PCU1MM8(offset, value); break;
+    case 2: SETMEM_PCU2MM8(offset, value); break;
+    case 3: SETMEM_PCU3MM8(offset, value); break;
+    case 4: SETMEM_PCU4MM8(offset, value); break;
+    case 5: SETMEM_PCU5MM8(offset, value); break;
+    }
+}
+
+/*****************************************************************************/
+
+void pcuFlexBusWrite16(uint32 aper, uint32 offset, uint32 value)
+{
+    switch(aper)
+    {
+    case 0: SETMEM_PCU0MM16(offset, value); break;
+    case 1: SETMEM_PCU1MM16(offset, value); break;
+    case 2: SETMEM_PCU2MM16(offset, value); break;
+    case 3: SETMEM_PCU3MM16(offset, value); break;
+    case 4: SETMEM_PCU4MM16(offset, value); break;
+    case 5: SETMEM_PCU5MM16(offset, value); break;
+    }
+}
+
+/*****************************************************************************/
+
+void pcuFlexBusWrite32(uint32 aper, uint32 offset, uint32 value)
+{
+    switch(aper)
+    {
+    case 0: SETMEM_PCU0MM32(offset, value); break;
+    case 1: SETMEM_PCU1MM32(offset, value); break;
+    case 2: SETMEM_PCU2MM32(offset, value); break;
+    case 3: SETMEM_PCU3MM32(offset, value); break;
+    case 4: SETMEM_PCU4MM32(offset, value); break;
+    case 5: SETMEM_PCU5MM32(offset, value); break;
+    }
+}
+
+/*****************************************************************************/
+
+uint32 pcuFlexBusRead8(uint32 aper, uint32 offset)
+{
+    switch(aper)
+    {
+    case 0: return GETMEM_PCU0MM8(offset);
+    case 1: return GETMEM_PCU1MM8(offset);
+    case 2: return GETMEM_PCU2MM8(offset);
+    case 3: return GETMEM_PCU3MM8(offset);
+    case 4: return GETMEM_PCU4MM8(offset);
+    case 5: return GETMEM_PCU5MM8(offset);
+    }
+
+    return 0;
+}
+
+/*****************************************************************************/
+
+uint32 pcuFlexBusRead16(uint32 aper, uint32 offset)
+{
+    switch(aper)
+    {
+    case 0: return GETMEM_PCU0MM16(offset);
+    case 1: return GETMEM_PCU1MM16(offset);
+    case 2: return GETMEM_PCU2MM16(offset);
+    case 3: return GETMEM_PCU3MM16(offset);
+    case 4: return GETMEM_PCU4MM16(offset);
+    case 5: return GETMEM_PCU5MM16(offset);
+    }
+
+    return 0;
+}
+
+/*****************************************************************************/
+
+uint32 pcuFlexBusRead32(uint32 aper, uint32 offset)
+{
+    switch(aper)
+    {
+    case 0: return GETMEM_PCU0MM32(offset);
+    case 1: return GETMEM_PCU1MM32(offset);
+    case 2: return GETMEM_PCU2MM32(offset);
+    case 3: return GETMEM_PCU3MM32(offset);
+    case 4: return GETMEM_PCU4MM32(offset);
+    case 5: return GETMEM_PCU5MM32(offset);
+    }
+
+    return 0;
+}
+
+
+void sbdSelectFlexBus(void)
+{
+    sbdSelectNandFlash(pflashGetPcuMode());
+}
+
+void sbdSelectNandFlash(int mode)
+{
+    uint32 r;
+    uint32 bootrom_straps = GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK;
+
+    // select pflash by setting GPIO10 if booted from NAND flash
+    r = GETREG_REGMM32(GPIO_SEL);
+    r &= ~((1<<GPIOSEL__1394_TRANSPORT)|(1<<GPIOSEL__DEBUG_BUS_A));
+    SETREG_REGMM32(GPIO_SEL, r);
+
+    r = GETREG_REGMM32(GPIOA_DIR);
+    r |= (1<<10);
+    SETREG_REGMM32(GPIOA_DIR, r);
+
+    r = GETREG_REGMM32(GPIOA_MASK);
+    r |= (1<<10);
+    SETREG_REGMM32(GPIOA_MASK, r);
+
+    r = GETREG_REGMM32(GPIOA_DATA);
+
+    switch(bootrom_straps)
+    {
+    case STRAPS__BOOTROM_SEL__NAND_32Mb:
+    case STRAPS__BOOTROM_SEL__NAND_64Mb:
+    case STRAPS__BOOTROM_SEL__NAND_128Mb:  r |= (1<<10);   break;
+    default:                               r &= ~(1<<10);  break;
+    }
+
+    SETREG_REGMM32(GPIOA_DATA, r);
+}
+
+/*****************************************************************************/
+
+void sbdSelectSerialFlash(int mode)
+{
+    uint32 r;
+    uint32 bootrom_straps = GETREG_REGMM32(STRAPS_VALUE) & STRAPS__BOOTROM_SEL__MASK;
+
+    // select sflash setting GPIO10 if booted from serial flash
+    r = GETREG_REGMM32(GPIO_SEL);
+    r &= ~((1<<GPIOSEL__1394_TRANSPORT)|(1<<GPIOSEL__DEBUG_BUS_A));
+    SETREG_REGMM32(GPIO_SEL, r);
+
+    r = GETREG_REGMM32(GPIOA_DIR);
+    r |= (1<<10);
+    SETREG_REGMM32(GPIOA_DIR, r);
+
+    r = GETREG_REGMM32(GPIOA_MASK);
+    r |= (1<<10);
+    SETREG_REGMM32(GPIOA_MASK, r);
+
+    r = GETREG_REGMM32(GPIOA_DATA);
+
+    switch(bootrom_straps)
+    {
+    case STRAPS__BOOTROM_SEL__ST_M25P05:
+    case STRAPS__BOOTROM_SEL__ST_M25P10:
+    case STRAPS__BOOTROM_SEL__ST_M25P20:
+    case STRAPS__BOOTROM_SEL__ST_M25P40:
+    case STRAPS__BOOTROM_SEL__ST_M25P80:
+    case STRAPS__BOOTROM_SEL__NEXTFLASH_NX25F011:
+    case STRAPS__BOOTROM_SEL__ATMEL_AT25F1024:     r |= (1<<10);   break;
+    default:                                       r &= ~(1<<10);  break;
+    }
+
+    SETREG_REGMM32(GPIOA_DATA, r);
+}
+

--------------BE86F1651CE9EF596226829F--
