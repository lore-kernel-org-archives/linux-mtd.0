Received: from mail-gw.radisys.com ([206.102.10.35] helo=radisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15800q-0007Yc-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 14:39:49 +0100
Received: (47405 bytes) by radisys.com
	via sendmail with P:stdio/R:inet_hosts/T:smtp
	(sender: <Jan.Rovins@radisys.com>)
	id <m15804V-000qQHC@radisys.com>
	for linux-mtd@lists.infradead.org; Thu, 7 Jun 2001 06:43:35 -0700 (PDT)
	(Smail-3.2.0.105 1999-Mar-3 #2 built 1999-Apr-18)
To: linux-mtd@lists.infradead.org
Subject: [PATCH] New Board Mapping Moto MCPN765 (plus some 64 bit  support stuff)
MIME-Version: 1.0
Message-ID: <OF5FDA669B.EE19EB2F-ON85256A64.00485DD1@radisys.com>
From: Jan.Rovins@radisys.com
Date: Thu, 7 Jun 2001 09:11:46 -0400
Content-Type: text/plain; charset="us-ascii"
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

I have got my MPCN765 board mapping working last week.

Here is a summary of whats in it:

Mapping for 765  board as single  16 Meg bank of 64 bit  FLASH, accessible 
from a 32 bit Linux kernel

I added some special case code to handle the situations of accessing 64 
bit flash
from 32 bit Linux, by faking up 64 bit commands, but doing 32 bit writes.
This is only in the AMD command set CFI code.  (Hope this is not too ugly 
).
 It is tested & working. with a 2.2.17 kernel,  Have not yet tried it on a 
2.4 build.

In preparation for accessing 64 bit flash from 64 bit Linux: 
I went in added all the 64 bit macros in cfi.h along with the buswidth == 
8 code paths in  CFI code.
this should make things just about ready for true  full 64 bit use, 
although I currently have
no way of testing 64 bit flash on 64 bit Linux right now.

I did a quick pass of adding some  busswidth == 8 and 64 bit code to the 
Intel CFI command set,
but I have not been able to test this code path.

Regards,
Jan

Patch Starts Here: 

Index: drivers/mtd/initcalls.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/initcalls.c,v
retrieving revision 1.3
diff -u -r1.3 initcalls.c
--- drivers/mtd/initcalls.c     2001/03/26 20:08:19     1.3
+++ drivers/mtd/initcalls.c     2001/06/06 23:52:31
@@ -1,5 +1,5 @@
 /*
- * $Id: initcalls.c,v 1.3 2001/03/26 20:08:19 kd Exp $
+ * $Id: initcalls.c,v 1.1 2001/05/24 22:58:15 jrovins Exp $
  *
  * Init calls for MTD drivers in kernels < 2.2.18
  * Split off into a separate file so they don't pollute
@@ -33,6 +33,7 @@
 extern int init_mtdblock(void);
 extern int init_mtdchar(void);
 extern int init_flagadm(void);
+extern int init_mcpn765(void);
 
 void init_mtd_devices(void)
 {
@@ -118,6 +119,9 @@
 #endif
 #ifdef CONFIG_MTD_FLAGADM
        init_flagadm();
+#endif
+#ifdef CONFIG_MTD_MCPN765
+       init_mcpn765();
 #endif
 }
 
Index: drivers/mtd/chips/Config.in
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/Config.in,v
retrieving revision 1.4
diff -u -r1.4 Config.in
--- drivers/mtd/chips/Config.in 2001/05/14 09:48:12     1.4
+++ drivers/mtd/chips/Config.in 2001/06/06 23:52:33
@@ -1,6 +1,6 @@
 # drivers/mtd/chips/Config.in
 
-# $Id: Config.in,v 1.4 2001/05/14 09:48:12 dwmw2 Exp $
+# $Id: Config.in,v 1.1 2001/05/24 22:58:15 jrovins Exp $
 
 mainmenu_option next_comment
 
@@ -21,6 +21,7 @@
        bool '    Support  8-bit buswidth' CONFIG_MTD_CFI_B1
        bool '    Support 16-bit buswidth' CONFIG_MTD_CFI_B2
        bool '    Support 32-bit buswidth' CONFIG_MTD_CFI_B4
+       bool '    Support 64-bit buswidth' CONFIG_MTD_CFI_B8
         if [ "$CONFIG_MTD_CFI_B1" = "y" ]; then
           define_bool CONFIG_MTD_CFI_I1 y
          else
Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.80
diff -u -r1.80 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c 2001/06/03 01:32:57     1.80
+++ drivers/mtd/chips/cfi_cmdset_0001.c 2001/06/06 23:52:48
@@ -86,6 +86,11 @@
        case 4:
                map->write32(map, 0x98989898, 0x154);
                break;
+#if (BITS_PER_LONG >= 64)
+       case 8:
+               map->write64(map, 0x9898989898989898, 0x1550);
+               break;
+#endif
        }
 
        extp = kmalloc(sizeof(*extp), GFP_KERNEL);
@@ -164,6 +169,11 @@
        case 4:
                map->write32(map, 0xffffffff, 0x154);
                break;
+#if (BITS_PER_LONG >= 64)
+       case 8:
+               map->write64(map, 0xffffffffffffffff, 0x1550);
+               break;
+#endif
        }
 
 
@@ -595,8 +605,8 @@
                unsigned long bus_ofs = ofs & ~(CFIDEV_BUSWIDTH-1);
                int gap = ofs - bus_ofs;
                int i = 0, n = 0;
-               u_char tmp_buf[4];
-               __u32 datum;
+               u_char tmp_buf[CFIDEV_BUSWIDTH];
+               unsigned long datum;
 
                while (gap--)
                        tmp_buf[i++] = 0xff;
@@ -609,6 +619,8 @@
                        datum = *(__u16*)tmp_buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)tmp_buf;
+                } else if (cfi_buswidth_is_8()) {
+                        datum = *(unsigned long*)tmp_buf;
                } else {
                        return -EINVAL;  /* should never happen, but be 
safe */
                }
@@ -631,7 +643,7 @@
        }
 
        while(len >= CFIDEV_BUSWIDTH) {
-               __u32 datum;
+               unsigned long datum;
 
                if (cfi_buswidth_is_1()) {
                        datum = *(__u8*)buf;
@@ -639,6 +651,8 @@
                        datum = *(__u16*)buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)buf;
+                } else if (cfi_buswidth_is_8()) {
+                        datum = *(unsigned long*)buf;
                } else {
                        return -EINVAL;
                }
