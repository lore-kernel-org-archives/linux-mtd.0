Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15mKNg-0006yv-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2001 20:30:04 +0100
Message-ID: <20010926123822.A32238@recycle.lbl.gov>
Date: Wed, 26 Sep 2001 12:38:22 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: Re: problems with 28F320B still
References: <20010925134029.A22314@recycle.lbl.gov> <24339.1001451631@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <24339.1001451631@redhat.com>; from David Woodhouse on Tue, Sep 25, 2001 at 10:00:31PM +0100
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

I can make the (current CVS) MTD system on a nanoEngine recognize
the on-board Intel TE28F320B3 if I do the following:
1. disable BLKGETSIZE64 support in drivers/mtd/mtdblock.c.  :-p
2. configure for CONFIG_MTD_CFI, CONFIG_MTD_JEDECPROBE, and
   CONFIG_MTD_CFI_AMDSTD, among other things.
3. adjust drivers/mtd/maps/sa1100-flash.c to create nanoEngine
   Flash mappings.
4. Change the first argument in the call to do_map_probe() in
   sa1100-flash.c from "cfi_probe" to "jedec_probe".

I'm nervous about progressing from here, in part because of the
amount of fussing that Daniel Belz did to the cfi_cmdset_0002
driver, when _he_ tackled the 320B3.  I append the diff between 
the CVS copy with Id:
   cfi_cmdset_0002.c,v 1.49 2001/07/14 00:59:16 thockin Exp
and Daniel's posting of Tue, 04 Sep 2001.  I'd appreciate advice
on which, if any, of these changes should be adapted to the current
CVS tree.  I'd really rather not corrupt the data on this chip!

If I leave off item 4 above, something triggers a false positive
detection of a CFI-compliant device.  I added more printk's to
qry_present() in cfi_probe.c, and forced its output to 0, like this:
        printk(KERN_NOTICE "qry_present: base=%x, osf=%d\n", base, osf);
        printk(KERN_NOTICE " 'Q': %.8x == %.8x\n", cfi_read(map,base+osf*0x10), cfi_build_cmd('Q',map,cfi));
        printk(KERN_NOTICE " 'R': %.8x == %.8x\n", cfi_read(map,base+osf*0x11), cfi_build_cmd('R',map,cfi));
        printk(KERN_NOTICE " 'Y': %.8x == %.8x\n", cfi_read(map,base+osf*0x12), cfi_build_cmd('Y',map,cfi));
        return 0;       // disable false positive on nanoEngine
with the result:
SA1100 flash: probing 16-bit flash bus
qry_present: base=0, osf=2
 'Q': 00000051 == 00000051
 'R': 00000052 == 00000052
 'Y': 00000059 == 00000059
qry_present: base=0, osf=2
 'Q': 00000051 == 00005151
 'R': 00000052 == 00005252
 'Y': 00000059 == 00005959
qry_present: base=0, osf=4
 'Q': 00000000 == 00005151
 'R': 00000000 == 00005252
 'Y': 00000000 == 00005959
CFI: Found no SA1100 flash device at location zero

It sure looks like 'QRY' is in there!

     - Larry


--- mtd/drivers/mtd/chips/cfi_cmdset_0002.c	Fri Jul 13 17:59:16 2001
+++ cfi_cmdset_0002.c	Wed Sep 26 12:05:52 2001
@@ -106,7 +106,7 @@
 		}
 	}
     }
-
+    //JEDEC so pega daqui em diante -- belz
     /* If there was an old setup function, decrease its use count */
     if (map->fldrv)
       if(map->fldrv->module)
@@ -199,11 +199,11 @@
 	case 1:
 	case 2:
 	case 4:
-#if 1
+//#if 1
 		if (mtd->numeraseregions > 1)
 			mtd->erase = cfi_amdstd_erase_varsize;
 		else
-#endif
+//#endif
 			mtd->erase = cfi_amdstd_erase_onesize;
 		mtd->read = cfi_amdstd_read;
 		mtd->write = cfi_amdstd_write;
