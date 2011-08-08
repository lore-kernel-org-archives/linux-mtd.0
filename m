Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqLEP-0001xD-Ht
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 08:30:42 +0000
Date: Mon, 8 Aug 2011 10:31:07 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110808083107.GN26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 6 August 2011 19:39:42 +0530, srimugunthan dhandapani wrote:
> 
> Thanks. I tested your patch with nandsim and i was able to unmount
> without any problems.

Good.

> I did some more tests on  logfs with nandsim. I ran into some crashes
> when i used bonnie and tiobench.
>  Following are the steps i followed with bonnie. Also kernel messages
> are below that.
> 
>  1. sudo modprobe mtdblock
>  2. sudo modprobe nandsim
>  3. sudo modprobe zlib_deflate
>  4. sudo insmod logfs/logfs.ko
>  5. sudo flash_eraseall /dev/mtd0
>  6. sudo logfsprogs/mklogfs /dev/mtdblock0
>  7. sudo mount -t logfs /dev/mtdblock0 /mnt/flash_drive/
>  8. sudo chown srimugunthan /mnt/flash_drive/
>  9. bonnie -d /mnt/flash_drive/ -s 100 -r 50
> 
>  kernel oops with bonnie
>  ( A different kind of crash happened with tiobench  command
> ./tiobench.pl --dir /mnt/flash_drive/ --size 25 --threads 4)

Not good.  So far I managed to see a (the?) tiobench bug once, but
couldn't make it reproduceable.  Nor could I reproduce the bonnie bug.
Once the bugs are reproduceable, even my feeble eyes can usually spot
the cause sooner or later.  With a backtrace alone and no idea what
internal state it depends on, life is much harder.

Just in case this depends on device size or erase size, can you send
me the mklogfs output?

>  do_invalidatepage+0x28/0x30
>  truncate_inode_page+0x92/0xb0
>  truncate_inode_pages_range+0x177/0x4f0
>  truncate_inode_pages+0x15/0x20
>  truncate_pagecache+0x4f/0x70
>  truncate_setsize+0x1f/0x30
>  vmtruncate+0x3e/0x60
>  logfs_truncate+0x263/0x2a0 [logfs]
>  logfs_evict_inode+0xdc/0x1d0 [logfs]
>  ?  do_raw_spin_unlock+0x5e/0xb0
>  evict+0xa9/0x1a0
>  iput+0xfd/0x200
>  dentry_iput+0x98/0xe0
>  dput+0x19e/0x2a0
>  fput+0x182/0x230
>  filp_close+0x66/0xa0
>  sys_close+0xb9/0x120
>  system_call_fastpath+0x16/0x1b

We still had a struct logfs_block with some reserved bytes attached to
the page when logfs called into vmtruncate.  I'll see whether that
makes any sense at all.  At the very least, some more documentation
would be in order.

Jörn

-- 
"[One] doesn't need to know [...] how to cause a headache in order
to take an aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
