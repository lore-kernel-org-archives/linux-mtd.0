Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIQ7x-0004O8-67
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 08:24:54 -0400
Date: Thu, 22 Sep 2005 14:20:52 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050922122052.GB4548@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New subject, removed reference to old mail.  I guess we agree that
this is completely independent of EBH and the first person who tries
to bring EBH back into this thread will have to do 20 pushups.  Right?

On Thu, 22 September 2005 15:47:06 +0400, Artem B. Bityutskiy wrote:
>
> Well, this was discussed... But I still don't see any conclusion. My
> opinion is below.
> 
> Terms:
> 1. New JFFS2 - recent JFFS2 where 1:1 was added.
> 2. Old JFFS2 - older JFFS2, before 1:1 was added.
> 3. New JFFS2 image - an image made for new JFFS2.
> 4. Old JFFS2 image - an image made for old JFFS2.
> 
> Q: are there any issues when an old JFFS2 image is mounted by new JFFS2
> code?
> A: yes, there are. Old JFFS2 did eraseblock concatenations and worked
> with virtual eraseblocks. So, there are nodes which cross the eraseblock
> boundary.

You're giving it an interesting spin.  The above was correct for very
few people only.  Everyone I know about didn't have virtual blocks.  A
few people would have had virtual blocks and protected themselves
against it by setting the MTD_NO_VIRTBLOCKS flag.

Your concern to the remaining people - if there are any - is
honorable.  But I am concerned about the vast majority as well.
*Everyone* would suffer an incompatible update.  *Everyone* would
suffer complicated code to detect old 1:m mapping in terms of code
size, bugs, etc.

Last, those few - if any - who would be in danger from an update are
in danger already.  The need for virtual blocks depends on subtle
things like processor type, code used, resizing of JFFS2 partitions,
etc.  People could have lost data already.

So this is effectively a trade-off.  How much do we inconvenience the
minory?  How much do we inconvenience everyone?  And how do we warn
the minority about the danger they are in?

> Q: why is this a problem?
> A: because with 1:1 mapping we will have nodes which cross the
> eraseblock boundary. JFFS2 will suffer hard.
> 
> Q: what to do?
> A: either handle this or reject mounting old images in New JFFS2.

Or we tell users very clearly about the problem.  In a way they can't
ignore.  Proposed patch below.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra

--- linux-2.6.12-rc4logfs/fs/Kconfig~warn_users	2005-05-12 06:38:11.000000000 +0200
+++ linux-2.6.12-rc4logfs/fs/Kconfig	2005-09-22 14:10:54.000000000 +0200
@@ -1033,10 +1033,28 @@ config JFFS_PROC_FS
 	  Enabling this option will cause statistics from mounted JFFS file systems
 	  to be made available to the user in the /proc/fs/jffs/ directory.
 
+config JFFS2_FS_CORRUPTION_WARNING
+	bool "Yes, I have read the warning about a possible JFFS2 corruption"
+	default n
+	help
+	  An old version of JFFS2 introduced the concept of virtual blocks.
+	  Close analysis of that feature showed that virtual block change
+	  the on-flash structure of JFFS2 in a way that can cause data
+	  corruption and data loss if mounted with different virtual block
+	  sizes (or no virtual blocks) later.
+	  If you want to mount old JFFS2 images, you should read the complete
+	  mail threads below before answering yes - better be safe than sorry.
+
+	  http://lists.infradead.org/pipermail/linux-mtd/2005-August/013498.html
+	  http://lists.infradead.org/pipermail/linux-mtd/2005-August/013465.html
+
+	  If in doubt, say n.
+
 config JFFS2_FS
 	tristate "Journalling Flash File System v2 (JFFS2) support"
 	select CRC32
 	depends on MTD
+	depends on JFFS2_FS_CORRUPTION_WARNING
 	help
 	  JFFS2 is the second generation of the Journalling Flash File System
 	  for use on diskless embedded devices. It provides improved wear
