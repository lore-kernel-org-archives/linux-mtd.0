Received: from earth.ayrnetworks.com ([64.166.72.139] helo=ayrnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bjeC-0003oh-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 16:19:52 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: "Richard J. Broberg" <rjb@ayrnetworks.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Is there any interest in providing a query lock to go with lock and unlock?
Date: Mon, 5 Aug 2002 08:19:40 -0700
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208050819.40628.rjb@ayrnetworks.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

We have a parochial need which I have met in a heavy
handed way by adding a mtd vector and an ioctl.

The files changed in our 2.4.16 kernel are

drivers/mtd/mtdchar.c
drivers/mtd/chips/amd_flash.c
drivers/mtd/chips/cfi_cmdset_0001.c
include/linux/mtd/mtd.h

If somebody has a less invasive way, I would love to hear
about it.

If some others find this approach useful, I will try to get an
acceptable patch.

Thanks,
	Dick Broberg

===================================================================
RCS file: /cvs/public/linux/drivers/mtd/mtdchar.c,v
retrieving revision 1.3
diff -c -b -B -r1.3 mtdchar.c
*** drivers/mtd/mtdchar.c       2002/04/16 20:01:07     1.3
--- drivers/mtd/mtdchar.c       2002/08/01 21:08:33
***************
*** 282,287 ****
--- 282,323 ----
                break;
        }
  

+       case MEMGETREGIONLOCKS:
+       {
+               int                     blocks,i,es;
+               char                   *stati;
+               struct region_info_lock ul;
+ 
+               if (copy_from_user(     &ul, 
+                                       (struct region_info_lock *)arg, 
+                                       sizeof(struct region_info_lock))) {
+                       ret = -EFAULT;
+               } else if (ul.regionindex >= mtd->numeraseregions) {
+                       ret = -EINVAL;
+               } else {
+                       blocks = mtd->eraseregions[ul.regionindex].numblocks;
+                       es = mtd->eraseregions[ul.regionindex].erasesize;
+                       stati = kmalloc(blocks,GFP_KERNEL);
+                       if (!stati) {
+                               ret = -ENOMEM;
+                       } else {
+                               memset(stati,0,blocks);
+                               if (mtd->is_it_locked) {
+                                       for (i = 0; i < blocks; i++) {
+                                               stati[i] = mtd->is_it_locked(mtd,
+                                                                            i * es,
+                                                                            es);
+                                       }
+                               }
+                               if (copy_to_user(ul.block_stati,stati,blocks)) {
+                                       ret = -EFAULT;
+                               }
+                               kfree(stati);
+                       }
+               }
+               break;
+       }
+ 
        case MEMGETINFO:
                if (copy_to_user((struct mtd_info *)arg, mtd,
                                 sizeof(struct mtd_info_user)))
Index: drivers/mtd/chips/amd_flash.c
===================================================================
RCS file: /cvs/public/linux/drivers/mtd/chips/amd_flash.c,v
retrieving revision 1.2
diff -c -b -B -r1.2 amd_flash.c
*** drivers/mtd/chips/amd_flash.c       2002/03/15 00:29:21     1.2
--- drivers/mtd/chips/amd_flash.c       2002/08/01 21:08:33
***************
*** 295,300 ****
--- 295,332 ----
        return amd_flash_do_unlock(mtd, ofs, len, 1);
  }
  

