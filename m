Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8dEw-0003bT-B5
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 08:23:26 -0400
Message-ID: <430F09E5.10607@inf.u-szeged.hu>
Date: Fri, 26 Aug 2005 14:24:05 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Peter Grayson <pgrayson@realmsys.com>
References: <1124840186.7086.19.camel@localhost.localdomain>
In-Reply-To: <1124840186.7086.19.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Latest jffs2 broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pete,

Peter Grayson wrote:

>This is fully reproducible for me. I am running the latest mtd cvs (as
>of 8/23/2005) on a 2.6.10 kernel. I am using a 32MB partition for this
>test, but it is not obvious that the partition size matters. My nand
>part has a 2048-byte page size and 128 kB eraseblock size.
>
>---- Debug output below ----
>
># flash_eraseall -jq /dev/mtd3
># mount /mnt/mtdb3
># touch /mnt/mtdb3/foo
>jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
>all?
>jffs2: Couldn't find erase block to garbage collect!
># umount /mnt/mtdb3
># mount /mnt/mtdb3
>kernel BUG in read_unknown at fs/jffs2/readinode.c:353!
>Oops: Exception in kernel mode, sig: 5 [#1]
>TASK = c0601190[74] 'jffs2_gcd_mtd3' THREAD: c044c000
>Last syscall: -1
>NIP [c00ad818] jffs2_do_read_inode_internal+0x804/0x1220
>LR [c00ad1f4] jffs2_do_read_inode_internal+0x1e0/0x1220
>Call trace:
> [c00ae2a4] jffs2_do_crccheck_inode+0x70/0xcc
> [c00b2de4] jffs2_garbage_collect_pass+0x284/0xa80
> [c00b4fc8] jffs2_garbage_collect_thread+0x1a0/0x1f4
> [c0004f6c] kernel_thread+0x44/0x60
>  
>
Is this problem still present at you?

Something very strange happened here. All of the relevant lists are
empty, there is an unknow (?) node that is REF_UNCHECKED.

Did you try which earlier snapshot works correctly? It can be a good
starting point where the problem is. 2005-07-30? 2005-08-01? 2005-08-05?

You also may attach some more from the log...

Bye,
Ferenc
