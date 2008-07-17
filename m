Received: from atlantis.8hz.com ([212.129.237.78])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJP8f-00054o-Fk
	for linux-mtd@lists.infradead.org; Thu, 17 Jul 2008 08:47:01 +0000
Date: Thu, 17 Jul 2008 08:46:59 +0000
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Oops in TS-5500 map
Message-ID: <20080717084659.GA96328@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If CONFIG_MTD_TS5500 is configured and the kernel is run on a system which
does not have this flash, an Oops will occur. This patch fixes that and 
cleans the driver up a little.

BUG: unable to handle kernel NULL pointer dereference at 000000a8
IP: [<c01ba7de>] map_destroy+0x3/0x1f
*pde = 00000000 
Oops: 0000 [#1] 

Pid: 1, comm: swapper Not tainted (2.6.26 #1)
EIP: 0060:[<c01ba7de>] EFLAGS: 00010246 CPU: 0
EIP is at map_destroy+0x3/0x1f
EAX: 00000000 EBX: 00000000 ECX: ffffffff EDX: 00000000
ESI: 00000000 EDI: 00000000 EBP: c029bb03 ESP: c181df78
 DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
Process swapper (pid: 1, ti=c181c000 task=c181a000 task.ti=c181c000)
Stack: c0292574 c029bba3 c0292600 00000000 00000000 c02a8cd8 00000000 00000000 
       00000000 00000000 00000000 c181a000 00000000 c010b838 c0102816 00000202 
       c0292574 00000000 00000000 00000000 00000000 00000000 00000000 c0292574 
Call Trace:
 [<c0292574>] kernel_init+0x0/0x1c0
 [<c029bba3>] init_ts5500_map+0xa0/0xb4
 [<c0292600>] kernel_init+0x8c/0x1c0
 [<c010b838>] schedule_tail+0xe/0x39
 [<c0102816>] ret_from_fork+0x6/0x20
 [<c0292574>] kernel_init+0x0/0x1c0
 [<c0292574>] kernel_init+0x0/0x1c0
 [<c0102ca7>] kernel_thread_helper+0x7/0x10
 =======================
Code: c7 40 14 20 5c 28 c0 89 0d 20 5c 28 c0 c3 8b 48 10 8b 50 14 89 51 04 89 0a c7 40 10 00 01 10 00 c7 40 14 00 02 20 00 c3 53 89 c3 <8b> 80 a8 00 00 00 8b 40 2c 8b 50 04 85 d2 74 04 89 d8 ff d2 89 
EIP: [<c01ba7de>] map_destroy+0x3/0x1f SS:ESP 0068:c181df78

Signed-off-by: Sean Young <sean@mess.org>
---
diff -urpN linux-2.6.26/drivers/mtd/maps/ts5500_flash.c /home/sean/tiger/linux-2.6.26/drivers/mtd/maps/ts5500_flash.c
--- linux-2.6.26/drivers/mtd/maps/ts5500_flash.c	2008-07-13 22:51:29.000000000 +0100
+++ /home/sean/tiger/linux-2.6.26/drivers/mtd/maps/ts5500_flash.c	2008-07-16 14:47:11.000000000 +0100
@@ -45,7 +45,7 @@ static struct map_info ts5500_map = {
 	.phys = WINDOW_ADDR
 };
 
-static struct mtd_partition ts5500_partitions[] = {
+static const struct mtd_partition ts5500_partitions[] = {
 	{
 		.name = "Drive A",
 		.offset = 0,
@@ -63,20 +63,17 @@ static struct mtd_partition ts5500_parti
 	}
 };
 
-#define NUM_PARTITIONS ARRAY_SIZE(ts5500_partitions)
-
 static struct mtd_info *mymtd;
 
 static int __init init_ts5500_map(void)
 {
-	int rc = 0;
+	int rc;
 
 	ts5500_map.virt = ioremap_nocache(ts5500_map.phys, ts5500_map.size);
 
 	if (!ts5500_map.virt) {
 		printk(KERN_ERR "Failed to ioremap_nocache\n");
-		rc = -EIO;
-		goto err2;
+		return -EIO;
 	}
 
 	simple_map_init(&ts5500_map);
@@ -87,18 +84,17 @@ static int __init init_ts5500_map(void)
 
 	if (!mymtd) {
 		rc = -ENXIO;
-		goto err1;
+		goto err;
 	}
 
 	mymtd->owner = THIS_MODULE;
-	add_mtd_partitions(mymtd, ts5500_partitions, NUM_PARTITIONS);
+	add_mtd_partitions(mymtd, ts5500_partitions, 
+						ARRAY_SIZE(ts5500_partitions));
 
 	return 0;
 
-err1:
-	map_destroy(mymtd);
+err:
 	iounmap(ts5500_map.virt);
-err2:
 	return rc;
 }
 
