Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDZd8-0005e6-BM
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 22:28:15 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id TAA16434
	for <linux-mtd@lists.infradead.org>; Fri, 1 Oct 2004 19:28:10 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	i922SALV012633
	for <linux-mtd@lists.infradead.org>; Fri, 1 Oct 2004 19:28:10 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id i922SAGT012631
	for linux-mtd@lists.infradead.org; Fri, 1 Oct 2004 19:28:10 -0700
Date: Fri, 1 Oct 2004 19:28:10 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041002022810.GA12611@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Patch: Avoid redundant strataflash [un]locking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check existing block lock status, avoid unnecessary lock/unlock if the
requested block is already in the requested state, for Intel command set
CFI flash.

Depending on the flash, it may be quite slow to perform either a lock or
unlock operation.  On a board with J3 StrataFlash I measured about 170
times as long to return OK status after an unlock than for lock.
Performing flash_unlock on a 30MB partition on this board formerly took
about 1 minute, now it takes about 300msec whether or not it was
previously locked, since this flash locks/unlocks all blocks along with
the block requested (so this "feature" is adapted to nicely).

If we properly support flashes that power up with all blocks locked, it will
become more important to sense the current state and flip lock/unlock state
accordingly.

Comments?  Thanks -- Todd

Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.156
diff -u -r1.156 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c	17 Sep 2004 11:45:05 -0000	1.156
+++ drivers/mtd/chips/cfi_cmdset_0001.c	2 Oct 2004 02:08:26 -0000
@@ -68,6 +68,8 @@
 		     size_t *retlen, u_char **mtdbuf);
 static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr, loff_t from,
 			size_t len);
+static int block_lockstatus(struct map_info *map, struct flchip *chip,
+			    unsigned long adr, int len);
 
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
 static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr);
@@ -1545,16 +1547,23 @@
 static int do_printlockstatus_oneblock(struct map_info *map, struct flchip *chip,
 				       unsigned long adr, int len, void *thunk)
 {
+	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
+	       adr, block_lockstatus(map, chip, adr, len));
+}
+#endif
+
+static int block_lockstatus(struct map_info *map, struct flchip *chip,
+			    unsigned long adr, int len)
+{
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ofs_factor = cfi->interleave * cfi->device_type;
+	int ret;
 
 	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
-	       adr, cfi_read_query(map, adr+(2*ofs_factor)));
+	ret = cfi_read_query(map, adr+(2*ofs_factor));
 	chip->state = FL_JEDEC_QUERY;
-	return 0;
+	return ret & 1;
 }
-#endif
 
 #define DO_XXLOCK_ONEBLOCK_LOCK		((void *) 1)
 #define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *) 2)
@@ -1567,6 +1576,10 @@
 	unsigned long timeo = jiffies + HZ;
 	int ret;
 
+	if (! ((thunk == DO_XXLOCK_ONEBLOCK_LOCK) ^ 
+	       block_lockstatus(map, chip, adr, len)))
+		return 0;
+
 	adr += chip->start;
 
 	/* Let's determine this according to the interleave only once */