@@ -663,8 +677,8 @@
 
        if (len & (CFIDEV_BUSWIDTH-1)) {
                int i = 0, n = 0;
-               u_char tmp_buf[4];
-               __u32 datum;
+               u_char tmp_buf[CFIDEV_BUSWIDTH];
+               unsigned long datum;
 
                while (len--)
                        tmp_buf[i++] = buf[n++];
@@ -675,6 +689,8 @@
                        datum = *(__u16*)tmp_buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)tmp_buf;
+               } else if (cfi_buswidth_is_8()) {
+                        datum = *(unsigned long*)buf;
                } else {
                        return -EINVAL;  /* should never happen, but be 
safe */
                }
@@ -789,6 +805,8 @@
                        map->write16 (map, *((__u16*)buf)++, adr+z);
                } else if (cfi_buswidth_is_4()) {
                        map->write32 (map, *((__u32*)buf)++, adr+z);
+               } else if (cfi_buswidth_is_8()) {
+                       map->write64 (map, *((unsigned long*)buf)++, 
adr+z);
                } else {
                        DISABLE_VPP(map);
                        return -EINVAL;
Index: drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.48
diff -u -r1.48 cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c 2001/06/03 01:32:57     1.48
+++ drivers/mtd/chips/cfi_cmdset_0002.c 2001/06/06 23:52:58
@@ -133,7 +133,7 @@
        unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
 
        mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
-       printk("number of %s chips: %d\n", 
(cfi->cfi_mode)?"JEDEC":"CFI",cfi->numchips);
+       printk("Number of %s chips: %d\n", 
(cfi->cfi_mode)?"JEDEC":"CFI",cfi->numchips);
 
        if (!mtd) {
          printk("Failed to allocate memory for MTD device\n");
@@ -198,6 +198,7 @@
        case 1:
        case 2:
        case 4:
+       case 8:
 #if 1
                if (mtd->numeraseregions > 1)
                        mtd->erase = cfi_amdstd_erase_varsize;
@@ -252,11 +253,8 @@
        } 
 
        adr += chip->start;
-
        chip->state = FL_READY;
-
        map->copy_from(map, buf, adr, len);
-
        wake_up(&chip->wq);
        cfi_spin_unlock(chip->mutex);
 
@@ -304,7 +302,7 @@
        return ret;
 }
 
-static int do_write_oneword(struct map_info *map, struct flchip *chip, 
unsigned long adr, __u32 datum, int fast)
+static int do_write_oneword(struct map_info *map, struct flchip *chip, 
unsigned long adr, unsigned long datum, int fast)
 {
        unsigned long timeo = jiffies + HZ;
        unsigned int Last[4];
@@ -312,6 +310,7 @@
        struct cfi_private *cfi = map->fldrv_priv;
        DECLARE_WAITQUEUE(wait, current);
        int ret = 0;
+       int base = chip->start;
 
  retry:
        cfi_spin_lock(chip->mutex);
@@ -336,16 +335,42 @@
        } 
 
        chip->state = FL_WRITING;
-
        adr += chip->start;
        ENABLE_VPP(map);
-       if (fast) { /* Unlock bypass */
-               cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, 
cfi->device_type, NULL);
+#if (defined(CFIDEV_BUSWIDTH_8) && (BITS_PER_LONG < 64))
+       if (CFIDEV_BUSWIDTH == 8) 
+       {
+               if(cfi->interleave > 1)
+               {
+                       /* special case for 64 bit flash on a 32 bit OS 
+                        * need to determine which chip set to send the 
unlock commands to
+                        */
+                       if(!((adr & 0x00000007) < 4) )
+                       { 
+                               base += 0x04;  /* upper pair */
+                       }
+               }
+       }
+#endif
+       if (fast)
+       { /* Unlock bypass */
+#if (CFIDEV_BUSWIDTH == 8) && (BITS_PER_LONG < 64) /* special case for 64 
bit flash on a 32 bit OS  */
+               cfi_send_word_cmd(0xA0, 0, base, map, cfi, 
cfi->device_type, NULL);
+#else
+               cfi_send_gen_cmd(0xA0, 0, base, map, cfi, 
cfi->device_type, NULL);
+#endif
        }
-       else {
+       else 
+       {
+#if (CFIDEV_BUSWIDTH == 8) && (BITS_PER_LONG < 64) /* special case for 64 
bit flash on a 32 bit OS  */
+               cfi_send_word_cmd(0xAA, cfi->addr_unlock1, base, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+               cfi_send_word_cmd(0x55, cfi->addr_unlock2, base, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+               cfi_send_word_cmd(0xA0, cfi->addr_unlock1, base, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+#else
                cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, 
map, cfi, CFI_DEVICETYPE_X8, NULL);
                cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, 
map, cfi, CFI_DEVICETYPE_X8, NULL);
                cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, 
map, cfi, CFI_DEVICETYPE_X8, NULL);
+#endif
        }
 
        cfi_write(map, datum, adr);
@@ -371,7 +396,7 @@
        }
 
        if (Last[(Count - 1) % 4] != datum){
-               printk("Last[%ld] is %x, datum is %x\n",(Count - 1) % 
4,Last[(Count - 1) % 4],datum);
+               printk("MTD: WRITE FAILURE! Last[%ld] is %x, datum is 
%x\n",(Count - 1) % 4,Last[(Count - 1) % 4],datum);
                cfi_send_gen_cmd(0xF0, 0, chip->start, map, cfi, 
cfi->device_type, NULL);
                DISABLE_VPP(map);
                ret = -EIO;
@@ -389,6 +414,7 @@
        struct map_info *map = mtd->priv;
        struct cfi_private *cfi = map->fldrv_priv;
        int ret = 0;
+        int  working_buswidth = CFIDEV_BUSWIDTH;
        int chipnum;
        unsigned long ofs, chipstart;
 
@@ -400,22 +426,28 @@
        ofs = to  - (chipnum << cfi->chipshift);
        chipstart = cfi->chips[chipnum].start;
 
+#if (CFIDEV_BUSWIDTH == 8) && (BITS_PER_LONG < 64)
+       // special case for 64 bit flash from a 32 bit OS
+        working_buswidth = CFIDEV_BUSWIDTH / 2;
+#endif
        /* If it's not bus-aligned, do the first byte write */
-       if (ofs & (CFIDEV_BUSWIDTH-1)) {
-               unsigned long bus_ofs = ofs & ~(CFIDEV_BUSWIDTH-1);
+       if (ofs & (working_buswidth-1)) {
+               unsigned long bus_ofs = ofs & ~(working_buswidth-1);
                int i = ofs - bus_ofs;
                int n = 0;
-               u_char tmp_buf[4];
-               __u32 datum;
+               u_char tmp_buf[CFIDEV_BUSWIDTH];
+               unsigned long datum;
 
-               map->copy_from(map, tmp_buf, bus_ofs + 
cfi->chips[chipnum].start, CFIDEV_BUSWIDTH);
-               while (len && i < CFIDEV_BUSWIDTH)
+               map->copy_from(map, tmp_buf, bus_ofs + 
cfi->chips[chipnum].start, working_buswidth);
+               while (len && i < working_buswidth)
                        tmp_buf[i++] = buf[n++], len--;
 
                if (cfi_buswidth_is_2()) {
                        datum = *(__u16*)tmp_buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)tmp_buf;
+               } else if (cfi_buswidth_is_8()) {
+                       datum = *(unsigned long*)tmp_buf;
                } else {
                        return -EINVAL;  /* should never happen, but be 
safe */
                }
@@ -423,7 +455,9 @@
                ret = do_write_oneword(map, &cfi->chips[chipnum], 
                                bus_ofs, datum, 0);
                if (ret) 
+               {
                        return ret;
+               }
 
                ofs += n;
                buf += n;
@@ -435,7 +469,7 @@
                        if (chipnum == cfi->numchips)
                                return 0;
                }
-       }
+       } // end not bus-alligned
 
        /* Go into unlock bypass mode */
        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
