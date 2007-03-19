Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTKwq-0003f8-Hi
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 12:43:07 -0400
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
From: Thomas Gleixner <tglx@linutronix.de>
To: Igor Marnat <marny@rambler.ru>
In-Reply-To: <9323738734.20070319144832@rambler.ru>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron> <41978953.20070319084552@rambler.ru>
	<1174288746.13341.490.camel@localhost.localdomain>
	<9323738734.20070319144832@rambler.ru>
Content-Type: text/plain
Date: Mon, 19 Mar 2007 17:50:06 +0100
Message-Id: <1174323006.13341.504.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-19 at 14:48 +0300, Igor Marnat wrote:
> Hello Thomas,
> 
> TG> Can you please dump the mtd partition with the corrupt data with
> TG> nanddump:
> 
> TG> # nanddump -b -f nand.dmp /dev/mtdX
> 
> I put it to ftp://ftp.tz.ru/pub/nand.dmp.bz2.
> 
> It's size is 26 MB. Nanddump didn't want to accept options you
> provided, so I did the dump with command "nanddump /dev/mtd0
> nand.dmp". Please tell me if it is wrong.

No. I probably looked at an old version.

Your flash is full of corrupted nodes. Most of them belong to 

the files: "messages" and "wtmp"

 Invalid Inode      node at 0x000253ec, totlen 0x00000130, #ino   1807, version 106033, isize 428154883, csize     4597, dsize     4597, offset 37875712
 Invalid Inode      node at 0x00025a14, totlen 0x00000046, #ino   8620, version 470658, isize 1019416371, csize     3596, dsize     3596, offset  5997846
 Invalid Inode      node at 0x00025e20, totlen 0x00000091, #ino   8620, version 470663, isize  5997941, csize 3438493594, dsize 4294927703, offset  5997864

Interrestingly enough are the node CRCs of some of the nodes intact, so
the corruption must have happened before writing to flash.

Does the patch below help ?

	tglx

--------------------->
Subject: JFFS2: Check inode CRC first

Corrupted inodes need to be sorted out before anything else is done on
them.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 7fb45bd..8a70590 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -952,7 +952,7 @@ static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 				 struct jffs2_raw_inode *ri, uint32_t ofs, struct jffs2_summary *s)
 {
 	struct jffs2_inode_cache *ic;
-	uint32_t ino = je32_to_cpu(ri->ino);
+	uint32_t crc, ino = je32_to_cpu(ri->ino);
 	int err;
 
 	D1(printk(KERN_DEBUG "jffs2_scan_inode_node(): Node at 0x%08x\n", ofs));
@@ -966,21 +966,22 @@ static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 	   Which means that the _full_ amount of time to get to proper write mode with GC
 	   operational may actually be _longer_ than before. Sucks to be me. */
 
+	/* Check the node CRC in any case. */
+	crc = crc32(0, ri, sizeof(*ri)-8);
+	if (crc != je32_to_cpu(ri->node_crc)) {
+		printk(KERN_NOTICE "jffs2_scan_inode_node(): CRC failed on "
+		       "node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+		       ofs, je32_to_cpu(ri->node_crc), crc);
+		/*
+		 * We believe totlen because the CRC on the node
+		 * _header_ was OK, just the node itself failed.
+		 */
+		return jffs2_scan_dirty_space(c, jeb,
+					      PAD(je32_to_cpu(ri->totlen));
+	}
+
 	ic = jffs2_get_ino_cache(c, ino);
 	if (!ic) {
-		/* Inocache get failed. Either we read a bogus ino# or it's just genuinely the
-		   first node we found for this inode. Do a CRC check to protect against the former
-		   case */
-		uint32_t crc = crc32(0, ri, sizeof(*ri)-8);
-
-		if (crc != je32_to_cpu(ri->node_crc)) {
-			printk(KERN_NOTICE "jffs2_scan_inode_node(): CRC failed on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
-			       ofs, je32_to_cpu(ri->node_crc), crc);
-			/* We believe totlen because the CRC on the node _header_ was OK, just the node itself failed. */
-			if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(ri->totlen)))))
-				return err;
-			return 0;
-		}
 		ic = jffs2_scan_make_ino_cache(c, ino);
 		if (!ic)
 			return -ENOMEM;
