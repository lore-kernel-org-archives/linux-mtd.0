Received: from smtp.seznam.cz ([212.80.76.43])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMUU2-0002jP-IT
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 13:24:34 -0500
Received: from ladis by orphique with local (Exim 3.36 #1 (Debian))
	id 1FMUVE-0005Ef-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2006 19:25:44 +0100
Date: Thu, 23 Mar 2006 19:25:44 +0100
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060323182544.GA19445@orphique>
References: <20060322115409.GA2242@orphique> <20060322194939.GA10058@orphique>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060322194939.GA10058@orphique>
Sender: Ladislav Michl <Ladislav.Michl@seznam.cz>
Subject: jffs2 BUG() on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 22, 2006 at 08:49:39PM +0100, Ladislav Michl wrote:
> With more debugs enabled it ends like this:
> Skipping ino #228 already checked
> Skipping ino #229 already checked
> Skipping ino #270 already checked
> Skipping check of ino #273 with nlink zero
> [lots of skipping check of ino #xxx with nlink zero]
> Skipping check of ino #800 with nlink zero
> Skipping check of ino #801 with nlink zero
> Skipping ino #802 already checked
> Skipping check of ino #803 with nlink zero
> Checked all inodes but still 0x13364c bytes of unchecked space?
> 
> Where checked_ino is 804 and highest_ino 803. ino 802 is already checked
> because userspace requested read meanwhile.

jffs2_scan_inode_node adds also inodes with zero nlink to
unchecked_space, but jffs2_garbage_collect_pass skips them. That
probably leads to above problem. After applying following patch
BUG() is no longer triggered.

Index: fs/jffs2/gc.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/gc.c,v
retrieving revision 1.159
diff -u -r1.159 gc.c
--- fs/jffs2/gc.c	18 Nov 2005 07:27:45 -0000	1.159
+++ fs/jffs2/gc.c	23 Mar 2006 17:39:00 -0000
@@ -211,12 +211,6 @@
 			continue;
 		}
 
-		if (!ic->nlink) {
-			D1(printk(KERN_DEBUG "Skipping check of ino #%d with nlink zero\n",
-				  ic->ino));
-			spin_unlock(&c->inocache_lock);
-			continue;
-		}
 		switch(ic->state) {
 		case INO_STATE_CHECKEDABSENT:
 		case INO_STATE_PRESENT:

I'm not sure what is correct solution. With this change there are lots of
JFFS2 warning: (138) jffs2_get_inode_nodes: Eep. No valid nodes for ino #465.
JFFS2 warning: (138) jffs2_do_read_inode_internal: no data nodes found for ino #465
Returned error for crccheck of ino #465. Expect badness...
warnings. Jffs2 summary feature is disabled. I'd be very gratefull for ideas.

	ladis