@@ -443,8 +477,8 @@
        cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
 
        /* We are now aligned, write as much as possible */
-       while(len >= CFIDEV_BUSWIDTH) {
-               __u32 datum;
+       while(len >= working_buswidth) {
+               unsigned long datum;
 
                if (cfi_buswidth_is_1()) {
                        datum = *(__u8*)buf;
@@ -452,6 +486,8 @@
                        datum = *(__u16*)buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)buf;
+               } else if (cfi_buswidth_is_8()) {
+                       datum = *(unsigned long*)buf;
                } else {
                        return -EINVAL;
                }
@@ -466,10 +502,10 @@
                        return ret;
                }
 
-               ofs += CFIDEV_BUSWIDTH;
-               buf += CFIDEV_BUSWIDTH;
-               (*retlen) += CFIDEV_BUSWIDTH;
-               len -= CFIDEV_BUSWIDTH;
+               ofs += working_buswidth;
+               buf += working_buswidth;
+               (*retlen) += working_buswidth;
+               len -= working_buswidth;
 
                if (ofs >> cfi->chipshift) {
                        if (cfi->fast_prog){
@@ -481,7 +517,9 @@
                        chipnum ++; 
                        ofs = 0;
                        if (chipnum == cfi->numchips)
+                       {
                                return 0;
+                       }
                        chipstart = cfi->chips[chipnum].start;
                        if (cfi->fast_prog){
                                /* Go into unlock bypass mode for next set 
of chips */
@@ -490,7 +528,7 @@
                                cfi_send_gen_cmd(0x20, cfi->addr_unlock1, 
chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
                        }
                }
-       }
+       } // end while()
 
        if (cfi->fast_prog){
                /* Get out of unlock bypass mode */
@@ -498,12 +536,12 @@
                cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, 
cfi->device_type, NULL);
        }
 
-       if (len & (CFIDEV_BUSWIDTH-1)) {
+       if (len & (working_buswidth-1)) {
                int i = 0, n = 0;
-               u_char tmp_buf[4];
-               __u32 datum;
+               u_char tmp_buf[CFIDEV_BUSWIDTH];
+               unsigned long datum;
 
-               map->copy_from(map, tmp_buf, ofs + 
cfi->chips[chipnum].start, CFIDEV_BUSWIDTH);
+               map->copy_from(map, tmp_buf, ofs + 
cfi->chips[chipnum].start, working_buswidth);
                while (len--)
                        tmp_buf[i++] = buf[n++];
 
@@ -511,6 +549,8 @@
                        datum = *(__u16*)tmp_buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)tmp_buf;
+               } else if (cfi_buswidth_is_8()) {
+                       datum = *(unsigned long*)tmp_buf;
                } else {
                        return -EINVAL;  /* should never happen, but be 
safe */
                }
@@ -518,7 +558,9 @@
                ret = do_write_oneword(map, &cfi->chips[chipnum], 
                                ofs, datum, 0);
                if (ret) 
+               {
                        return ret;
+               }
 
                (*retlen) += n;
        }
@@ -564,6 +606,12 @@
        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
        cfi_write(map, CMD(0x30), adr);
+#if (BITS_PER_LONG < 64) && ( CFIDEV_BUSWIDTH == 8)
+        /* when writing to 64 bit flash, from 32 bit linux, we also have 
to hit
+        * the upper 32 bits of the bank with an extra write
+        */ 
+       cfi_write(map, CMD(0x30), adr +0x04);
+#endif
 
        timeo = jiffies + (HZ*20);
 
Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.60
diff -u -r1.60 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c       2001/06/03 01:32:57     1.60
+++ drivers/mtd/chips/cfi_probe.c       2001/06/06 23:53:00
@@ -17,6 +17,7 @@
 #include <linux/mtd/cfi.h>
 
 /* #define DEBUG_CFI */
+#define DEBUG_CFI
 
 #ifdef DEBUG_CFI
 static void print_cfi_ident(struct cfi_ident *);
@@ -46,14 +47,18 @@
        cfi = cfi_cfi_probe(map);
 
        if (!cfi)
+        {
                return NULL;
+        }
 
        map->fldrv_priv = cfi;
        /* OK we liked it. Now find a driver for the command set it talks 
*/
 
        check_cmd_set(map, 1, cfi->chips[0].start); /* First the primary 
cmdset */
        if (!map->fldrv)
