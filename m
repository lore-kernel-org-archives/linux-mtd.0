Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=talia.fluff.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C3eTe-0000bL-Cg
	for linux-mtd@lists.infradead.org; Sat, 04 Sep 2004 13:37:29 -0400
Date: Sat, 4 Sep 2004 18:37:03 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20040904173703.GA2100@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: ben@fluff.org
Subject: jedec_probe problems with 16bit devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been trying to get an SST 39LF160 on an Simtec Electronics
EB2410ITX (aka Bast). I have found some problems with jedec_probe
with non-8bit devices.

Basically, the two problems are as follows:

1) A number of functions are masking out bits from the command
addresses, but the cfi_send_gen_cmd() moves the addresses up
depending on the chip type, so the masking is not needed.

2) the cfi_send_gen_cmd() is called with CFI_DEVICETYPE_X8
instead of cfi->device_type, which causes the wrong accesses to
be generated to the chip.


This is the patch generated from the 03 Sep 2004 CVS drop:

--- mtd/drivers/mtd/chips/jedec_probe.c	2004-08-25 23:00:11.000000000 +0100
+++ linux-2.6.8.1-patched-work2/drivers/mtd/chips/jedec_probe.c	2004-09-04 18:18:51.000000000 +0100
@@ -8,6 +8,15 @@
    Occasionally maintained by Thayne Harbaugh tharbaugh at lnxi dot com
 */
 
+/* Note from Ben Dooks:
+ *
+ * There was an attempt to mask off unused address bits depending on the
+ * device width (ie, remove A0 for 16bit). This is a proble since the 
+ * command functions shift the addresses up for the chip-width, thus
+ * negating the need to mask, as all bits of the address are presented
+ * to the chip.
+ */
+
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -1379,6 +1388,22 @@
 			ERASEINFO(0x01000,256),
 		}
 	}, {
+		.mfr_id		= MANUFACTURER_SST,	/* should be CFI */
+		.dev_id		= SST39LF160,
+		.name		= "SST 39LF160",
+ 		.uaddr		= {
+			[0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
+			[1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
+		},
+		.DevSize	= SIZE_2MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 2,
+		.regions	= {
+			ERASEINFO(0x1000,256),
+			ERASEINFO(0x1000,256)
+		}
+
+	}, {
 		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W800DT,
 		.name		= "ST M29W800DT",
@@ -1654,8 +1679,8 @@
 	 * the F0 is written to */
 	if(cfi->addr_unlock1) {
 		/*printk("reset unlock called %x %x \n",cfi->addr_unlock1,cfi->addr_unlock2);*/
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
 	}
 
 	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
@@ -1700,7 +1725,6 @@
 static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
 {
 	int i,num_erase_regions;
-	unsigned long mask;
 	__u8 uaddr;
 
 	printk("Found: %s\n",jedec_table[index].name);
@@ -1735,10 +1759,11 @@
 		return 0;
 	}
 
-	/* Mask out address bits which are smaller than the device type */
-	mask = ~(p_cfi->device_type-1);
-	p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
-	p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;
+	/* Do not mask out `unused bits` due to the command function
+	 * shifting the addresses depdning on the chip type */
+
+	p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1;
+	p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2;
 
 	return 1; 	/* ok */
 }
@@ -1759,7 +1784,6 @@
 	int rc = 0;           /* failure until all tests pass */
 	u32 mfr, id;
 	__u8 uaddr;
-	unsigned long mask;
 
 	/*
 	 * The IDs must match.  For X16 and X32 devices operating in
@@ -1810,18 +1834,17 @@
 		goto match_done;
 	}
 
-	mask = ~(cfi->device_type-1);
 
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
 	       __func__, cfi->addr_unlock1, cfi->addr_unlock2 );
 	if ( MTD_UADDR_UNNECESSARY != uaddr && MTD_UADDR_DONT_CARE != uaddr
-	     && ( (unlock_addrs[uaddr].addr1 & mask) != cfi->addr_unlock1 ||
-		  (unlock_addrs[uaddr].addr2 & mask) != cfi->addr_unlock2 ) ) {
+	     && ( unlock_addrs[uaddr].addr1 != cfi->addr_unlock1 ||
+		  unlock_addrs[uaddr].addr2 != cfi->addr_unlock2 ) ) {
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "MTD %s(): 0x%.4lx 0x%.4lx did not match\n",
 		       __func__,
-		       unlock_addrs[uaddr].addr1 & mask,
-		       unlock_addrs[uaddr].addr2 & mask);
+		       unlock_addrs[uaddr].addr1,
+		       unlock_addrs[uaddr].addr2);
 		goto match_done;
 	}
 
@@ -1857,10 +1880,10 @@
 	 */
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__ );
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 	/* FIXME - should have a delay before continuing */
 
  match_done:	
@@ -1876,16 +1899,13 @@
 
  retry:
 	if (!cfi->numchips) {
-		unsigned long mask = ~(cfi->device_type-1);
-
 		uaddr_idx++;
 
 		if (MTD_UADDR_UNNECESSARY == uaddr_idx)
 			return 0;
 
-		/* Mask out address bits which are smaller than the device type */
-		cfi->addr_unlock1 = unlock_addrs[uaddr_idx].addr1 & mask;
-		cfi->addr_unlock2 = unlock_addrs[uaddr_idx].addr2 & mask;
+		cfi->addr_unlock1 = unlock_addrs[uaddr_idx].addr1;
+		cfi->addr_unlock2 = unlock_addrs[uaddr_idx].addr2;
 	}
 
 	/* Make certain we aren't probing past the end of map */
@@ -1916,10 +1936,10 @@
 
 	/* Autoselect Mode */
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 	/* FIXME - should have a delay before continuing */
 
 	if (!cfi->numchips) {
