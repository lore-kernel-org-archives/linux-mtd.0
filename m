Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TNmL-0004pp-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 12:44:57 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E22@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Thu, 15 Feb 2001 13:44:22 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> But I don't care enough to argue :) As long as it works, it's 
> OK by me. 
> 

You don't have to argue, I'm convinced. Does this look OK (it works for my chips)?

/Jonas

+++ ./cfi_cmdset_0002.c	Thu Feb 15 13:37:41 2001
@@ -46,22 +46,42 @@
 	unsigned char bootloc;
 	int ofs_factor = cfi->interleave * cfi->device_type;
 	int i;
+	__u8 major, minor;
 //	struct cfi_pri_intelext *extp;
 
 	__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
 
 	cfi_send_gen_cmd(0x98, 0x55, 0, map, cfi->interleave, cfi->device_type, NULL);
 
-	printk(" Amd/Fujitsu Extended Query Table v%c.%c at 0x%4.4X\n", 
-	       cfi_read_query(map, (adr+3)*ofs_factor),
-	       cfi_read_query(map, (adr+4)*ofs_factor),
-	       adr);
+	major = cfi_read_query(map, (adr+3)*ofs_factor);
+	minor = cfi_read_query(map, (adr+4)*ofs_factor);
 
-	bootloc = cfi_read_query(map, (adr+15)*ofs_factor);
+	printk(" Amd/Fujitsu Extended Query Table v%c.%c at 0x%4.4X\n",
+	       major, minor, adr);
+
+	cfi_send_gen_cmd(0xf0, 0x55, 0, map, cfi->interleave, cfi->device_type, NULL);
+
+	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi->interleave, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
+	cfi->mfr = cfi_read_query(map, base);
+	cfi->id = map->read16(map, base + ofs_factor);

 	/* Wheee. Bring me the head of someone at AMD. */
+	if (((major << 8) | minor) > 0x3130) {
+		cfi_send_gen_cmd(0x98, 0x55, 0, map, cfi->interleave, cfi->device_type, NULL);
+		bootloc = cfi_read_query(map, (adr+15)*ofs_factor);
+	} else {
+		/* CFI version 1.0 => don't trust bootloc */
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
@@ -88,13 +108,6 @@
 		
 
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
