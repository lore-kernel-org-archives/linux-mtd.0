Received: from dbudemr1.dadebehring.com ([195.127.249.28]
	helo=dadebehring.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8GsE-0000ZI-RH
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2004 11:53:38 +0100
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-ID: <OF00A6CB1C.1181C429-ONC1256E67.003B93D3-C1256E67.003BCC89@dadebehring.com>
From: Richard_Theil@dadebehring.com
Date: Tue, 30 Mar 2004 12:55:06 +0200
Content-Type: text/plain; charset="us-ascii"
Subject: JFFS2 not honouring MS_RDONLY flag on mount?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Try 2, hopefully _without_ html section this time) Hello everyone!

We're using JFFS2 on a custom MPC8250 board (with 8 or 32 MB Flash) and
the experience has been pleasant so far (*). I am in the process of 
migrating our
suite to Kernel 2.6 and ran into a (little) problem with the mounting of 
the root
(mtd) partition. I want to mount it read-only, so we can reliably detect 
whether
the original image is still in flash, and only enable writing for testing 
or possible
updates.

Although the mount flags are set to 0x8001 (MS_VERBOSE | MS_RDONLY),
jffs2 mounts as read/write. I have put a few printk's in, so you can see 
what
happens:

...
do_kern_mount(sysfs,0x00000000,sysfs,0x00000000)
mount_root creating /dev/root as mtdblock2
mount_block_root: fs jffs2
do_kern_mount(jffs2,0x00008001,/dev/root,0x00000000)
jffs2_get_sb(..,0x00008001,/dev/root,0x00000000)
do_mount_root(/dev/root,jffs2,0x    8001,data) -> 0
VFS: Mounted root (jffs2 filesystem).
init started:  BusyBox v1.00
...

Now. according to the flags, init/do_mounts.c:do_mount_root() should say
"VFS: ... readonly" as a first indicator.

It seems that somewhere on the path into jffs2_get_sb_mtd(), the flags 
passed
as parameter _should_ be honoured, but are not. This would have to happen
before jffs2_do_fill_super is called, because in there, the collector 
thread is
started if the fs is flagged r/w. Wouldn't it be appropriate to have a 
line like
in jffs2_remount_fs:

sb->s_flags = (sb->s_flags & ~MS_RDONLY)|(*flags & MS_RDONLY);

after "sb->s_op = &jffs2_super_operations;" in jffs2_get_sb_mtd? While at 
that,
it might be appropriate to apply the MS_VERBOSE flag to sb->s_flags as 
well
(jffs2_do_fill_super doesn't use its 'silent' parameter, btw).

Or did I miss something where that rdonly stuff should happen at a larger
scope and it's broken for some other reason?

All work is being done on stock 2.6.3, but I cross-checked against 
CVS-snapshot.

Rich

(*) Well, I had to find out the "rootfstype" thing the hard way...
