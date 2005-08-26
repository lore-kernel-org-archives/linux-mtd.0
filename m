Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8kOl-0000kq-Ld
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 16:02:05 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <430F09E5.10607@inf.u-szeged.hu>
References: <1124840186.7086.19.camel@localhost.localdomain>
	<430F09E5.10607@inf.u-szeged.hu>
Content-Type: text/plain
Date: Fri, 26 Aug 2005 14:01:34 -0600
Message-Id: <1125086494.18847.17.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Fri, 2005-08-26 at 14:24 +0200, Ferenc Havasi wrote:
> Is this problem still present at you?

Yes.

> Something very strange happened here. All of the relevant lists are
> empty, there is an unknow (?) node that is REF_UNCHECKED.
> 
> Did you try which earlier snapshot works correctly? It can be a good
> starting point where the problem is. 2005-07-30? 2005-08-01? 2005-08-05?

I have not yet had a chance to figure out when this broke. If I had to
guess, I would say that the problem has something to do with the new
frag tree stuff. I was hoping that Artem might just know what is
happening.

I will try to find some time next week to do this search to figure out
when the breakage occurred.

> You also may attach some more from the log...

There was no more to the log. At debug level 2, there are lots of
messages like this at mount time:

  jffs_check_nand_cleanmarker returned 0
  jffs2_check_oob_empty returned 0

But those are not very interesting. I did omit some of the CPU-specific
stuff from the kernel oops printout. Here is the complete trace again:

# flash_eraseall -jq /dev/mtd3
# mount /mnt/mtdb3/
# touch /mnt/mtdb3/foo
# jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
jffs2: Couldn't find erase block to garbage collect!

# umount /mnt/mtdb3
# mount /mnt/mtdb3
# kernel BUG in read_unknown at fs/jffs2/readinode.c:353!
Oops: Exception in kernel mode, sig: 5 [#1]
PREEMPT
NIP: C00ADDA8 LR: C00AD804 SP: C0633E10 REGS: c0633d60 TRAP: 0700    Not
tainted
MSR: 00029030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c03303f0[83] 'jffs2_gcd_mtd3' THREAD: c0632000
Last syscall: -1
GPR00: 00000001 C0633E10 C03303F0 00000000 0003FF80 0000000B 00000000
00000800
GPR08: 00000800 00000000 00000000 00000000 24008048 00000000 00000000
00000000
GPR16: C0633E20 C0633E24 00000000 00000000 C01D1E0C C0452000 00000000
00000000
GPR24: C0633E90 C0615400 C0656434 C01D7000 C01D1E00 C0632000 00000000
C0452000
NIP [c00adda8] jffs2_do_read_inode_internal+0x71c/0x1084
LR [c00ad804] jffs2_do_read_inode_internal+0x178/0x1084
Call trace:
 [c00ae780] jffs2_do_crccheck_inode+0x70/0xcc
 [c00b32f0] jffs2_garbage_collect_pass+0x27c/0xa78
 [c00b5558] jffs2_garbage_collect_thread+0x1a0/0x1f4
 [c0004f6c] kernel_thread+0x44/0x60

Pete
