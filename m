Received: from wx-out-0506.google.com ([66.249.82.238])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQWPp-0004BU-4K
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 18:53:48 -0400
Received: by wx-out-0506.google.com with SMTP id s7so335440wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 15:53:34 -0700 (PDT)
Message-ID: <46D5F890.5070305@gmail.com>
Date: Wed, 29 Aug 2007 18:52:00 -0400
MIME-Version: 1.0
To: "Mouawad, Tony" <Tony.Mouawad@christiedigital.com>
Subject: Re: Support for Intel Flash Strata P30 512Mbit
References: <AD98412A5373CC4AA643D9C021922A543A92F5@cdskitexg01.cds.int>
In-Reply-To: <AD98412A5373CC4AA643D9C021922A543A92F5@cdskitexg01.cds.int>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
From: Vernon Sauder <vernoninhand@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mouawad, Tony wrote:
> Hello,
>
> I'm running GNU Linux v2.6.10 on the Coldfire architecture and from what I can see, there is no support for the Intel Strata P30 512Mbit dual die flash device.  The best that we can get out of it is a single 256MBit die working.  Can anyone please tell me if later versions of the MTD driver support Strata P30 512Mbit flash?  If I am asking the question in the wrong place, will someone directly to the right place?  Thank you for your help.
>
> Regards,
> Tony
Tony,

I had the same issue and was hoping someone else would fix it. I finally 
had to do something so I came up with a solution. The solution was to 
create a separate cfi_ident structure for each chip, defaulting to the 
original or base one if we don't see see the dual-die Strataflash. Then 
I created a fixup for the StrataFlash to detect the dual-die and modify 
the cfi structures.

I also tried to fix the erase regions of the Strataflash chip but that 
failed. See patch below. It was much simpler but did not seem to work 
correctly.

This patch was against 2.6.20. Most of the differences are because of 
the structure member rename.


# Fix Intel StrataFlash detection (PC48F4400xxx)
# we need to create a different CFI structure (cfi_ident) for each chip 
in the map.
# This keeps the EraseRegionInfo for each chip separate. To limit 
change, the cfiq
# is linked to the main one unless it needs to be different.
# This is considered a temporary fix. Hopefully, MTD is updated to provide
# full native support for this chip.

diff -U15 --exclude-from=/tmp/fileLxzYlC -rbw 
src.cache/drivers/mtd/chips/cfi_cmdset_0001.c 
src.new/drivers/mtd/chips/cfi_cmdset_0001.c
--- src.cache/drivers/mtd/chips/cfi_cmdset_0001.c    2007-02-04 
13:44:54.000000000 -0500
+++ src.new/drivers/mtd/chips/cfi_cmdset_0001.c    2007-06-21 
01:12:33.000000000 -0400
@@ -155,87 +155,120 @@
 
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 /* Some Intel Strata Flash prior to FPO revision C has bugs in this area */
 static void fixup_intel_strataflash(struct mtd_info *mtd, void* param)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
     struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
 
     printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
                         "erase on write disabled.\n");
     extp->SuspendCmdSupport &= ~1;
 }
 #endif
 
+#ifdef CONFIG_STACKED_STRATAFLASH
+static void fixup_stacked_strataflash(struct mtd_info *mtd, void* param)
+{
+    struct map_info *map = mtd->priv;
+    struct cfi_private *cfi = map->fldrv_priv;
+
+    if (cfi->numchips == 2) { // FIXME: should make this work for 
4-stack also
+        // we may have a dual-die chip
+        if ((cfi->id >= 0x891A && cfi->id <= 0x891C) && 
cfi->addr_unlock1 == cfi->id - 3) {
+            printk(KERN_DEBUG "Fixing up stacked strataflash\n");
+           
+            // make a new CFI struct for this chip
+            uint32_t cfiq_sz = sizeof(struct cfi_ident) +
+                    (cfi->cfiq_base->NumEraseRegions) * sizeof(uint32_t);
+            struct cfi_ident *cfiq_fl = kzalloc(cfiq_sz, GFP_KERNEL);
+            if (!cfiq_fl) {
+                printk(KERN_WARNING "%s: kmalloc failed for CFI ident 
structure\n", map->name);
+                return;
+            }
+            CFIQ(cfi,1) = cfiq_fl;
+   
+            // just copy most of it
+            memcpy(cfiq_fl, cfi->cfiq_base, cfiq_sz);
+            // invert regions
+            int i = cfi->cfiq_base->NumEraseRegions;
+            cfiq_fl->EraseRegionInfo[i-1] = 
cfi->cfiq_base->EraseRegionInfo[0];
+            cfiq_fl->EraseRegionInfo[i-2] = 
cfi->cfiq_base->EraseRegionInfo[1];
+        }
+    }
+}
+#endif
+
 #ifdef CMDSET0001_DISABLE_WRITE_SUSPEND
 static void fixup_no_write_suspend(struct mtd_info *mtd, void* param)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
     struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
 
     if (cfip && (cfip->FeatureSupport&4)) {
         cfip->FeatureSupport &= ~4;
         printk(KERN_WARNING "cfi_cmdset_0001: write suspend disabled\n");
     }
 }
 #endif
 
 static void fixup_st_m28w320ct(struct mtd_info *mtd, void* param)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
 
-    cfi->cfiq->BufWriteTimeoutTyp = 0;    /* Not supported */
-    cfi->cfiq->BufWriteTimeoutMax = 0;    /* Not supported */
+    cfi->cfiq_base->BufWriteTimeoutTyp = 0;    /* Not supported */
+    cfi->cfiq_base->BufWriteTimeoutMax = 0;    /* Not supported */
 }
 
 static void fixup_st_m28w320cb(struct mtd_info *mtd, void* param)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
 
     /* Note this is done after the region info is endian swapped */