+       {
                check_cmd_set(map, 0, cfi->chips[0].start); /* Then the 
secondary */
+       }
 
        /* check_cmd_set() will have used inter_module_get to increase
           the use count of the module which provides the command set 
@@ -93,14 +98,33 @@
        __u32 manufacturer_id, device_id;
        int osf = cfi->interleave * cfi->device_type;   // scale factor
 
-       //printk("cfi_check_qry_or_id: base=0x%08lx interl=%d type=%d 
index=%d\n",base,cfi->interleave,cfi->device_type,index);
 
        switch(cfi->cfi_mode){
        case 0:
                if 
(cfi_read(map,base+osf*0x10)==cfi_build_cmd('Q',map,cfi) &&
 cfi_read(map,base+osf*0x11)==cfi_build_cmd('R',map,cfi) &&
 cfi_read(map,base+osf*0x12)==cfi_build_cmd('Y',map,cfi))
+               {
+#if (CFIDEV_BUSWIDTH == 8) && (BITS_PER_LONG < 64)
+                       // for 64 bit flash on 32 bit linux,
+                       // do an extra sanity check on the upper half of 
64 bit flash
+                       if (map->buswidth == 8)
+                       {
+                               if 
(cfi_read(map,base+0x04+osf*0x10)==cfi_build_cmd('Q',map,cfi) &&
+ cfi_read(map,base+0x04+osf*0x11)==cfi_build_cmd('R',map,cfi) &&
+ cfi_read(map,base+0x04+osf*0x12)==cfi_build_cmd('Y',map,cfi))
+                               {
+                                       //printk("look for Q: 64 bit upper 
range OK  \n");
+                                       return 0;       // ok !
+                               }
+                               else
+                               {
+                                       printk("cfi_check_qry_or_id: 64 
bit upper range BAD  \n");
+                               }
+                       }
+#endif
                        return 0;       // ok !
+               }
                break;
 
        case 1:
@@ -136,14 +160,17 @@
                          struct flchip *chips, struct cfi_private *cfi)
 {
        int index;
-       __u32 tmp,ofs;
+       unsigned long tmp,ofs;
 
        ofs = cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, 
&tmp);
 
        cfi_qry_mode(map,base,cfi);
 
        index=cfi_check_qry_or_id(map,base,-1,cfi);
-       if (index<0) return -1;
+       if (index<0)
+       {
+                return -1;
+       }
 
        if (chips){
                int i;
@@ -317,6 +344,33 @@
 #endif
                break;
 #endif
+
+#ifdef CFIDEV_BUSWIDTH_8
+       case CFIDEV_BUSWIDTH_8:
+#ifdef CFIDEV_INTERLEAVE_4
+               cfi->interleave = CFIDEV_INTERLEAVE_4;
+               cfi->device_type = CFI_DEVICETYPE_X16;
+               index = cfi_probe_chip(map,base,chips,cfi);
+               if (index>=0) return index;
+#endif
+#ifdef CFIDEV_INTERLEAVE_2
+               cfi->interleave = CFIDEV_INTERLEAVE_2;
+               cfi->device_type = CFI_DEVICETYPE_X32;
+               index = cfi_probe_chip(map,base,chips,cfi);
+               if (index>=0) return index;
+#endif
+
+#if 0 // place holder for single 64 bit flash, (not implemented yet...)
+#ifdef CFIDEV_INTERLEAVE_1
+                cfi->device_type = CFI_DEVICETYPE_X64;
+                index = cfi_probe_chip(map,base,chips,cfi);
+                if (index>=0) return index;
+#endif
+#endif// place holder for single 64 bit flash, (not implemented yet...)
+
+               break;
+#endif
+
        default:
                printk(KERN_WARNING "cfi_probe called with unsupported 
buswidth %d\n", map->buswidth);
                return -1;
@@ -333,7 +387,6 @@
        int i,index; 
        char num_erase_regions;
        int ofs_factor;
-
        memset(&cfi, 0, sizeof(cfi));
 
        /* The first invocation (with chips == NULL) leaves the device in 
Query Mode */
@@ -432,7 +485,9 @@
        }
 
        for (base = (1<<cfi.chipshift); base < map->size; base += 
(1<<cfi.chipshift))
+       {
                cfi_probe_chip_1(map, base, &chip[0], &cfi);
+       }
 
        retcfi = kmalloc(sizeof(struct cfi_private) + cfi.numchips * 
sizeof(struct flchip), GFP_KERNEL);
 
@@ -628,7 +683,6 @@
                return;
        /* Put it in query mode */
        cfi_qry_mode(map,base,cfi);
