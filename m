MIME-Version: 1.0
Date: Fri, 25 Sep 2009 07:57:55 -0400
Message-ID: <771cded00909250457w19686a53obdc178488368dd43@mail.gmail.com>
Subject: [PATCH 1/5] pxa3xx_nand: enable PXA3xx bad block management
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary=001517741a149782d2047465a8bf
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001517741a149782d2047465a8bf
Content-Type: multipart/alternative; boundary=001517741a149782ca047465a8bd

--001517741a149782ca047465a8bd
Content-Type: text/plain; charset=ISO-8859-1

>From 7e5bbb5082ef2afaab0966d60530af4131c0c4ee Mon Sep 17 00:00:00 2001
From: Haojian Zhuang <haojian.zhuang@marvell.com>
Date: Fri, 25 Sep 2009 15:00:28 -0400
Subject: [PATCH] [MTD] [NAND] pxa3xx_nand: enable PXA3xx bad block
management

There's a custom bad block management in PXA3xx series.

This BBM needs to allocate a reserved area at the bottom of NAND chip.
The reserved area should be protected from normal usage. The first block
of NAND is also reserved in order to storing the relocation information.

When NAND controller finds a bad block, it marks the block as bad and
allocate a unused block from reserved area in bottom. The new block is
used to replace the original bad one. From OS view, there's no bad block
at the time. It's handled by NAND driver. Then driver records the
replacement
in the first block.

The reserved area is also called as relocation area. It occupies 2% of
the whole NAND space.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h |   62 ++++
 drivers/mtd/Kconfig                         |    6 +
 drivers/mtd/Makefile                        |    1 +
 drivers/mtd/nand/pxa3xx_nand.c              |  124 ++++++++
 drivers/mtd/pxa3xx_bbm.c                    |  427
+++++++++++++++++++++++++++
 5 files changed, 620 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h
 create mode 100644 drivers/mtd/pxa3xx_bbm.c

diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h
b/arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h
new file mode 100644
index 0000000..8508547
--- /dev/null
+++ b/arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h
@@ -0,0 +1,62 @@
+#ifndef    __PXA3XX_BBT_H__
+#define    __PXA3XX_BBT_H__
+
+#include <linux/types.h>
+
+#define PXA_RLTABLE_HEADER        (0x524e)
+#define PXA_MAX_RLENTRY            (127)
+#define PXA_MAX_SLOT            (40)
+#define PXA_BEGIN_SLOT            (2)
+#define PXA_BBM_MAGIC            (0x4c56524d)    /* MRVL */
+
+enum {
+    PXA3xx_BBM_NAND = 0,
+    PXA3xx_BBM_ONENAND,
+    PXA3xx_BBM_INVALID = -1,
+};
+
+struct relocate_entry {
+    unsigned short from;
+    unsigned short to;
+};
+
+struct relocate_table {
+    unsigned short header;
+    unsigned short total;
+};
+
+struct pxa3xx_bbm {
+    int            magic;
+    /*
+     * NOTES: this field impact the partition table. Please make sure
+     * that this value align with partitions definition.
+     */
+    int            max_relocate_entry;
+    int            max_slots;
+    int            current_slot;
+
+    void            *data_buf;
+
+    /*
+     * These two fields should be in (one)nand_chip. Add here to handle
+     * onenand_chip and nand_chip at the same time.
+     */
+    int            page_shift;
+    int            erase_shift;
+
+    struct relocate_table    *table;
+    struct relocate_entry    *entry;
+
+    void    (*uninit)(struct mtd_info *mtd);
+    loff_t    (*search)(struct mtd_info *mtd,    loff_t ofs);
+    int    (*block_markbad)(struct mtd_info *mtd, int block);
+    int    (*scan_bbt)(struct mtd_info *mtd);
+};
+
+extern int verify_nand_bbm(struct mtd_info *mtd, struct pxa3xx_bbm **bbm);
+extern int verify_onenand_bbm(struct mtd_info *mtd, struct pxa3xx_bbm
**bbm);
+extern int nand_badblockpos(struct mtd_info *mtd);
+extern int onenand_badblockpos(struct mtd_info *mtd);
+extern struct pxa3xx_bbm *pxa3xx_query_bbm(void);
+#endif
+
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b8e35a0..3cdf7bf 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -315,6 +315,12 @@ config MTD_OOPS
       To use, add console=ttyMTDx to the kernel command line,
       where x is the MTD device number to use.

+config PXA3xx_BBM
+    bool "Marvell PXA3xx Bad Block Management"
+    depends on MTD && (MTD_NAND || MTD_ONENAND)
+    help
+      This enables Marvell Bad block management on NAND/ONENAND on PXA3xx.
+
 source "drivers/mtd/chips/Kconfig"

 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 82d1e4d..e637fa0 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_INFTL)        += inftl.o
 obj-$(CONFIG_RFD_FTL)        += rfd_ftl.o
 obj-$(CONFIG_SSFDC)        += ssfdc.o
 obj-$(CONFIG_MTD_OOPS)        += mtdoops.o
+obj-$(CONFIG_PXA3xx_BBM)    += pxa3xx_bbm.o

 nftl-objs        := nftlcore.o nftlmount.o
 inftl-objs        := inftlcore.o inftlmount.o
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 134bfbc..d6c9524 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -24,6 +24,10 @@
 #include <mach/dma.h>
 #include <plat/pxa3xx_nand.h>

+#ifdef CONFIG_PXA3xx_BBM
+#include <plat/pxa3xx_bbm.h>
+#endif
+
 #define    CHIP_DELAY_TIMEOUT    (2 * HZ/10)

 /* registers and bit definitions */
@@ -112,6 +116,14 @@ enum {

 struct pxa3xx_nand_info {
     struct nand_chip    nand_chip;
+#ifdef CONFIG_PXA3xx_BBM
+    /*
+     * Restriction: nand_chip should be the first one of pxa3xx_nand_info.
+     * bbm should be the second one of pxa3xx_nand_info.
+     * Marvell PXA3xx BBM always access this field to get bbm.
+     */
+    struct pxa3xx_bbm    *bbm;
+#endif

     struct platform_device     *pdev;
     const struct pxa3xx_nand_flash *flash_info;
@@ -365,6 +377,8 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] =
{
 /* convert nand flash controller clock cycles to nano-seconds */
 #define cycle2ns(c, clk)    ((((c) + 1) * 1000000 + clk / 500) / (clk /
1000))

+static int pxa3xx_nand_relocate_addr(struct mtd_info *mtd, int page_addr);
+
 static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
                    const struct pxa3xx_nand_timing *t)
 {
@@ -706,6 +720,8 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd,
unsigned command,

     init_completion(&info->cmd_complete);

+    page_addr = pxa3xx_nand_relocate_addr(mtd, page_addr);
+
     switch (command) {
     case NAND_CMD_READOOB:
         /* disable HW ECC to get all the OOB data */
@@ -1165,6 +1181,113 @@ static struct nand_ecclayout hw_largepage_ecclayout
= {
     .oobfree = { {2, 38} }
 };

+#ifdef CONFIG_PXA3xx_BBM
+int verify_nand_bbm(struct mtd_info *mtd, struct pxa3xx_bbm **bbm)
+{
+    struct nand_chip *info = mtd->priv;
+    struct pxa3xx_bbm **nbbm = NULL;
+
+    /* check whether current flash is nand */
+    nbbm = (struct pxa3xx_bbm **)(++info);
+    if (((unsigned int)nbbm < PAGE_OFFSET)
+        || ((unsigned int)*nbbm < PAGE_OFFSET))
+        return PXA3xx_BBM_INVALID;
+
+    if ((*nbbm)->magic == PXA_BBM_MAGIC) {
+        pr_debug("%s:Found Nand flash.\n", __func__);
+        *bbm = *nbbm;
+        return PXA3xx_BBM_NAND;
+    }
+    return PXA3xx_BBM_INVALID;
+}
+
+static int pxa3xx_nand_relocate_addr(struct mtd_info *mtd, int page_addr)
+{
+    struct pxa3xx_nand_info *info = mtd->priv;
+    struct pxa3xx_bbm *bbm = info->bbm;
+    loff_t addr;
+    int ret;
+
+    addr = page_addr << bbm->page_shift;
+    addr = bbm->search(mtd, addr);
+    ret = addr >> bbm->page_shift;
+    return ret;
+}
+
+static int pxa3xx_nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+    struct pxa3xx_nand_info *info = mtd->priv;
+    struct pxa3xx_bbm *bbm = info->bbm;
+    struct nand_chip *chip = mtd->priv;
+    uint8_t buf[2] = { 0, 0 };
+    int block, ret;
+
+    /* Get block number */
+    block = (int)(ofs >> chip->bbt_erase_shift);
+
+    /* We write two bytes, so we dont have to mess with 16 bit
+     * access
+     */
+    ofs += mtd->oobsize;
+    chip->ops.len = chip->ops.ooblen = 2;
+    chip->ops.datbuf = NULL;
+    chip->ops.oobbuf = buf;
+    chip->ops.ooboffs = chip->badblockpos & ~0x01;
+
+    ret = mtd->write_oob(mtd, ofs, &chip->ops);
+
+    if (!ret)
+        mtd->ecc_stats.badblocks++;
+
+    return bbm->block_markbad(mtd, block);
+}
+
+static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
+                 struct pxa3xx_nand_info *info)
+{
+    const struct pxa3xx_nand_flash *f = info->flash_info;
+    struct nand_chip *this = &info->nand_chip;
+    struct pxa3xx_bbm *bbm = NULL;
+
+    this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16: 0;
+
+    this->waitfunc        = pxa3xx_nand_waitfunc;
+    this->select_chip    = pxa3xx_nand_select_chip;
+    this->dev_ready        = pxa3xx_nand_dev_ready;
+    this->cmdfunc        = pxa3xx_nand_cmdfunc;
+    this->read_word        = pxa3xx_nand_read_word;
+    this->read_byte        = pxa3xx_nand_read_byte;
+    this->read_buf        = pxa3xx_nand_read_buf;
+    this->write_buf        = pxa3xx_nand_write_buf;
+    this->verify_buf    = pxa3xx_nand_verify_buf;
+
+    this->ecc.mode        = NAND_ECC_HW;
+    this->ecc.hwctl        = pxa3xx_nand_ecc_hwctl;
+    this->ecc.calculate    = pxa3xx_nand_ecc_calculate;
+    this->ecc.correct    = pxa3xx_nand_ecc_correct;
+    this->ecc.size        = f->page_size;
+
+    if (f->page_size == 2048)
+        this->ecc.layout = &hw_largepage_ecclayout;
+    else
+        this->ecc.layout = &hw_smallpage_ecclayout;
+
+    this->chip_delay = 25;
+
+    bbm = pxa3xx_query_bbm();
+    if (bbm) {
+        /* Marvell PXA3xx BBM is initialized successfully */
+        info->bbm = bbm;
+        this->scan_bbt = bbm->scan_bbt;
+        this->block_markbad = pxa3xx_nand_block_markbad;
+    }
+}
+#else
+static int pxa3xx_nand_relocate_addr(struct mtd_info *mtd, int page_addr)
+{
+    return page_addr;
+}
+
 static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
                  struct pxa3xx_nand_info *info)
 {
@@ -1196,6 +1319,7 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,

     this->chip_delay = 25;
 }