-    cfi->cfiq->EraseRegionInfo[1] =
-        (cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
+    cfi->cfiq_base->EraseRegionInfo[1] =
+        (cfi->cfiq_base->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
 };
 
 static void fixup_use_point(struct mtd_info *mtd, void *param)
 {
     struct map_info *map = mtd->priv;
     if (!mtd->point && map_is_linear(map)) {
         mtd->point   = cfi_intelext_point;
         mtd->unpoint = cfi_intelext_unpoint;
     }
 }
 
 static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
-    if (cfi->cfiq->BufWriteTimeoutTyp) {
+    if (cfi->cfiq_base->BufWriteTimeoutTyp) {
         printk(KERN_INFO "Using buffer write method\n" );
         mtd->write = cfi_intelext_write_buffers;
         mtd->writev = cfi_intelext_writev;
     }
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
     { CFI_MFR_ANY, CFI_ID_ANY, fixup_intel_strataflash, NULL },
 #endif
+    { MANUFACTURER_INTEL, CFI_ID_ANY, fixup_stacked_strataflash, NULL, },
 #ifdef CMDSET0001_DISABLE_WRITE_SUSPEND
     { CFI_MFR_ANY, CFI_ID_ANY, fixup_no_write_suspend, NULL },
 #endif
 #if !FORCE_WORD_WRITE
     { CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL },
 #endif
     { CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
     { CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
     { 0, 0, NULL, NULL }
 };
 
 static struct cfi_fixup jedec_fixup_table[] = {
     { MANUFACTURER_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
     { MANUFACTURER_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
     { MANUFACTURER_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
@@ -354,127 +387,128 @@
     mtd->unlock  = cfi_intelext_unlock;
     mtd->suspend = cfi_intelext_suspend;
     mtd->resume  = cfi_intelext_resume;
     mtd->flags   = MTD_CAP_NORFLASH;
     mtd->name    = map->name;
     mtd->writesize = 1;
 
     mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
 
     if (cfi->cfi_mode == CFI_MODE_CFI) {
         /*
          * It's a real CFI chip, not one for which the probe
          * routine faked a CFI structure. So we read the feature
          * table from it.
          */
-        __u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
+        __u16 adr = primary?cfi->cfiq_base->P_ADR:cfi->cfiq_base->A_ADR;
         struct cfi_pri_intelext *extp;
 
         extp = read_pri_intelext(map, adr);
         if (!extp) {
             kfree(mtd);
             return NULL;
         }
 
         /* Install our own private info structure */
         cfi->cmdset_priv = extp;
 
         cfi_fixup(mtd, cfi_fixup_table);
 
 #ifdef DEBUG_CFI_FEATURES
         /* Tell the user about it in lots of lovely detail */
         cfi_tell_features(extp);
 #endif
 
         if(extp->SuspendCmdSupport & 1) {
             printk(KERN_NOTICE "cfi_cmdset_0001: Erase suspend on write 
enabled\n");
         }
     }
     else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
         /* Apply jedec specific fixups */
         cfi_fixup(mtd, jedec_fixup_table);
     }
     /* Apply generic fixups */
     cfi_fixup(mtd, fixup_table);
 
     for (i=0; i< cfi->numchips; i++) {
-        cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
-        cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
-        cfi->chips[i].erase_time = 1000<<cfi->cfiq->BlockEraseTimeoutTyp;
+        cfi->chips[i].word_write_time = 
1<<cfi->cfiq_base->WordWriteTimeoutTyp;
+        cfi->chips[i].buffer_write_time = 
1<<cfi->cfiq_base->BufWriteTimeoutTyp;
+        cfi->chips[i].erase_time = 
1000<<cfi->cfiq_base->BlockEraseTimeoutTyp;
         cfi->chips[i].ref_point_counter = 0;
         init_waitqueue_head(&(cfi->chips[i].wq));
     }
 
     map->fldrv = &cfi_intelext_chipdrv;
 
     return cfi_intelext_setup(mtd);
 }
 struct mtd_info *cfi_cmdset_0003(struct map_info *map, int primary) 
__attribute__((alias("cfi_cmdset_0001")));
 struct mtd_info *cfi_cmdset_0200(struct map_info *map, int primary) 
__attribute__((alias("cfi_cmdset_0001")));
 EXPORT_SYMBOL_GPL(cfi_cmdset_0001);
 EXPORT_SYMBOL_GPL(cfi_cmdset_0003);
 EXPORT_SYMBOL_GPL(cfi_cmdset_0200);
 
 static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
     unsigned long offset = 0;
     int i,j;
-    unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
+    unsigned long devsize = (1<<cfi->cfiq_base->DevSize) * cfi->interleave;
 
     //printk(KERN_DEBUG "number of CFI chips: %d\n", cfi->numchips);
 
     mtd->size = devsize * cfi->numchips;
 
-    mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
+    mtd->numeraseregions = 0;
+    for (j = 0; j < cfi->numchips; j++) {
+        mtd->numeraseregions += CFIQ(cfi,j)->NumEraseRegions;
+    }
     mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
             * mtd->numeraseregions, GFP_KERNEL);
     if (!mtd->eraseregions) {
         printk(KERN_ERR "Failed to allocate memory for MTD erase region 
info\n");
         goto setup_err;
     }
 
-    for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
+    int region = 0;
+    for (j = 0; j < cfi->numchips; j++) {
+        for (i = 0; i < CFIQ(cfi,j)->NumEraseRegions; i++) {
         unsigned long ernum, ersize;
-        ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * 
cfi->interleave;
-        ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
+            ersize = ((CFIQ(cfi,j)->EraseRegionInfo[i] >> 8) & ~0xff) * 
cfi->interleave;
+            ernum = (CFIQ(cfi,j)->EraseRegionInfo[i] & 0xffff) + 1;
 
         if (mtd->erasesize < ersize) {
             mtd->erasesize = ersize;
         }
-        for (j=0; j<cfi->numchips; j++) {
-            mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset 
= (j*devsize)+offset;
-            
mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize = ersize;
-            
mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
-        }
+            mtd->eraseregions[region].offset = offset;
+            mtd->eraseregions[region].erasesize = ersize;
+            mtd->eraseregions[region].numblocks = ernum;
+            printk(KERN_DEBUG "erase region %d: 
chip=%d.%d,offset=0x%lx,size=0x%lx,blocks=%lu\n",
+                   region, j, i, offset, ersize, ernum);
         offset += (ersize * ernum);
+            region++;
+        }
     }
 
-    if (offset != devsize) {
+    if (offset != mtd->size) {
         /* Argh */
-        printk(KERN_WARNING "Sum of regions (%lx) != total size of set 
of interleaved chips (%lx)\n", offset, devsize);
+        printk(KERN_WARNING "Sum of regions (%lx) != total size of set 
of interleaved chips (%x)\n",
+               offset, mtd->size);
         goto setup_err;
     }
 
-    for (i=0; i<mtd->numeraseregions;i++){
-        printk(KERN_DEBUG "erase region %d: 
offset=0x%x,size=0x%x,blocks=%d\n",
-               i,mtd->eraseregions[i].offset,
-               mtd->eraseregions[i].erasesize,
-               mtd->eraseregions[i].numblocks);
-    }
-
 #ifdef CONFIG_MTD_OTP
     mtd->read_fact_prot_reg = cfi_intelext_read_fact_prot_reg;
     mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;
     mtd->write_user_prot_reg = cfi_intelext_write_user_prot_reg;
     mtd->lock_user_prot_reg = cfi_intelext_lock_user_prot_reg;
     mtd->get_fact_prot_info = cfi_intelext_get_fact_prot_info;
     mtd->get_user_prot_info = cfi_intelext_get_user_prot_info;
 #endif
 
     /* This function has the potential to distort the reality
        a bit and therefore should be called last. */
     if (cfi_intelext_partition_fixup(mtd, &cfi) != 0)
         goto setup_err;
 
     __module_get(THIS_MODULE);
@@ -1293,31 +1327,31 @@
     }
     return ret;
 }
 
 static int __xipram do_write_oneword(struct map_info *map, struct 
flchip *chip,
                      unsigned long adr, map_word datum, int mode)
 {
     struct cfi_private *cfi = map->fldrv_priv;
     map_word status, write_cmd;
     int ret=0;
 
     adr += chip->start;
 
     switch (mode) {
     case FL_WRITING:
-        write_cmd = (cfi->cfiq->P_ID != 0x0200) ? CMD(0x40) : CMD(0x41);
+        write_cmd = (cfi->cfiq_base->P_ID != 0x0200) ? CMD(0x40) : 
CMD(0x41);
         break;
     case FL_OTP_WRITE:
         write_cmd = CMD(0xc0);
         break;
     default:
         return -EINVAL;
     }
 
     spin_lock(chip->mutex);
     ret = get_chip(map, chip, adr, mode);
     if (ret) {
         spin_unlock(chip->mutex);
         return ret;
     }
 
@@ -1449,36 +1483,36 @@
     return 0;
 }
 
 
 static int __xipram do_write_buffer(struct map_info *map, struct flchip 
*chip,
                     unsigned long adr, const struct kvec **pvec,
                     unsigned long *pvec_seek, int len)
 {
     struct cfi_private *cfi = map->fldrv_priv;
     map_word status, write_cmd, datum;
     unsigned long cmd_adr;
     int ret, wbufsize, word_gap, words;
     const struct kvec *vec;
     unsigned long vec_seek;
 
-    wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
+    wbufsize = cfi_interleave(cfi) << cfi->cfiq_base->MaxBufWriteSize;
     adr += chip->start;
     cmd_adr = adr & ~(wbufsize-1);
 
     /* Let's determine this according to the interleave only once */
-    write_cmd = (cfi->cfiq->P_ID != 0x0200) ? CMD(0xe8) : CMD(0xe9);
+    write_cmd = (cfi->cfiq_base->P_ID != 0x0200) ? CMD(0xe8) : CMD(0xe9);
 
     spin_lock(chip->mutex);
     ret = get_chip(map, chip, cmd_adr, FL_WRITING);
     if (ret) {
         spin_unlock(chip->mutex);
         return ret;
     }
 
     XIP_INVAL_CACHED_RANGE(map, adr, len);
     ENABLE_VPP(map);
     xip_disable(map, chip, cmd_adr);
 
     /* §4.8 of the 28FxxxJ3A datasheet says "Any time SR.4 and/or SR.5 
is set
        [...], the device will not accept any more Write to Buffer 
commands".
        So we must check here and reset those bits if they're set. Otherwise
@@ -1598,31 +1632,31 @@
 
         goto out;
     }
 
     xip_enable(map, chip, cmd_adr);
  out:    put_chip(map, chip, cmd_adr);
     spin_unlock(chip->mutex);
     return ret;
 }
 
 static int cfi_intelext_writev (struct mtd_info *mtd, const struct kvec 
*vecs,
                 unsigned long count, loff_t to, size_t *retlen)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
-    int wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
+    int wbufsize = cfi_interleave(cfi) << cfi->cfiq_base->MaxBufWriteSize;
     int ret = 0;
     int chipnum;
     unsigned long ofs, vec_seek, i;
     size_t len = 0;
 
     for (i = 0; i < count; i++)
         len += vecs[i].iov_len;
 
     *retlen = 0;
     if (!len)
         return 0;
 
     chipnum = to >> cfi->chipshift;
     ofs = to - (chipnum << cfi->chipshift);
     vec_seek = 0;
@@ -2025,31 +2059,31 @@
     struct cfi_pri_intelext *extp = cfi->cmdset_priv;
     struct flchip *chip;
     struct cfi_intelext_otpinfo *otp;
     u_long devsize, reg_prot_offset, data_offset;
     u_int chip_num, chip_step, field, reg_fact_size, reg_user_size;
     u_int groups, groupno, groupsize, reg_fact_groups, reg_user_groups;
     int ret;
 
     *retlen = 0;
 
     /* Check that we actually have some OTP registers */
     if (!extp || !(extp->FeatureSupport & 64) || 
!extp->NumProtectionFields)
         return -ENODATA;
 
     /* we need real chips here not virtual ones */
-    devsize = (1 << cfi->cfiq->DevSize) * cfi->interleave;
+    devsize = (1 << cfi->cfiq_base->DevSize) * cfi->interleave;
     chip_step = devsize >> cfi->chipshift;
     chip_num = 0;
 
     /* Some chips have OTP located in the _top_ partition only.
        For example: Intel 28F256L18T (T means top-parameter device) */
     if (cfi->mfr == MANUFACTURER_INTEL) {
         switch (cfi->id) {
         case 0x880b:
         case 0x880c:
         case 0x880d:
             chip_num = chip_step - 1;
         }
     }
 
     for ( ; chip_num < cfi->numchips; chip_num += chip_step) {
@@ -2326,26 +2360,26 @@
 {
     struct mtd_info *mtd;
 
     mtd = container_of(nb, struct mtd_info, reboot_notifier);
     cfi_intelext_reset(mtd);
     return NOTIFY_DONE;
 }
 
 static void cfi_intelext_destroy(struct mtd_info *mtd)
 {
     struct map_info *map = mtd->priv;
     struct cfi_private *cfi = map->fldrv_priv;
     cfi_intelext_reset(mtd);
     unregister_reboot_notifier(&mtd->reboot_notifier);
     kfree(cfi->cmdset_priv);
-    kfree(cfi->cfiq);
+    kfree(cfi->cfiq_base);
     kfree(cfi->chips[0].priv);
     kfree(cfi);
     kfree(mtd->eraseregions);
 }
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org> et al.");
 MODULE_DESCRIPTION("MTD chip driver for Intel/Sharp flash chips");
 MODULE_ALIAS("cfi_cmdset_0003");
 MODULE_ALIAS("cfi_cmdset_0200");
diff -U15 --exclude-from=/tmp/fileLxzYlC -rbw 
src.cache/drivers/mtd/chips/cfi_probe.c 
src.new/drivers/mtd/chips/cfi_probe.c
--- src.cache/drivers/mtd/chips/cfi_probe.c    2007-02-04 
13:44:54.000000000 -0500
+++ src.new/drivers/mtd/chips/cfi_probe.c    2007-06-21 
00:28:54.000000000 -0400
@@ -120,30 +120,48 @@
     cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 
     if (!qry_present(map,base,cfi)) {
         xip_enable(base, map, cfi);
         return 0;
     }
 
     if (!cfi->numchips) {
         /* This is the first time we're called. Set up the CFI
            stuff accordingly and return */
         return cfi_chip_setup(map, cfi);
     }
 
+    cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+    int osf = cfi->interleave * cfi->device_type;    // scale factor
+    int mfr = cfi_read_query16(map, base);
+    int id = cfi_read_query16(map, base + osf);
+#ifdef CONFIG_STACKED_STRATAFLASH
+    if (mfr == cfi->mfr && (cfi->id >= 0x891A && cfi->id <= 0x891C) && 
id == cfi->id - 3) {
+        printk(KERN_DEBUG "Found stacked strataflash\n");
+        cfi->addr_unlock1 = id; // marker for later
+    } else
+#endif
+    if (mfr != cfi->mfr || id != cfi->id) {
+        // this chip is not the same type
+        printk(KERN_NOTICE "Found different chip type: 0x%02X/%04X\n", 
mfr, id);
+        xip_enable(base, map, cfi);
+        return 0;
+    }
+    cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+
     /* Check each previous chip to see if it's an alias */
      for (i=0; i < (base >> cfi->chipshift); i++) {
          unsigned long start;
          if(!test_bit(i, chip_map)) {
             /* Skip location; no valid chip at this address */
              continue;
          }
          start = i << cfi->chipshift;
         /* This chip should be in read mode if it's one
            we've already touched. */
         if (qry_present(map, start, cfi)) {
             /* Eep. This chip also had the QRY marker.
              * Is it an alias for the new one? */
             cfi_send_gen_cmd(0xF0, 0, start, map, cfi, 
cfi->device_type, NULL);
             cfi_send_gen_cmd(0xFF, 0, start, map, cfi, 
cfi->device_type, NULL);
@@ -179,104 +197,120 @@
     /* Put it back into Read Mode */
     cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
     xip_allowed(base, map);
 
     printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
            map->name, cfi->interleave, cfi->device_type*8, base,
            map->bankwidth*8);
 
     return 1;
 }
 
 static int __xipram cfi_chip_setup(struct map_info *map,
                    struct cfi_private *cfi)
 {
-    int ofs_factor = cfi->interleave*cfi->device_type;
     __u32 base = 0;
-    int num_erase_regions = cfi_read_query(map, base + (0x10 + 
28)*ofs_factor);
-    int i;
-
-    xip_enable(base, map, cfi);
-#ifdef DEBUG_CFI
-    printk("Number of erase regions: %d\n", num_erase_regions);
-#endif
-    if (!num_erase_regions)
-        return 0;
+    int ofs_factor = cfi->interleave*cfi->device_type;
 
-    cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 
4, GFP_KERNEL);
-    if (!cfi->cfiq) {
-        printk(KERN_WARNING "%s: kmalloc failed for CFI ident 
structure\n", map->name);
+    if (!read_cfiq(map, cfi, base, &cfi->cfiq_base))
         return 0;
-    }
-
-    memset(cfi->cfiq,0,sizeof(struct cfi_ident));
 
+    // real CFI mode
     cfi->cfi_mode = CFI_MODE_CFI;
 
-    /* Read the CFI info structure */
-    xip_disable_qry(base, map, cfi);
-    for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
-        ((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + 
(0x10 + i)*ofs_factor);
-
     /* Note we put the device back into Read Mode BEFORE going into Auto
      * Select Mode, as some devices support nesting of modes, others
      * don't. This way should always work.
      * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
      * so should be treated as nops or illegal (and so put the device
      * back into Read Mode, which is a nop in this case).
      */
     cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
     cfi->mfr = cfi_read_query16(map, base);
     cfi->id = cfi_read_query16(map, base + ofs_factor);
+    printk(KERN_DEBUG "Found chip mfr/id: 0x%02X/%04X\n", cfi->mfr, 
cfi->id);
 
     /* Put it back into Read Mode */
     cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
     /* ... even if it's an Intel chip */
     cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
     xip_allowed(base, map);
 
-    /* Do any necessary byteswapping */
-    cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
 
-    cfi->cfiq->P_ADR = le16_to_cpu(cfi->cfiq->P_ADR);
-    cfi->cfiq->A_ID = le16_to_cpu(cfi->cfiq->A_ID);
-    cfi->cfiq->A_ADR = le16_to_cpu(cfi->cfiq->A_ADR);
-    cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
-    cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
+    printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
+           map->name, cfi->interleave, cfi->device_type*8, base,
+           map->bankwidth*8);
+
+    return 1;
+}
+
+
+int read_cfiq(struct map_info *map, struct cfi_private *cfi,
+              __u32 base, struct cfi_ident **pcfiq)
+{
+    int ofs_factor = cfi->interleave*cfi->device_type;
+    int num_erase_regions = cfi_read_query(map, base + (0x10 + 
28)*ofs_factor);
+    int i;
 
+    xip_enable(base, map, cfi);
 #ifdef DEBUG_CFI
-    /* Dump the information therein */
-    print_cfi_ident(cfi->cfiq);
+    printk("Number of erase regions: %d\n", num_erase_regions);
 #endif
+    if (!num_erase_regions)
+        return 0;
+
+    // allocate cfi struct + a ulong for each erase region
+    *pcfiq = kzalloc(sizeof(struct cfi_ident) +
+            (num_erase_regions) * sizeof(uint32_t), GFP_KERNEL);
+    if (!*pcfiq) {
+        printk(KERN_WARNING "%s: kmalloc failed for CFI ident 
structure\n", map->name);
+        return 0;
+    }
+    struct cfi_ident *cfiq = *pcfiq;
 
-    for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
-        cfi->cfiq->EraseRegionInfo[i] = 
le32_to_cpu(cfi->cfiq->EraseRegionInfo[i]);
+    /* Read the CFI info structure */
+    xip_disable_qry(base, map, cfi);
+    for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
+        ((unsigned char *)cfiq)[i] = cfi_read_query(map,base + (0x10 + 
i)*ofs_factor);
+
+    /* Do any necessary byteswapping */
+    cfiq->P_ID = le16_to_cpu(cfiq->P_ID);
+
+    cfiq->P_ADR = le16_to_cpu(cfiq->P_ADR);
+    cfiq->A_ID = le16_to_cpu(cfiq->A_ID);
+    cfiq->A_ADR = le16_to_cpu(cfiq->A_ADR);
+    cfiq->InterfaceDesc = le16_to_cpu(cfiq->InterfaceDesc);
+    cfiq->MaxBufWriteSize = le16_to_cpu(cfiq->MaxBufWriteSize);
+
+    for (i=0; i<cfiq->NumEraseRegions; i++) {
+        cfiq->EraseRegionInfo[i] = le32_to_cpu(cfiq->EraseRegionInfo[i]);
+    }
 
 #ifdef DEBUG_CFI
+    /* Dump the information therein */
+    print_cfi_ident(cfiq);
+   
+    for (i=0; i<cfiq->NumEraseRegions; i++) {
         printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
-               i, (cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff,
-               (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1);
-#endif
+               i, (cfi->cfiq_base->EraseRegionInfo[i] >> 8) & ~0xff,
+               (cfi->cfiq_base->EraseRegionInfo[i] & 0xffff) + 1);
     }
-
-    printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
-           map->name, cfi->interleave, cfi->device_type*8, base,
-           map->bankwidth*8);
+#endif
 
     return 1;
 }
 
 #ifdef DEBUG_CFI
 static char *vendorname(__u16 vendor)
 {
     switch (vendor) {
     case P_ID_NONE:
         return "None";
 
     case P_ID_INTEL_EXT:
         return "Intel/Sharp Extended";
 
     case P_ID_AMD_STD:
diff -U15 --exclude-from=/tmp/fileLxzYlC -rbw 
src.cache/drivers/mtd/chips/gen_probe.c 
src.new/drivers/mtd/chips/gen_probe.c
--- src.cache/drivers/mtd/chips/gen_probe.c    2007-02-04 
13:44:54.000000000 -0500
+++ src.new/drivers/mtd/chips/gen_probe.c    2007-06-20 
23:55:21.000000000 -0400
@@ -37,31 +37,31 @@
     if (!mtd)
         mtd = check_cmd_set(map, 0); /* Then the secondary */
 
     if (mtd) {
         if (mtd->size > map->size) {
             printk(KERN_WARNING "Reducing visibility of %ldKiB chip to 
%ldKiB\n",
                    (unsigned long)mtd->size >> 10,
                    (unsigned long)map->size >> 10);
             mtd->size = map->size;
         }
         return mtd;
     }
 
     printk(KERN_WARNING"gen_probe: No supported Vendor Command Set 
found\n");
 
-    kfree(cfi->cfiq);
+    kfree(cfi->cfiq_base);
     kfree(cfi);
     map->fldrv_priv = NULL;
     return NULL;
 }
 EXPORT_SYMBOL(mtd_do_chip_probe);
 
 
 static struct cfi_private *genprobe_ident_chips(struct map_info *map, 
struct chip_probe *cp)
 {
     struct cfi_private cfi;
     struct cfi_private *retcfi;
     unsigned long *chip_map;
     int i, j, mapsize;
     int max_chips;
 
@@ -74,102 +74,103 @@
         printk(KERN_DEBUG "%s: Found no %s device at location zero\n",
                cp->name, map->name);
         return NULL;
     }
 
 #if 0 /* Let the CFI probe routine do this sanity check. The Intel and AMD
      probe routines won't ever return a broken CFI structure anyway,
      because they make them up themselves.
       */
     if (cfi.cfiq->NumEraseRegions == 0) {
         printk(KERN_WARNING "Number of erase regions is zero\n");
         kfree(cfi.cfiq);
         return NULL;
     }
 #endif
-    cfi.chipshift = cfi.cfiq->DevSize;
+    cfi.chipshift = cfi.cfiq_base->DevSize;
 
     if (cfi_interleave_is_1(&cfi)) {
         ;
     } else if (cfi_interleave_is_2(&cfi)) {
         cfi.chipshift++;
     } else if (cfi_interleave_is_4((&cfi))) {
         cfi.chipshift += 2;
     } else if (cfi_interleave_is_8(&cfi)) {
         cfi.chipshift += 3;
     } else {
         BUG();
     }
 
     cfi.numchips = 1;
 
     /*
      * Allocate memory for bitmap of valid chips.
      * Align bitmap storage size to full byte.
      */
     max_chips = map->size >> cfi.chipshift;
     if (!max_chips) {
         printk(KERN_WARNING "NOR chip too large to fit in mapping. 
Attempting to cope...\n");
         max_chips = 1;
     }
 
     mapsize = (max_chips + BITS_PER_LONG-1) / BITS_PER_LONG;
     chip_map = kzalloc(mapsize, GFP_KERNEL);
     if (!chip_map) {
         printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", 
map->name);
-        kfree(cfi.cfiq);
+        kfree(cfi.cfiq_base);
         return NULL;
     }
 
     set_bit(0, chip_map); /* Mark first chip valid */
 
     /*
      * Now probe for other chips, checking sensibly for aliases while
      * we're at it. The new_chip probe above should have let the first
      * chip in read mode.
      */
 
     for (i = 1; i < max_chips; i++) {
         cp->probe_chip(map, i << cfi.chipshift, chip_map, &cfi);
     }
 
     /*
      * Now allocate the space for the structures we need to return to
      * our caller, and copy the appropriate data into them.
      */
 
     retcfi = kmalloc(sizeof(struct cfi_private) + cfi.numchips * 
sizeof(struct flchip), GFP_KERNEL);
 
     if (!retcfi) {
         printk(KERN_WARNING "%s: kmalloc failed for CFI private 
structure\n", map->name);
-        kfree(cfi.cfiq);
+        kfree(cfi.cfiq_base);
         kfree(chip_map);
         return NULL;
     }
 
     memcpy(retcfi, &cfi, sizeof(cfi));
     memset(&retcfi->chips[0], 0, sizeof(struct flchip) * cfi.numchips);
 
     for (i = 0, j = 0; (j < cfi.numchips) && (i < max_chips); i++) {
         if(test_bit(i, chip_map)) {
             struct flchip *pchip = &retcfi->chips[j++];
 
             pchip->start = (i << cfi.chipshift);
             pchip->state = FL_READY;
             init_waitqueue_head(&pchip->wq);
             spin_lock_init(&pchip->_spinlock);
             pchip->mutex = &pchip->_spinlock;
+            pchip->cfiq = retcfi->cfiq_base;
         }
     }
 
     kfree(chip_map);
     return retcfi;
 }
 
 
 static int genprobe_new_chip(struct map_info *map, struct chip_probe *cp,
                  struct cfi_private *cfi)
 {
     int min_chips = (map_bankwidth(map)/4?:1); /* At most 4-bytes wide. */
     int max_chips = map_bankwidth(map); /* And minimum 1 */
     int nr_chips, type;
 
@@ -192,61 +193,61 @@
         }
     }
     return 0;
 }
 
 typedef struct mtd_info *cfi_cmdset_fn_t(struct map_info *, int);
 
 extern cfi_cmdset_fn_t cfi_cmdset_0001;
 extern cfi_cmdset_fn_t cfi_cmdset_0002;
 extern cfi_cmdset_fn_t cfi_cmdset_0020;
 
 static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
                           int primary)
 {
     struct cfi_private *cfi = map->fldrv_priv;
-    __u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
+    __u16 type = primary?cfi->cfiq_base->P_ID:cfi->cfiq_base->A_ID;
 #ifdef CONFIG_MODULES
     char probename[16+sizeof(MODULE_SYMBOL_PREFIX)];
     cfi_cmdset_fn_t *probe_function;
 
     sprintf(probename, MODULE_SYMBOL_PREFIX "cfi_cmdset_%4.4X", type);
 
     probe_function = __symbol_get(probename);
     if (!probe_function) {
         request_module(probename + sizeof(MODULE_SYMBOL_PREFIX) - 1);
         probe_function = __symbol_get(probename);
     }
 
     if (probe_function) {
         struct mtd_info *mtd;
 
         mtd = (*probe_function)(map, primary);
         /* If it was happy, it'll have increased its own use count */
         symbol_put_addr(probe_function);
         return mtd;
     }
 #endif
     printk(KERN_NOTICE "Support for command set %04X not present\n", type);
 
     return NULL;
 }
 
 static struct mtd_info *check_cmd_set(struct map_info *map, int primary)
 {
     struct cfi_private *cfi = map->fldrv_priv;
-    __u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
+    __u16 type = primary?cfi->cfiq_base->P_ID:cfi->cfiq_base->A_ID;
 
     if (type == P_ID_NONE || type == P_ID_RESERVED)
         return NULL;
 
     switch(type){
         /* We need these for the !CONFIG_MODULES case,
            because symbol_get() doesn't work there */
 #ifdef CONFIG_MTD_CFI_INTELEXT
     case 0x0001:
     case 0x0003:
     case 0x0200:
         return cfi_cmdset_0001(map, primary);
 #endif
 #ifdef CONFIG_MTD_CFI_AMDSTD
     case 0x0002:
diff -U15 --exclude-from=/tmp/fileLxzYlC -rbw 
src.cache/include/linux/mtd/cfi.h src.new/include/linux/mtd/cfi.h
--- src.cache/include/linux/mtd/cfi.h    2007-02-04 13:44:54.000000000 -0500
+++ src.new/include/linux/mtd/cfi.h    2007-06-21 00:28:30.000000000 -0400
@@ -1,24 +1,26 @@
 
 /* Common Flash Interface structures
  * See http://support.intel.com/design/flash/technote/index.htm
  * $Id: cfi.h,v 1.57 2005/11/15 23:28:17 tpoynor Exp $
  */
 
 #ifndef __MTD_CFI_H__
 #define __MTD_CFI_H__
 
+#define CONFIG_STACKED_STRATAFLASH
+
 #include <linux/delay.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi_endian.h>
 
 #ifdef CONFIG_MTD_CFI_I1
 #define cfi_interleave(cfi) 1
 #define cfi_interleave_is_1(cfi) (cfi_interleave(cfi) == 1)
 #else
 #define cfi_interleave_is_1(cfi) (0)
 #endif
 
 #ifdef CONFIG_MTD_CFI_I2
@@ -237,38 +239,39 @@
 #define P_ID_RESERVED           0xffff
 
 
 #define CFI_MODE_CFI    1
 #define CFI_MODE_JEDEC    0
 
 struct cfi_private {
     uint16_t cmdset;
     void *cmdset_priv;
     int interleave;
     int device_type;
     int cfi_mode;        /* Are we a JEDEC device pretending to be CFI? */
     int addr_unlock1;
     int addr_unlock2;
     struct mtd_info *(*cmdset_setup)(struct map_info *);
-    struct cfi_ident *cfiq; /* For now only one. We insist that all devs
+    struct cfi_ident *cfiq_base; /* For now only one. We insist that 
all devs
                   must be of the same type. */
     int mfr, id;
     int numchips;
     unsigned long chipshift; /* Because they're of the same type */
     const char *im_name;     /* inter_module name for cmdset_setup */
     struct flchip chips[0];  /* per-chip data structure for each chip */
 };
+#define CFIQ(c,n) ((c)->chips[(n)].cfiq)
 
 /*
  * Returns the command address according to the given geometry.
  */
 static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs, int 
interleave, int type)
 {
     return (cmd_ofs * type) * interleave;
 }
 
 /*
  * Transforms the CFI command for the given geometry (bus width & 
interleave).
  * It looks too long to be inline, but in the common case it should 
almost all
  * get optimised away.
  */
 static inline map_word cfi_build_cmd(u_long cmd, struct map_info *map, 
struct cfi_private *cfi)
@@ -475,17 +478,20 @@
 #define CFI_MFR_ANY 0xffff
 #define CFI_ID_ANY  0xffff
 
 #define CFI_MFR_AMD 0x0001
 #define CFI_MFR_ATMEL 0x001F
 #define CFI_MFR_ST  0x0020     /* STMicroelectronics */
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
 
 typedef int (*varsize_frob_t)(struct map_info *map, struct flchip *chip,
                   unsigned long adr, int len, void *thunk);
 
 int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
     loff_t ofs, size_t len, void *thunk);
 
+extern int read_cfiq(struct map_info *map, struct cfi_private *cfi,
+                     __u32 base, struct cfi_ident **pcfiq);
+
 
 #endif /* __MTD_CFI_H__ */
diff -U15 --exclude-from=/tmp/fileLxzYlC -rbw 
src.cache/include/linux/mtd/flashchip.h 
src.new/include/linux/mtd/flashchip.h
--- src.cache/include/linux/mtd/flashchip.h    2007-02-04 
13:44:54.000000000 -0500
+++ src.new/include/linux/mtd/flashchip.h    2007-06-20 
22:55:06.000000000 -0400
@@ -63,28 +63,30 @@
     flstate_t state;
     flstate_t oldstate;
 
     unsigned int write_suspended:1;
     unsigned int erase_suspended:1;
     unsigned long in_progress_block_addr;
 
     spinlock_t *mutex;
     spinlock_t _spinlock; /* We do it like this because sometimes 
they'll be shared. */
     wait_queue_head_t wq; /* Wait on here when we're waiting for the chip
                  to be ready */
     int word_write_time;
     int buffer_write_time;
     int erase_time;
 
+    struct cfi_ident *cfiq;
+
     void *priv;
 };
 
 /* This is used to handle contention on write/erase operations
    between partitions of the same physical chip. */
 struct flchip_shared {
     spinlock_t lock;
     struct flchip *writing;
     struct flchip *erasing;
 };
 
 
 #endif /* __MTD_FLASHCHIP_H__ */



--------------------------
Patch to fix erase regions on the strataflash to make the dual-die chip 
as one MTD chip with 4 regions.

# Fix Intel StrataFlash detection (PC48F4400xxx)

--- old/drivers/mtd/chips/cfi_probe.c    2007-04-23 21:12:37.000000000 -0400
+++ new/drivers/mtd/chips/cfi_probe.c    2007-04-23 20:42:48.000000000 -0400
@@ -130,10 +130,22 @@
         /* This is the first time we're called. Set up the CFI
            stuff accordingly and return */
         return cfi_chip_setup(map, cfi);
     }
 
+    cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+    int osf = cfi->interleave * cfi->device_type;    // scale factor
+    int mfr = cfi_read_query16(map, base);
+    int id = cfi_read_query16(map, base + osf);
+    if (mfr != cfi->mfr || id != cfi->id) {
+        // this chip is not the same type
+        printk(KERN_NOTICE "Found different chip type: 0x%02X/%04X\n", 
mfr, id);
+        xip_enable(base, map, cfi);
+        return 0;
+    }
+    cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+
     /* Check each previous chip to see if it's an alias */
      for (i=0; i < (base >> cfi->chipshift); i++) {
          unsigned long start;
          if(!test_bit(i, chip_map)) {
             /* Skip location; no valid chip at this address */
@@ -201,18 +213,24 @@
     printk("Number of erase regions: %d\n", num_erase_regions);
 #endif
     if (!num_erase_regions)
         return 0;
 
-    cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 
4, GFP_KERNEL);
+#define CONFIG_STACKED_STRATAFLASH
+#ifdef CONFIG_STACKED_STRATAFLASH
+    int extra_erase_regions = 2;
+#else
+    int extra_erase_regions = 0;
+#endif
+    // allocate cfi struct + a ulong for each erase region
+    cfi->cfiq = kzalloc(sizeof(struct cfi_ident) +
+            (num_erase_regions + extra_erase_regions) * 
sizeof(uint32_t), GFP_KERNEL);
     if (!cfi->cfiq) {
         printk(KERN_WARNING "%s: kmalloc failed for CFI ident 
structure\n", map->name);
         return 0;
     }
 
-    memset(cfi->cfiq,0,sizeof(struct cfi_ident));
-
     cfi->cfi_mode = CFI_MODE_CFI;
 
     /* Read the CFI info structure */
     xip_disable_qry(base, map, cfi);
     for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
@@ -229,26 +247,47 @@
     cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
     cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
     cfi->mfr = cfi_read_query16(map, base);
     cfi->id = cfi_read_query16(map, base + ofs_factor);
-
-    /* Put it back into Read Mode */
-    cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-    /* ... even if it's an Intel chip */
-    cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
-    xip_allowed(base, map);
+    printk(KERN_DEBUG "Found chip mfr/id: 0x%02X/%04X\n", cfi->mfr, 
cfi->id);
 
     /* Do any necessary byteswapping */
     cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
 
     cfi->cfiq->P_ADR = le16_to_cpu(cfi->cfiq->P_ADR);
     cfi->cfiq->A_ID = le16_to_cpu(cfi->cfiq->A_ID);
     cfi->cfiq->A_ADR = le16_to_cpu(cfi->cfiq->A_ADR);
     cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
     cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
 
+#ifdef CONFIG_STACKED_STRATAFLASH
+    ulong new_start = base + (1 << cfi->cfiq->DevSize);
+    if (new_start + 0xff < map->size && cfi->mfr == 0x89) {
+        cfi_send_gen_cmd(0x90, 0x555, new_start, map, cfi, 
cfi->device_type, NULL);
+        int mfr = cfi_read_query16(map, new_start);
+        int id = cfi_read_query16(map, new_start + ofs_factor);
+        if (mfr == cfi->mfr && (cfi->id >= 0x891A && cfi->id <= 0x891C) 
&& id == cfi->id - 3) {
+            printk(KERN_DEBUG "Found stacked strataflash\n");
+
+            // increment number of regions/size and duplicate regions 
(inverted)
+            cfi->cfiq->DevSize++;    // power of 2
+            cfi->cfiq->NumEraseRegions += extra_erase_regions;
+            i = cfi->cfiq->NumEraseRegions;
+            cfi->cfiq->EraseRegionInfo[i-1] = 
cfi->cfiq->EraseRegionInfo[0];
+            cfi->cfiq->EraseRegionInfo[i-2] = 
cfi->cfiq->EraseRegionInfo[1];
+        }
+    }
+#endif
+
+    /* Put it back into Read Mode */
+    cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+    /* ... even if it's an Intel chip */
+    cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+    xip_allowed(base, map);
+
+
 #ifdef DEBUG_CFI
     /* Dump the information therein */
     print_cfi_ident(cfi->cfiq);
 #endif
 
