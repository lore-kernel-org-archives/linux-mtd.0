Received: from tiku.hut.fi ([130.233.228.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166vPR-0003M5-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2001 15:05:01 +0000
Received: from kosh.hut.fi (jlavi@kosh.hut.fi [130.233.228.10])
	by tiku.hut.fi (8.9.3/8.9.3) with ESMTP id RAA20429
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2001 17:15:34 +0200 (EET)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id RAA27848
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2001 17:15:34 +0200 (EET)
Date: Thu, 22 Nov 2001 17:15:34 +0200
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: New Intel chip with CFIext version 1.3 not working
Message-ID: <20011122171534.A22055@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20011114115334.A29901@kosh.hut.fi>; from jlavi@iki.fi on Wed, Nov 14, 2001 at 11:53:35AM +0200
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

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Could anybody give suggestions how to add the concept of multiple
planes into MTD? Or is it there somewhere already? 

The problem is that currently there is flchip_t structure that has single 
field for flash state, but this state is shared among all planes. This is
not good since each plane has its own independent state.

Is see two possibilites. Either each partition region or plane has its
own flchip_t or flchip_t is expanded to understand multiple planes.

Another problem is to how to find out the existence of these planes
from the flash. For this end I have modified the cfi_cmdset_0001
driver to tell in cleartext the data it sees about partition regions.
Below follows a sample from boot messages. 

I have also attached a hex dump of the flash memory contents. Attaches 
is also the patch containing my modifications.

The chip is top boot with 16 planes. Each of the plane is 512 KB. The
first 15 planes have 8 64 KB sectors each. The last plane has 7 64 kB
sectors and 8 8KB sectors.

Jarkko Lavinen


Kernel boot messages follow:

Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x10000 bytes, 127 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 8 blocks
Map Flash0, base 0, number of device hardware partition regions: 2
Partition Region 0 Information:
  Number of identical partitions within partition region 15
  Number of simultaneous program operations: 1
  Number of simultaneous erase operations: 1
  Number of programming or erase ops allowed in other partitions while programmming: 0
  Number of programming or erase ops allowed in other partitions while erasing: 0
  Number of erase block regions w/ contiguous same-size erase blocks: 1
  Erase Block Type 0
    Number of identical sized erase block: 8
    Number of bytes in erase block region: 65536
    Minimum block erase cycles: 100000
    Internal ECC, bits per cell: 1
    Internal ECC, inernal ECC used: 1
    Page mode host reads permitted: 0
    Synchronous host reads permitted: 1
    Synchronous host writes permitted: 0
Partition Region 1 Information:
  Number of identical partitions within partition region 1
  Number of simultaneous program operations: 1
  Number of simultaneous erase operations: 1
  Number of programming or erase ops allowed in other partitions while programmming: 0
  Number of programming or erase ops allowed in other partitions while erasing: 0
  Number of erase block regions w/ contiguous same-size erase blocks: 2
  Erase Block Type 0
    Number of identical sized erase block: 7
    Number of bytes in erase block region: 65536
    Minimum block erase cycles: 100000
    Internal ECC, bits per cell: 1
    Internal ECC, inernal ECC used: 1
    Page mode host reads permitted: 0
    Synchronous host reads permitted: 1
    Synchronous host writes permitted: 0
  Erase Block Type 1
    Number of identical sized erase block: 8
    Number of bytes in erase block region: 8192
    Minimum block erase cycles: 100000
    Internal ECC, bits per cell: 1
    Internal ECC, inernal ECC used: 1
    Page mode host reads permitted: 0
    Synchronous host reads permitted: 1
    Synchronous host writes permitted: 0
mtd: Giving out device 0 to Flash0

Hex dump of flash chip in read query mode follows:

address__0__1__2__3__4__5__6__7__8__9__A__B__C__D__E__F__0123456789ABCDEF
F0000000|89 00 74 88 01 00 01 00 89 00 CF FF 01 00 01 00 ..t.............
F0000010|89 00 74 88 01 00 01 00 89 00 CF FF 01 00 01 00 ..t.............
F0000020|51 00 52 00 59 00 03 00 00 00 39 00 00 00 00 00 Q.R.Y.....9.....
F0000030|00 00 00 00 00 00 17 00 19 00 B4 00 C6 00 04 00 ................
F0000040|00 00 0A 00 00 00 04 00 00 00 03 00 00 00 17 00 ................
F0000050|01 00 00 00 00 00 00 00 02 00 7E 00 00 00 00 00 ..........~.....
F0000060|01 00 07 00 00 00 20 00 00 00 00 00 00 00 00 00 ...... .........
F0000070|00 00 50 00 52 00 49 00 31 00 33 00 66 00 0B 00 ..P.R.I.1.3.f...
F0000080|00 00 00 00 01 00 03 00 00 00 18 00 C0 00 01 00 ................
F0000090|80 00 00 00 03 00 03 00 00 00 03 00 01 00 02 00 ................
F00000A0|07 00 02 00 0F 00 00 00 11 00 00 00 00 00 01 00 ................
F00000B0|07 00 00 00 00 00 01 00 64 00 00 00 01 00 02 00 ........d.......
F00000C0|01 00 00 00 11 00 00 00 00 00 02 00 06 00 00 00 ................
F00000D0|00 00 01 00 64 00 00 00 01 00 02 00 07 00 00 00 ....d...........
F00000E0|20 00 00 00 64 00 00 00 01 00 02 00 01 00 FF FF  ...d...........
F00000F0|FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ................
F0000100|FE FF 03 80 16 00 69 3A 4D A6 FF FF FF FF FF FF ......i:M.......

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=partregs-patch

diff -u -r linux-2.4.14/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.4.14-jlavi/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.4.14/drivers/mtd/chips/cfi_cmdset_0001.c	Fri Oct  5 01:14:59 2001
+++ linux-2.4.14-jlavi/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov 22 16:18:27 2001
@@ -4,7 +4,7 @@
  *
  * (C) 2000 Red Hat. GPL'd
  *
- * $Id: cfi_cmdset_0001.c,v 1.87 2001/10/02 15:05:11 dwmw2 Exp $
+ * $Id: cfi_cmdset_0001.c,v 1.85 2001/07/19 14:11:47 rmk Exp $
  *
  * 
  * 10/10/2000	Nicolas Pitre <nico@cam.org>
@@ -97,6 +97,95 @@
 }
 #endif
 
+void cfi_intel_specific_partitions(struct map_info *map, __u16 adr)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	__u32 base = cfi->chips[0].start;
+	int ofs_factor = cfi->interleave * cfi->device_type;
+	int i, j, k, nparts, nfields, ofs;
+
+	/*printk("adr: %x\n", adr);*/
+
+	ofs = 0;
+	/* Skip Primary Vendor Specific Entended Query Table */
+	ofs = sizeof(struct cfi_pri_intelext);
+	
+	/* Skip Protected Register Informantion */
+	nfields = cfi_read_query(map, (base+((adr + ofs)*ofs_factor)));
+	
+	ofs += sizeof(__u8) + nfields*sizeof(__u32);
+	
+	/* Skip Burst Read Informatin */
+	nfields = cfi_read_query(map, (base+((adr + ofs + 1)*ofs_factor)));
+	
+	ofs += 2*sizeof(__u8) + nfields*sizeof(__u8);
+
+	/*printk("ofs: %x\n", ofs); */
+	
+	/* Read Partition and Erase Block Region Information */
+	
+	nparts = cfi_read_query(map, (base+((adr + ofs)*ofs_factor)));
+	printk("Map %s, base %x, number of device hardware partition regions: %d\n",
+	       map->name, base, nparts);
+				  		       			
+	ofs += 1;
+	for(i = 0; i < nparts; i++) {
+		struct cfi_vsi_pri_query pri;
+		struct cfi_vsi_ebr_query ebr;
+		
+		for(j=0; j < sizeof(struct cfi_vsi_pri_query); j++)
+			((unsigned char *)&pri)[j] = 
+				cfi_read_query(map, (base+((adr + ofs + j)*
+							   ofs_factor)));
+		pri.NumOfIdPartitions = le16_to_cpu(pri.NumOfIdPartitions);
+		
+		printk("Partition Region %d Information:\n"
+		       "  Number of identical partitions within partition region %d\n"
+		       "  Number of simultaneous program operations: %d\n"
+		       "  Number of simultaneous erase operations: %d\n"
+		       "  Number of programming or erase ops allowed in other partitions while programmming: %d\n"
+		       "  Number of programming or erase ops allowed in other partitions while erasing: %d\n"
+		       "  Number of erase block regions w/ contiguous same-size erase blocks: %d\n",
+		       i, 
+		       pri.NumOfIdPartitions,
+		       pri.NumOfOps & 0xf, pri.NumOfOps >> 4,
+		       pri.NunOfOtherPEOpsWhileProgramming,
+		       pri.NunOfOtherPEOpsWhileErasing,
+		       pri.NumOfEBRsInProgRegion);
+
+		ofs += sizeof(struct cfi_vsi_pri_query);
+		for(j = 0; j < pri.NumOfEBRsInProgRegion; j++) {
+			for(k = 0; k < sizeof(struct cfi_vsi_ebr_query); k++)
+				((unsigned char *)&ebr)[k] = 
+					cfi_read_query(map, (base+((adr + ofs + k)* ofs_factor)));
+
+			ebr.NumOfEQSizedEBRs = le16_to_cpu(ebr.NumOfEQSizedEBRs);
+			ebr.NumOfEBRBytes = le16_to_cpu(ebr.NumOfEBRBytes);
+			ebr.MaxBEraseCnt = le16_to_cpu(ebr.MaxBEraseCnt);
+			
+			printk("  Erase Block Type %d\n"
+			       "    Number of identical sized erase block: %d\n"
+			       "    Number of bytes in erase block region: %d\n"
+			       "    Minimum block erase cycles: %d\n"
+			       "    Internal ECC, bits per cell: %d\n"
+			       "    Internal ECC, inernal ECC used: %d\n"
+			       "    Page mode host reads permitted: %d\n"
+			       "    Synchronous host reads permitted: %d\n"
+			       "    Synchronous host writes permitted: %d\n",
+			       j,
+			       ebr.NumOfEQSizedEBRs + 1,
+			       ebr.NumOfEBRBytes * 256,
+			       ebr.MaxBEraseCnt * 1000,
+			       ebr.EccBits & 0xf, (ebr.EccBits & 0x10) != 0,
+			       (ebr.PgSynModeCap & 0x1) != 0,
+			       (ebr.PgSynModeCap & 0x2) != 0,
+			       (ebr.PgSynModeCap & 0x4) != 0);
+
+			ofs += sizeof(struct cfi_vsi_ebr_query);
+		}			
+	}
+}
+
 /* This routine is made available to other mtd code via
  * inter_module_register.  It must only be accessed through
  * inter_module_get which will bump the use count of this module.  The
@@ -138,9 +227,18 @@
 			((unsigned char *)extp)[i] = 
 				cfi_read_query(map, (base+((adr+i)*ofs_factor)));
 		}
-		
+
+#if defined(DEBUG_CFI_FEATURES)
+		if (extp->MajorVersion == '1' &&  extp->MinorVersion == '3') 
+			cfi_intel_specific_partitions(map, adr);
+#endif
+
 		if (extp->MajorVersion != '1' || 
+#if 0
 		    (extp->MinorVersion < '0' || extp->MinorVersion > '2')) {
+#else
+		    (extp->MinorVersion < '0' || extp->MinorVersion > '3')) {
+#endif
 			printk(KERN_WARNING "  Unknown IntelExt Extended Query "
 			       "version %c.%c.\n",  extp->MajorVersion,
 			       extp->MinorVersion);
@@ -1478,37 +1576,76 @@
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
diff -u -r linux-2.4.14/include/linux/mtd/cfi.h linux-2.4.14-jlavi/include/linux/mtd/cfi.h
--- linux-2.4.14/include/linux/mtd/cfi.h	Fri Oct  5 01:13:18 2001
+++ linux-2.4.14-jlavi/include/linux/mtd/cfi.h	Thu Nov 22 14:15:40 2001
@@ -219,6 +219,22 @@
   __u32 ConfField[1]; /* Not host ordered */
 } __attribute__((packed));
 
+struct cfi_vsi_pri_query {
+	__u16 NumOfIdPartitions;
+	__u8  NumOfOps;
+	__u8  NunOfOtherPEOpsWhileProgramming;
+	__u8  NunOfOtherPEOpsWhileErasing;	
+	__u8  NumOfEBRsInProgRegion;
+} __attribute__((packed));
+
+struct cfi_vsi_ebr_query {
+	__u16 NumOfEQSizedEBRs;
+	__u16 NumOfEBRBytes;
+	__u16 MaxBEraseCnt;
+	__u8  EccBits;
+	__u8  PgSynModeCap;
+} __attribute__((packed));
+
 #define P_ID_NONE 0
 #define P_ID_INTEL_EXT 1
 #define P_ID_AMD_STD 2

--fUYQa+Pmc3FrFX/N--
