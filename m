Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UamyR-00066n-Sb
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 13:03:00 +0000
Message-ID: <1368191107.26780.163.camel@sauron.fi.intel.com>
Subject: Re: UBI(FS) issues: how to debug?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Cartwright <josh.cartwright@ni.com>
Date: Fri, 10 May 2013 16:05:07 +0300
In-Reply-To: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
References: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-03-28 at 13:53 -0500, Josh Cartwright wrote:
>   [ 4551.355726] UBIFS error (pid 777): ubifs_read_node: bad node type (0 but expected 2)
>   [ 4551.363509] UBIFS error (pid 777): ubifs_read_node: bad node at LEB 4278:92920, LEB mapping status 1
>   [ 4551.373349] UBIFS warning (pid 777): ubifs_ro_mode: switched to read-only mode, error -22
>   [ 4551.381590] [<c0013f00>] (unwind_backtrace+0x0/0xec) from [<c0384d28>] (dump_stack+0x20/0x24)
>   [ 4551.390671] [<c0384d28>] (dump_stack+0x20/0x24) from [<c01bf914>] (ubifs_ro_mode+0x74/0x80)
>   [ 4551.399393] [<c01bf914>] (ubifs_ro_mode+0x74/0x80) from [<c01b6c5c>] (ubifs_jnl_update+0x444/0x470)
>   [ 4551.408781] [<c01b6c5c>] (ubifs_jnl_update+0x444/0x470) from [<c01baa80>] (ubifs_unlink+0x13c/0x1c4)
>   [ 4551.418243] [<c01baa80>] (ubifs_unlink+0x13c/0x1c4) from [<c00d9ed0>] (vfs_unlink+0x74/0xf4)
>   [ 4551.427031] [<c00d9ed0>] (vfs_unlink+0x74/0xf4) from [<c00db9b8>] (do_unlinkat+0xb8/0x144)
>   [ 4551.435340] [<c00db9b8>] (do_unlinkat+0xb8/0x144) from [<c00dd020>] (sys_unlink+0x20/0x24)
>   [ 4551.444018] [<c00dd020>] (sys_unlink+0x20/0x24) from [<c000ddc0>] (ret_fast_syscall+0x0/0x48)
>   [ 4556.446694] UBIFS error (pid 352): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
>      ... plus many more failures with -EROFS
> 
> We've also seen this error shortly after userspace boots up:
> 
>   [  113.841633] UBIFS error (pid 1065): ubifs_read_node: bad node type (255 but expected 6)
>   [  113.855771] UBIFS error (pid 1065): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 0
> 
> (Side question, but presumably UBIFS makes special use of LEB 0:0 ?)

The errors look like somehow the contents of your flash gets corrupted.
LEB 0:0 is where we store the superblock. It is mostly read-only and we
usually do not modify it.

> Things we've done for testing so far:
>    - mtdtests, we've run the full test suite; currently sacrificing two
>      boards for the mtd_torturetest at room temp
>    - Weeks of aggregate automated power-cycle testing, at both room temp
>      and in a temp chamber at -40C, as mentioned above
> 
> My questions are:
>    - Where should we go from here?  Are there tools we're missing that
>      might help us stress UBIFS/UBI/the NAND controller driver/the NAND
>      chip itself in the hopes of reproducing the above issues?

Not sure. You can try enabling the UBI and UBIFS self-checking features,
there are plenty of them.

-- 
Best Regards,
Artem Bityutskiy