+#endif

 static int pxa3xx_nand_probe(struct platform_device *pdev)
 {
diff --git a/drivers/mtd/pxa3xx_bbm.c b/drivers/mtd/pxa3xx_bbm.c
new file mode 100644
index 0000000..bcc9a35
--- /dev/null
+++ b/drivers/mtd/pxa3xx_bbm.c
@@ -0,0 +1,427 @@
+/*
+ * linux/drivers/mtd/pxa3xx_bbm.c
+ *
+ * Support bad block management on PXA3xx.
+ * Copyright (C) 2007 Marvell International Ltd.
+ *
+ * Haojian Zhuang <haojian.zhuang@marvell.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <plat/pxa3xx_bbm.h>
+#include <asm/errno.h>
+
+static struct pxa3xx_bbm *pxa3xx_bbm = NULL;
+
+/*
+ * bbm should be the next field of nand_chip or onenand_chip.
+ */
+static int verify_bbm_magic(struct mtd_info *mtd, struct pxa3xx_bbm **bbm)
+{
+    int ret;
+
+    ret = verify_nand_bbm(mtd, bbm);
+    return ret;
+}
+
+static void dump_rltable(struct pxa3xx_bbm *bbm)
+{
+    int i;
+
+    if (bbm->table->total == 0) {
+        pr_info("The relocation table is empty now\n");
+        return;
+    }
+    for (i = 0; i < bbm->table->total; i++) {
+        if (bbm->entry[i].from == (unsigned short)(-1))
+            continue;
+        if (bbm->entry[i].to == (unsigned short)(-1))
+            pr_info("(%4d): block #%d is bad in relocation area\n",
+                i, bbm->entry[i].from);
+        else
+            pr_info("(%4d): block #%d is relocated to #%d\n",
+                i, bbm->entry[i].from, bbm->entry[i].to);
+    }
+}
+
+/* Initialize the relocation table */
+static int pxa3xx_init_rltable(struct mtd_info *mtd)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+    int size = mtd->writesize + mtd->oobsize;
+    int pages, entries;
+
+    if (verify_bbm_magic(mtd, &bbm) < 0) {
+        /* BBM don't support this type of flash */
+        return -EINVAL;
+    }
+
+    bbm->page_shift = ffs(mtd->writesize) - 1;
+    bbm->erase_shift = ffs(mtd->erasesize) - 1;
+
+    pages = mtd->erasesize >> bbm->page_shift;
+
+    entries = mtd->size >> bbm->erase_shift;
+    entries = (entries * 2) / 100;
+    if (mtd->writesize == 512)
+        entries = (entries < PXA_MAX_RLENTRY) ? entries
+              : PXA_MAX_RLENTRY;
+
+    bbm->max_slots    = PXA_MAX_SLOT;
+    bbm->max_relocate_entry = entries;
+    bbm->current_slot = -1;
+
+    bbm->data_buf = kzalloc(size, GFP_KERNEL);
+    if (bbm->data_buf == NULL)
+        return -ENOMEM;
+
+    bbm->table = (struct relocate_table *)bbm->data_buf;
+    memset(bbm->table, 0, sizeof(struct relocate_table));
+
+    bbm->entry = (struct relocate_entry *)((uint8_t *)bbm->data_buf +
+            sizeof(struct relocate_entry));
+    memset(bbm->entry, 0, sizeof(struct relocate_entry)
+        * bbm->max_relocate_entry);
+
+    return 0;
+}
+
+/* Uninitialize the relocation table */
+static void pxa3xx_uninit_rltable(struct mtd_info *mtd)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+
+    if (verify_bbm_magic(mtd, &bbm) < 0) {
+        /* BBM don't support this flash type */
+        return;
+    }
+
+    if (bbm) {
+        kfree(bbm->data_buf);
+        bbm = NULL;
+    }
+}
+
+/*
+ * Move larger data to left of pivot, and move smaller data to right of
+ * pivot.
+ */
+static int partition(unsigned short *array, int left, int right, int
pivot_idx)
+{
+    int i, pivot, base_idx;
+
+    pivot = array[pivot_idx];
+    swap(array[left], array[right]);
+    base_idx = left;
+
+    for (i = left; i < right; i++) {
+        if (array[i] > pivot) {
+            swap(array[i], array[base_idx]);
+            base_idx++;
+        }
+    }
+    if (base_idx < right)
+        swap(array[base_idx], array[right]);
+    return base_idx;
+}
+
+static int quick_sort(unsigned short *array, int left, int right)
+{
+    int pivot_idx, new_idx;
+    if (right > left) {
+        pivot_idx = left;
+        new_idx = partition(array, left, right, pivot_idx);
+        quick_sort(array, left, new_idx - 1);
+        quick_sort(array, new_idx + 1, right);
+    }
+    return 0;
+}
+
+/*
+ * Add the relocation entry into the relocation table. If the relocated
block
+ * is bad, an new entry will be added into the bottom of the relocation
table.
+ */
+int update_rltable(struct mtd_info *mtd, int block)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+    struct relocate_table *table = NULL;
+    struct relocate_entry *entry = NULL;
+    struct erase_info instr;
+    unsigned short array[PXA_MAX_RLENTRY], addr;
+    int i, idx, ret, relocated_idx = -1;
+
+    if (verify_bbm_magic(mtd, &bbm) < 0) {
+        /* BBM don't support this type of flash */
+        return -EINVAL;
+    }
+
+    table = bbm->table;
+    entry = bbm->entry;
+
+    /* identify whether the block has been relocated */
+    for (i = 0; i < table->total; i++) {
+        if (entry[i].from == (unsigned short)(-1))
+            continue;
+        if (block == entry[i].from) {
+            relocated_idx = i;
+            break;
+        }
+    }
+
+scan:
+    if (table->total > bbm->max_relocate_entry) {
+        pr_warning("Relocation entries exceed max num. Can't relocate");
+        pr_warning(" block 0x%x\n", block);
+        return -ENOSPC;
+    }
+
+    memset(array, 0, PXA_MAX_RLENTRY);
+    /* Get all index of relocated blocks */
+    for (i = 0, idx = 0; i < table->total; i++) {
+        array[idx] = (entry[i].to != (unsigned short)(-1)) ? entry[i].to
+                : entry[i].from;
+        idx++;
+    }
+    /* sort array with descending order */
+    quick_sort(array, 0, idx - 1);
+    /*
+     * find the available block with the largest number in reservered
+     * area
+     */
+    addr = (unsigned short)((mtd->size >> bbm->erase_shift) - 1);
+    for (i = 0; i < bbm->max_relocate_entry; i++, addr--) {
+        if (addr < ((mtd->size >> bbm->erase_shift)
+            - bbm->max_relocate_entry)) {
+            pr_warning("Relocation area is already full!\n");
+            return -ENOSPC;
+        }
+        if (array[i] < addr) {
+            memset(&instr, 0, sizeof(struct erase_info));
+            instr.mtd = mtd;
+            instr.addr = addr << bbm->erase_shift;
+            instr.len = 1 << bbm->erase_shift;
+            ret = mtd->erase(mtd, &instr);
+            if (ret == 0) {
+                /* fill the recorder into relocation table */
+                if (relocated_idx == -1) {
+                    /* new entry in relocation table */
+                    entry[table->total].from = block;
+                    entry[table->total].to = addr;
+                    table->total++;
+                    goto done;
+                } else {
+                    /* update entry in relocation table */
+                    entry[table->total].from
+                        = entry[relocated_idx].to;
+                    entry[table->total].to
+                        = (unsigned short)(-1);
+                    table->total++;
+                    entry[relocated_idx].to = addr;
+                    goto done;
+                }
+            } else {
+                /* append new bad entry */
+                entry[table->total].from = addr;
+                entry[table->total].to = (unsigned short)(-1);
+                table->total++;
+                goto scan;
+            }
+        }
+    }
+
+done:
+    return 0;
+}
+
+/* Write the relocation table back to device, if there's room. */
+static int sync_rltable(struct mtd_info *mtd, int *idx)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+    unsigned char *tmp;
+    size_t retlen;
+    int len, pages;
+
+    if (verify_bbm_magic(mtd, &bbm) < 0) {
+        /* BBM don't support this type of flash */
+        return -EINVAL;
+    }
+
+    pages = mtd->erasesize >> bbm->page_shift;
+    if ((*idx >= pages) || (*idx <= (pages - bbm->max_slots))) {
+        printk(KERN_ERR "Wrong Slot is specified.\n");
+        return -EINVAL;
+    }
+
+    /* should write to the next slot*/
+    (*idx)--;
+
+    len = 4;        /* table header */
+    len += bbm->table->total << 2;
+
+    tmp = (unsigned char *)bbm->data_buf;
+    mtd->write(mtd, (*idx) << bbm->page_shift,
+           1 << bbm->page_shift, &retlen, tmp);
+
+    return 0;
+}
+
+static int pxa3xx_scan_rltable(struct mtd_info *mtd)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+    struct relocate_table *table;
+    int page, max_page;
+    size_t retlen;
+    int ret, retry_count = 3;
+
+    if (verify_bbm_magic(mtd, &bbm) < 0) {
+        /* BBM don't support this type of flash */
+        return -EINVAL;
+    }
+
+    pxa3xx_init_rltable(mtd);
+
+    table = bbm->table;
+
+    bbm->current_slot = -1;
+    page = (mtd->erasesize >> bbm->page_shift) - bbm->max_slots;
+    max_page = mtd->erasesize >> bbm->page_shift;
+    for (; page < max_page; page++, retry_count = 3) {
+retry:
+        memset(bbm->data_buf, 0, mtd->writesize + mtd->oobsize);
+        ret = mtd->read(mtd, (page << bbm->page_shift),
+                mtd->writesize, &retlen, bbm->data_buf);
+        if (ret == 0) {
+            if (table->header == PXA_RLTABLE_HEADER) {
+                bbm->current_slot = page;
+                break;
+            }
+        } else {
+            if (retry_count--)
+                goto retry;
+        }
+    }
+    if (bbm->current_slot != -1) {
+        pr_debug("Found relocation table at page:%d\n",
+            bbm->current_slot);
+        dump_rltable(bbm);
+    } else {
+        pr_err("Can't recognize relocation table.\n");
+        pr_err("CAUTION: It may cause unpredicated error\n");
+        pr_err("Please re-initialize the flash.\n");
+        memset((unsigned char *)bbm->table, 0,
+            sizeof(struct relocate_table));
+        return -EFAULT;
+    }
+    return 0;
+}
+
+/*
+ * Find the relocated block of the bad one.
+ * If it's a good block, return 0. Otherwise, return a relocated one.
+ * idx points to the next relocation entry
+ * If the relocated block is bad, an new entry will be added into the
+ * bottom of the relocation table.
+ */
+static loff_t pxa3xx_search_rlentry(struct mtd_info *mtd, loff_t ofs)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+    struct relocate_table *table = NULL;
+    struct relocate_entry *entry = NULL;
+    int i, block;
+
+    /*
+     * In SLC, block 0 shouldn't be broken.
+     * In some command, address is assigned to 0 if it doesn't need
+     * to operate address. So just skip it.
+     */
+    if (ofs <= 0)
+        return ofs;
+
+    if (verify_bbm_magic(mtd, &bbm) < 0)
+        return ofs;
+
+    table = bbm->table;
+    entry = bbm->entry;
+
+    block = ofs >> bbm->erase_shift;
+
+    if ((bbm->current_slot == -1) || (table->total <= 0)
+        || (block >= (mtd->size >> bbm->erase_shift)))
+        return ofs;
+
+    ofs = ofs - (block << bbm->erase_shift);    /* save offset */
+
+    for (i = 0; i < table->total; i++) {
+        if (block == entry[i].from) {
+            block = entry[i].to;
+            break;
+        }
+    }
+    ofs += block << bbm->erase_shift;
+    return ofs;
+}
+
+static int pxa3xx_mark_rlentry(struct mtd_info *mtd, int block)
+{
+    struct pxa3xx_bbm *bbm = NULL;
+    int ret = 0;
+
+    ret = verify_bbm_magic(mtd, &bbm);
+    if (ret < 0) {
+        /* BBM don't support this type of flash */
+        return -EINVAL;
+    }
+
+    ret = update_rltable(mtd, block);
+    if (ret)
+        return ret;
+
+    return sync_rltable(mtd, &(bbm->current_slot));
+}
+
+/* If Marvell BBM is used, return 0. Otherwise, return negative value. */
+struct pxa3xx_bbm *pxa3xx_query_bbm(void)
+{
+    if (pxa3xx_bbm)
+        return pxa3xx_bbm;
+    return NULL;
+}
+EXPORT_SYMBOL(pxa3xx_query_bbm);
+
+static int __init pxa3xx_bbm_init(void)
+{
+    struct pxa3xx_bbm *bbm;
+
+    bbm = kzalloc(sizeof(struct pxa3xx_bbm), GFP_KERNEL);
+    if (!bbm)
+        return -ENOMEM;
+
+    bbm->magic        = PXA_BBM_MAGIC;
+    bbm->uninit        = pxa3xx_uninit_rltable;
+    bbm->search        = pxa3xx_search_rlentry;
+    bbm->block_markbad    = pxa3xx_mark_rlentry;
+    bbm->scan_bbt        = pxa3xx_scan_rltable;
+
+    pxa3xx_bbm = bbm;
+
+    return 0;
+}
+subsys_initcall(pxa3xx_bbm_init);
+
+static void pxa3xx_bbm_exit(void)
+{
+    if (pxa3xx_bbm) {
+        kfree(pxa3xx_bbm);
+        pxa3xx_bbm = NULL;
+    }
+}
+module_exit(pxa3xx_bbm_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Marvell PXA3xx Bad Block Management");
-- 
1.5.6.5

--001517741a149782ca047465a8bd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From 7e5bbb5082ef2afaab0966d60530af4131c0c4ee Mon Sep 17 00:00:00 2001<br>F=
rom: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haoji=
an.zhuang@marvell.com</a>&gt;<br>Date: Fri, 25 Sep 2009 15:00:28 -0400<br>
Subject: [PATCH] [MTD] [NAND] pxa3xx_nand: enable PXA3xx bad block manageme=
nt<br><br>There&#39;s a custom bad block management in PXA3xx series.<br><b=
r>This BBM needs to allocate a reserved area at the bottom of NAND chip.<br=
>
The reserved area should be protected from normal usage. The first block<br=
>of NAND is also reserved in order to storing the relocation information.<b=
r><br>When NAND controller finds a bad block, it marks the block as bad and=
<br>
allocate a unused block from reserved area in bottom. The new block is<br>u=
sed to replace the original bad one. From OS view, there&#39;s no bad block=
<br>at the time. It&#39;s handled by NAND driver. Then driver records the r=
eplacement<br>
in the first block.<br><br>The reserved area is also called as relocation a=
rea. It occupies 2% of<br>the whole NAND space.<br><br>Signed-off-by: Haoji=
an Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haojian.zhuang@=
marvell.com</a>&gt;<br>
---<br>=A0arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h |=A0=A0 62 ++++<br>=
=A0drivers/mtd/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 6 +<br>=A0drivers/mtd/Makefile=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 1 +<br=
>=A0drivers/mtd/nand/pxa3xx_nand.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 124 ++++++++<br>
=A0drivers/mtd/pxa3xx_bbm.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 427 +++++++++++++++++++++++++++<br>=A05 files changed, 620 i=
nsertions(+), 0 deletions(-)<br>=A0create mode 100644 arch/arm/plat-pxa/inc=
lude/plat/pxa3xx_bbm.h<br>=A0create mode 100644 drivers/mtd/pxa3xx_bbm.c<br=
>
<br>diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_bbm.h b/arch/arm/pla=
t-pxa/include/plat/pxa3xx_bbm.h<br>new file mode 100644<br>index 0000000..8=
508547<br>--- /dev/null<br>+++ b/arch/arm/plat-pxa/include/plat/pxa3xx_bbm.=
h<br>
@@ -0,0 +1,62 @@<br>+#ifndef=A0=A0=A0 __PXA3XX_BBT_H__<br>+#define=A0=A0=A0=
 __PXA3XX_BBT_H__<br>+<br>+#include &lt;linux/types.h&gt;<br>+<br>+#define =
PXA_RLTABLE_HEADER=A0=A0=A0 =A0=A0=A0 (0x524e)<br>+#define PXA_MAX_RLENTRY=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 (127)<br>
+#define PXA_MAX_SLOT=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 (40)<br>+#define PXA_BEG=
IN_SLOT=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 (2)<br>+#define PXA_BBM_MAGIC=A0=A0=A0=
 =A0=A0=A0 =A0=A0=A0 (0x4c56524d)=A0=A0=A0 /* MRVL */<br>+<br>+enum {<br>+=
=A0=A0=A0 PXA3xx_BBM_NAND =3D 0,<br>+=A0=A0=A0 PXA3xx_BBM_ONENAND,<br>+=A0=
=A0=A0 PXA3xx_BBM_INVALID =3D -1,<br>
+};<br>+<br>+struct relocate_entry {<br>+=A0=A0=A0 unsigned short from;<br>=
+=A0=A0=A0 unsigned short to;<br>+};<br>+<br>+struct relocate_table {<br>+=
=A0=A0=A0 unsigned short header;<br>+=A0=A0=A0 unsigned short total;<br>+};=
<br>+<br>+struct pxa3xx_bbm {<br>
+=A0=A0=A0 int=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 magic;<br>+=A0=A0=A0 /*<br>+=A0=
=A0=A0 =A0* NOTES: this field impact the partition table. Please make sure<=
br>+=A0=A0=A0 =A0* that this value align with partitions definition.<br>+=
=A0=A0=A0 =A0*/<br>+=A0=A0=A0 int=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 max_relocate=
_entry;<br>
+=A0=A0=A0 int=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 max_slots;<br>+=A0=A0=A0 int=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 current_slot;<br>+<br>+=A0=A0=A0 void=A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 *data_buf;<br>+<br>+=A0=A0=A0 /*<br>+=A0=A0=A0 =A0* The=
se two fields should be in (one)nand_chip. Add here to handle<br>+=A0=A0=A0=
 =A0* onenand_chip and nand_chip at the same time.<br>
+=A0=A0=A0 =A0*/<br>+=A0=A0=A0 int=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 page_shift;=
<br>+=A0=A0=A0 int=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 erase_shift;<br>+<br>+=A0=
=A0=A0 struct relocate_table=A0=A0=A0 *table;<br>+=A0=A0=A0 struct relocate=
_entry=A0=A0=A0 *entry;<br>+<br>+=A0=A0=A0 void=A0=A0=A0 (*uninit)(struct m=
td_info *mtd);<br>
+=A0=A0=A0 loff_t=A0=A0=A0 (*search)(struct mtd_info *mtd,=A0=A0=A0 loff_t =
ofs);<br>+=A0=A0=A0 int=A0=A0=A0 (*block_markbad)(struct mtd_info *mtd, int=
 block);<br>+=A0=A0=A0 int=A0=A0=A0 (*scan_bbt)(struct mtd_info *mtd);<br>+=
};<br>+<br>+extern int verify_nand_bbm(struct mtd_info *mtd, struct pxa3xx_=
bbm **bbm);<br>
+extern int verify_onenand_bbm(struct mtd_info *mtd, struct pxa3xx_bbm **bb=
m);<br>+extern int nand_badblockpos(struct mtd_info *mtd);<br>+extern int o=
nenand_badblockpos(struct mtd_info *mtd);<br>+extern struct pxa3xx_bbm *pxa=
3xx_query_bbm(void);<br>
+#endif<br>+<br>diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig<br>i=
ndex b8e35a0..3cdf7bf 100644<br>--- a/drivers/mtd/Kconfig<br>+++ b/drivers/=
mtd/Kconfig<br>@@ -315,6 +315,12 @@ config MTD_OOPS<br>=A0=A0=A0=A0 =A0 To =
use, add console=3DttyMTDx to the kernel command line,<br>
=A0=A0=A0=A0 =A0 where x is the MTD device number to use.<br>=A0<br>+config=
 PXA3xx_BBM<br>+=A0=A0=A0 bool &quot;Marvell PXA3xx Bad Block Management&qu=
ot;<br>+=A0=A0=A0 depends on MTD &amp;&amp; (MTD_NAND || MTD_ONENAND)<br>+=
=A0=A0=A0 help<br>+=A0=A0=A0 =A0 This enables Marvell Bad block management =
on NAND/ONENAND on PXA3xx.<br>
+<br>=A0source &quot;drivers/mtd/chips/Kconfig&quot;<br>=A0<br>=A0source &q=
uot;drivers/mtd/maps/Kconfig&quot;<br>diff --git a/drivers/mtd/Makefile b/d=
rivers/mtd/Makefile<br>index 82d1e4d..e637fa0 100644<br>--- a/drivers/mtd/M=
akefile<br>
+++ b/drivers/mtd/Makefile<br>@@ -25,6 +25,7 @@ obj-$(CONFIG_INFTL)=A0=A0=
=A0 =A0=A0=A0 +=3D inftl.o<br>=A0obj-$(CONFIG_RFD_FTL)=A0=A0=A0 =A0=A0=A0 +=
=3D rfd_ftl.o<br>=A0obj-$(CONFIG_SSFDC)=A0=A0=A0 =A0=A0=A0 +=3D ssfdc.o<br>=
=A0obj-$(CONFIG_MTD_OOPS)=A0=A0=A0 =A0=A0=A0 +=3D mtdoops.o<br>
+obj-$(CONFIG_PXA3xx_BBM)=A0=A0=A0 +=3D pxa3xx_bbm.o<br>=A0<br>=A0nftl-objs=
=A0=A0=A0 =A0=A0=A0 :=3D nftlcore.o nftlmount.o<br>=A0inftl-objs=A0=A0=A0 =
=A0=A0=A0 :=3D inftlcore.o inftlmount.o<br>diff --git a/drivers/mtd/nand/px=
a3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c<br>
index 134bfbc..d6c9524 100644<br>--- a/drivers/mtd/nand/pxa3xx_nand.c<br>++=
+ b/drivers/mtd/nand/pxa3xx_nand.c<br>@@ -24,6 +24,10 @@<br>=A0#include &lt=
;mach/dma.h&gt;<br>=A0#include &lt;plat/pxa3xx_nand.h&gt;<br>=A0<br>+#ifdef=
 CONFIG_PXA3xx_BBM<br>
+#include &lt;plat/pxa3xx_bbm.h&gt;<br>+#endif<br>+<br>=A0#define=A0=A0=A0 =
CHIP_DELAY_TIMEOUT=A0=A0=A0 (2 * HZ/10)<br>=A0<br>=A0/* registers and bit d=
efinitions */<br>@@ -112,6 +116,14 @@ enum {<br>=A0<br>=A0struct pxa3xx_nan=
d_info {<br>=A0=A0=A0=A0 struct nand_chip=A0=A0=A0 nand_chip;<br>
+#ifdef CONFIG_PXA3xx_BBM<br>+=A0=A0=A0 /*<br>+=A0=A0=A0 =A0* Restriction: =
nand_chip should be the first one of pxa3xx_nand_info.<br>+=A0=A0=A0 =A0* b=
bm should be the second one of pxa3xx_nand_info.<br>+=A0=A0=A0 =A0* Marvell=
 PXA3xx BBM always access this field to get bbm.<br>
+=A0=A0=A0 =A0*/<br>+=A0=A0=A0 struct pxa3xx_bbm=A0=A0=A0 *bbm;<br>+#endif<=
br>=A0<br>=A0=A0=A0=A0 struct platform_device=A0=A0=A0 =A0*pdev;<br>=A0=A0=
=A0=A0 const struct pxa3xx_nand_flash *flash_info;<br>@@ -365,6 +377,8 @@ s=
tatic struct pxa3xx_nand_flash *builtin_flash_types[] =3D {<br>
=A0/* convert nand flash controller clock cycles to nano-seconds */<br>=A0#=
define cycle2ns(c, clk)=A0=A0=A0 ((((c) + 1) * 1000000 + clk / 500) / (clk =
/ 1000))<br>=A0<br>+static int pxa3xx_nand_relocate_addr(struct mtd_info *m=
td, int page_addr);<br>
+<br>=A0static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,<b=
r>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0 const struct pxa3xx_nan=
d_timing *t)<br>=A0{<br>@@ -706,6 +720,8 @@ static void pxa3xx_nand_cmdfunc=
(struct mtd_info *mtd, unsigned command,<br>
=A0<br>=A0=A0=A0=A0 init_completion(&amp;info-&gt;cmd_complete);<br>=A0<br>=
+=A0=A0=A0 page_addr =3D pxa3xx_nand_relocate_addr(mtd, page_addr);<br>+<br=
>=A0=A0=A0=A0 switch (command) {<br>=A0=A0=A0=A0 case NAND_CMD_READOOB:<br>=
=A0=A0=A0=A0 =A0=A0=A0 /* disable HW ECC to get all the OOB data */<br>
@@ -1165,6 +1181,113 @@ static struct nand_ecclayout hw_largepage_ecclayout=
 =3D {<br>=A0=A0=A0=A0 .oobfree =3D { {2, 38} }<br>=A0};<br>=A0<br>+#ifdef =
CONFIG_PXA3xx_BBM<br>+int verify_nand_bbm(struct mtd_info *mtd, struct pxa3=
xx_bbm **bbm)<br>
+{<br>+=A0=A0=A0 struct nand_chip *info =3D mtd-&gt;priv;<br>+=A0=A0=A0 str=
uct pxa3xx_bbm **nbbm =3D NULL;<br>+<br>+=A0=A0=A0 /* check whether current=
 flash is nand */<br>+=A0=A0=A0 nbbm =3D (struct pxa3xx_bbm **)(++info);<br=
>+=A0=A0=A0 if (((unsigned int)nbbm &lt; PAGE_OFFSET)<br>
+=A0=A0=A0 =A0=A0=A0 || ((unsigned int)*nbbm &lt; PAGE_OFFSET))<br>+=A0=A0=
=A0 =A0=A0=A0 return PXA3xx_BBM_INVALID;<br>+<br>+=A0=A0=A0 if ((*nbbm)-&gt=
;magic =3D=3D PXA_BBM_MAGIC) {<br>+=A0=A0=A0 =A0=A0=A0 pr_debug(&quot;%s:Fo=
und Nand flash.\n&quot;, __func__);<br>+=A0=A0=A0 =A0=A0=A0 *bbm =3D *nbbm;=
<br>
+=A0=A0=A0 =A0=A0=A0 return PXA3xx_BBM_NAND;<br>+=A0=A0=A0 }<br>+=A0=A0=A0 =
return PXA3xx_BBM_INVALID;<br>+}<br>+<br>+static int pxa3xx_nand_relocate_a=
ddr(struct mtd_info *mtd, int page_addr)<br>+{<br>+=A0=A0=A0 struct pxa3xx_=
nand_info *info =3D mtd-&gt;priv;<br>
+=A0=A0=A0 struct pxa3xx_bbm *bbm =3D info-&gt;bbm;<br>+=A0=A0=A0 loff_t ad=
dr;<br>+=A0=A0=A0 int ret;<br>+<br>+=A0=A0=A0 addr =3D page_addr &lt;&lt; b=
bm-&gt;page_shift;<br>+=A0=A0=A0 addr =3D bbm-&gt;search(mtd, addr);<br>+=
=A0=A0=A0 ret =3D addr &gt;&gt; bbm-&gt;page_shift;<br>
+=A0=A0=A0 return ret;<br>+}<br>+<br>+static int pxa3xx_nand_block_markbad(=
struct mtd_info *mtd, loff_t ofs)<br>+{<br>+=A0=A0=A0 struct pxa3xx_nand_in=
fo *info =3D mtd-&gt;priv;<br>+=A0=A0=A0 struct pxa3xx_bbm *bbm =3D info-&g=
t;bbm;<br>+=A0=A0=A0 struct nand_chip *chip =3D mtd-&gt;priv;<br>
+=A0=A0=A0 uint8_t buf[2] =3D { 0, 0 };<br>+=A0=A0=A0 int block, ret;<br>+<=
br>+=A0=A0=A0 /* Get block number */<br>+=A0=A0=A0 block =3D (int)(ofs &gt;=
&gt; chip-&gt;bbt_erase_shift);<br>+<br>+=A0=A0=A0 /* We write two bytes, s=
o we dont have to mess with 16 bit<br>
+=A0=A0=A0 =A0* access<br>+=A0=A0=A0 =A0*/<br>+=A0=A0=A0 ofs +=3D mtd-&gt;o=
obsize;<br>+=A0=A0=A0 chip-&gt;ops.len =3D chip-&gt;ops.ooblen =3D 2;<br>+=
=A0=A0=A0 chip-&gt;ops.datbuf =3D NULL;<br>+=A0=A0=A0 chip-&gt;ops.oobbuf =
=3D buf;<br>+=A0=A0=A0 chip-&gt;ops.ooboffs =3D chip-&gt;badblockpos &amp; =
~0x01;<br>
+<br>+=A0=A0=A0 ret =3D mtd-&gt;write_oob(mtd, ofs, &amp;chip-&gt;ops);<br>=
+<br>+=A0=A0=A0 if (!ret)<br>+=A0=A0=A0 =A0=A0=A0 mtd-&gt;ecc_stats.badbloc=
ks++;<br>+<br>+=A0=A0=A0 return bbm-&gt;block_markbad(mtd, block);<br>+}<br=
>+<br>+static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0struct pxa3xx_nand_info *info)<=
br>+{<br>+=A0=A0=A0 const struct pxa3xx_nand_flash *f =3D info-&gt;flash_in=
fo;<br>+=A0=A0=A0 struct nand_chip *this =3D &amp;info-&gt;nand_chip;<br>+=
=A0=A0=A0 struct pxa3xx_bbm *bbm =3D NULL;<br>+<br>
+=A0=A0=A0 this-&gt;options =3D (f-&gt;flash_width =3D=3D 16) ? NAND_BUSWID=
TH_16: 0;<br>+<br>+=A0=A0=A0 this-&gt;waitfunc=A0=A0=A0 =A0=A0=A0 =3D pxa3x=
x_nand_waitfunc;<br>+=A0=A0=A0 this-&gt;select_chip=A0=A0=A0 =3D pxa3xx_nan=
d_select_chip;<br>+=A0=A0=A0 this-&gt;dev_ready=A0=A0=A0 =A0=A0=A0 =3D pxa3=
xx_nand_dev_ready;<br>
+=A0=A0=A0 this-&gt;cmdfunc=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_nand_cmdfunc;<br>=
+=A0=A0=A0 this-&gt;read_word=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_nand_read_word;=
<br>+=A0=A0=A0 this-&gt;read_byte=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_nand_read_b=
yte;<br>+=A0=A0=A0 this-&gt;read_buf=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_nand_rea=
d_buf;<br>
+=A0=A0=A0 this-&gt;write_buf=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_nand_write_buf;=
<br>+=A0=A0=A0 this-&gt;verify_buf=A0=A0=A0 =3D pxa3xx_nand_verify_buf;<br>=
+<br>+=A0=A0=A0 this-&gt;ecc.mode=A0=A0=A0 =A0=A0=A0 =3D NAND_ECC_HW;<br>+=
=A0=A0=A0 this-&gt;ecc.hwctl=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_nand_ecc_hwctl;<=
br>
+=A0=A0=A0 this-&gt;ecc.calculate=A0=A0=A0 =3D pxa3xx_nand_ecc_calculate;<b=
r>+=A0=A0=A0 this-&gt;ecc.correct=A0=A0=A0 =3D pxa3xx_nand_ecc_correct;<br>=
+=A0=A0=A0 this-&gt;ecc.size=A0=A0=A0 =A0=A0=A0 =3D f-&gt;page_size;<br>+<b=
r>+=A0=A0=A0 if (f-&gt;page_size =3D=3D 2048)<br>+=A0=A0=A0 =A0=A0=A0 this-=
&gt;ecc.layout =3D &amp;hw_largepage_ecclayout;<br>
+=A0=A0=A0 else<br>+=A0=A0=A0 =A0=A0=A0 this-&gt;ecc.layout =3D &amp;hw_sma=
llpage_ecclayout;<br>+<br>+=A0=A0=A0 this-&gt;chip_delay =3D 25;<br>+<br>+=
=A0=A0=A0 bbm =3D pxa3xx_query_bbm();<br>+=A0=A0=A0 if (bbm) {<br>+=A0=A0=
=A0 =A0=A0=A0 /* Marvell PXA3xx BBM is initialized successfully */<br>
+=A0=A0=A0 =A0=A0=A0 info-&gt;bbm =3D bbm;<br>+=A0=A0=A0 =A0=A0=A0 this-&gt=
;scan_bbt =3D bbm-&gt;scan_bbt;<br>+=A0=A0=A0 =A0=A0=A0 this-&gt;block_mark=
bad =3D pxa3xx_nand_block_markbad;<br>+=A0=A0=A0 }<br>+}<br>+#else<br>+stat=
ic int pxa3xx_nand_relocate_addr(struct mtd_info *mtd, int page_addr)<br>
+{<br>+=A0=A0=A0 return page_addr;<br>+}<br>+<br>=A0static void pxa3xx_nand=
_init_mtd(struct mtd_info *mtd,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=
=A0 =A0struct pxa3xx_nand_info *info)<br>=A0{<br>@@ -1196,6 +1319,7 @@ stat=
ic void pxa3xx_nand_init_mtd(struct mtd_info *mtd,<br>
=A0<br>=A0=A0=A0=A0 this-&gt;chip_delay =3D 25;<br>=A0}<br>+#endif<br>=A0<b=
r>=A0static int pxa3xx_nand_probe(struct platform_device *pdev)<br>=A0{<br>=
diff --git a/drivers/mtd/pxa3xx_bbm.c b/drivers/mtd/pxa3xx_bbm.c<br>new fil=
e mode 100644<br>
index 0000000..bcc9a35<br>--- /dev/null<br>+++ b/drivers/mtd/pxa3xx_bbm.c<b=
r>@@ -0,0 +1,427 @@<br>+/*<br>+ * linux/drivers/mtd/pxa3xx_bbm.c<br>+ *<br>=
+ * Support bad block management on PXA3xx.<br>+ * Copyright (C) 2007 Marve=
ll International Ltd.<br>
+ *<br>+ * Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com"=
>haojian.zhuang@marvell.com</a>&gt;<br>+ *<br>+ * This program is free soft=
ware; you can redistribute it and/or modify<br>+ * it under the terms of th=
e GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>+ *<br>+ */<br>+<br>+#inc=
lude &lt;linux/mtd/mtd.h&gt;<br>+#include &lt;linux/mtd/nand.h&gt;<br>+#inc=
lude &lt;plat/pxa3xx_bbm.h&gt;<br>+#include &lt;asm/errno.h&gt;<br>+<br>
+static struct pxa3xx_bbm *pxa3xx_bbm =3D NULL;<br>+<br>+/*<br>+ * bbm shou=
ld be the next field of nand_chip or onenand_chip.<br>+ */<br>+static int v=
erify_bbm_magic(struct mtd_info *mtd, struct pxa3xx_bbm **bbm)<br>+{<br>+=
=A0=A0=A0 int ret;<br>
+<br>+=A0=A0=A0 ret =3D verify_nand_bbm(mtd, bbm);<br>+=A0=A0=A0 return ret=
;<br>+}<br>+<br>+static void dump_rltable(struct pxa3xx_bbm *bbm)<br>+{<br>=
+=A0=A0=A0 int i;<br>+<br>+=A0=A0=A0 if (bbm-&gt;table-&gt;total =3D=3D 0) =
{<br>+=A0=A0=A0 =A0=A0=A0 pr_info(&quot;The relocation table is empty now\n=
&quot;);<br>
+=A0=A0=A0 =A0=A0=A0 return;<br>+=A0=A0=A0 }<br>+=A0=A0=A0 for (i =3D 0; i =
&lt; bbm-&gt;table-&gt;total; i++) {<br>+=A0=A0=A0 =A0=A0=A0 if (bbm-&gt;en=
try[i].from =3D=3D (unsigned short)(-1))<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
continue;<br>+=A0=A0=A0 =A0=A0=A0 if (bbm-&gt;entry[i].to =3D=3D (unsigned =
short)(-1))<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 pr_info(&quot;(%4d): block #%d is bad in rel=
ocation area\n&quot;,<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 i, bbm-&g=
t;entry[i].from);<br>+=A0=A0=A0 =A0=A0=A0 else<br>+=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 pr_info(&quot;(%4d): block #%d is relocated to #%d\n&quot;,<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 i, bbm-&gt;entry[i].from, bbm-&gt;=
entry[i].to);<br>+=A0=A0=A0 }<br>+}<br>+<br>+/* Initialize the relocation t=
able */<br>+static int pxa3xx_init_rltable(struct mtd_info *mtd)<br>+{<br>+=
=A0=A0=A0 struct pxa3xx_bbm *bbm =3D NULL;<br>
+=A0=A0=A0 int size =3D mtd-&gt;writesize + mtd-&gt;oobsize;<br>+=A0=A0=A0 =
int pages, entries;<br>+<br>+=A0=A0=A0 if (verify_bbm_magic(mtd, &amp;bbm) =
&lt; 0) {<br>+=A0=A0=A0 =A0=A0=A0 /* BBM don&#39;t support this type of fla=
sh */<br>+=A0=A0=A0 =A0=A0=A0 return -EINVAL;<br>
+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 bbm-&gt;page_shift =3D ffs(mtd-&gt;writesiz=
e) - 1;<br>+=A0=A0=A0 bbm-&gt;erase_shift =3D ffs(mtd-&gt;erasesize) - 1;<b=
r>+<br>+=A0=A0=A0 pages =3D mtd-&gt;erasesize &gt;&gt; bbm-&gt;page_shift;<=
br>+<br>+=A0=A0=A0 entries =3D mtd-&gt;size &gt;&gt; bbm-&gt;erase_shift;<b=
r>
+=A0=A0=A0 entries =3D (entries * 2) / 100;<br>+=A0=A0=A0 if (mtd-&gt;write=
size =3D=3D 512)<br>+=A0=A0=A0 =A0=A0=A0 entries =3D (entries &lt; PXA_MAX_=
RLENTRY) ? entries<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 : PXA_MAX_RLENTRY;=
<br>+<br>+=A0=A0=A0 bbm-&gt;max_slots=A0=A0=A0 =3D PXA_MAX_SLOT;<br>
+=A0=A0=A0 bbm-&gt;max_relocate_entry =3D entries;<br>+=A0=A0=A0 bbm-&gt;cu=
rrent_slot =3D -1;<br>+<br>+=A0=A0=A0 bbm-&gt;data_buf =3D kzalloc(size, GF=
P_KERNEL);<br>+=A0=A0=A0 if (bbm-&gt;data_buf =3D=3D NULL)<br>+=A0=A0=A0 =
=A0=A0=A0 return -ENOMEM;<br>+<br>+=A0=A0=A0 bbm-&gt;table =3D (struct relo=
cate_table *)bbm-&gt;data_buf;<br>
+=A0=A0=A0 memset(bbm-&gt;table, 0, sizeof(struct relocate_table));<br>+<br=
>+=A0=A0=A0 bbm-&gt;entry =3D (struct relocate_entry *)((uint8_t *)bbm-&gt;=
data_buf +<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 sizeof(struct relocate_entry))=
;<br>+=A0=A0=A0 memset(bbm-&gt;entry, 0, sizeof(struct relocate_entry)<br>
+=A0=A0=A0 =A0=A0=A0 * bbm-&gt;max_relocate_entry);<br>+<br>+=A0=A0=A0 retu=
rn 0;<br>+}<br>+<br>+/* Uninitialize the relocation table */<br>+static voi=
d pxa3xx_uninit_rltable(struct mtd_info *mtd)<br>+{<br>+=A0=A0=A0 struct px=
a3xx_bbm *bbm =3D NULL;<br>
+<br>+=A0=A0=A0 if (verify_bbm_magic(mtd, &amp;bbm) &lt; 0) {<br>+=A0=A0=A0=
 =A0=A0=A0 /* BBM don&#39;t support this flash type */<br>+=A0=A0=A0 =A0=A0=
=A0 return;<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 if (bbm) {<br>+=A0=A0=A0 =A0=
=A0=A0 kfree(bbm-&gt;data_buf);<br>+=A0=A0=A0 =A0=A0=A0 bbm =3D NULL;<br>
+=A0=A0=A0 }<br>+}<br>+<br>+/*<br>+ * Move larger data to left of pivot, an=
d move smaller data to right of<br>+ * pivot.<br>+ */<br>+static int partit=
ion(unsigned short *array, int left, int right, int pivot_idx)<br>+{<br>+=
=A0=A0=A0 int i, pivot, base_idx;<br>
+<br>+=A0=A0=A0 pivot =3D array[pivot_idx];<br>+=A0=A0=A0 swap(array[left],=
 array[right]);<br>+=A0=A0=A0 base_idx =3D left;<br>+<br>+=A0=A0=A0 for (i =
=3D left; i &lt; right; i++) {<br>+=A0=A0=A0 =A0=A0=A0 if (array[i] &gt; pi=
vot) {<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 swap(array[i], array[base_idx]);<b=
r>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 base_idx++;<br>+=A0=A0=A0 =A0=A0=A0 }<br>+=
=A0=A0=A0 }<br>+=A0=A0=A0 if (base_idx &lt; right)<br>+=A0=A0=A0 =A0=A0=A0 =
swap(array[base_idx], array[right]);<br>+=A0=A0=A0 return base_idx;<br>+}<b=
r>+<br>+static int quick_sort(unsigned short *array, int left, int right)<b=
r>
+{<br>+=A0=A0=A0 int pivot_idx, new_idx;<br>+=A0=A0=A0 if (right &gt; left)=
 {<br>+=A0=A0=A0 =A0=A0=A0 pivot_idx =3D left;<br>+=A0=A0=A0 =A0=A0=A0 new_=
idx =3D partition(array, left, right, pivot_idx);<br>+=A0=A0=A0 =A0=A0=A0 q=
uick_sort(array, left, new_idx - 1);<br>+=A0=A0=A0 =A0=A0=A0 quick_sort(arr=
ay, new_idx + 1, right);<br>
+=A0=A0=A0 }<br>+=A0=A0=A0 return 0;<br>+}<br>+<br>+/*<br>+ * Add the reloc=
ation entry into the relocation table. If the relocated block<br>+ * is bad=
, an new entry will be added into the bottom of the relocation table.<br>+ =
*/<br>+int update_rltable(struct mtd_info *mtd, int block)<br>
+{<br>+=A0=A0=A0 struct pxa3xx_bbm *bbm =3D NULL;<br>+=A0=A0=A0 struct relo=
cate_table *table =3D NULL;<br>+=A0=A0=A0 struct relocate_entry *entry =3D =
NULL;<br>+=A0=A0=A0 struct erase_info instr;<br>+=A0=A0=A0 unsigned short a=
rray[PXA_MAX_RLENTRY], addr;<br>
+=A0=A0=A0 int i, idx, ret, relocated_idx =3D -1;<br>+<br>+=A0=A0=A0 if (ve=
rify_bbm_magic(mtd, &amp;bbm) &lt; 0) {<br>+=A0=A0=A0 =A0=A0=A0 /* BBM don&=
#39;t support this type of flash */<br>+=A0=A0=A0 =A0=A0=A0 return -EINVAL;=
<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 table =3D bbm-&gt;table;<br>
+=A0=A0=A0 entry =3D bbm-&gt;entry;<br>+<br>+=A0=A0=A0 /* identify whether =
the block has been relocated */<br>+=A0=A0=A0 for (i =3D 0; i &lt; table-&g=
t;total; i++) {<br>+=A0=A0=A0 =A0=A0=A0 if (entry[i].from =3D=3D (unsigned =
short)(-1))<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;<br>
+=A0=A0=A0 =A0=A0=A0 if (block =3D=3D entry[i].from) {<br>+=A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 relocated_idx =3D i;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 break;=
<br>+=A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 }<br>+<br>+scan:<br>+=A0=A0=A0 if =
(table-&gt;total &gt; bbm-&gt;max_relocate_entry) {<br>+=A0=A0=A0 =A0=A0=A0=
 pr_warning(&quot;Relocation entries exceed max num. Can&#39;t relocate&quo=
t;);<br>
+=A0=A0=A0 =A0=A0=A0 pr_warning(&quot; block 0x%x\n&quot;, block);<br>+=A0=
=A0=A0 =A0=A0=A0 return -ENOSPC;<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 memset(=
array, 0, PXA_MAX_RLENTRY);<br>+=A0=A0=A0 /* Get all index of relocated blo=
cks */<br>+=A0=A0=A0 for (i =3D 0, idx =3D 0; i &lt; table-&gt;total; i++) =
{<br>
+=A0=A0=A0 =A0=A0=A0 array[idx] =3D (entry[i].to !=3D (unsigned short)(-1))=
 ? entry[i].to<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 : entry[i].from;=
<br>+=A0=A0=A0 =A0=A0=A0 idx++;<br>+=A0=A0=A0 }<br>+=A0=A0=A0 /* sort array=
 with descending order */<br>+=A0=A0=A0 quick_sort(array, 0, idx - 1);<br>
+=A0=A0=A0 /*<br>+=A0=A0=A0 =A0* find the available block with the largest =
number in reservered<br>+=A0=A0=A0 =A0* area<br>+=A0=A0=A0 =A0*/<br>+=A0=A0=
=A0 addr =3D (unsigned short)((mtd-&gt;size &gt;&gt; bbm-&gt;erase_shift) -=
 1);<br>+=A0=A0=A0 for (i =3D 0; i &lt; bbm-&gt;max_relocate_entry; i++, ad=
dr--) {<br>
+=A0=A0=A0 =A0=A0=A0 if (addr &lt; ((mtd-&gt;size &gt;&gt; bbm-&gt;erase_sh=
ift)<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 - bbm-&gt;max_relocate_entry)) {<br>=
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 pr_warning(&quot;Relocation area is already =
full!\n&quot;);<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 return -ENOSPC;<br>
+=A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 =A0=A0=A0 if (array[i] &lt; addr) {<br=
>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 memset(&amp;instr, 0, sizeof(struct erase_i=
nfo));<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 instr.mtd =3D mtd;<br>+=A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 instr.addr =3D addr &lt;&lt; bbm-&gt;erase_shift;<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 instr.len =3D 1 &lt;&lt; bbm-&gt;erase_shift;=
<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 ret =3D mtd-&gt;erase(mtd, &amp;instr);<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if (ret =3D=3D 0) {<br>+=A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 /* fill the recorder into relocation table */<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if (relocated_idx =3D=3D -1) {<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* new entry in relocation t=
able */<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 entry[table-&gt;total].f=
rom =3D block;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 entry[=
table-&gt;total].to =3D addr;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 table-&gt;total++;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 goto done;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 } else {<b=
r>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* update entry in reloc=
ation table */<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 entry[=
table-&gt;total].from<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=
 =A0=A0=A0 =3D entry[relocated_idx].to;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 entry[table-&gt;total].to<br>+=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =3D (unsigned short)(-1);<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 table-&gt;total++;<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 entry[relocated_idx].to =
=3D addr;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 goto done;<=
br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 } else {<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* append new b=
ad entry */<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 entry[table-&gt;total].from =3D ad=
dr;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 entry[table-&gt;total].to =
=3D (unsigned short)(-1);<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 table=
-&gt;total++;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 goto scan;<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 =A0=A0=A0 }<br>
+=A0=A0=A0 }<br>+<br>+done:<br>+=A0=A0=A0 return 0;<br>+}<br>+<br>+/* Write=
 the relocation table back to device, if there&#39;s room. */<br>+static in=
t sync_rltable(struct mtd_info *mtd, int *idx)<br>+{<br>+=A0=A0=A0 struct p=
xa3xx_bbm *bbm =3D NULL;<br>
+=A0=A0=A0 unsigned char *tmp;<br>+=A0=A0=A0 size_t retlen;<br>+=A0=A0=A0 i=
nt len, pages;<br>+<br>+=A0=A0=A0 if (verify_bbm_magic(mtd, &amp;bbm) &lt; =
0) {<br>+=A0=A0=A0 =A0=A0=A0 /* BBM don&#39;t support this type of flash */=
<br>+=A0=A0=A0 =A0=A0=A0 return -EINVAL;<br>
+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 pages =3D mtd-&gt;erasesize &gt;&gt; bbm-&g=
t;page_shift;<br>+=A0=A0=A0 if ((*idx &gt;=3D pages) || (*idx &lt;=3D (page=
s - bbm-&gt;max_slots))) {<br>+=A0=A0=A0 =A0=A0=A0 printk(KERN_ERR &quot;Wr=
ong Slot is specified.\n&quot;);<br>
+=A0=A0=A0 =A0=A0=A0 return -EINVAL;<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 /* =
should write to the next slot*/<br>+=A0=A0=A0 (*idx)--;<br>+<br>+=A0=A0=A0 =
len =3D 4;=A0=A0=A0 =A0=A0=A0 /* table header */<br>+=A0=A0=A0 len +=3D bbm=
-&gt;table-&gt;total &lt;&lt; 2;<br>+<br>+=A0=A0=A0 tmp =3D (unsigned char =
*)bbm-&gt;data_buf;<br>
+=A0=A0=A0 mtd-&gt;write(mtd, (*idx) &lt;&lt; bbm-&gt;page_shift,<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0 1 &lt;&lt; bbm-&gt;page_shift, &amp;retlen, tmp);<b=
r>+<br>+=A0=A0=A0 return 0;<br>+}<br>+<br>+static int pxa3xx_scan_rltable(s=
truct mtd_info *mtd)<br>+{<br>
+=A0=A0=A0 struct pxa3xx_bbm *bbm =3D NULL;<br>+=A0=A0=A0 struct relocate_t=
able *table;<br>+=A0=A0=A0 int page, max_page;<br>+=A0=A0=A0 size_t retlen;=
<br>+=A0=A0=A0 int ret, retry_count =3D 3;<br>+<br>+=A0=A0=A0 if (verify_bb=
m_magic(mtd, &amp;bbm) &lt; 0) {<br>
+=A0=A0=A0 =A0=A0=A0 /* BBM don&#39;t support this type of flash */<br>+=A0=
=A0=A0 =A0=A0=A0 return -EINVAL;<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 pxa3xx_=
init_rltable(mtd);<br>+<br>+=A0=A0=A0 table =3D bbm-&gt;table;<br>+<br>+=A0=
=A0=A0 bbm-&gt;current_slot =3D -1;<br>+=A0=A0=A0 page =3D (mtd-&gt;erasesi=
ze &gt;&gt; bbm-&gt;page_shift) - bbm-&gt;max_slots;<br>
+=A0=A0=A0 max_page =3D mtd-&gt;erasesize &gt;&gt; bbm-&gt;page_shift;<br>+=
=A0=A0=A0 for (; page &lt; max_page; page++, retry_count =3D 3) {<br>+retry=
:<br>+=A0=A0=A0 =A0=A0=A0 memset(bbm-&gt;data_buf, 0, mtd-&gt;writesize + m=
td-&gt;oobsize);<br>+=A0=A0=A0 =A0=A0=A0 ret =3D mtd-&gt;read(mtd, (page &l=
t;&lt; bbm-&gt;page_shift),<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 mtd-&gt;writesize, &amp;retlen, bb=
m-&gt;data_buf);<br>+=A0=A0=A0 =A0=A0=A0 if (ret =3D=3D 0) {<br>+=A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 if (table-&gt;header =3D=3D PXA_RLTABLE_HEADER) {<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bbm-&gt;current_slot =3D page;<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 break;<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 =A0=A0=A0 } else {<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 if (retry_count--)<br>+=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 goto retry;<br>+=A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 }<br>+=
=A0=A0=A0 if (bbm-&gt;current_slot !=3D -1) {<br>+=A0=A0=A0 =A0=A0=A0 pr_de=
bug(&quot;Found relocation table at page:%d\n&quot;,<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bbm-&gt;current_slot);<br>+=A0=A0=A0 =A0=A0=
=A0 dump_rltable(bbm);<br>+=A0=A0=A0 } else {<br>+=A0=A0=A0 =A0=A0=A0 pr_er=
r(&quot;Can&#39;t recognize relocation table.\n&quot;);<br>+=A0=A0=A0 =A0=
=A0=A0 pr_err(&quot;CAUTION: It may cause unpredicated error\n&quot;);<br>
+=A0=A0=A0 =A0=A0=A0 pr_err(&quot;Please re-initialize the flash.\n&quot;);=
<br>+=A0=A0=A0 =A0=A0=A0 memset((unsigned char *)bbm-&gt;table, 0,<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 sizeof(struct relocate_table));<br>+=A0=A0=A0 =
=A0=A0=A0 return -EFAULT;<br>+=A0=A0=A0 }<br>+=A0=A0=A0 return 0;<br>
+}<br>+<br>+/*<br>+ * Find the relocated block of the bad one.<br>+ * If it=
&#39;s a good block, return 0. Otherwise, return a relocated one.<br>+ * id=
x points to the next relocation entry<br>+ * If the relocated block is bad,=
 an new entry will be added into the<br>
+ * bottom of the relocation table.<br>+ */<br>+static loff_t pxa3xx_search=
_rlentry(struct mtd_info *mtd, loff_t ofs)<br>+{<br>+=A0=A0=A0 struct pxa3x=
x_bbm *bbm =3D NULL;<br>+=A0=A0=A0 struct relocate_table *table =3D NULL;<b=
r>+=A0=A0=A0 struct relocate_entry *entry =3D NULL;<br>
+=A0=A0=A0 int i, block;<br>+<br>+=A0=A0=A0 /*<br>+=A0=A0=A0 =A0* In SLC, b=
lock 0 shouldn&#39;t be broken.<br>+=A0=A0=A0 =A0* In some command, address=
 is assigned to 0 if it doesn&#39;t need<br>+=A0=A0=A0 =A0* to operate addr=
ess. So just skip it.<br>+=A0=A0=A0 =A0*/<br>
+=A0=A0=A0 if (ofs &lt;=3D 0)<br>+=A0=A0=A0 =A0=A0=A0 return ofs;<br>+<br>+=
=A0=A0=A0 if (verify_bbm_magic(mtd, &amp;bbm) &lt; 0)<br>+=A0=A0=A0 =A0=A0=
=A0 return ofs;<br>+<br>+=A0=A0=A0 table =3D bbm-&gt;table;<br>+=A0=A0=A0 e=
ntry =3D bbm-&gt;entry;<br>+<br>+=A0=A0=A0 block =3D ofs &gt;&gt; bbm-&gt;e=
rase_shift;<br>
+<br>+=A0=A0=A0 if ((bbm-&gt;current_slot =3D=3D -1) || (table-&gt;total &l=
t;=3D 0)<br>+=A0=A0=A0 =A0=A0=A0 || (block &gt;=3D (mtd-&gt;size &gt;&gt; b=
bm-&gt;erase_shift)))<br>+=A0=A0=A0 =A0=A0=A0 return ofs;<br>+<br>+=A0=A0=
=A0 ofs =3D ofs - (block &lt;&lt; bbm-&gt;erase_shift);=A0=A0=A0 /* save of=
fset */<br>
+<br>+=A0=A0=A0 for (i =3D 0; i &lt; table-&gt;total; i++) {<br>+=A0=A0=A0 =
=A0=A0=A0 if (block =3D=3D entry[i].from) {<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=
=A0 block =3D entry[i].to;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 break;<br>+=A0=
=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 }<br>+=A0=A0=A0 ofs +=3D block &lt;&lt; bb=
m-&gt;erase_shift;<br>
+=A0=A0=A0 return ofs;<br>+}<br>+<br>+static int pxa3xx_mark_rlentry(struct=
 mtd_info *mtd, int block)<br>+{<br>+=A0=A0=A0 struct pxa3xx_bbm *bbm =3D N=
ULL;<br>+=A0=A0=A0 int ret =3D 0;<br>+<br>+=A0=A0=A0 ret =3D verify_bbm_mag=
ic(mtd, &amp;bbm);<br>+=A0=A0=A0 if (ret &lt; 0) {<br>
+=A0=A0=A0 =A0=A0=A0 /* BBM don&#39;t support this type of flash */<br>+=A0=
=A0=A0 =A0=A0=A0 return -EINVAL;<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 ret =3D=
 update_rltable(mtd, block);<br>+=A0=A0=A0 if (ret)<br>+=A0=A0=A0 =A0=A0=A0=
 return ret;<br>+<br>+=A0=A0=A0 return sync_rltable(mtd, &amp;(bbm-&gt;curr=
ent_slot));<br>
+}<br>+<br>+/* If Marvell BBM is used, return 0. Otherwise, return negative=
 value. */<br>+struct pxa3xx_bbm *pxa3xx_query_bbm(void)<br>+{<br>+=A0=A0=
=A0 if (pxa3xx_bbm)<br>+=A0=A0=A0 =A0=A0=A0 return pxa3xx_bbm;<br>+=A0=A0=
=A0 return NULL;<br>+}<br>
+EXPORT_SYMBOL(pxa3xx_query_bbm);<br>+<br>+static int __init pxa3xx_bbm_ini=
t(void)<br>+{<br>+=A0=A0=A0 struct pxa3xx_bbm *bbm;<br>+<br>+=A0=A0=A0 bbm =
=3D kzalloc(sizeof(struct pxa3xx_bbm), GFP_KERNEL);<br>+=A0=A0=A0 if (!bbm)=
<br>+=A0=A0=A0 =A0=A0=A0 return -ENOMEM;<br>
+<br>+=A0=A0=A0 bbm-&gt;magic=A0=A0=A0 =A0=A0=A0 =3D PXA_BBM_MAGIC;<br>+=A0=
=A0=A0 bbm-&gt;uninit=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_uninit_rltable;<br>+=A0=
=A0=A0 bbm-&gt;search=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_search_rlentry;<br>+=A0=
=A0=A0 bbm-&gt;block_markbad=A0=A0=A0 =3D pxa3xx_mark_rlentry;<br>+=A0=A0=
=A0 bbm-&gt;scan_bbt=A0=A0=A0 =A0=A0=A0 =3D pxa3xx_scan_rltable;<br>
+<br>+=A0=A0=A0 pxa3xx_bbm =3D bbm;<br>+<br>+=A0=A0=A0 return 0;<br>+}<br>+=
subsys_initcall(pxa3xx_bbm_init);<br>+<br>+static void pxa3xx_bbm_exit(void=
)<br>+{<br>+=A0=A0=A0 if (pxa3xx_bbm) {<br>+=A0=A0=A0 =A0=A0=A0 kfree(pxa3x=
x_bbm);<br>+=A0=A0=A0 =A0=A0=A0 pxa3xx_bbm =3D NULL;<br>
+=A0=A0=A0 }<br>+}<br>+module_exit(pxa3xx_bbm_exit);<br>+<br>+MODULE_LICENS=
E(&quot;GPL&quot;);<br>+MODULE_DESCRIPTION(&quot;Marvell PXA3xx Bad Block M=
anagement&quot;);<br>-- <br>1.5.6.5<br><br>

--001517741a149782ca047465a8bd--

--001517741a149782d2047465a8bf
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001--MTD-NAND-pxa3xx_nand-enable-PXA3xx-bad-block-ma.patch"
Content-Disposition: attachment;
	filename="0001--MTD-NAND-pxa3xx_nand-enable-PXA3xx-bad-block-ma.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g01cks240

RnJvbSA3ZTViYmI1MDgyZWYyYWZhYWIwOTY2ZDYwNTMwYWY0MTMxYzBjNGVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9qaWFuIFpodWFuZyA8aGFvamlhbi56aHVhbmdAbWFydmVs
bC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMDkgMTU6MDA6MjggLTA0MDAKU3ViamVjdDogW1BB
VENIXSBbTVREXSBbTkFORF0gcHhhM3h4X25hbmQ6IGVuYWJsZSBQWEEzeHggYmFkIGJsb2NrIG1h
bmFnZW1lbnQKClRoZXJlJ3MgYSBjdXN0b20gYmFkIGJsb2NrIG1hbmFnZW1lbnQgaW4gUFhBM3h4
IHNlcmllcy4KClRoaXMgQkJNIG5lZWRzIHRvIGFsbG9jYXRlIGEgcmVzZXJ2ZWQgYXJlYSBhdCB0
aGUgYm90dG9tIG9mIE5BTkQgY2hpcC4KVGhlIHJlc2VydmVkIGFyZWEgc2hvdWxkIGJlIHByb3Rl
Y3RlZCBmcm9tIG5vcm1hbCB1c2FnZS4gVGhlIGZpcnN0IGJsb2NrCm9mIE5BTkQgaXMgYWxzbyBy
ZXNlcnZlZCBpbiBvcmRlciB0byBzdG9yaW5nIHRoZSByZWxvY2F0aW9uIGluZm9ybWF0aW9uLgoK
V2hlbiBOQU5EIGNvbnRyb2xsZXIgZmluZHMgYSBiYWQgYmxvY2ssIGl0IG1hcmtzIHRoZSBibG9j
ayBhcyBiYWQgYW5kCmFsbG9jYXRlIGEgdW51c2VkIGJsb2NrIGZyb20gcmVzZXJ2ZWQgYXJlYSBp
biBib3R0b20uIFRoZSBuZXcgYmxvY2sgaXMKdXNlZCB0byByZXBsYWNlIHRoZSBvcmlnaW5hbCBi
YWQgb25lLiBGcm9tIE9TIHZpZXcsIHRoZXJlJ3Mgbm8gYmFkIGJsb2NrCmF0IHRoZSB0aW1lLiBJ
dCdzIGhhbmRsZWQgYnkgTkFORCBkcml2ZXIuIFRoZW4gZHJpdmVyIHJlY29yZHMgdGhlIHJlcGxh
Y2VtZW50CmluIHRoZSBmaXJzdCBibG9jay4KClRoZSByZXNlcnZlZCBhcmVhIGlzIGFsc28gY2Fs
bGVkIGFzIHJlbG9jYXRpb24gYXJlYS4gSXQgb2NjdXBpZXMgMiUgb2YKdGhlIHdob2xlIE5BTkQg
c3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBIYW9qaWFuIFpodWFuZyA8aGFvamlhbi56aHVhbmdAbWFy
dmVsbC5jb20+Ci0tLQogYXJjaC9hcm0vcGxhdC1weGEvaW5jbHVkZS9wbGF0L3B4YTN4eF9iYm0u
aCB8ICAgNjIgKysrKwogZHJpdmVycy9tdGQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgIDYgKwogZHJpdmVycy9tdGQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDEgKwogZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jICAgICAgICAgICAgICB8ICAx
MjQgKysrKysrKysKIGRyaXZlcnMvbXRkL3B4YTN4eF9iYm0uYyAgICAgICAgICAgICAgICAgICAg
fCAgNDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2MjAg
aW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bS9wbGF0LXB4YS9pbmNsdWRlL3BsYXQvcHhhM3h4X2JibS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tdGQvcHhhM3h4X2JibS5jCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vcGxhdC1weGEv
aW5jbHVkZS9wbGF0L3B4YTN4eF9iYm0uaCBiL2FyY2gvYXJtL3BsYXQtcHhhL2luY2x1ZGUvcGxh
dC9weGEzeHhfYmJtLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uODUwODU0
NwotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL3BsYXQtcHhhL2luY2x1ZGUvcGxhdC9weGEz
eHhfYmJtLmgKQEAgLTAsMCArMSw2MiBAQAorI2lmbmRlZglfX1BYQTNYWF9CQlRfSF9fCisjZGVm
aW5lCV9fUFhBM1hYX0JCVF9IX18KKworI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisKKyNkZWZp
bmUgUFhBX1JMVEFCTEVfSEVBREVSCQkoMHg1MjRlKQorI2RlZmluZSBQWEFfTUFYX1JMRU5UUlkJ
CQkoMTI3KQorI2RlZmluZSBQWEFfTUFYX1NMT1QJCQkoNDApCisjZGVmaW5lIFBYQV9CRUdJTl9T
TE9UCQkJKDIpCisjZGVmaW5lIFBYQV9CQk1fTUFHSUMJCQkoMHg0YzU2NTI0ZCkJLyogTVJWTCAq
LworCitlbnVtIHsKKwlQWEEzeHhfQkJNX05BTkQgPSAwLAorCVBYQTN4eF9CQk1fT05FTkFORCwK
KwlQWEEzeHhfQkJNX0lOVkFMSUQgPSAtMSwKK307CisKK3N0cnVjdCByZWxvY2F0ZV9lbnRyeSB7
CisJdW5zaWduZWQgc2hvcnQgZnJvbTsKKwl1bnNpZ25lZCBzaG9ydCB0bzsKK307CisKK3N0cnVj
dCByZWxvY2F0ZV90YWJsZSB7CisJdW5zaWduZWQgc2hvcnQgaGVhZGVyOworCXVuc2lnbmVkIHNo
b3J0IHRvdGFsOworfTsKKworc3RydWN0IHB4YTN4eF9iYm0geworCWludAkJCW1hZ2ljOworCS8q
CisJICogTk9URVM6IHRoaXMgZmllbGQgaW1wYWN0IHRoZSBwYXJ0aXRpb24gdGFibGUuIFBsZWFz
ZSBtYWtlIHN1cmUKKwkgKiB0aGF0IHRoaXMgdmFsdWUgYWxpZ24gd2l0aCBwYXJ0aXRpb25zIGRl
ZmluaXRpb24uCisJICovCisJaW50CQkJbWF4X3JlbG9jYXRlX2VudHJ5OworCWludAkJCW1heF9z
bG90czsKKwlpbnQJCQljdXJyZW50X3Nsb3Q7CisKKwl2b2lkCQkJKmRhdGFfYnVmOworCisJLyoK
KwkgKiBUaGVzZSB0d28gZmllbGRzIHNob3VsZCBiZSBpbiAob25lKW5hbmRfY2hpcC4gQWRkIGhl
cmUgdG8gaGFuZGxlCisJICogb25lbmFuZF9jaGlwIGFuZCBuYW5kX2NoaXAgYXQgdGhlIHNhbWUg
dGltZS4KKwkgKi8KKwlpbnQJCQlwYWdlX3NoaWZ0OworCWludAkJCWVyYXNlX3NoaWZ0OworCisJ
c3RydWN0IHJlbG9jYXRlX3RhYmxlCSp0YWJsZTsKKwlzdHJ1Y3QgcmVsb2NhdGVfZW50cnkJKmVu
dHJ5OworCisJdm9pZAkoKnVuaW5pdCkoc3RydWN0IG10ZF9pbmZvICptdGQpOworCWxvZmZfdAko
KnNlYXJjaCkoc3RydWN0IG10ZF9pbmZvICptdGQsCWxvZmZfdCBvZnMpOworCWludAkoKmJsb2Nr
X21hcmtiYWQpKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgYmxvY2spOworCWludAkoKnNjYW5f
YmJ0KShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7Cit9OworCitleHRlcm4gaW50IHZlcmlmeV9uYW5k
X2JibShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IHB4YTN4eF9iYm0gKipiYm0pOworZXh0
ZXJuIGludCB2ZXJpZnlfb25lbmFuZF9iYm0oc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBw
eGEzeHhfYmJtICoqYmJtKTsKK2V4dGVybiBpbnQgbmFuZF9iYWRibG9ja3BvcyhzdHJ1Y3QgbXRk
X2luZm8gKm10ZCk7CitleHRlcm4gaW50IG9uZW5hbmRfYmFkYmxvY2twb3Moc3RydWN0IG10ZF9p
bmZvICptdGQpOworZXh0ZXJuIHN0cnVjdCBweGEzeHhfYmJtICpweGEzeHhfcXVlcnlfYmJtKHZv
aWQpOworI2VuZGlmCisKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL0tjb25maWcgYi9kcml2ZXJz
L210ZC9LY29uZmlnCmluZGV4IGI4ZTM1YTAuLjNjZGY3YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL0tjb25maWcKKysrIGIvZHJpdmVycy9tdGQvS2NvbmZpZwpAQCAtMzE1LDYgKzMxNSwxMiBA
QCBjb25maWcgTVREX09PUFMKIAkgIFRvIHVzZSwgYWRkIGNvbnNvbGU9dHR5TVREeCB0byB0aGUg
a2VybmVsIGNvbW1hbmQgbGluZSwKIAkgIHdoZXJlIHggaXMgdGhlIE1URCBkZXZpY2UgbnVtYmVy
IHRvIHVzZS4KIAorY29uZmlnIFBYQTN4eF9CQk0KKwlib29sICJNYXJ2ZWxsIFBYQTN4eCBCYWQg
QmxvY2sgTWFuYWdlbWVudCIKKwlkZXBlbmRzIG9uIE1URCAmJiAoTVREX05BTkQgfHwgTVREX09O
RU5BTkQpCisJaGVscAorCSAgVGhpcyBlbmFibGVzIE1hcnZlbGwgQmFkIGJsb2NrIG1hbmFnZW1l
bnQgb24gTkFORC9PTkVOQU5EIG9uIFBYQTN4eC4KKwogc291cmNlICJkcml2ZXJzL210ZC9jaGlw
cy9LY29uZmlnIgogCiBzb3VyY2UgImRyaXZlcnMvbXRkL21hcHMvS2NvbmZpZyIKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL01ha2VmaWxlIGIvZHJpdmVycy9tdGQvTWFrZWZpbGUKaW5kZXggODJk
MWU0ZC4uZTYzN2ZhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvTWFrZWZpbGUKKysrIGIvZHJp
dmVycy9tdGQvTWFrZWZpbGUKQEAgLTI1LDYgKzI1LDcgQEAgb2JqLSQoQ09ORklHX0lORlRMKQkJ
Kz0gaW5mdGwubwogb2JqLSQoQ09ORklHX1JGRF9GVEwpCQkrPSByZmRfZnRsLm8KIG9iai0kKENP
TkZJR19TU0ZEQykJCSs9IHNzZmRjLm8KIG9iai0kKENPTkZJR19NVERfT09QUykJCSs9IG10ZG9v
cHMubworb2JqLSQoQ09ORklHX1BYQTN4eF9CQk0pCSs9IHB4YTN4eF9iYm0ubwogCiBuZnRsLW9i
anMJCTo9IG5mdGxjb3JlLm8gbmZ0bG1vdW50Lm8KIGluZnRsLW9ianMJCTo9IGluZnRsY29yZS5v
IGluZnRsbW91bnQubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jCmluZGV4IDEzNGJmYmMuLmQ2Yzk1MjQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcHhhM3h4X25hbmQuYworKysgYi9kcml2ZXJz
L210ZC9uYW5kL3B4YTN4eF9uYW5kLmMKQEAgLTI0LDYgKzI0LDEwIEBACiAjaW5jbHVkZSA8bWFj
aC9kbWEuaD4KICNpbmNsdWRlIDxwbGF0L3B4YTN4eF9uYW5kLmg+CiAKKyNpZmRlZiBDT05GSUdf
UFhBM3h4X0JCTQorI2luY2x1ZGUgPHBsYXQvcHhhM3h4X2JibS5oPgorI2VuZGlmCisKICNkZWZp
bmUJQ0hJUF9ERUxBWV9USU1FT1VUCSgyICogSFovMTApCiAKIC8qIHJlZ2lzdGVycyBhbmQgYml0
IGRlZmluaXRpb25zICovCkBAIC0xMTIsNiArMTE2LDE0IEBAIGVudW0gewogCiBzdHJ1Y3QgcHhh
M3h4X25hbmRfaW5mbyB7CiAJc3RydWN0IG5hbmRfY2hpcAluYW5kX2NoaXA7CisjaWZkZWYgQ09O
RklHX1BYQTN4eF9CQk0KKwkvKgorCSAqIFJlc3RyaWN0aW9uOiBuYW5kX2NoaXAgc2hvdWxkIGJl
IHRoZSBmaXJzdCBvbmUgb2YgcHhhM3h4X25hbmRfaW5mby4KKwkgKiBiYm0gc2hvdWxkIGJlIHRo
ZSBzZWNvbmQgb25lIG9mIHB4YTN4eF9uYW5kX2luZm8uCisJICogTWFydmVsbCBQWEEzeHggQkJN
IGFsd2F5cyBhY2Nlc3MgdGhpcyBmaWVsZCB0byBnZXQgYmJtLgorCSAqLworCXN0cnVjdCBweGEz
eHhfYmJtCSpiYm07CisjZW5kaWYKIAogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UJICpwZGV2Owog
CWNvbnN0IHN0cnVjdCBweGEzeHhfbmFuZF9mbGFzaCAqZmxhc2hfaW5mbzsKQEAgLTM2NSw2ICsz
NzcsOCBAQCBzdGF0aWMgc3RydWN0IHB4YTN4eF9uYW5kX2ZsYXNoICpidWlsdGluX2ZsYXNoX3R5
cGVzW10gPSB7CiAvKiBjb252ZXJ0IG5hbmQgZmxhc2ggY29udHJvbGxlciBjbG9jayBjeWNsZXMg
dG8gbmFuby1zZWNvbmRzICovCiAjZGVmaW5lIGN5Y2xlMm5zKGMsIGNsaykJKCgoKGMpICsgMSkg
KiAxMDAwMDAwICsgY2xrIC8gNTAwKSAvIChjbGsgLyAxMDAwKSkKIAorc3RhdGljIGludCBweGEz
eHhfbmFuZF9yZWxvY2F0ZV9hZGRyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgcGFnZV9hZGRy
KTsKKwogc3RhdGljIHZvaWQgcHhhM3h4X25hbmRfc2V0X3RpbWluZyhzdHJ1Y3QgcHhhM3h4X25h
bmRfaW5mbyAqaW5mbywKIAkJCQkgICBjb25zdCBzdHJ1Y3QgcHhhM3h4X25hbmRfdGltaW5nICp0
KQogewpAQCAtNzA2LDYgKzcyMCw4IEBAIHN0YXRpYyB2b2lkIHB4YTN4eF9uYW5kX2NtZGZ1bmMo
c3RydWN0IG10ZF9pbmZvICptdGQsIHVuc2lnbmVkIGNvbW1hbmQsCiAKIAlpbml0X2NvbXBsZXRp
b24oJmluZm8tPmNtZF9jb21wbGV0ZSk7CiAKKwlwYWdlX2FkZHIgPSBweGEzeHhfbmFuZF9yZWxv
Y2F0ZV9hZGRyKG10ZCwgcGFnZV9hZGRyKTsKKwogCXN3aXRjaCAoY29tbWFuZCkgewogCWNhc2Ug
TkFORF9DTURfUkVBRE9PQjoKIAkJLyogZGlzYWJsZSBIVyBFQ0MgdG8gZ2V0IGFsbCB0aGUgT09C
IGRhdGEgKi8KQEAgLTExNjUsNiArMTE4MSwxMTMgQEAgc3RhdGljIHN0cnVjdCBuYW5kX2VjY2xh
eW91dCBod19sYXJnZXBhZ2VfZWNjbGF5b3V0ID0gewogCS5vb2JmcmVlID0geyB7MiwgMzh9IH0K
IH07CiAKKyNpZmRlZiBDT05GSUdfUFhBM3h4X0JCTQoraW50IHZlcmlmeV9uYW5kX2JibShzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IHB4YTN4eF9iYm0gKipiYm0pCit7CisJc3RydWN0IG5h
bmRfY2hpcCAqaW5mbyA9IG10ZC0+cHJpdjsKKwlzdHJ1Y3QgcHhhM3h4X2JibSAqKm5iYm0gPSBO
VUxMOworCisJLyogY2hlY2sgd2hldGhlciBjdXJyZW50IGZsYXNoIGlzIG5hbmQgKi8KKwluYmJt
ID0gKHN0cnVjdCBweGEzeHhfYmJtICoqKSgrK2luZm8pOworCWlmICgoKHVuc2lnbmVkIGludClu
YmJtIDwgUEFHRV9PRkZTRVQpCisJCXx8ICgodW5zaWduZWQgaW50KSpuYmJtIDwgUEFHRV9PRkZT
RVQpKQorCQlyZXR1cm4gUFhBM3h4X0JCTV9JTlZBTElEOworCisJaWYgKCgqbmJibSktPm1hZ2lj
ID09IFBYQV9CQk1fTUFHSUMpIHsKKwkJcHJfZGVidWcoIiVzOkZvdW5kIE5hbmQgZmxhc2guXG4i
LCBfX2Z1bmNfXyk7CisJCSpiYm0gPSAqbmJibTsKKwkJcmV0dXJuIFBYQTN4eF9CQk1fTkFORDsK
Kwl9CisJcmV0dXJuIFBYQTN4eF9CQk1fSU5WQUxJRDsKK30KKworc3RhdGljIGludCBweGEzeHhf
bmFuZF9yZWxvY2F0ZV9hZGRyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgcGFnZV9hZGRyKQor
eworCXN0cnVjdCBweGEzeHhfbmFuZF9pbmZvICppbmZvID0gbXRkLT5wcml2OworCXN0cnVjdCBw
eGEzeHhfYmJtICpiYm0gPSBpbmZvLT5iYm07CisJbG9mZl90IGFkZHI7CisJaW50IHJldDsKKwor
CWFkZHIgPSBwYWdlX2FkZHIgPDwgYmJtLT5wYWdlX3NoaWZ0OworCWFkZHIgPSBiYm0tPnNlYXJj
aChtdGQsIGFkZHIpOworCXJldCA9IGFkZHIgPj4gYmJtLT5wYWdlX3NoaWZ0OworCXJldHVybiBy
ZXQ7Cit9CisKK3N0YXRpYyBpbnQgcHhhM3h4X25hbmRfYmxvY2tfbWFya2JhZChzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgbG9mZl90IG9mcykKK3sKKwlzdHJ1Y3QgcHhhM3h4X25hbmRfaW5mbyAqaW5m
byA9IG10ZC0+cHJpdjsKKwlzdHJ1Y3QgcHhhM3h4X2JibSAqYmJtID0gaW5mby0+YmJtOworCXN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGQtPnByaXY7CisJdWludDhfdCBidWZbMl0gPSB7IDAs
IDAgfTsKKwlpbnQgYmxvY2ssIHJldDsKKworCS8qIEdldCBibG9jayBudW1iZXIgKi8KKwlibG9j
ayA9IChpbnQpKG9mcyA+PiBjaGlwLT5iYnRfZXJhc2Vfc2hpZnQpOworCisJLyogV2Ugd3JpdGUg
dHdvIGJ5dGVzLCBzbyB3ZSBkb250IGhhdmUgdG8gbWVzcyB3aXRoIDE2IGJpdAorCSAqIGFjY2Vz
cworCSAqLworCW9mcyArPSBtdGQtPm9vYnNpemU7CisJY2hpcC0+b3BzLmxlbiA9IGNoaXAtPm9w
cy5vb2JsZW4gPSAyOworCWNoaXAtPm9wcy5kYXRidWYgPSBOVUxMOworCWNoaXAtPm9wcy5vb2Ji
dWYgPSBidWY7CisJY2hpcC0+b3BzLm9vYm9mZnMgPSBjaGlwLT5iYWRibG9ja3BvcyAmIH4weDAx
OworCisJcmV0ID0gbXRkLT53cml0ZV9vb2IobXRkLCBvZnMsICZjaGlwLT5vcHMpOworCisJaWYg
KCFyZXQpCisJCW10ZC0+ZWNjX3N0YXRzLmJhZGJsb2NrcysrOworCisJcmV0dXJuIGJibS0+Ymxv
Y2tfbWFya2JhZChtdGQsIGJsb2NrKTsKK30KKworc3RhdGljIHZvaWQgcHhhM3h4X25hbmRfaW5p
dF9tdGQoc3RydWN0IG10ZF9pbmZvICptdGQsCisJCQkJIHN0cnVjdCBweGEzeHhfbmFuZF9pbmZv
ICppbmZvKQoreworCWNvbnN0IHN0cnVjdCBweGEzeHhfbmFuZF9mbGFzaCAqZiA9IGluZm8tPmZs
YXNoX2luZm87CisJc3RydWN0IG5hbmRfY2hpcCAqdGhpcyA9ICZpbmZvLT5uYW5kX2NoaXA7CisJ
c3RydWN0IHB4YTN4eF9iYm0gKmJibSA9IE5VTEw7CisKKwl0aGlzLT5vcHRpb25zID0gKGYtPmZs
YXNoX3dpZHRoID09IDE2KSA/IE5BTkRfQlVTV0lEVEhfMTY6IDA7CisKKwl0aGlzLT53YWl0ZnVu
YwkJPSBweGEzeHhfbmFuZF93YWl0ZnVuYzsKKwl0aGlzLT5zZWxlY3RfY2hpcAk9IHB4YTN4eF9u
YW5kX3NlbGVjdF9jaGlwOworCXRoaXMtPmRldl9yZWFkeQkJPSBweGEzeHhfbmFuZF9kZXZfcmVh
ZHk7CisJdGhpcy0+Y21kZnVuYwkJPSBweGEzeHhfbmFuZF9jbWRmdW5jOworCXRoaXMtPnJlYWRf
d29yZAkJPSBweGEzeHhfbmFuZF9yZWFkX3dvcmQ7CisJdGhpcy0+cmVhZF9ieXRlCQk9IHB4YTN4
eF9uYW5kX3JlYWRfYnl0ZTsKKwl0aGlzLT5yZWFkX2J1ZgkJPSBweGEzeHhfbmFuZF9yZWFkX2J1
ZjsKKwl0aGlzLT53cml0ZV9idWYJCT0gcHhhM3h4X25hbmRfd3JpdGVfYnVmOworCXRoaXMtPnZl
cmlmeV9idWYJPSBweGEzeHhfbmFuZF92ZXJpZnlfYnVmOworCisJdGhpcy0+ZWNjLm1vZGUJCT0g
TkFORF9FQ0NfSFc7CisJdGhpcy0+ZWNjLmh3Y3RsCQk9IHB4YTN4eF9uYW5kX2VjY19od2N0bDsK
Kwl0aGlzLT5lY2MuY2FsY3VsYXRlCT0gcHhhM3h4X25hbmRfZWNjX2NhbGN1bGF0ZTsKKwl0aGlz
LT5lY2MuY29ycmVjdAk9IHB4YTN4eF9uYW5kX2VjY19jb3JyZWN0OworCXRoaXMtPmVjYy5zaXpl
CQk9IGYtPnBhZ2Vfc2l6ZTsKKworCWlmIChmLT5wYWdlX3NpemUgPT0gMjA0OCkKKwkJdGhpcy0+
ZWNjLmxheW91dCA9ICZod19sYXJnZXBhZ2VfZWNjbGF5b3V0OworCWVsc2UKKwkJdGhpcy0+ZWNj
LmxheW91dCA9ICZod19zbWFsbHBhZ2VfZWNjbGF5b3V0OworCisJdGhpcy0+Y2hpcF9kZWxheSA9
IDI1OworCisJYmJtID0gcHhhM3h4X3F1ZXJ5X2JibSgpOworCWlmIChiYm0pIHsKKwkJLyogTWFy
dmVsbCBQWEEzeHggQkJNIGlzIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseSAqLworCQlpbmZvLT5i
Ym0gPSBiYm07CisJCXRoaXMtPnNjYW5fYmJ0ID0gYmJtLT5zY2FuX2JidDsKKwkJdGhpcy0+Ymxv
Y2tfbWFya2JhZCA9IHB4YTN4eF9uYW5kX2Jsb2NrX21hcmtiYWQ7CisJfQorfQorI2Vsc2UKK3N0
YXRpYyBpbnQgcHhhM3h4X25hbmRfcmVsb2NhdGVfYWRkcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
aW50IHBhZ2VfYWRkcikKK3sKKwlyZXR1cm4gcGFnZV9hZGRyOworfQorCiBzdGF0aWMgdm9pZCBw
eGEzeHhfbmFuZF9pbml0X210ZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAkJCQkgc3RydWN0IHB4
YTN4eF9uYW5kX2luZm8gKmluZm8pCiB7CkBAIC0xMTk2LDYgKzEzMTksNyBAQCBzdGF0aWMgdm9p
ZCBweGEzeHhfbmFuZF9pbml0X210ZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAogCXRoaXMtPmNo
aXBfZGVsYXkgPSAyNTsKIH0KKyNlbmRpZgogCiBzdGF0aWMgaW50IHB4YTN4eF9uYW5kX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9weGEzeHhfYmJtLmMgYi9kcml2ZXJzL210ZC9weGEzeHhfYmJtLmMKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMC4uYmNjOWEzNQotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMv
bXRkL3B4YTN4eF9iYm0uYwpAQCAtMCwwICsxLDQyNyBAQAorLyoKKyAqIGxpbnV4L2RyaXZlcnMv
bXRkL3B4YTN4eF9iYm0uYworICoKKyAqIFN1cHBvcnQgYmFkIGJsb2NrIG1hbmFnZW1lbnQgb24g
UFhBM3h4LgorICogQ29weXJpZ2h0IChDKSAyMDA3IE1hcnZlbGwgSW50ZXJuYXRpb25hbCBMdGQu
CisgKgorICogSGFvamlhbiBaaHVhbmcgPGhhb2ppYW4uemh1YW5nQG1hcnZlbGwuY29tPgorICoK
KyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CisgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcworICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24uCisgKgorICovCisKKyNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+
CisjaW5jbHVkZSA8bGludXgvbXRkL25hbmQuaD4KKyNpbmNsdWRlIDxwbGF0L3B4YTN4eF9iYm0u
aD4KKyNpbmNsdWRlIDxhc20vZXJybm8uaD4KKworc3RhdGljIHN0cnVjdCBweGEzeHhfYmJtICpw
eGEzeHhfYmJtID0gTlVMTDsKKworLyoKKyAqIGJibSBzaG91bGQgYmUgdGhlIG5leHQgZmllbGQg
b2YgbmFuZF9jaGlwIG9yIG9uZW5hbmRfY2hpcC4KKyAqLworc3RhdGljIGludCB2ZXJpZnlfYmJt
X21hZ2ljKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgcHhhM3h4X2JibSAqKmJibSkKK3sK
KwlpbnQgcmV0OworCisJcmV0ID0gdmVyaWZ5X25hbmRfYmJtKG10ZCwgYmJtKTsKKwlyZXR1cm4g
cmV0OworfQorCitzdGF0aWMgdm9pZCBkdW1wX3JsdGFibGUoc3RydWN0IHB4YTN4eF9iYm0gKmJi
bSkKK3sKKwlpbnQgaTsKKworCWlmIChiYm0tPnRhYmxlLT50b3RhbCA9PSAwKSB7CisJCXByX2lu
Zm8oIlRoZSByZWxvY2F0aW9uIHRhYmxlIGlzIGVtcHR5IG5vd1xuIik7CisJCXJldHVybjsKKwl9
CisJZm9yIChpID0gMDsgaSA8IGJibS0+dGFibGUtPnRvdGFsOyBpKyspIHsKKwkJaWYgKGJibS0+
ZW50cnlbaV0uZnJvbSA9PSAodW5zaWduZWQgc2hvcnQpKC0xKSkKKwkJCWNvbnRpbnVlOworCQlp
ZiAoYmJtLT5lbnRyeVtpXS50byA9PSAodW5zaWduZWQgc2hvcnQpKC0xKSkKKwkJCXByX2luZm8o
IiglNGQpOiBibG9jayAjJWQgaXMgYmFkIGluIHJlbG9jYXRpb24gYXJlYVxuIiwKKwkJCQlpLCBi
Ym0tPmVudHJ5W2ldLmZyb20pOworCQllbHNlCisJCQlwcl9pbmZvKCIoJTRkKTogYmxvY2sgIyVk
IGlzIHJlbG9jYXRlZCB0byAjJWRcbiIsCisJCQkJaSwgYmJtLT5lbnRyeVtpXS5mcm9tLCBiYm0t
PmVudHJ5W2ldLnRvKTsKKwl9Cit9CisKKy8qIEluaXRpYWxpemUgdGhlIHJlbG9jYXRpb24gdGFi
bGUgKi8KK3N0YXRpYyBpbnQgcHhhM3h4X2luaXRfcmx0YWJsZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKK3sKKwlzdHJ1Y3QgcHhhM3h4X2JibSAqYmJtID0gTlVMTDsKKwlpbnQgc2l6ZSA9IG10ZC0+
d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOworCWludCBwYWdlcywgZW50cmllczsKKworCWlmICh2
ZXJpZnlfYmJtX21hZ2ljKG10ZCwgJmJibSkgPCAwKSB7CisJCS8qIEJCTSBkb24ndCBzdXBwb3J0
IHRoaXMgdHlwZSBvZiBmbGFzaCAqLworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwliYm0tPnBh
Z2Vfc2hpZnQgPSBmZnMobXRkLT53cml0ZXNpemUpIC0gMTsKKwliYm0tPmVyYXNlX3NoaWZ0ID0g
ZmZzKG10ZC0+ZXJhc2VzaXplKSAtIDE7CisKKwlwYWdlcyA9IG10ZC0+ZXJhc2VzaXplID4+IGJi
bS0+cGFnZV9zaGlmdDsKKworCWVudHJpZXMgPSBtdGQtPnNpemUgPj4gYmJtLT5lcmFzZV9zaGlm
dDsKKwllbnRyaWVzID0gKGVudHJpZXMgKiAyKSAvIDEwMDsKKwlpZiAobXRkLT53cml0ZXNpemUg
PT0gNTEyKQorCQllbnRyaWVzID0gKGVudHJpZXMgPCBQWEFfTUFYX1JMRU5UUlkpID8gZW50cmll
cworCQkJICA6IFBYQV9NQVhfUkxFTlRSWTsKKworCWJibS0+bWF4X3Nsb3RzCT0gUFhBX01BWF9T
TE9UOworCWJibS0+bWF4X3JlbG9jYXRlX2VudHJ5ID0gZW50cmllczsKKwliYm0tPmN1cnJlbnRf
c2xvdCA9IC0xOworCisJYmJtLT5kYXRhX2J1ZiA9IGt6YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7
CisJaWYgKGJibS0+ZGF0YV9idWYgPT0gTlVMTCkKKwkJcmV0dXJuIC1FTk9NRU07CisKKwliYm0t
PnRhYmxlID0gKHN0cnVjdCByZWxvY2F0ZV90YWJsZSAqKWJibS0+ZGF0YV9idWY7CisJbWVtc2V0
KGJibS0+dGFibGUsIDAsIHNpemVvZihzdHJ1Y3QgcmVsb2NhdGVfdGFibGUpKTsKKworCWJibS0+
ZW50cnkgPSAoc3RydWN0IHJlbG9jYXRlX2VudHJ5ICopKCh1aW50OF90ICopYmJtLT5kYXRhX2J1
ZiArCisJCQlzaXplb2Yoc3RydWN0IHJlbG9jYXRlX2VudHJ5KSk7CisJbWVtc2V0KGJibS0+ZW50
cnksIDAsIHNpemVvZihzdHJ1Y3QgcmVsb2NhdGVfZW50cnkpCisJCSogYmJtLT5tYXhfcmVsb2Nh
dGVfZW50cnkpOworCisJcmV0dXJuIDA7Cit9CisKKy8qIFVuaW5pdGlhbGl6ZSB0aGUgcmVsb2Nh
dGlvbiB0YWJsZSAqLworc3RhdGljIHZvaWQgcHhhM3h4X3VuaW5pdF9ybHRhYmxlKHN0cnVjdCBt
dGRfaW5mbyAqbXRkKQoreworCXN0cnVjdCBweGEzeHhfYmJtICpiYm0gPSBOVUxMOworCisJaWYg
KHZlcmlmeV9iYm1fbWFnaWMobXRkLCAmYmJtKSA8IDApIHsKKwkJLyogQkJNIGRvbid0IHN1cHBv
cnQgdGhpcyBmbGFzaCB0eXBlICovCisJCXJldHVybjsKKwl9CisKKwlpZiAoYmJtKSB7CisJCWtm
cmVlKGJibS0+ZGF0YV9idWYpOworCQliYm0gPSBOVUxMOworCX0KK30KKworLyoKKyAqIE1vdmUg
bGFyZ2VyIGRhdGEgdG8gbGVmdCBvZiBwaXZvdCwgYW5kIG1vdmUgc21hbGxlciBkYXRhIHRvIHJp
Z2h0IG9mCisgKiBwaXZvdC4KKyAqLworc3RhdGljIGludCBwYXJ0aXRpb24odW5zaWduZWQgc2hv
cnQgKmFycmF5LCBpbnQgbGVmdCwgaW50IHJpZ2h0LCBpbnQgcGl2b3RfaWR4KQoreworCWludCBp
LCBwaXZvdCwgYmFzZV9pZHg7CisKKwlwaXZvdCA9IGFycmF5W3Bpdm90X2lkeF07CisJc3dhcChh
cnJheVtsZWZ0XSwgYXJyYXlbcmlnaHRdKTsKKwliYXNlX2lkeCA9IGxlZnQ7CisKKwlmb3IgKGkg
PSBsZWZ0OyBpIDwgcmlnaHQ7IGkrKykgeworCQlpZiAoYXJyYXlbaV0gPiBwaXZvdCkgeworCQkJ
c3dhcChhcnJheVtpXSwgYXJyYXlbYmFzZV9pZHhdKTsKKwkJCWJhc2VfaWR4Kys7CisJCX0KKwl9
CisJaWYgKGJhc2VfaWR4IDwgcmlnaHQpCisJCXN3YXAoYXJyYXlbYmFzZV9pZHhdLCBhcnJheVty
aWdodF0pOworCXJldHVybiBiYXNlX2lkeDsKK30KKworc3RhdGljIGludCBxdWlja19zb3J0KHVu
c2lnbmVkIHNob3J0ICphcnJheSwgaW50IGxlZnQsIGludCByaWdodCkKK3sKKwlpbnQgcGl2b3Rf
aWR4LCBuZXdfaWR4OworCWlmIChyaWdodCA+IGxlZnQpIHsKKwkJcGl2b3RfaWR4ID0gbGVmdDsK
KwkJbmV3X2lkeCA9IHBhcnRpdGlvbihhcnJheSwgbGVmdCwgcmlnaHQsIHBpdm90X2lkeCk7CisJ
CXF1aWNrX3NvcnQoYXJyYXksIGxlZnQsIG5ld19pZHggLSAxKTsKKwkJcXVpY2tfc29ydChhcnJh
eSwgbmV3X2lkeCArIDEsIHJpZ2h0KTsKKwl9CisJcmV0dXJuIDA7Cit9CisKKy8qCisgKiBBZGQg
dGhlIHJlbG9jYXRpb24gZW50cnkgaW50byB0aGUgcmVsb2NhdGlvbiB0YWJsZS4gSWYgdGhlIHJl
bG9jYXRlZCBibG9jaworICogaXMgYmFkLCBhbiBuZXcgZW50cnkgd2lsbCBiZSBhZGRlZCBpbnRv
IHRoZSBib3R0b20gb2YgdGhlIHJlbG9jYXRpb24gdGFibGUuCisgKi8KK2ludCB1cGRhdGVfcmx0
YWJsZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IGJsb2NrKQoreworCXN0cnVjdCBweGEzeHhf
YmJtICpiYm0gPSBOVUxMOworCXN0cnVjdCByZWxvY2F0ZV90YWJsZSAqdGFibGUgPSBOVUxMOwor
CXN0cnVjdCByZWxvY2F0ZV9lbnRyeSAqZW50cnkgPSBOVUxMOworCXN0cnVjdCBlcmFzZV9pbmZv
IGluc3RyOworCXVuc2lnbmVkIHNob3J0IGFycmF5W1BYQV9NQVhfUkxFTlRSWV0sIGFkZHI7CisJ
aW50IGksIGlkeCwgcmV0LCByZWxvY2F0ZWRfaWR4ID0gLTE7CisKKwlpZiAodmVyaWZ5X2JibV9t
YWdpYyhtdGQsICZiYm0pIDwgMCkgeworCQkvKiBCQk0gZG9uJ3Qgc3VwcG9ydCB0aGlzIHR5cGUg
b2YgZmxhc2ggKi8KKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJdGFibGUgPSBiYm0tPnRhYmxl
OworCWVudHJ5ID0gYmJtLT5lbnRyeTsKKworCS8qIGlkZW50aWZ5IHdoZXRoZXIgdGhlIGJsb2Nr
IGhhcyBiZWVuIHJlbG9jYXRlZCAqLworCWZvciAoaSA9IDA7IGkgPCB0YWJsZS0+dG90YWw7IGkr
KykgeworCQlpZiAoZW50cnlbaV0uZnJvbSA9PSAodW5zaWduZWQgc2hvcnQpKC0xKSkKKwkJCWNv
bnRpbnVlOworCQlpZiAoYmxvY2sgPT0gZW50cnlbaV0uZnJvbSkgeworCQkJcmVsb2NhdGVkX2lk
eCA9IGk7CisJCQlicmVhazsKKwkJfQorCX0KKworc2NhbjoKKwlpZiAodGFibGUtPnRvdGFsID4g
YmJtLT5tYXhfcmVsb2NhdGVfZW50cnkpIHsKKwkJcHJfd2FybmluZygiUmVsb2NhdGlvbiBlbnRy
aWVzIGV4Y2VlZCBtYXggbnVtLiBDYW4ndCByZWxvY2F0ZSIpOworCQlwcl93YXJuaW5nKCIgYmxv
Y2sgMHgleFxuIiwgYmxvY2spOworCQlyZXR1cm4gLUVOT1NQQzsKKwl9CisKKwltZW1zZXQoYXJy
YXksIDAsIFBYQV9NQVhfUkxFTlRSWSk7CisJLyogR2V0IGFsbCBpbmRleCBvZiByZWxvY2F0ZWQg
YmxvY2tzICovCisJZm9yIChpID0gMCwgaWR4ID0gMDsgaSA8IHRhYmxlLT50b3RhbDsgaSsrKSB7
CisJCWFycmF5W2lkeF0gPSAoZW50cnlbaV0udG8gIT0gKHVuc2lnbmVkIHNob3J0KSgtMSkpID8g
ZW50cnlbaV0udG8KKwkJCQk6IGVudHJ5W2ldLmZyb207CisJCWlkeCsrOworCX0KKwkvKiBzb3J0
IGFycmF5IHdpdGggZGVzY2VuZGluZyBvcmRlciAqLworCXF1aWNrX3NvcnQoYXJyYXksIDAsIGlk
eCAtIDEpOworCS8qCisJICogZmluZCB0aGUgYXZhaWxhYmxlIGJsb2NrIHdpdGggdGhlIGxhcmdl
c3QgbnVtYmVyIGluIHJlc2VydmVyZWQKKwkgKiBhcmVhCisJICovCisJYWRkciA9ICh1bnNpZ25l
ZCBzaG9ydCkoKG10ZC0+c2l6ZSA+PiBiYm0tPmVyYXNlX3NoaWZ0KSAtIDEpOworCWZvciAoaSA9
IDA7IGkgPCBiYm0tPm1heF9yZWxvY2F0ZV9lbnRyeTsgaSsrLCBhZGRyLS0pIHsKKwkJaWYgKGFk
ZHIgPCAoKG10ZC0+c2l6ZSA+PiBiYm0tPmVyYXNlX3NoaWZ0KQorCQkJLSBiYm0tPm1heF9yZWxv
Y2F0ZV9lbnRyeSkpIHsKKwkJCXByX3dhcm5pbmcoIlJlbG9jYXRpb24gYXJlYSBpcyBhbHJlYWR5
IGZ1bGwhXG4iKTsKKwkJCXJldHVybiAtRU5PU1BDOworCQl9CisJCWlmIChhcnJheVtpXSA8IGFk
ZHIpIHsKKwkJCW1lbXNldCgmaW5zdHIsIDAsIHNpemVvZihzdHJ1Y3QgZXJhc2VfaW5mbykpOwor
CQkJaW5zdHIubXRkID0gbXRkOworCQkJaW5zdHIuYWRkciA9IGFkZHIgPDwgYmJtLT5lcmFzZV9z
aGlmdDsKKwkJCWluc3RyLmxlbiA9IDEgPDwgYmJtLT5lcmFzZV9zaGlmdDsKKwkJCXJldCA9IG10
ZC0+ZXJhc2UobXRkLCAmaW5zdHIpOworCQkJaWYgKHJldCA9PSAwKSB7CisJCQkJLyogZmlsbCB0
aGUgcmVjb3JkZXIgaW50byByZWxvY2F0aW9uIHRhYmxlICovCisJCQkJaWYgKHJlbG9jYXRlZF9p
ZHggPT0gLTEpIHsKKwkJCQkJLyogbmV3IGVudHJ5IGluIHJlbG9jYXRpb24gdGFibGUgKi8KKwkJ
CQkJZW50cnlbdGFibGUtPnRvdGFsXS5mcm9tID0gYmxvY2s7CisJCQkJCWVudHJ5W3RhYmxlLT50
b3RhbF0udG8gPSBhZGRyOworCQkJCQl0YWJsZS0+dG90YWwrKzsKKwkJCQkJZ290byBkb25lOwor
CQkJCX0gZWxzZSB7CisJCQkJCS8qIHVwZGF0ZSBlbnRyeSBpbiByZWxvY2F0aW9uIHRhYmxlICov
CisJCQkJCWVudHJ5W3RhYmxlLT50b3RhbF0uZnJvbQorCQkJCQkJPSBlbnRyeVtyZWxvY2F0ZWRf
aWR4XS50bzsKKwkJCQkJZW50cnlbdGFibGUtPnRvdGFsXS50bworCQkJCQkJPSAodW5zaWduZWQg
c2hvcnQpKC0xKTsKKwkJCQkJdGFibGUtPnRvdGFsKys7CisJCQkJCWVudHJ5W3JlbG9jYXRlZF9p
ZHhdLnRvID0gYWRkcjsKKwkJCQkJZ290byBkb25lOworCQkJCX0KKwkJCX0gZWxzZSB7CisJCQkJ
LyogYXBwZW5kIG5ldyBiYWQgZW50cnkgKi8KKwkJCQllbnRyeVt0YWJsZS0+dG90YWxdLmZyb20g
PSBhZGRyOworCQkJCWVudHJ5W3RhYmxlLT50b3RhbF0udG8gPSAodW5zaWduZWQgc2hvcnQpKC0x
KTsKKwkJCQl0YWJsZS0+dG90YWwrKzsKKwkJCQlnb3RvIHNjYW47CisJCQl9CisJCX0KKwl9CisK
K2RvbmU6CisJcmV0dXJuIDA7Cit9CisKKy8qIFdyaXRlIHRoZSByZWxvY2F0aW9uIHRhYmxlIGJh
Y2sgdG8gZGV2aWNlLCBpZiB0aGVyZSdzIHJvb20uICovCitzdGF0aWMgaW50IHN5bmNfcmx0YWJs
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50ICppZHgpCit7CisJc3RydWN0IHB4YTN4eF9iYm0g
KmJibSA9IE5VTEw7CisJdW5zaWduZWQgY2hhciAqdG1wOworCXNpemVfdCByZXRsZW47CisJaW50
IGxlbiwgcGFnZXM7CisKKwlpZiAodmVyaWZ5X2JibV9tYWdpYyhtdGQsICZiYm0pIDwgMCkgewor
CQkvKiBCQk0gZG9uJ3Qgc3VwcG9ydCB0aGlzIHR5cGUgb2YgZmxhc2ggKi8KKwkJcmV0dXJuIC1F
SU5WQUw7CisJfQorCisJcGFnZXMgPSBtdGQtPmVyYXNlc2l6ZSA+PiBiYm0tPnBhZ2Vfc2hpZnQ7
CisJaWYgKCgqaWR4ID49IHBhZ2VzKSB8fCAoKmlkeCA8PSAocGFnZXMgLSBiYm0tPm1heF9zbG90
cykpKSB7CisJCXByaW50ayhLRVJOX0VSUiAiV3JvbmcgU2xvdCBpcyBzcGVjaWZpZWQuXG4iKTsK
KwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJLyogc2hvdWxkIHdyaXRlIHRvIHRoZSBuZXh0IHNs
b3QqLworCSgqaWR4KS0tOworCisJbGVuID0gNDsJCS8qIHRhYmxlIGhlYWRlciAqLworCWxlbiAr
PSBiYm0tPnRhYmxlLT50b3RhbCA8PCAyOworCisJdG1wID0gKHVuc2lnbmVkIGNoYXIgKiliYm0t
PmRhdGFfYnVmOworCW10ZC0+d3JpdGUobXRkLCAoKmlkeCkgPDwgYmJtLT5wYWdlX3NoaWZ0LAor
CQkgICAxIDw8IGJibS0+cGFnZV9zaGlmdCwgJnJldGxlbiwgdG1wKTsKKworCXJldHVybiAwOwor
fQorCitzdGF0aWMgaW50IHB4YTN4eF9zY2FuX3JsdGFibGUoc3RydWN0IG10ZF9pbmZvICptdGQp
Cit7CisJc3RydWN0IHB4YTN4eF9iYm0gKmJibSA9IE5VTEw7CisJc3RydWN0IHJlbG9jYXRlX3Rh
YmxlICp0YWJsZTsKKwlpbnQgcGFnZSwgbWF4X3BhZ2U7CisJc2l6ZV90IHJldGxlbjsKKwlpbnQg
cmV0LCByZXRyeV9jb3VudCA9IDM7CisKKwlpZiAodmVyaWZ5X2JibV9tYWdpYyhtdGQsICZiYm0p
IDwgMCkgeworCQkvKiBCQk0gZG9uJ3Qgc3VwcG9ydCB0aGlzIHR5cGUgb2YgZmxhc2ggKi8KKwkJ
cmV0dXJuIC1FSU5WQUw7CisJfQorCisJcHhhM3h4X2luaXRfcmx0YWJsZShtdGQpOworCisJdGFi
bGUgPSBiYm0tPnRhYmxlOworCisJYmJtLT5jdXJyZW50X3Nsb3QgPSAtMTsKKwlwYWdlID0gKG10
ZC0+ZXJhc2VzaXplID4+IGJibS0+cGFnZV9zaGlmdCkgLSBiYm0tPm1heF9zbG90czsKKwltYXhf
cGFnZSA9IG10ZC0+ZXJhc2VzaXplID4+IGJibS0+cGFnZV9zaGlmdDsKKwlmb3IgKDsgcGFnZSA8
IG1heF9wYWdlOyBwYWdlKyssIHJldHJ5X2NvdW50ID0gMykgeworcmV0cnk6CisJCW1lbXNldChi
Ym0tPmRhdGFfYnVmLCAwLCBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZSk7CisJCXJldCA9
IG10ZC0+cmVhZChtdGQsIChwYWdlIDw8IGJibS0+cGFnZV9zaGlmdCksCisJCQkJbXRkLT53cml0
ZXNpemUsICZyZXRsZW4sIGJibS0+ZGF0YV9idWYpOworCQlpZiAocmV0ID09IDApIHsKKwkJCWlm
ICh0YWJsZS0+aGVhZGVyID09IFBYQV9STFRBQkxFX0hFQURFUikgeworCQkJCWJibS0+Y3VycmVu
dF9zbG90ID0gcGFnZTsKKwkJCQlicmVhazsKKwkJCX0KKwkJfSBlbHNlIHsKKwkJCWlmIChyZXRy
eV9jb3VudC0tKQorCQkJCWdvdG8gcmV0cnk7CisJCX0KKwl9CisJaWYgKGJibS0+Y3VycmVudF9z
bG90ICE9IC0xKSB7CisJCXByX2RlYnVnKCJGb3VuZCByZWxvY2F0aW9uIHRhYmxlIGF0IHBhZ2U6
JWRcbiIsCisJCQliYm0tPmN1cnJlbnRfc2xvdCk7CisJCWR1bXBfcmx0YWJsZShiYm0pOworCX0g
ZWxzZSB7CisJCXByX2VycigiQ2FuJ3QgcmVjb2duaXplIHJlbG9jYXRpb24gdGFibGUuXG4iKTsK
KwkJcHJfZXJyKCJDQVVUSU9OOiBJdCBtYXkgY2F1c2UgdW5wcmVkaWNhdGVkIGVycm9yXG4iKTsK
KwkJcHJfZXJyKCJQbGVhc2UgcmUtaW5pdGlhbGl6ZSB0aGUgZmxhc2guXG4iKTsKKwkJbWVtc2V0
KCh1bnNpZ25lZCBjaGFyICopYmJtLT50YWJsZSwgMCwKKwkJCXNpemVvZihzdHJ1Y3QgcmVsb2Nh
dGVfdGFibGUpKTsKKwkJcmV0dXJuIC1FRkFVTFQ7CisJfQorCXJldHVybiAwOworfQorCisvKgor
ICogRmluZCB0aGUgcmVsb2NhdGVkIGJsb2NrIG9mIHRoZSBiYWQgb25lLgorICogSWYgaXQncyBh
IGdvb2QgYmxvY2ssIHJldHVybiAwLiBPdGhlcndpc2UsIHJldHVybiBhIHJlbG9jYXRlZCBvbmUu
CisgKiBpZHggcG9pbnRzIHRvIHRoZSBuZXh0IHJlbG9jYXRpb24gZW50cnkKKyAqIElmIHRoZSBy
ZWxvY2F0ZWQgYmxvY2sgaXMgYmFkLCBhbiBuZXcgZW50cnkgd2lsbCBiZSBhZGRlZCBpbnRvIHRo
ZQorICogYm90dG9tIG9mIHRoZSByZWxvY2F0aW9uIHRhYmxlLgorICovCitzdGF0aWMgbG9mZl90
IHB4YTN4eF9zZWFyY2hfcmxlbnRyeShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcykK
K3sKKwlzdHJ1Y3QgcHhhM3h4X2JibSAqYmJtID0gTlVMTDsKKwlzdHJ1Y3QgcmVsb2NhdGVfdGFi
bGUgKnRhYmxlID0gTlVMTDsKKwlzdHJ1Y3QgcmVsb2NhdGVfZW50cnkgKmVudHJ5ID0gTlVMTDsK
KwlpbnQgaSwgYmxvY2s7CisKKwkvKgorCSAqIEluIFNMQywgYmxvY2sgMCBzaG91bGRuJ3QgYmUg
YnJva2VuLgorCSAqIEluIHNvbWUgY29tbWFuZCwgYWRkcmVzcyBpcyBhc3NpZ25lZCB0byAwIGlm
IGl0IGRvZXNuJ3QgbmVlZAorCSAqIHRvIG9wZXJhdGUgYWRkcmVzcy4gU28ganVzdCBza2lwIGl0
LgorCSAqLworCWlmIChvZnMgPD0gMCkKKwkJcmV0dXJuIG9mczsKKworCWlmICh2ZXJpZnlfYmJt
X21hZ2ljKG10ZCwgJmJibSkgPCAwKQorCQlyZXR1cm4gb2ZzOworCisJdGFibGUgPSBiYm0tPnRh
YmxlOworCWVudHJ5ID0gYmJtLT5lbnRyeTsKKworCWJsb2NrID0gb2ZzID4+IGJibS0+ZXJhc2Vf
c2hpZnQ7CisKKwlpZiAoKGJibS0+Y3VycmVudF9zbG90ID09IC0xKSB8fCAodGFibGUtPnRvdGFs
IDw9IDApCisJCXx8IChibG9jayA+PSAobXRkLT5zaXplID4+IGJibS0+ZXJhc2Vfc2hpZnQpKSkK
KwkJcmV0dXJuIG9mczsKKworCW9mcyA9IG9mcyAtIChibG9jayA8PCBiYm0tPmVyYXNlX3NoaWZ0
KTsJLyogc2F2ZSBvZmZzZXQgKi8KKworCWZvciAoaSA9IDA7IGkgPCB0YWJsZS0+dG90YWw7IGkr
KykgeworCQlpZiAoYmxvY2sgPT0gZW50cnlbaV0uZnJvbSkgeworCQkJYmxvY2sgPSBlbnRyeVtp
XS50bzsKKwkJCWJyZWFrOworCQl9CisJfQorCW9mcyArPSBibG9jayA8PCBiYm0tPmVyYXNlX3No
aWZ0OworCXJldHVybiBvZnM7Cit9CisKK3N0YXRpYyBpbnQgcHhhM3h4X21hcmtfcmxlbnRyeShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IGJsb2NrKQoreworCXN0cnVjdCBweGEzeHhfYmJtICpi
Ym0gPSBOVUxMOworCWludCByZXQgPSAwOworCisJcmV0ID0gdmVyaWZ5X2JibV9tYWdpYyhtdGQs
ICZiYm0pOworCWlmIChyZXQgPCAwKSB7CisJCS8qIEJCTSBkb24ndCBzdXBwb3J0IHRoaXMgdHlw
ZSBvZiBmbGFzaCAqLworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlyZXQgPSB1cGRhdGVfcmx0
YWJsZShtdGQsIGJsb2NrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIHN5
bmNfcmx0YWJsZShtdGQsICYoYmJtLT5jdXJyZW50X3Nsb3QpKTsKK30KKworLyogSWYgTWFydmVs
bCBCQk0gaXMgdXNlZCwgcmV0dXJuIDAuIE90aGVyd2lzZSwgcmV0dXJuIG5lZ2F0aXZlIHZhbHVl
LiAqLworc3RydWN0IHB4YTN4eF9iYm0gKnB4YTN4eF9xdWVyeV9iYm0odm9pZCkKK3sKKwlpZiAo
cHhhM3h4X2JibSkKKwkJcmV0dXJuIHB4YTN4eF9iYm07CisJcmV0dXJuIE5VTEw7Cit9CitFWFBP
UlRfU1lNQk9MKHB4YTN4eF9xdWVyeV9iYm0pOworCitzdGF0aWMgaW50IF9faW5pdCBweGEzeHhf
YmJtX2luaXQodm9pZCkKK3sKKwlzdHJ1Y3QgcHhhM3h4X2JibSAqYmJtOworCisJYmJtID0ga3ph
bGxvYyhzaXplb2Yoc3RydWN0IHB4YTN4eF9iYm0pLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWJibSkK
KwkJcmV0dXJuIC1FTk9NRU07CisKKwliYm0tPm1hZ2ljCQk9IFBYQV9CQk1fTUFHSUM7CisJYmJt
LT51bmluaXQJCT0gcHhhM3h4X3VuaW5pdF9ybHRhYmxlOworCWJibS0+c2VhcmNoCQk9IHB4YTN4
eF9zZWFyY2hfcmxlbnRyeTsKKwliYm0tPmJsb2NrX21hcmtiYWQJPSBweGEzeHhfbWFya19ybGVu
dHJ5OworCWJibS0+c2Nhbl9iYnQJCT0gcHhhM3h4X3NjYW5fcmx0YWJsZTsKKworCXB4YTN4eF9i
Ym0gPSBiYm07CisKKwlyZXR1cm4gMDsKK30KK3N1YnN5c19pbml0Y2FsbChweGEzeHhfYmJtX2lu
aXQpOworCitzdGF0aWMgdm9pZCBweGEzeHhfYmJtX2V4aXQodm9pZCkKK3sKKwlpZiAocHhhM3h4
X2JibSkgeworCQlrZnJlZShweGEzeHhfYmJtKTsKKwkJcHhhM3h4X2JibSA9IE5VTEw7CisJfQor
fQorbW9kdWxlX2V4aXQocHhhM3h4X2JibV9leGl0KTsKKworTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
OworTU9EVUxFX0RFU0NSSVBUSU9OKCJNYXJ2ZWxsIFBYQTN4eCBCYWQgQmxvY2sgTWFuYWdlbWVu
dCIpOwotLSAKMS41LjYuNQoK
--001517741a149782d2047465a8bf--
