Received: from smtp-2.hut.fi ([130.233.228.92])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163y3c-0006GU-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2001 11:18:16 +0000
Date: Wed, 14 Nov 2001 13:27:34 +0200
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: New Intel chip with CFIext version 1.3 not working.
Message-ID: <20011114132734.A19820@kosh.hut.fi>
References: <20011114115334.A29901@kosh.hut.fi> <2478.1005732188@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <2478.1005732188@redhat.com>; from dwmw2@infradead.org on Wed, Nov 14, 2001 at 10:03:08AM +0000
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

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Please could you send the changes in 'diff -u' form so that I can see what's 
> changed?

OK, here comes.

Jarkko

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cfi_cmdset_0001.c.diff"

--- cfi_cmdset_0001.c.old	Wed Nov 14 12:06:22 2001
+++ cfi_cmdset_0001.c	Wed Nov 14 12:09:08 2001
@@ -4,7 +4,7 @@
  *
  * (C) 2000 Red Hat. GPL'd
  *
- * $Id: cfi_cmdset_0001.c,v 1.87 2001/10/02 15:05:11 dwmw2 Exp $
+ * $Id: cfi_cmdset_0001.c,v 1.85 2001/07/19 14:11:47 rmk Exp $
  *
  * 
  * 10/10/2000	Nicolas Pitre <nico@cam.org>
@@ -140,7 +140,11 @@
 		}
 		
 		if (extp->MajorVersion != '1' || 
+#if 0
 		    (extp->MinorVersion < '0' || extp->MinorVersion > '2')) {
+#else
+		    (extp->MinorVersion < '0' || extp->MinorVersion > '3')) {
+#endif
 			printk(KERN_WARNING "  Unknown IntelExt Extended Query "
 			       "version %c.%c.\n",  extp->MajorVersion,
 			       extp->MinorVersion);
@@ -1478,37 +1482,76 @@
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	int eraseoffset, erasesize, eraseblocks;
 	unsigned long adr;
-	int chipnum, ret = 0;
+	int chipnum, ernum, ret = 0;
 #ifdef DEBUG_LOCK_BITS
 	int ofs_factor = cfi->interleave * cfi->device_type;
+	unsigned long temp_adr = adr;
+	unsigned long temp_len = len;
 #endif
 
-	chipnum = ofs >> cfi->chipshift;
-	adr = ofs - (chipnum << cfi->chipshift);
+	/* Pass the whole chip through sector by sector and check for each
+	   sector if the sector and the given interval overlap */
+	for(ernum = 0; ernum < mtd->numeraseregions; ernum++) {
+		struct mtd_erase_region_info *erp = &mtd->eraseregions[ernum];
+
+		eraseoffset = erp->offset;
+		erasesize = erp->erasesize;
+		eraseblocks = erp->numblocks;
 
 #ifdef DEBUG_LOCK_BITS
-	{
-		unsigned long temp_adr = adr;
-		unsigned long temp_len = len;
-                 
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-                while (temp_len) {
-			printk("before unlock %x: block status register is %x\n",temp_adr,cfi_read_query(map, temp_adr+(2*ofs_factor)));
-			temp_adr += mtd->erasesize;
-			temp_len -= mtd->erasesize;
-		}
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	}
+		printk("Erase offset %08x size %06x blocks %d\n",
+		       eraseoffset, erasesize, eraseblocks);
 #endif
 
-	ret = do_unlock_oneblock(map, &cfi->chips[chipnum], adr);
+		if (ofs > eraseoffset + erasesize)
+			continue;
+
+		while (eraseblocks > 0) {
+			if (ofs < eraseoffset + erasesize && 
+			    ofs + len > eraseoffset) {
+			       
+				chipnum = eraseoffset >> cfi->chipshift;
+				adr = eraseoffset - 
+					(chipnum << cfi->chipshift);
 
 #ifdef DEBUG_LOCK_BITS
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk("after unlock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+				temp_adr = adr;
+				temp_len = len;
+				
+				cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, 
+						 cfi->device_type, NULL);
+				while (temp_len) {
+					printk("before unlock %x: block "
+					       "status register is %x\n",
+					       temp_adr, cfi_read_query(map, temp_adr+(2*ofs_factor)));
+					temp_adr += mtd->erasesize;
+					temp_len -= mtd->erasesize;
+				}
+					
+				cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, 
+						 cfi->device_type, NULL);
+
+#endif
+				ret = do_unlock_oneblock(map, 
+							 &cfi->chips[chipnum],
+							 adr);
+
+#ifdef DEBUG_LOCK_BITS
+				cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, 
+						 cfi->device_type, NULL);
+				printk("after unlock: block status register "
+				       "is %x\n", 
+				       cfi_read_query(map, adr+(2*ofs_factor)));
+				cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, 
+						 cfi->device_type, NULL);
 #endif
+			}
+			eraseoffset += erasesize;
+			eraseblocks --;
+		}
+	}
 	
 	return ret;
 }
@@ -1601,17 +1644,23 @@
 	kfree(cfi);
 }
 
+#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
+#define cfi_intelext_init init_module
+#define cfi_intelext_exit cleanup_module
+#endif
+
 static char im_name_1[]="cfi_cmdset_0001";
 static char im_name_3[]="cfi_cmdset_0003";
 
-int __init cfi_intelext_init(void)
+
+mod_init_t cfi_intelext_init(void)
 {
 	inter_module_register(im_name_1, THIS_MODULE, &cfi_cmdset_0001);
 	inter_module_register(im_name_3, THIS_MODULE, &cfi_cmdset_0001);
 	return 0;
 }
 
-static void __exit cfi_intelext_exit(void)
+mod_exit_t cfi_intelext_exit(void)
 {
 	inter_module_unregister(im_name_1);
 	inter_module_unregister(im_name_3);
@@ -1619,7 +1668,3 @@
 
 module_init(cfi_intelext_init);
 module_exit(cfi_intelext_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org> et al.");
-MODULE_DESCRIPTION("MTD chip driver for Intel/Sharp flash chips");

--4Ckj6UjgE2iN1+kY--
