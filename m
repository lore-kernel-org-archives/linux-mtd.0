Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14T43v-0007CZ-00
	for mtd-list@infradead.org; Wed, 14 Feb 2001 15:41:47 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E1D@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Wed, 14 Feb 2001 16:41:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> Looks like as good a heuristic as any. Just wrap it in an 
> ifdef and we can 
> remove it or make it a config option if it causes trouble.
> 
> 	__u8 maj,min;
> 	int swap = 0;
> 
> 	maj = cfi_read_query(map, (adr+3)*ofs_factor);
> 	min = cfi_read_query(map, (adr+4)*ofs_factor);
> 
> 	cfi_send_gen_cmd(0xaa, 0x555, base, map, 
> cfi->interleave, cfi->device_type, NULL);
> 	cfi_send_gen_cmd(0x55, 0x2aa, base, map, 
> cfi->interleave, cfi->device_type, NULL);
> 	cfi_send_gen_cmd(0x90, 0x555, base, map, 
> cfi->interleave, cfi->device_type, NULL);
> 
>        	cfi->mfr = cfi_read_query(map, base);
>        	cfi->id = cfi_read_query(map, base + ofs_factor);
> 
> 	bootloc = if (maj << 8 + min >= 0x0101 /* Is this right? */) {
> 		if (cfi_read_query(map, (adr+3)*ofs_factor) == 3)
> 			swap = 1;
> 	}
> #ifdef FTSO_AMD
> 	else {
> 		/* Eep. Need to check JEDEC ID */
> 		if (cfi->id & 0x80) {
> 			printk(KERN_WARNING "JEDEC Device ID is 
> 0x%02X. Assuming broken CFI table.\n" cfi->id);
> 			swap = 1;		
> 		}
> 	}
> #endif
> 	if (swap) {
> 		printk(KERN_WARNING "Swapping erase regions for 
> broken CFI table\n");
> 		/* Do the swap as before ... */
> 	}
> 
> --
> dwmw2
> 

The following seems to work. Do you still think that the ifdef is necessary? The new code only gets executed if bootloc==0, and then I think it has to be.

/Jonas


+++ ./cfi_cmdset_0002.c	Wed Feb 14 16:29:40 2001
@@ -59,9 +59,25 @@
 
 	bootloc = cfi_read_query(map, (adr+15)*ofs_factor);
 
+	cfi_send_gen_cmd(0xf0, 0x55, 0, map, cfi->interleave, cfi->device_type, NULL);
+
+	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi->interleave, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
+	cfi->mfr = cfi_read_query(map, base);
+	cfi->id = map->read16(map, base + ofs_factor);
+
 	/* Wheee. Bring me the head of someone at AMD. */
+	if (!bootloc) {
+		if (cfi->id & 0x80) {
+			printk(KERN_WARNING "%s: JEDEC Device ID is 0x%02X. Assuming broken CFI table.\n", map->name, cfi->id);
+			bootloc = 3;	/* top boot */
+		} else {
+			bootloc = 2;	/* bottom boot */
+		}
+	}
 	if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
-		printk("Swapping erase regions for broken CFI table\n");
+		printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
 
 		for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
 			int j = (cfi->cfiq->NumEraseRegions-1)-i;
@@ -88,13 +104,6 @@
 		
 
 	cfi->cmdset_setup = cfi_amdstd_setup;
-	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi->interleave, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
-
-	cfi->mfr = cfi_read_query(map, base);
-	cfi->id = cfi_read_query(map, base + ofs_factor);
-
 	cfi_send_gen_cmd(0xf0, 0x55, 0, map, cfi->interleave, cfi->device_type, NULL);
 	return;
 }


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
