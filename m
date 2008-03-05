Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWzW0-00022f-Um
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 19:43:01 +0000
Date: Wed, 5 Mar 2008 20:42:45 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: linux-mtd@lists.infradead.org
Subject: Sleeping while atomic on a RO JFFS2 partition.
Message-ID: <20080305194245.GA15584@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, I'm sorry to CC you again.

My flash partition was marked RO in the partition table and got probably
RW mounted somehow. However I get
|VFS: Mounted root (jffs2 filesystem) readonly.
So I should not be able to write anyway. This is maybe another BUG I try
to look after later. Anyway, the backtrace I got is:

|jffs2_flush_wbuf(): Write failed with -30
|BUG: sleeping function called from invalid context at /home/bigeasy/linux-2.6/include/linux/writeback.h:79
|in_atomic():1, irqs_disabled():0
|Call Trace:
|[df8b3d80] [c0006c24] show_stack+0x48/0x184 (unreliable)
|[df8b3da0] [c001d8b4] __might_sleep+0xc0/0xd4
|[df8b3db0] [c008d650] ifind_fast+0x60/0xa8
|[df8b3dd0] [c008da68] iget_locked+0x3c/0x140
|[df8b3e00] [c011430c] jffs2_iget+0x14/0x39c
|[df8b3e70] [c01151f0] jffs2_gc_fetch_inode+0xcc/0x124
|[df8b3eb0] [c0116a90] __jffs2_flush_wbuf+0x744/0xc10
|[df8b3f00] [c011778c] jffs2_flush_wbuf_gc+0x128/0x1bc
|[df8b3f20] [c01142e4] jffs2_write_super+0x48/0x5c
|[df8b3f30] [c007a14c] sync_supers+0x88/0x104
|[df8b3f40] [c0058ef8] wb_kupdate+0x38/0x138
|[df8b3f90] [c0059620] pdflush+0x108/0x1d0
|[df8b3fd0] [c003b374] kthread+0x4c/0x88
|[df8b3ff0] [c000daf8] kernel_thread+0x44/0x60
|jffs2_flush_wbuf(): Write failed with -30

jffs2_gc_fetch_inode() is called from two places. One of them is
jffs2_wbuf_recover() and that functions grabs the spinlock
c->erase_completion_lock before calling (under some condition) that
function. IMHO there should be no spinlock around or that function
should not be called at all.

To reproduce:
- mark nand JFFS2 partition RO
- in my case it is my root partition which mounted RW during the boot
  process
- later some programs are going to store some data and voila.

Sebastian