-
        switch(type){
                /* Urgh. Ifdefs. The version with weak symbols was
                 * _much_ nicer. Shame it didn't seem to work on
Index: drivers/mtd/maps/Config.in
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Config.in,v
retrieving revision 1.8
diff -u -r1.8 Config.in
--- drivers/mtd/maps/Config.in  2001/06/04 21:33:50     1.8
+++ drivers/mtd/maps/Config.in  2001/06/06 23:53:01
@@ -25,6 +25,7 @@
    dep_bool '    Support for RedBoot partition tables on SA11x0' 
CONFIG_MTD_SA1100_REDBOOT_PARTITIONS $CONFIG_MTD_SA1100 
$CONFIG_MTD_REDBOOT_PARTS
    dep_bool '    Support for Compaq bootldr partition tables on SA11x0' 
CONFIG_MTD_SA1100_BOOTLDR_PARTITIONS $CONFIG_MTD_SA1100 
$CONFIG_MTD_BOOTLDR_PARTS
 dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' 
CONFIG_MTD_DC21285 $CONFIG_MTD_CFI $CONFIG_ARCH_FOOTBRIDGE 
$CONFIG_MTD_PARTITIONS
+dep_tristate '  CFI Flash device mapped on MCPN765' CONFIG_MTD_MCPN765 
$CONFIG_MTD_CFI $CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_PARTITIONS
 dep_tristate '  CFI Flash device mapped on the XScale IQ80310 board' 
CONFIG_MTD_IQ80310 $CONFIG_MTD_CFI $CONFIG_XSCALE_IQ80310
 dep_tristate '  CFI Flash device mapped on D-Box2' CONFIG_MTD_DBOX2 
$CONFIG_MTD_CFI_INTELSTD $CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_CFI_AMDSTD
 dep_tristate '  Flash chip mapping on ITE QED-4N-S01B, Globespan IVR or 
custom board' CONFIG_MTD_CSTM_MIPS_IXX $CONFIG_MTD_CFI $CONFIG_MTD_JEDEC 
$CONFIG_MTD_PARTITIONS 
Index: drivers/mtd/maps/Makefile
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Makefile,v
retrieving revision 1.8
diff -u -r1.8 Makefile
--- drivers/mtd/maps/Makefile   2001/06/04 21:33:50     1.8
+++ drivers/mtd/maps/Makefile   2001/06/06 23:53:01
@@ -24,6 +24,7 @@
 obj-$(CONFIG_MTD_SUN_UFLASH)    += sun_uflash.o
 obj-$(CONFIG_MTD_VMAX)         += vmax301.o
 obj-$(CONFIG_MTD_DBOX2)                += dbox2-flash.o
+obj-$(CONFIG_MTD_MCPN765)      += mcpn765-flash.o
 obj-$(CONFIG_MTD_OCELOT)       += ocelot.o
 
 include $(TOPDIR)/Rules.make
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.21
diff -u -r1.21 cfi.h
--- include/linux/mtd/cfi.h     2001/06/03 01:32:57     1.21
+++ include/linux/mtd/cfi.h     2001/06/06 23:53:04
@@ -17,7 +17,7 @@
  * You can optimize the code size and performance by defining only 
  * the geometry(ies) available on your hardware.
  * CFIDEV_INTERLEAVE_n, where  represents the interleave (number of chips 
to fill the bus width)
- * CFIDEV_BUSWIDTH_n, where n is the bus width in bytes (1, 2 or 4 bytes)
+ * CFIDEV_BUSWIDTH_n, where n is the bus width in bytes (1, 2, 4 or 8 
bytes)
  *
  * By default, all (known) geometries are supported.
  */
@@ -31,6 +31,7 @@
 #define CFIDEV_BUSWIDTH_1 (1)
 #define CFIDEV_BUSWIDTH_2 (2)
 #define CFIDEV_BUSWIDTH_4 (4)
+#define CFIDEV_BUSWIDTH_8 (8)
 
 #else
 
@@ -53,6 +54,9 @@
 #ifdef CONFIG_MTD_CFI_B4
 #define CFIDEV_BUSWIDTH_4 (4)
 #endif
+#ifdef CONFIG_MTD_CFI_B8
+#define CFIDEV_BUSWIDTH_8 (8)
+#endif
 
 #endif
 
@@ -144,6 +148,20 @@
 # define cfi_buswidth_is_4() (0)
 #endif
 
+
+#ifdef CFIDEV_BUSWIDTH_8
+# ifdef CFIDEV_BUSWIDTH
+#  undef CFIDEV_BUSWIDTH
+#  define CFIDEV_BUSWIDTH (map->buswidth)
+# else
+#  define CFIDEV_BUSWIDTH CFIDEV_BUSWIDTH_8
+# endif
+# define cfi_buswidth_is_8() (CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_8)
+#else
+# define cfi_buswidth_is_8() (0)
+#endif
+
+
 #ifndef CFIDEV_BUSWIDTH
 #error You must define at least one bus width to support!
 #endif
@@ -155,6 +173,7 @@
 #define CFI_DEVICETYPE_X8  (8 / 8)
 #define CFI_DEVICETYPE_X16 (16 / 8)
 #define CFI_DEVICETYPE_X32 (32 / 8)
+#define CFI_DEVICETYPE_X64 (64 / 8)
 
 /* NB: We keep these structures in memory in HOST byteorder, except
  * where individually noted.
@@ -255,7 +274,7 @@
 /*
  * Returns the command address according to the given geometry.
  */
-static inline __u32 cfi_build_cmd_addr(__u32 cmd_ofs, int interleave, int 
type)
+static inline unsigned long cfi_build_cmd_addr(__u32 cmd_ofs, int 
interleave, int type)
 {
        return (cmd_ofs * type) * interleave;
 }
@@ -263,7 +282,7 @@
 /*
  * Transforms the CFI command for the given geometry (bus width & 
interleave.
  */
-static inline __u32 cfi_build_cmd(u_char cmd, struct map_info *map, 
struct cfi_private *cfi)
+static inline unsigned long  cfi_build_cmd(u_char cmd, struct map_info 
*map, struct cfi_private *cfi)
 {
        __u32 val = 0;
 
@@ -290,7 +309,37 @@
                        val = (cmd << 16) | cmd;
                        val = cpu_to_cfi32((val << 8) | val);
                }
-       }
+       } else if (cfi_buswidth_is_8()) {
+#if BITS_PER_LONG < 64 // 64 bit flash on 32 bit Linux
+                       // currently this handles only 32 bits of the 
command
+                       // we get around this by doing two 32 bit writes 
to 
+                       // form a 64 bit command
+                       // (this happens in send_gen_cmd()
+                       if (cfi_interleave_is_2()) {
+                               /* 2 x32 device in x32 mode */
+                               val = cpu_to_cfi32(cmd);
+                       } else if (cfi_interleave_is_4()) {
+                               /* 4 ( x16 ) devices in x16 mode */
+                               // which is 2 chips of the bank of 4
+                               // this ends up looking like an interleave 
of 2
+                               val = cpu_to_cfi32((cmd << 16) | cmd);
+                       }
+#else   // Fully 64 bit Flash & Linux
+                       // Full 64 bit not yet tested 
+                       // but it would look somthing like this
+                       if (cfi_interleave_is_1()) {
+                               /* 1 x64 device in x64 mode */
+                               val = cpu_to_cfi64(cmd);
+                       } else if (cfi_interleave_is_2()) {
+                               /* 2 x32 device in x32 mode */
+                               val = cpu_to_cfi64(cmd << 32);
+                       } else if (cfi_interleave_is_4()) {
+                               /* 4 ( x16 ) devices in x16 mode */
+                               val = (cmd << 16) | cmd;
+                               val = cpu_to_cfi64((cmd << 32) | cmd);
+                       }
+#endif
+               }
        return val;
 }
 #define CMD(x)  cfi_build_cmd((x), map, cfi)
@@ -299,7 +348,7 @@
  * Read a value according to the bus width.
  */
 
-static inline __u32 cfi_read(struct map_info *map, __u32 addr)
+static inline unsigned long cfi_read(struct map_info *map, __u32 addr)
 {
        if (cfi_buswidth_is_1()) {
                return map->read8(map, addr);
@@ -307,6 +356,12 @@
                return map->read16(map, addr);
        } else if (cfi_buswidth_is_4()) {
                return map->read32(map, addr);
+       } else if (cfi_buswidth_is_8()) {
+#if BITS_PER_LONG < 64 // 64 bit flash on 32 bit Linux
+               return map->read32(map, addr);
+#else   // Fully 64 bit Flash & Linux
+               return map->read64(map, addr);
+#endif
        } else {
                return 0;
        }
@@ -324,6 +379,13 @@
                map->write16(map, val, addr);
        } else if (cfi_buswidth_is_4()) {
                map->write32(map, val, addr);
+       } else if (cfi_buswidth_is_8()) {
+#if BITS_PER_LONG < 64 // 64 bit flash on 32 bit Linux
+               map->write32(map, val, addr);
+#else   // Fully 64 bit Flash & Linux
+               map->write64(map, val, addr);
+#endif
+       } else {
        }
 }
 
@@ -334,22 +396,64 @@
  * If prev_val is non-null, it will be set to the value at the command 
address,
  * before the command was written.
  */
