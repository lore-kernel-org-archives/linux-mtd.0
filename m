Received: from dsl-crow-209-5-162-130-cgy.nucleus.com ([209.5.162.130]
	helo=ray.lehtiniemi.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5Srx-0007mT-9j
	for linux-mtd@lists.infradead.org; Sun, 27 Feb 2005 13:10:18 -0500
Date: Sun, 27 Feb 2005 11:10:12 -0700
From: Ray Lehtiniemi <rayl@mail.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050227181012.GA15280@mail.com>
References: <1109444967.4688.19.camel@sauron.oktetlabs.ru>
	<422141F8.7050707@voxware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <422141F8.7050707@voxware.com>
Subject: Re: [BUGFIX] JFFS2 NOR problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 26, 2005 at 10:43:52PM -0500, Craig A. Vanderborgh wrote:
> Artem B. Bityuckiy wrote:
> 
> >Hello,
> >
> >I've detected major JFFS2 bug and have attached the fix. The bug seems
> >to be NOR-only. I believe everybody who uses JFFS2 on top of NOR flash
> >should have this bug fixed.

> Thanks a lot for looking into this, we REALLY appreciate it and it's 
> great to be fully operational on kernel 2.6!!


i have been experiencing this bug as well, and can confirm that the
patch to move "c->flags &= ~JFFS2_SB_FLAG_MOUNTING" seems to clear up
the panic for me.


however, there are still some issues... 


if i enable CONFIG_DEBUG_SLAB, i get this message a few seconds after
the filesystem is mounted:

   VFS: Mounted root (jffs2 filesystem).
   Freeing init memory: 84K
   Initializing random number generator... Slab corruption: start=c1475924, len=24
   Redzone: 0x5a2cf071/0x5a2cf071.
   Last user: [<c00fd468>](jffs2_mark_node_obsolete+0x1300/0x1648)
   010: 6b 6b 6b 6b 03 00 00 00
   Prev obj: start=c1475900, len=24
   Redzone: 0x170fc2a5/0x170fc2a5.
   Last user: [<c0102ac4>](jffs2_scan_make_ino_cache+0x34/0x7c)
   000: 00 00 00 00 34 be 47 c1 fc 68 47 c1 a1 00 00 00
   010: 01 00 00 00 03 00 00 00
   Next obj: start=c1475948, len=24
   Redzone: 0x170fc2a5/0x170fc2a5.
   Last user: [<c0102ac4>](jffs2_scan_make_ino_cache+0x34/0x7c)
   000: 00 00 00 00 7c be 47 c1 ec 65 47 c1 9f 00 00 00
   010: 01 00 00 00 03 00 00 00
   done.
   Starting network...

the boot process then appears to continue normally.



i had seen this message before applying the patch as well. i was able to
reproduce it as follows:

prior to trying this patch, i had determined that the panic occurred
while mounting a virgin (never-been-mounted) jffs2 root filesystem
while CONFIG_DEBUG_SLAB=y. if CONFIG_DEBUG_SLAB=n, the mount just
appeared to "work"... and then if i re-enabled slab debugging and
mounted the non-virgin jffs2 root, i would then see the above-mentioned
slab corruption message.

after applying the patch, i now proceed directly to the slab corruption
message, virgin fs or not.





i am running on a cirrus ep9302-based EDB9302 board. it has a non-intel
clone device on it, marked MT28F128J3:

   physmap flash device: 1000000 at 60000000
   phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
    Intel/Sharp Extended Query Table at 0x0031
   Using buffer write method
   cfi_cmdset_0001: Erase suspend on write enabled



my kernel is:

  - newest linux-cirrus bk tree
    - this tree is synced to linux-2.6.11-rc3
    - so it should contain russell's 2.6.11-rc1 pud_t slab corruption fix

  - mtd-snapshot-20050225.tar.bz2 has been applied using 'patchin.sh -j -c'

  - CONFIG_JFFS2_FS_DEBUG=1 (but i didn't see any extra output...)



my userspace is a 2005-02-26 svn checkout of buildroot,  using busybox
and uClibc snapshots.  my toolchain is also from buildroot, consisting
of binutils-2.15.91.0.2 and gcc-3.4.2. i replaced the standard mtd
download from debian with the mtd snapshot from linux.org.uk.



please let me know if i can provide any more info.



thanks

-- 
----------------------------------------------------------------------
     Ray L   <rayl@mail.com>
