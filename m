Received: from law11-f13.law11.hotmail.com ([64.4.17.13] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19wirv-000799-KA
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2003 14:49:19 +0100
From: "J B" <mad_flasher@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 09 Sep 2003 08:48:09 -0500
Mime-Version: 1.0
Message-ID: <Law11-F13qq7KWfrkc000015f6b@hotmail.com>
Content-Type: text/plain; format=flowed
Subject: jffs2 and small eraseblocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A jffs2 internals question for the masses:

Besides the 128Kb max kmalloc issue, is there any restriction on the size of
an eraseblock that jffs2 can use?

I am using the slram driver with a 4Kb eraseblock size to create a 4Mb ram
device.  I mount jffs2 on top of this and everything appears to work until
the filesystem becomes full.  I try removing a file and the remove command
returns "rm: cannot unlink `foo' : No space left on device".  df reports
100% usage.

Also, looking at the output from having CONFIG_JFFS2_FS_DEBUG=1, it appears
that garbage collection is constantly running and picking blocks from the
clean list because there are none on the dirty list.  Eventually even this
fails and the garbage collector loops and complains repeatedly:

"Argh. No free space left for GC.  nr_erasing_blocks is 0.  nr_free_blocks
is 0. (erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28"

The thread_should_wake is returning 1 because the dirty size is > an
eraseblock, so it loops forever.

If I switch the eraseblock size in slram back to 64Kb, this problem does not
appear.  So again, are there any restricitons on how small of an eraseblock
size you can use, or is this something that hasn't ever really been an
issue?

TIA,
j

_________________________________________________________________
Need more e-mail storage? Get 10MB with Hotmail Extra Storage.   
http://join.msn.com/?PAGE=features/es