@@ -230,6 +230,7 @@
 {
 	DECLARE_WAITQUEUE(wait, current);
 	unsigned long timeo = jiffies + HZ;
+        struct cfi_private *cfi = map->fldrv_priv;
 
  retry:
 	cfi_spin_lock(chip->mutex);
@@ -256,6 +257,10 @@
 
 	chip->state = FL_READY;
 
+        
+        cfi_write(map, CMD(0xFF), adr); //belz
+
+
 	map->copy_from(map, buf, adr, len);
 
 	wake_up(&chip->wq);
@@ -308,12 +313,15 @@
 static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, __u32 datum, int fast)
 {
 	unsigned long timeo = jiffies + HZ;
-	unsigned int Last[4];
-	unsigned long Count = 0;
+        //unsigned int Last[4];    //com belz
+        //unsigned long Count = 0; //com belz
 	struct cfi_private *cfi = map->fldrv_priv;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+        __u32 status, status_OK; //belz
 
+
+        status_OK = CMD(0x80);
  retry:
 	cfi_spin_lock(chip->mutex);
 
@@ -340,7 +348,8 @@
 
 	adr += chip->start;
 	ENABLE_VPP(map);
-	if (fast) { /* Unlock bypass */
+        
+        if (fast) { // Unlock bypass
 		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, NULL);
 	}
 	else {
@@ -349,18 +358,58 @@
 	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	}
 
+        //cfi_write(map, CMD(0x50), adr); //belz
+        cfi_write(map, CMD(0x40), adr); //belz
 	cfi_write(map, datum, adr);
 
+
 	cfi_spin_unlock(chip->mutex);
 	cfi_udelay(chip->word_write_time);
 	cfi_spin_lock(chip->mutex);
 
+        
+        
+        
+        //belz inicio
+        
+        
+        while ( ( (status = cfi_read(map,adr)) & status_OK ) != status_OK ) {
+                static int z=0;
+                /* OK Still waiting */
+                if (time_after(jiffies, timeo)) {
+                        chip->state = FL_READY;
+                        cfi_spin_unlock(chip->mutex);
+                        printk("waiting for writing to complete timed out.");
+                        DISABLE_VPP(map);
+                        return -EIO;
+                }
+                
+                /* Latency issues. Drop the lock, wait a while and retry */
+                cfi_spin_unlock(chip->mutex);
+
+                z++;
+                if ( 0 && !(z % 100 ))
+                        printk("chip not ready yet after write. looping\n");
+
+                cfi_udelay(1);
+                
+                cfi_spin_lock(chip->mutex);
+                continue;
+        }
+
+        
+        
+        
+        
+        //belz fim
+        /*
+        
 	Last[0] = cfi_read(map, adr);
-	//	printk("Last[0] is %x\n", Last[0]);
+                printk("Last[0] is %x\n", Last[0]);
 	Last[1] = cfi_read(map, adr);
-	//	printk("Last[1] is %x\n", Last[1]);
+                printk("Last[1] is %x\n", Last[1]);
 	Last[2] = cfi_read(map, adr);
-	//	printk("Last[2] is %x\n", Last[2]);
+                printk("Last[2] is %x\n", Last[2]);
 
 	for (Count = 3; Last[(Count - 1) % 4] != Last[(Count - 2) % 4] && Count < 10000; Count++){
 		cfi_spin_unlock(chip->mutex);
@@ -376,7 +425,7 @@
 	        cfi_send_gen_cmd(0xF0, 0, chip->start, map, cfi, cfi->device_type, NULL);
 		DISABLE_VPP(map);
 		ret = -EIO;
-	}       
+        } */
 	DISABLE_VPP(map);
 	chip->state = FL_READY;
 	wake_up(&chip->wq);
@@ -425,7 +474,6 @@
 				bus_ofs, datum, 0);
 		if (ret) 
 			return ret;
-		
 		ofs += n;
 		buf += n;
 		(*retlen) += n;
@@ -436,6 +484,7 @@
 			if (chipnum == cfi->numchips)
 				return 0;
 		}
+
 	}
 	
 	/* Go into unlock bypass mode */
@@ -443,6 +492,8 @@
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
 
+        //cfi_write(map, CMD(0x40), 0); //belz
+
 	/* We are now aligned, write as much as possible */
 	while(len >= CFIDEV_BUSWIDTH) {
 		__u32 datum;
@@ -564,7 +615,7 @@
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_write(map, CMD(0x30), adr);
+        //cfi_write(map, CMD(0x20), adr);
 	
 	timeo = jiffies + (HZ*20);
 
@@ -573,7 +624,9 @@
 	cfi_spin_lock(chip->mutex);
 	
 	rdy_mask = CMD(0x80);
-
+        cfi_write(map, CMD(0x50), adr);//<----foi inserido e com
+        cfi_write(map, CMD(0x20), adr);//<----foi inserido
+        cfi_write(map, CMD(0xD0), adr);//<----foi inserido
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
@@ -603,7 +656,7 @@
 		if (time_after(jiffies, timeo)) {
 			chip->state = FL_READY;
 			cfi_spin_unlock(chip->mutex);
-			printk("waiting for erase to complete timed out.");
+                        printk("--->(status:%X, cfi_read:%X) waiting for erase to complete timed out.",chip->state,cfi_read(map, adr));
 			DISABLE_VPP(map);
 			return -EIO;
 		}
