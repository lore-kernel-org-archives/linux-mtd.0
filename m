Received: from alya.utu.fi ([130.232.202.242])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y6c8-0007Na-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 14:30:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by alya.utu.fi (Postfix) with ESMTP id 6E31C1B24B
	for <linux-mtd@lists.infradead.org>; Tue,  5 Feb 2002 16:41:37 +0200 (EET)
Date: Tue, 5 Feb 2002 16:41:37 +0200 (EET)
From: =?ISO-8859-1?Q?Veli-Pekka_Yl=F6nen?= <velpeyl@utu.fi>
To: <linux-mtd@lists.infradead.org>
Subject: NAND flash and JFFS(2)
Message-ID: <Pine.SOL.4.30.0202051629570.28565-100000@alya.utu.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I read TODO file in JFFS2 sources and found this:

- NAND flash support:
    - Fix locking in jffs2_garbage_collect_deletion_dirent().
    - Move CLEANMARKER into the 'spare' area.
    - Write batching - build up a NAND-page worth of data and write out all in
	one go, using the hardware ECC or block-based software ECC. This gives us
	some interesting problems, but it's not that bad:
    - When we go to erase a block from which we've been garbage-collecting,
	  we have to make sure that the nodes in it _really_ are obsolete, and
	  the new node which finally obsoletes the block we want to erase isn't
	  still waiting in the write-buffer. We can do this by sticking such
	  blocks not on the erase_pending_list, but on a new erase_pending_wbuf
	  list, and then moving them to the erase_pending_list when the buffer is
	  flushed.
        - fsync() becomes a non-NOP.
	- Deal with write errors. Data don't get lost - we just have to write
	  the affected node(s) out again somewhere else.



Is somebody already working on this?

I read also in the archive that JFFS should support NAND. Is this true?
I have made the raw NAND interface work but JFFS and JFFS2 doesn't
do the batching and tries to write multiple times to same
page.