+ static int amd_flash_is_it_locked(struct mtd_info *mtd, loff_t ofs, size_t len)
+ {
+       struct map_info *map = mtd->priv;
+       struct mtd_erase_region_info *merip;
+       int eraseoffset, erasesize, eraseblocks;
+       int i;
+       int lock_status = 0;
+ 
+       /* Pass the whole chip through sector by sector and check for each
+          sector if the sector and the given interval overlap */
+       for(i = 0; i < mtd->numeraseregions; i++) {
+               merip = &mtd->eraseregions[i];
+ 
+               eraseoffset = merip->offset;
+               erasesize = merip->erasesize;
+               eraseblocks = merip->numblocks;
+ 
+               if (ofs > eraseoffset + erasesize)
+                       continue;
+               while (eraseblocks > 0) {
+                       if (ofs < eraseoffset + erasesize && ofs + len > eraseoffset) {
+                               lock_status = is_sector_locked(map, eraseoffset);
+                               goto have_lock_status;
+                       }
+                       eraseoffset += erasesize;
+                       eraseblocks --;
+               }
+       }
+  have_lock_status:
+       return lock_status;
+ }
+ 
  static int amd_flash_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
  {
        return amd_flash_do_unlock(mtd, ofs, len, 0);
***************
*** 748,753 ****
--- 780,786 ----
        mtd->resume = amd_flash_resume; 
        mtd->lock = amd_flash_lock;
        mtd->unlock = amd_flash_unlock;
+       mtd->is_it_locked = amd_flash_is_it_locked;
  

        private = kmalloc(sizeof(*private) + (sizeof(struct flchip) *
                                              temp.numchips), GFP_KERNEL);
Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /cvs/public/linux/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.3
diff -c -b -B -r1.3 cfi_cmdset_0001.c
*** drivers/mtd/chips/cfi_cmdset_0001.c 2002/03/27 23:35:42     1.3
--- drivers/mtd/chips/cfi_cmdset_0001.c 2002/08/01 21:08:33
***************
*** 51,56 ****
--- 51,57 ----
  struct mtd_info *cfi_cmdset_0001(struct map_info *, int);
  

  static struct mtd_info *cfi_intelext_setup (struct map_info *);
+ static int cfi_is_it_locked(struct mtd_info *mtd, loff_t ofs, size_t len);
  

  static struct mtd_chip_driver cfi_intelext_chipdrv = {
        probe: NULL, /* Not usable directly */
***************
*** 264,269 ****
--- 265,271 ----
      mtd->sync = cfi_intelext_sync;
      mtd->lock = cfi_intelext_lock;
      mtd->unlock = cfi_intelext_unlock;
+     mtd->is_it_locked = cfi_is_it_locked;
      mtd->suspend = cfi_intelext_suspend;
      mtd->resume = cfi_intelext_resume;
      mtd->flags = MTD_CAP_NORFLASH;
***************
*** 1067,1084 ****
  

        return 0;
  }
- 
- typedef int (*varsize_frob_t)(struct map_info *map, struct flchip *chip,
-                             unsigned long adr, void *thunk);
  

! static int cfi_intelext_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
!                                    loff_t ofs, size_t len, void *thunk)
  {
!       struct map_info *map = mtd->priv;
!       struct cfi_private *cfi = map->fldrv_priv;
!       unsigned long adr;
!       int chipnum, ret = 0;
!       int i, first;
        struct mtd_erase_region_info *regions = mtd->eraseregions;
  

        if (ofs > mtd->size)
--- 1068,1077 ----
  

        return 0;
  }
  

! static int get_region_index(struct mtd_info *mtd, loff_t ofs, size_t len, int *first)
  {
!         int i;
        struct mtd_erase_region_info *regions = mtd->eraseregions;
  

        if (ofs > mtd->size)
***************
*** 1087,1101 ****
        if ((len + ofs) > mtd->size)
                return -EINVAL;
  

!       /* Check that both start and end of the requested erase are
         * aligned with the erasesize at the appropriate addresses.
         */
  

        i = 0;
  

!       /* Skip all erase regions which are ended before the start of 
!          the requested erase. Actually, to save on the calculations,
!          we skip to the first erase region which starts after the
           start of the requested erase, and then go back one.
        */
        

--- 1079,1093 ----
        if ((len + ofs) > mtd->size)
                return -EINVAL;
  

!       /* Check that both start and end of the requested region are
         * aligned with the erasesize at the appropriate addresses.
         */
  

        i = 0;
  

!       /* Skip all regions which are ended before the start of 
!          the requested region. Actually, to save on the calculations,
!          we skip to the first region which starts after the
           start of the requested erase, and then go back one.
        */
        

***************
*** 1104,1111 ****
        i--;
  

        /* OK, now i is pointing at the erase region in which this 
!          erase request starts. Check the start of the requested
!          erase range is aligned with the erase size which is in
           effect here.
        */
  

--- 1096,1103 ----
        i--;
  

        /* OK, now i is pointing at the erase region in which this 
!          request starts. Check the start of the requested
!          range is aligned with the erase size which is in
           effect here.
        */
  

***************
*** 1113,1121 ****
                return -EINVAL;
  

        /* Remember the erase region we start on */
!       first = i;
  

!       /* Next, check that the end of the requested erase is aligned
         * with the erase region at that address.
         */
  

--- 1105,1115 ----
                return -EINVAL;
  

        /* Remember the erase region we start on */
! 
!       if (first)
!           *first = i;
  

!       /* Next, check that the end of the request is aligned
         * with the erase region at that address.
         */
  

***************
*** 1129,1135 ****
--- 1123,1147 ----
  

        if ((ofs + len) & (regions[i].erasesize-1))
                return -EINVAL;
+       return i;
+ }
+ 
+ typedef int (*varsize_frob_t)(struct map_info *map, struct flchip *chip,
+                             unsigned long adr, void *thunk);
+ 
+ static int cfi_intelext_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
+                                    loff_t ofs, size_t len, void *thunk)
+ {
+       struct map_info *map = mtd->priv;
+       struct cfi_private *cfi = map->fldrv_priv;
+       unsigned long adr;
+       int chipnum, ret = 0;
+       int i, first;
+       struct mtd_erase_region_info *regions = mtd->eraseregions;
  

+       if (0 > (i = get_region_index(mtd,ofs,len,&first))) 
+           return i;
+ 
        chipnum = ofs >> cfi->chipshift;
        adr = ofs - (chipnum << cfi->chipshift);
  

***************
*** 1401,1406 ****
--- 1413,1441 ----
        }
  }
  