-static inline __u32 cfi_send_gen_cmd(u_char cmd, __u32 cmd_addr, __u32 
base,
+static inline unsigned long cfi_send_gen_cmd(u_char cmd, unsigned long 
cmd_addr, unsigned long base,
                                struct map_info *map, struct cfi_private 
*cfi,
-                               int type, __u32 *prev_val)
+                               int type, unsigned long  *prev_val)
 {
+       unsigned long  val;
+       unsigned long  addr = base + cfi_build_cmd_addr(cmd_addr, 
CFIDEV_INTERLEAVE, type);
+       val = cfi_build_cmd(cmd, map, cfi);
+
+       if (prev_val)
+               *prev_val = cfi_read(map, addr);
+
+       cfi_write(map, val, addr);
+#if (defined ( CFIDEV_BUSWIDTH_8) && (BITS_PER_LONG < 64) ) 
+       if(cfi_buswidth_is_8()) // 64 bit flash on 32 bit Linux
+       {
+               // have to doctor up the command address when accessing 64 
bit flash 
+               // from a 32 bit machine  the upper 2 chips will have a 
different 
+               // command address (addr + 0x04)
+               // we want to write the command to all the flash chips,
+               //  by doing 2 32bit writes
+
+               cfi_write(map, val, addr + 0x04);
+
+               // note that in this code path *prev_val is only first 32 
of the 64 bits, 
+               // however, no one is calling this with *prev_val set (as 
of 5/2001)
+               // but just incase ....
+               if (prev_val)
+                       printk(KERN_WARNING "MTD: cfi_send_gen_cmd() 
prev_val not fixed up for full 64 bits \n");
+ 
+       }
+#endif // CFIDEV_BUSWIDTH_8
+       return addr - base;
+}
+
+#if (defined(CFIDEV_BUSWIDTH_8) && (BITS_PER_LONG < 64))  // 64 bit flash 
on 32 bit Linux
+
+// when runing a 64 bit flash from a 32 bit OS,
+// there are times when we still want to send commands as 32 bit words.
+// since we have doctored up cfi_send_gen_cmd() to send 64 bit commands,
+// we need a seperate function to send out a 32 bit command word
+// note that in this case the values dont have to be changed from __u32 
to ulong
+// because in this code path, we are not on a 64 bit machine
+
+static inline __u32 cfi_send_word_cmd(u_char cmd, __u32 cmd_addr, __u32 
base,
+                                       struct map_info *map, struct 
cfi_private *cfi,
+                                       int type, __u32 *prev_val)
+{
        __u32 val;
        __u32 addr = base + cfi_build_cmd_addr(cmd_addr, 
CFIDEV_INTERLEAVE, type);
-
        val = cfi_build_cmd(cmd, map, cfi);
 
        if (prev_val)
                *prev_val = cfi_read(map, addr);
 
        cfi_write(map, val, addr);
-
        return addr - base;
 }
+#endif // CFIDEV_BUSWIDTH_8
 
 static inline __u8 cfi_read_query(struct map_info *map, __u32 addr)
 {
@@ -359,6 +463,12 @@
                return cfi16_to_cpu(map->read16(map, addr));
        } else if (cfi_buswidth_is_4()) {
                return cfi32_to_cpu(map->read32(map, addr));
+       } else if (cfi_buswidth_is_8()) {
+#if BITS_PER_LONG < 64 // 64 bit flash on 32 bit Linux
+               return cfi32_to_cpu(map->read32(map, addr));
+#else   // Fully 64 bit Flash & Linux
+               return cfi64_to_cpu(map->read64(map, addr));
+#endif
        } else {
                return 0;
        }
Index: include/linux/mtd/cfi_endian.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi_endian.h,v
retrieving revision 1.9
diff -u -r1.9 cfi_endian.h
--- include/linux/mtd/cfi_endian.h      2001/04/23 21:19:11     1.9
+++ include/linux/mtd/cfi_endian.h      2001/06/06 23:53:04
@@ -1,5 +1,5 @@
 /*
- * $Id: cfi_endian.h,v 1.9 2001/04/23 21:19:11 nico Exp $
+ * $Id: cfi_endian.h,v 1.1 2001/05/24 22:58:18 jrovins Exp $
  *
  * It seems that some helpful people decided to make life easier
  * for software engineers who aren't capable of dealing with the 
@@ -42,25 +42,33 @@
 
 #if defined(CFI_LITTLE_ENDIAN)
 #define cpu_to_cfi8(x) (x)
-#define cfi8_to_cpu(x) (x)
 #define cpu_to_cfi16(x) cpu_to_le16(x)
 #define cpu_to_cfi32(x) cpu_to_le32(x)
+#define cpu_to_cfi64(x) cpu_to_le64(x)
+#define cfi8_to_cpu(x) (x)
 #define cfi16_to_cpu(x) le16_to_cpu(x)
 #define cfi32_to_cpu(x) le32_to_cpu(x)
+#define cfi64_to_cpu(x) le64_to_cpu(x)
 #elif defined (CFI_BIG_ENDIAN)
 #define cpu_to_cfi8(x) (x)
-#define cfi8_to_cpu(x) (x)
 #define cpu_to_cfi16(x) cpu_to_be16(x)
 #define cpu_to_cfi32(x) cpu_to_be32(x)
+#define cpu_to_cfi64(x) cpu_to_be64(x)
+#define cfi8_to_cpu(x) (x)
 #define cfi16_to_cpu(x) be16_to_cpu(x)
 #define cfi32_to_cpu(x) be32_to_cpu(x)
+#define cfi64_to_cpu(x) be64_to_cpu(x)
 #elif defined (CFI_HOST_ENDIAN)
 #define cpu_to_cfi8(x) (x)
-#define cfi8_to_cpu(x) (x)
 #define cpu_to_cfi16(x) (x)
 #define cpu_to_cfi32(x) (x)
+#define cpu_to_cfi64(x) (x)
+#define cfi8_to_cpu(x) (x)
 #define cfi16_to_cpu(x) (x)
 #define cfi32_to_cpu(x) (x)
+#define cfi64_to_cpu(x) (x) 
+#define cpu_to_cfi64(x) (x)
+
 #elif defined (CFI_LART_ENDIAN)
 /* 
    Fuck me backwards. The data line mapping on LART is as follows:
@@ -91,9 +99,15 @@
 */
 /* cpu_to_cfi16() and cfi16_to_cpu() are not needed because the LART
  * only has 32 bit wide Flash memory. -- Erik
+ * 
+ * 64 bit extentions should not be needed for the same reasons
+ * as above, if they ever are, they should be fixed.
+ *  -- Jan <jan.rovins@radisys.com>
  */
 #define cpu_to_cfi16(x) (x)
 #define cfi16_to_cpu(x) (x)
