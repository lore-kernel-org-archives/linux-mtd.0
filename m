Received: from av9-1-sn1.fre.skanova.net ([81.228.11.115])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgX1g-0003Ti-2y
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 18:33:17 -0500
Received: from smtp3-1-sn1.fre.skanova.net (smtp3-1-sn1.fre.skanova.net
	[81.228.11.163])
	by av9-1-sn1.fre.skanova.net (Postfix) with ESMTP id 2695037E4E
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Dec 2004 00:33:14 +0100 (CET)
Received: from grey (h161n2fls34o815.telia.com [213.67.183.161])
	by smtp3-1-sn1.fre.skanova.net (Postfix) with ESMTP id 0ADE137E46
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Dec 2004 00:33:14 +0100 (CET)
From: "Per Hedblom" <per.hedblom@abem.se>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 21 Dec 2004 00:33:11 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Message-Id: <20041220233314.0ADE137E46@smtp3-1-sn1.fre.skanova.net>
Subject: jffs2  lost  pointer to the allocated memory 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I checked all calls to jffs2_alloc_raw_node_ref() in the jffs2 code and
found one strange call in gc.c where the pointer to the allocated memory is
lost immediately.

cvs -z5 diff -u -wb -p gc.c (in directory C:\cvs\mtd\fs\jffs2\)
Index: gc.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/gc.c,v
retrieving revision 1.143
diff -u -w -b -p -r1.143 gc.c
--- gc.c	16 Nov 2004 20:36:11 -0000	1.143
+++ gc.c	20 Dec 2004 22:41:20 -0000
@@ -602,7 +602,7 @@ static int jffs2_garbage_collect_pristin
 			printk(KERN_NOTICE "Not marking the space at 0x%08x
as dirty because the flash driver returned retlen zero\n",
nraw->flash_offset);
                         jffs2_free_raw_node_ref(nraw);
 		}
-		if (!retried && (nraw == jffs2_alloc_raw_node_ref())) {
+		if (!retried && (nraw = jffs2_alloc_raw_node_ref())) {
 			/* Try to reallocate space and retry */
 			uint32_t dummy;
 			struct jffs2_eraseblock *jeb = &c->blocks[phys_ofs /
c->sector_size];


/Per
