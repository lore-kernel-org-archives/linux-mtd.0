Received: from [202.98.123.42] (helo=mail.ocdtt.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163RP8-0003qQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 00:26:18 +0000
Received: from ocdtt.com (unknown [61.139.82.209])
	by mail.ocdtt.com (Postfix) with ESMTP id 35DFF13DD4
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 08:16:56 +0800 (CST)
Message-ID: <3BF06BB6.5344BB7C@ocdtt.com>
Date: Tue, 13 Nov 2001 08:39:18 +0800
From: Chen Yaoming <ymchen@ocdtt.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: patches for cfi_cmdset_0001.c etc.
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 7bit
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

I'm using Intel 28F160C3B. There must have something lost in
cfi_cmdset_0001.
That will cause the utils 'unlock' and 'eraseall' to fail.  The funtion
'atol()'  used to convert string to digital in the mtd_debug is also
dangerous
when addressing as hex format leading with 0x, which will aparently
damage
the area from address 0.  However, Here is the patches.  The first patch
is
for kernel 2.4.13, but also apply to mtd snapshot.

More, at least three of the utils are not region realized, such as lock,
unlock and eraseall.

diff -urN linux/drivers/mtd/chips/cfi_cmdset_0001.c
linux-2.4.13dt/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux/drivers/mtd/chips/cfi_cmdset_0001.c	Fri Oct  5 06:14:59 2001
+++ linux-2.4.13dt/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Nov 12
17:52:40 2001
@@ -1362,7 +1362,7 @@
 		printk("after lock: block status register is
%x\n",cfi_read_query(map, adr+(2*ofs_factor)));
 		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
 #endif
-
+
 		if (ret)
 			return ret;

@@ -1372,7 +1372,7 @@
 		if (adr >> cfi->chipshift) {
 			adr = 0;
 			chipnum++;
-
+
 			if (chipnum >= cfi->numchips)
 			break;
 		}
@@ -1480,37 +1480,53 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long adr;
 	int chipnum, ret = 0;
+
 #ifdef DEBUG_LOCK_BITS
 	int ofs_factor = cfi->interleave * cfi->device_type;
 #endif

+	if (ofs & (mtd->erasesize - 1))
+		return -EINVAL;
+
+	if (len & (mtd->erasesize -1))
+		return -EINVAL;
+
+	if ((len + ofs) > mtd->size)
+		return -EINVAL;
+
 	chipnum = ofs >> cfi->chipshift;
 	adr = ofs - (chipnum << cfi->chipshift);

+	while (len) {
 #ifdef DEBUG_LOCK_BITS
-	{
-		unsigned long temp_adr = adr;
-		unsigned long temp_len = len;
-
 		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-                while (temp_len) {
-			printk("before unlock %x: block status register is
%x\n",temp_adr,cfi_read_query(map, temp_adr+(2*ofs_factor)));
-			temp_adr += mtd->erasesize;
-			temp_len -= mtd->erasesize;
-		}
+		printk("before unlock %x: block status register is
%x\n",adr,cfi_read_query(map, adr+(2*ofs_factor)));
 		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	}
 #endif

-	ret = do_unlock_oneblock(map, &cfi->chips[chipnum], adr);
+		ret = do_unlock_oneblock(map, &cfi->chips[chipnum], adr);

 #ifdef DEBUG_LOCK_BITS
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk("after unlock: block status register is
%x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		printk("after unlock %x: block status register is
%x\n",adr,cfi_read_query(map, adr+(2*ofs_factor)));
+		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
 #endif
-
-	return ret;
+
+		if (ret)
+			return ret;
+
+		adr += mtd->erasesize;
+		len -= mtd->erasesize;
+
+		if (adr >> cfi->chipshift) {
+			adr = 0;
+			chipnum++;
+
+			if (chipnum >= cfi->numchips)
+			break;
+		}
+	}
+	return 0;
 }

 static int cfi_intelext_suspend(struct mtd_info *mtd)

--- mtd_debug.c	Mon Nov 12 19:05:23 2001
+++ mtd_debug.c	Mon Nov 12 19:04:19 2001
@@ -386,13 +386,13 @@
 		showinfo (fd);
 		break;
 	  case OPT_READ:
-		err = flash_to_file (fd,atol (argv[3]),atol (argv[4]),argv[5]);
+		err = flash_to_file (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0),argv[5]);
 		break;
 	  case OPT_WRITE:
-		err = file_to_flash (fd,atol (argv[3]),atol (argv[4]),argv[5]);
+		err = file_to_flash (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0),argv[5]);
 		break;
 	  case OPT_ERASE:
-		err = erase_flash (fd,atol (argv[3]),atol (argv[4]));
+		err = erase_flash (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0));
 		break;
 	 }