+ static int cfi_is_it_locked(struct mtd_info *mtd, loff_t ofs, size_t len)
+ {
+       struct map_info              *map = mtd->priv;
+       struct cfi_private           *cfi = map->fldrv_priv;
+       int                           ofs_factor = cfi->interleave *
+                                                  cfi->device_type;
+       unsigned long                 adr;
+       int                           chipnum;
+       int                           i;
+       int                           flags = 0;
+ 
+       if (0 > (i = get_region_index(mtd,ofs,len,0))) 
+           return i;
+       
+       chipnum = ofs >> cfi->chipshift;
+       adr = ofs - (chipnum << cfi->chipshift);
+ 
+       cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+       flags = cfi_read_query(map, adr+(2*ofs_factor));
+       cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+       return flags;
+ }
+ 
  #ifdef DEBUG_LOCK_BITS
  static int do_printlockstatus_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, void *thunk)
  {
***************
*** 1451,1457 ****
                /* Urgh. Chip not yet ready to talk to us. */
                if (time_after(jiffies, timeo)) {
                        spin_unlock_bh(chip->mutex);
!                       printk(KERN_ERR __FUNCTION__ ": waiting for chip to be ready timed out\n");
                        return -EIO;
                }
  

--- 1486,1494 ----
                /* Urgh. Chip not yet ready to talk to us. */
                if (time_after(jiffies, timeo)) {
                        spin_unlock_bh(chip->mutex);
!                       printk(KERN_ERR 
!                              "%s: waiting for chip to be ready timed out\n",
!                              __FUNCTION__);
                        return -EIO;
                }
  

Index: include/linux/mtd/mtd.h
===================================================================
RCS file: /cvs/public/linux/include/linux/mtd/mtd.h,v
retrieving revision 1.4
diff -c -b -B -r1.4 mtd.h
*** include/linux/mtd/mtd.h     2002/04/16 20:00:29     1.4
--- include/linux/mtd/mtd.h     2002/08/01 21:08:33
***************
*** 85,90 ****
--- 85,95 ----
        u_int32_t regionindex;
  };
  

+ struct region_info_lock {
+       u_int32_t  regionindex;
+       u_char     *block_stati;
+ };
+ 
  #define MEMGETINFO              _IOR('M', 1, struct mtd_info_user)
  #define MEMERASE                _IOW('M', 2, struct erase_info_user)
  #define MEMWRITEOOB             _IOWR('M', 3, struct mtd_oob_buf)
***************
*** 93,98 ****
--- 98,104 ----
  #define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
  #define MEMGETREGIONCOUNT     _IOR('M', 7, int)
  #define MEMGETREGIONINFO      _IOWR('M', 8, struct region_info_user)
+ #define MEMGETREGIONLOCKS     _IOWR('M', 9, struct region_info_lock)
  

  #ifndef __KERNEL__
  

***************
*** 207,212 ****
--- 213,219 ----
        /* Chip-supported device locking */
        int (*lock) (struct mtd_info *mtd, loff_t ofs, size_t len);
        int (*unlock) (struct mtd_info *mtd, loff_t ofs, size_t len);
+       int (*is_it_locked) (struct mtd_info *mtd, loff_t ofs, size_t len);
  

        /* Power Management functions */
        int (*suspend) (struct mtd_info *mtd);
