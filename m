Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UOyo-0000Xk-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2001 09:46:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B70ED72.78088871@willhart-tech.com> 
References: <3B70ED72.78088871@willhart-tech.com>  <3B70C06D.5908CAC8@willhart-tech.com> <3B677B90.B2E244BD@cvs.anu.edu.au> <E15RXGo-00058Q-00@pentafluge.infradead.org> <30960.997176999@redhat.com> <22004.997252928@redhat.com> 
To: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
Cc: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC 2000 driver (NFTL) in kernel 2.4.7 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Aug 2001 09:52:04 +0100
Message-ID: <29728.997260724@redhat.com>
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

a.harsanyi@willhart-tech.com said:
>  However, when I mount it read-write and I write some files to the
> partition, the NFTL driver hangs my system...

> The messages are:
> ------------
> _Doc_WaitReady called for out-of-line wait
> Setting inplace to 0. VUC 194, block 2 was 0 lastEUN, and is in EUN 333 (!=) 673


/me dusts off the NFTL spec and tries to interpret that...

One of the blocks is marked BLOCK_DELETED in the Erase Unit which it's 
trying to fold the chain into. That ought to be fine - it can just leave it 
marked as deleted. I think that sanity check can be changed as follows:

Index: nftlcore.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nftlcore.c,v
retrieving revision 1.77
diff -u -r1.77 nftlcore.c
--- nftlcore.c	2001/08/07 09:47:41	1.77
+++ nftlcore.c	2001/08/08 08:46:17
@@ -330,8 +330,17 @@
 					       "in Virtual Unit Chain %d for block %d\n",
 					       thisVUC, block);
 				break;
-			case SECTOR_IGNORE:
 			case SECTOR_DELETED:
+				if (!BlockFreeFound[block])
+					BlockMap[block] = BLOCK_NIL;
+				else
+					printk(KERN_WARNING 
+					       "SECTOR_DELETED found after SECTOR_FREE "
+					       "in Virtual Unit Chain %d for block %d\n",
+					       thisVUC, block);
+				break;
+
+			case SECTOR_IGNORE:
 				break;
 			default:
 				printk("Unknown status for block %d in EUN %d: %x\n",
@@ -350,12 +359,15 @@
 
 	if (inplace) {
 		/* We're being asked to be a fold-in-place. Check
-		   that all blocks are either present or SECTOR_FREE
-		   in the target block. If not, we're going to have
-		   to fold out-of-place anyway.
+		   that all blocks which actually have data associated
+		   with them (i.e. BlockMap[block] != BLOCK_NIL) are 
+		   either already present or SECTOR_FREE in the target
+		   block. If not, we're going to have to fold out-of-place
+		   anyway.
 		*/
 		for (block = 0; block < nftl->EraseSize / 512 ; block++) {
 			if (BlockLastState[block] != SECTOR_FREE &&
+			    BlockMap[block] != BLOCK_NIL &&
 			    BlockMap[block] != targetEUN) {
 				DEBUG(MTD_DEBUG_LEVEL1, "Setting inplace to 0. VUC %d, "
 				      "block %d was %x lastEUN, "


> Cannot fold Virtual Unit Chain 194 in place. Trying out-of-place

Regardless of the above bug, dying here is not acceptable though. 
Change the 'int silly = -1;' in NFTL_findfreeblock() to
	int silly = nftl->nb_blocks;

Dunno why it wasn't like that before.


--
dwmw2