+#define cpu_to_cfi64(x) (x)
+#define cfi64_to_cpu(x) (x)
 static inline __u32 cfi32_to_cpu(__u32 x)
 {
        __u32 ret;
Index: include/linux/mtd/map.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/map.h,v
retrieving revision 1.22
diff -u -r1.22 map.h
--- include/linux/mtd/map.h     2001/06/02 20:35:31     1.22
+++ include/linux/mtd/map.h     2001/06/06 23:53:04
@@ -33,6 +33,7 @@
        __u8 (*read8)(struct map_info *, unsigned long);
        __u16 (*read16)(struct map_info *, unsigned long);
        __u32 (*read32)(struct map_info *, unsigned long); 
+       unsigned long (*read64)(struct map_info *, unsigned long); 
        /* If it returned a 'long' I'd call it readl.
         * It doesn't.
         * I won't.
@@ -42,6 +43,7 @@
        void (*write8)(struct map_info *, __u8, unsigned long);
        void (*write16)(struct map_info *, __u16, unsigned long);
        void (*write32)(struct map_info *, __u32, unsigned long);
+       void (*write64)(struct map_info *, unsigned long, unsigned long);
        void (*copy_to)(struct map_info *, unsigned long, const void *, 
ssize_t);
 
        void (*set_vpp)(struct map_info *, int);
Index: patches/Configure.help
===================================================================
RCS file: /home/cvs/mtd/patches/Configure.help,v
retrieving revision 1.13
diff -u -r1.13 Configure.help
--- patches/Configure.help      2001/06/02 19:58:03     1.13
+++ patches/Configure.help      2001/06/06 23:53:09
@@ -202,6 +202,11 @@
   If you wish to support CFI devices on a physical bus which is
   32 bits wide, say 'Y'.
 
+Support 64-bit buswidth
+CONFIG_MTD_CFI_B8
+  If you wish to support CFI devices on a physical bus which is
+  64 bits wide, say 'Y'.
+
 Support 1-chip flash interleave
 CONFIG_MTD_CFI_I1
   If your flash chips are not interleaved - i.e. you only have one
@@ -442,6 +447,16 @@
   the flash chips are connected in the Tempustech VMAX SBC301 Single
   Board Computer. More information on the board is available at
   (http://www.tempustech.com/tt301.htm).
+
+Flash chip mapping on Motorola MCPN765 PPC CompactPCI Board
+CONFIG_MTD_MCPN765
+  This is a  mapping driver for Motorola's MCPN765 PPC CompactPCI Board.
+  This Maps The 16MB Falsh bank A as 2 MTD partitions.
+  Flash Bank B (1MB) is ignored so as to preserve the system firmware.
+  This Mapping supports access to the MPCN765's 64 bit flash array
+  from 32 bit linux. You will need to have set MTD for 64-bit buswidth
+  (CONFIG_MTD_CFI_B8) for this to work. 
+  This Mapping does not yet support 64 bit linux.
 
 Support for NAND flash devices
 CONFIG_MTD_NAND

--- /dev/null   Tue May  5 16:32:27 1998
+++ drivers/mtd/maps/mcpn765-flash.c    Wed Jun  6 16:47:18 2001
@@ -0,0 +1,264 @@
+/*
+ *
+ *  $Id: mcpn765-flash.c,v 1.1 2001/05/24 22:58:16 jrovins Exp $
+ * 
+ *  Mapping for Motorola MCPN765 PPC CompactPCI Board 
+ *
+ *  This Maps The 16MB Falsh bank A as 2 MTD partitions 
+ * 
+ *  Flash Bank B (1MB) is ignored so as to preserve the system firmware 
+ *
+ *  Copyright (C) RadiSys Corporation 
+ *
+ *  This program is free software; you can redistribute  it and/or modify 
it
+ *  under  the terms of  the GNU General  Public License as published by 
the
+ *  Free Software Foundation;  either version 2 of the  License, or (at 
your
+ *  option) any later version.
+ *
+ *  THIS  SOFTWARE  IS PROVIDED   ``AS  IS'' AND   ANY  EXPRESS OR 
IMPLIED
+ *  WARRANTIES,   INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES 
OF
+ *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN
+ *  NO  EVENT  SHALL   THE AUTHOR  BE    LIABLE FOR ANY   DIRECT, 
INDIRECT,
+ *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
BUT
+ *  NOT LIMITED   TO, PROCUREMENT OF  SUBSTITUTE GOODS  OR SERVICES; LOSS 
OF
+ *  USE, DATA,  OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
ON
+ *  ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR 
TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
OF
+ *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ *  You should have received a copy of the  GNU General Public License 
along
+ *  with this program; if not, write  to the Free Software Foundation, 
Inc.,
+ *  675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+/*
+ *  Flash Bank A is made up of four AMD AM29LV323C 32MB devices i
+ *  for a total of  16 MB of memory.
+ *
+ *  Now for the ugly part ...
+ *  This memory is configured as a 64 bit port 
+ *  This Mapping handles the situation of 64 bit flash access from a 32 
bit kernel
+ *  There were modifications made in the MTD cfi code to accomidate this. 

+ *  We have not run this board with a 64 bit linux kernel,
+ *  64 bit read & write methods would have to be added.
+ *  -- Jan Rovins <jan.rovins@radisys.com>
+ */
+
+/*  We split the flash up into two parts.
+ *  1: kernel & compressed XXXk root ramdisk   (0x00000000 - 0x00B00000) 
size 11 Meg
+ *  2: writeable diskpartition (jffs)          (0x00B00000 - 0x01000000) 
size  5 Meg
+ */
+
+#define FLASH_PHYS_ADDR 0xF4000000
+#define FLASH_SIZE 0x1000000 
+
+/*  The 765 Contains a ROM A Base/Size Register which controls
+ *  the 16Mb of Flash.  This register has a bit which allows
+ *  the bank to be write protected.  The following define the
+ *  address of this long word register, and the Write Enable
+ *  bit (must be set to write to Flash).
+ */
+#define FLASH_ROM_A_BASE_SIZE_REG       0xFEF80050
+#define FLASH_ROM_A_BASE_SIZE_REG_SIZE  0x04
+#define FLASH_ROM_A_WRITE_ENABLE        0x00000001
+#define FLASH_ROM_A_ENABLE             0x00000002
+
+
+
+// These need to be on sector boundries
+#define FLASH_PARTITION0_SIZE 0x00B00000
+#define FLASH_PARTITION1_SIZE 0x00500000
+
+#define FLASH_PARTITION0_ADDR 0x00000000
+#define FLASH_PARTITION1_ADDR (FLASH_PARTITION0_ADDR | 
FLASH_PARTITION0_SIZE)
+
+__u8 mcpn765_read8(struct map_info *map, unsigned long ofs)
+{
+//printk("mcpn765_read8(0x%x): 0x%x\n", ofs, *(char *)(map->map_priv_1 + 
ofs));
+#if 0
+       return __raw_readb(map->map_priv_1 + ofs);
+#else
+       return *(__u8 *)(map->map_priv_1  + ofs);
+#endif
+}
+
+__u16 mcpn765_read16(struct map_info *map, unsigned long ofs)
+{
+//printk("mcpn765_read16(0x%x): 0x%x\n", ofs, *(__u16 *)(map->map_priv_1 
+ ofs));
+#if 0
+       return __raw_readw(map->map_priv_1 + ofs);
+#else
+       return *(__u16 *)(map->map_priv_1  + ofs);
+#endif
+}
+
+__u32 mcpn765_read32(struct map_info *map, unsigned long ofs)
+{
+//printk("mcpn765_read32(0x%x): 0x%x\n", ofs, *(__u32 *)(map->map_priv_1 
+ ofs));
+
+#if 0
+       return __raw_readl(map->map_priv_1 + ofs);
+#else
+       return *(volatile unsigned int *)(map->map_priv_1  + ofs);
+#endif
+}
+
+void mcpn765_copy_from(struct map_info *map, void *to, unsigned long 
from, ssize_t len)
+{
+#if 0
+       memcpy_fromio(to, map->map_priv_1 + from, len);
+#else
+       memcpy(to, (void *)(map->map_priv_1  + from), len);
+#endif
+}
+
+void mcpn765_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+#if 0
+       __raw_writeb(d, map->map_priv_1 + adr);
+       mb();
+#else
+        *(__u8 *)(map->map_priv_1  + adr) = d;
+#endif
+}
+
+void mcpn765_write16(struct map_info *map, __u16 d, unsigned long adr)
+{
+#if 0
+       __raw_writew(d, map->map_priv_1 + adr);
+       mb();
+#else
+        *(__u16 *)(map->map_priv_1  + adr) = d;
+#endif
+}
+
+void mcpn765_write32(struct map_info *map, __u32 d, unsigned long adr)
+{
+#if 0
+       __raw_writel(d, map->map_priv_1 + adr);
+       mb();
+#else
+        *(__u32 *)(map->map_priv_1  + adr) = d;
+#endif
+}
+
+void mcpn765_copy_to(struct map_info *map, unsigned long to, const void 
*from, ssize_t len)
+{
+#if 0
+       memcpy_toio(map->map_priv_1 + to, from, len);
+#else
+       memcpy((void *)(map->map_priv_1  + to), from, len);
+#endif
+}
+
+struct map_info mcpn765_map = {
+               name: "MCPN765 flash device",
+               size: FLASH_SIZE,
+               buswidth: 8,
+               read8: mcpn765_read8,
+               read16: mcpn765_read16,
+               read32: mcpn765_read32,
+               copy_from: mcpn765_copy_from,
+               write8: mcpn765_write8,
+               write16: mcpn765_write16,
+               write32: mcpn765_write32,
+               copy_to: mcpn765_copy_to
+};
+
+struct mtd_partition mcpn765_parts[] = {
+       {
+               name    : "Kernel image & initrd",
+               offset  : FLASH_PARTITION0_ADDR,
+               size    : FLASH_PARTITION0_SIZE
+       },
+       { 
+               name    : "Persistant storage",
+               offset  : FLASH_PARTITION1_ADDR,
+               size    : FLASH_PARTITION1_SIZE
+       }
+};
+
+#define PARTITION_COUNT (sizeof(mcpn765_parts)/sizeof(struct 
mtd_partition))
+
+#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
+#define init_mcpn765 init_module
+#define cleanup_mcpn765 cleanup_module
+#endif
+
+static struct mtd_info *mymtd;
+
+//
+// init_mcpn765(void)
+// Adapted from Tom Bessemer's Char flash driver
+// by jan.rovins@radisys.com
+//
+int __init init_mcpn765(void)
+{ 
+        unsigned long romACtlReg;
+       printk(KERN_NOTICE "MCPN765 flash device: %x at %x\n",
+                       FLASH_SIZE, FLASH_PHYS_ADDR);
+ 
+       mcpn765_map.map_priv_1 = (unsigned long)ioremap(FLASH_PHYS_ADDR,
+                                       FLASH_SIZE);
+
+       if (!mcpn765_map.map_priv_1) {
+               printk("Failed to ioremap FLASH_PHYS_ADDR\n");
+               return -EIO;
+       }
+       mcpn765_map.map_priv_2 = (unsigned 
long)ioremap(FLASH_ROM_A_BASE_SIZE_REG,
+                                       FLASH_ROM_A_BASE_SIZE_REG_SIZE);
+
+       if (!mcpn765_map.map_priv_2) {
+               printk("Failed to ioremap FLASH_ROM_A_BASE_SIZE_REG\n");
+               return -EIO;
+       }
+
+        /* 
+         * Enable the bank for Access
+         * Enable the bank for Writes.
+         */
+
+        romACtlReg = *(volatile long *)mcpn765_map.map_priv_2;
+        romACtlReg |= FLASH_ROM_A_ENABLE;
+       // TDB: need to work out exactly when to turn on & off the write 
enable
+        // for now it seems OK to leave it on all the time
+        romACtlReg |= FLASH_ROM_A_WRITE_ENABLE;
+        *(volatile long *)mcpn765_map.map_priv_2 = romACtlReg;
+       mymtd = do_map_probe("cfi", &mcpn765_map);
+       if (mymtd) {
+               mymtd->module = THIS_MODULE;
+               add_mtd_partitions(mymtd, mcpn765_parts, PARTITION_COUNT);
+               printk(KERN_NOTICE "FlagaDM flash device initialized\n");
+               return 0;
+       }
+       printk("MTD: cfi probe FAILED!\n");
+       iounmap((void *)mcpn765_map.map_priv_1);
+       return -ENXIO;
+}
+
+static void __exit cleanup_mcpn765(void)
+{
+       if (mymtd) {
+               del_mtd_partitions(mymtd);
+               map_destroy(mymtd);
+       }
+       if (mcpn765_map.map_priv_1) {
+               iounmap((void *)mcpn765_map.map_priv_1);
+               mcpn765_map.map_priv_1 = 0;
+       }
+       if (mcpn765_map.map_priv_2) {
+               iounmap((void *)mcpn765_map.map_priv_2);
+               mcpn765_map.map_priv_2 = 0;
+       }
+}
+
+module_init(init_mcpn765);
+module_exit(cleanup_mcpn765);
