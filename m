From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Alexander Belyakov'" <abelyako@googlemail.com>,
	<linux-mtd@lists.infradead.org>
References: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
Subject: RE: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
Date: Fri, 29 Jun 2007 18:05:14 +0900
Message-ID: <001201c7ba2c$aa54a5b0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-reply-to: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

After this patch, I can't delete the existing files. So we can't operation
anymore.

How about to reserve the one more block to GC for this case?

Thank you,
Kyungmin Park

Another side effect is it doesn't oops after fullness 100% :)
Raw node at 0x007a0000 wasn't in node lists for ino #77165
kernel BUG at fs/jffs2/gc.c:517!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c78dc000
[00000000] *pgd=8787d031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x20/0x2c
LR is at preempt_schedule+0x40/0x50
pc : [<c0025aec>]    lr : [<c020c4bc>]    Not tainted
sp : c7df5c04  ip : c7df5b68  fp : c7df5c10
r10: c5c51080  r9 : c078cc00  r8 : 00000000
r7 : 00000000  r6 : 00000000  r5 : c7fe8c88  r4 : 00000000
r3 : 00000000  r2 : c7df4000  r1 : 00000001  r0 : 00000024
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C5387F
Table: 878DC000  DAC: 00000015
Backtrace:
[<c0025acc>] (__bug+0x0/0x2c) from [<c011670c>] (jffs2_garbage_collect_live+0x1)
[<c01155a0>] (jffs2_garbage_collect_live+0x0/0x1198) from [<c0116e78>] (jffs2_g)
[<c0116738>] (jffs2_garbage_collect_pass+0x0/0x810) from [<c0110e98>] (jffs2_re)
[<c0110d38>] (jffs2_reserve_space+0x0/0x240) from [<c0118508>] (jffs2_do_setatt)
[<c0118304>] (jffs2_do_setattr+0x0/0x6f0) from [<c0118a08>] (jffs2_setattr+0x14)
[<c01189f4>] (jffs2_setattr+0x0/0x18) from [<c0098b10>] (notify_change+0x128/0x)
[<c00989e8>] (notify_change+0x0/0x1d8) from [<c00811b8>] (do_truncate+0x5c/0x7c)
[<c008115c>] (do_truncate+0x0/0x7c) from [<c0081384>] (do_sys_truncate+0x1ac/0x)
 r5 = 00000000  r4 = 00000000
[<c00811d8>] (do_sys_truncate+0x0/0x1e0) from [<c0081580>] (sys_truncate64+0x10)
[<c0081570>] (sys_truncate64+0x0/0x14) from [<c0021e00>] (ret_fast_syscall+0x0/)
Code: e1a01000 e59f000c eb005801 e3a03000 (e5833000)

The following is my scenario.

1. After filling jffs2 partition, I got the following message.
"Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks )
jffs2_reserve_space_gc of 43 bytes for garbage_collect_dirent failed: -28"

/mnt # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock2            2048      1764       284  87% /mnt
/mnt # ls
041111  t

2. Try to delete ones,
/mnt # rm -rf 041111/
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is 0. ()
jffs2_reserve_space_gc of 43 bytes for garbage_collect_dirent failed: -28
rm: unable to remove `041111/wearlevArgh. No free space left for GC. nr_erasing)
el.1000': No space left on devicjffs2_reserve_space_gc of 43 bytes for garbage_8
...snip...

3. Try again after umount & mount
/ # umount /mnt
/ # mount -t jffs2 /dev/mtdblock2 /mnt
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_bloc)
No space for garbage collection. Aborting GC thread

/mnt # rm -rf 041111/
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is 0. ()
jffs2_reserve_space_gc of 43 bytes for garbage_collect_dirent failed: -28
rm: unable to remove `041111/wearlevArgh. No free space left for GC. nr_erasing)
el.1000': No space left on devicjffs2_reserve_space_gc of 43 bytes for garbage_8
e
rm: unable to remove `041111/weaArgh. No free space left for GC. nr_erasing_blo)
rlevel.1010': No space left on djffs2_reserve_space_gc of 43 bytes for garbage_8
evice
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is 0. ()
rm: unable to remove `041111/weajffs2_reserve_space_gc of 43 bytes for garbage_8
rlevel.1020': No space left on dArgh. No free space left for GC. nr_erasing_blo)
evice

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Alexander Belyakov
> Sent: Friday, June 29, 2007 3:25 PM
> To: linux-mtd@lists.infradead.org
> Subject: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
> 
> I've met an error when JFFS2 is unable to write data unreasonably
> returning -EIO. The scenario might be as follow:
> 
> 1. fill jffs2 partition with data (full flash condition).
> 2. unlink single file.
> 3. try to write new file.
> 
> The last step sometimes fails. It is highly reproducible especially on
> small volumes.
> 
> jffs2_do_reserve_space() sees that nr_free_blocks plus
> nr_erasing_blocks is not enough and tries to call
> jffs2_garbage_collect_pass() which calls jffs2_find_gc_block().
> jffs2_find_gc_block() falls into not empty erasable_pending_wbuf_list
> case and calls jffs2_flush_wbuf_pad(). jffs2_flush_wbuf_pad() calls
> jffs2_refile_wbuf_blocks() which tries to move blocks from
> erasable_pending_wbuf_list to erase_pending_list and (with a small
> chance) to erasable_list.
> 
> So there is a chance that eraseble_list is still empty upon
> jffs2_flush_wbuf_pad() exit. Thus jffs2_find_gc_block() fails with
> "jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are
> they all?" message.
> 
> They are at erase_pending_list at that point (and write can succeed),
> but jffs2_garbage_collect_pass() fails failing
> jffs2_do_reserve_space() and consequently write attempt.
> 
> There are several places where this bug can be fixed.
> 
> The patch below checks if erasable_list is empty. If so
> jffs2_refile_wbuf_blocks() moves at least one block to that list.
> jffs2_find_gc_block() will not fail in that case and write will
> succeed.
> 
> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
> ---
> diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> --- a/fs/jffs2/wbuf.c	2007-05-25 01:22:47.000000000 +0400
> +++ b/fs/jffs2/wbuf.c	2007-06-20 18:45:09.000000000 +0400
> @@ -117,7 +117,7 @@
> 
>  		D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from
> erasable_pending_wbuf_list...\n", jeb->offset));
>  		list_del(this);
> -		if ((jiffies + (n++)) & 127) {
> +		if (((jiffies + (n++)) & 127) && !list_empty(&c->erasable_list))
> {
>  			/* Most of the time, we just erase it immediately.
> Otherwise we
>  			   spend ages scanning it on mount, etc. */
>  			D1(printk(KERN_DEBUG "...and adding to
> erase_pending_list\n"));
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
