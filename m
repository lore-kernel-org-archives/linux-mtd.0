Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Opold-0000Ns-H4
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 20:46:20 +0000
Received: by gwb10 with SMTP id 10so2182313gwb.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 13:46:16 -0700 (PDT)
Subject: Re: ubi : kernel panic on erroneous block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C61223F.30100@parrot.com>
References: <4C61223F.30100@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 23:46:08 +0300
Message-ID: <1283114768.2003.222.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthiew,

I've read both of your mails. It looks like there are several issues.
Let's try to identify them and then deal with them one by one. I think I
see one of them, you'll find the fix at the end of this e-mail.

But let me also comment on your e-mail to let you know what I think was
happening.

On Tue, 2010-08-10 at 11:56 +0200, Matthieu CASTET wrote:
> when running test with ubifs I found the following crash.
> One block is instable (some read fails with ecc error correctable or 
> not) after a power cut. This is due to interrupted write or erase.

OK

> Our test do first a read of the ubi volume (cat /dev/ubi3_0 > /dev/null) 
> to force complete read of it.

OK

> In this case ecc correctable is detected, and scrubbing is scheduled
> But ubi_eba_copy_leb: the block become uncorrectable and added to 
> erroneous list.

OK, this is fine and expected behavior.

> When mounting ubifs read doesn't check that it is erroneous and return data.
> It is added again for scrubbing, but prot_queue_del crash because we 
> already remove it in the first scrubbing try.
> 
> Here an attempt to fix the problem. This is ugly. I didn't try it yet. I 
>   erased my corrupted flash by accident.
> 
> One other solution could be to add the test in ubi_wl_scrub_peb, but I 
> don't think it is ok to return data on erroneous block.
> 
> An other solution could be to unmap the block (read will return 0xff), 
> but this may break upper layer ?

Err, I think the bug is actually very simple - when I introduced the
erroneous list, I just forgot to add a check in 'ubi_wl_scrub_peb()'.

> [    6.613769] UBI DBG (pid 266): ubi_scan: scanning is finished
> [    6.627283] UBI: attached mtd3 to ubi3
> [    6.630876] UBI: MTD device name:            "P6system"
> [    6.636130] UBI: MTD device size:            32 MiB
> [    6.640948] UBI: number of good PEBs:        256
> [    6.645567] UBI: number of bad PEBs:         0
> [    6.649979] UBI: max. allowed volumes:       128
> [    6.654591] UBI: wear-leveling threshold:    4096
> [    6.659274] UBI: number of internal volumes: 1
> [    6.663701] UBI: number of user volumes:     1
> [    6.668138] UBI: available PEBs:             0
> [    6.672559] UBI: total number of reserved PEBs: 256
> [    6.677433] UBI: number of PEBs reserved for bad PEB handling: 2
> [    6.683416] UBI: max/mean erase counter: 3717/3558
> [    6.688201] UBI: image sequence number: 1403635655
> [    6.693008] UBI: background thread "ubi_bgt3d" started, PID 269
> UBI device number 3, total 256 LEBs (32505856 bytes, 31.0 MiB), 
> available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
> 
> ----> cat /dev/ubi3_0 > /dev/null

OK, you are reading whole UBI.

> [    6.908524] BA315_STATUS_DEC_ERR : 0 4 on 24525
> [    6.912907] ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [    6.931062] UBI DBG (pid 272): ubi_io_read: fixable bit-flip detected 
> at PEB 189
> [    6.938448] UBI DBG (pid 272): ubi_wl_scrub_peb: schedule PEB 189 for 
> scrubbing

OK, a fixable I/O error happens, and this PEB is scheduled for
scrubbing. So far so good.

> [    6.947677] BA315_STATUS_DEC_ERR : 512 4 on 24525
> [    6.952226] ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [    6.976651] UBI error: ubi_io_read: error -74 while reading 126976 
> bytes from PEB 189:4096, read 126976 bytes

OK. While scrubbing, we have a hard error, and UBI reports about it. As
you described, we are dealing with an unstable NAND page which sometimes
may be read with no errors, sometimes with a correctable ECC error,
sometimes with an uncorrectable ECC error.

> [    6.986429] [<c00279f0>] (dump_stack+0x0/0x14) from [<c0160fa8>] 
> (ubi_io_read+0xf0/0x258)
> [    6.994594] [<c0160eb8>] (ubi_io_read+0x0/0x258) from [<c01607e8>] 
> (ubi_eba_copy_leb+0x204/0x58c)
> [    7.003434] [<c01605e4>] (ubi_eba_copy_leb+0x0/0x58c) from 
> [<c01638e8>] (wear_leveling_worker+0x2e4/0x630)
> [    7.013074] [<c0163604>] (wear_leveling_worker+0x0/0x630) from 
> [<c0162b0c>] (do_work+0x94/0xe8)
> [    7.021758] [<c0162a78>] (do_work+0x0/0xe8) from [<c0163cc4>] 
> (ubi_thread+0x90/0x118)
> [    7.029576]  r7:c789bc50 r6:00000000 r5:c7848000 r4:c789b800
> [    7.035222] [<c0163c34>] (ubi_thread+0x0/0x118) from [<c0047204>] 
> (kthread+0x50/0x7c)
> [    7.043036] [<c00471b4>] (kthread+0x0/0x7c) from [<c00360e8>] 
> (do_exit+0x0/0x6ac)
> [    7.050505]  r5:00000000 r4:00000000

You have debugging enable, so you are enjoins extra UBI prints, but they
are useful :-) 

> [    7.054071] UBI warning: ubi_eba_copy_leb: error -74 while reading 
> data from PEB 189

The WL code warns that we cannot read the LEB, this is OK. So far so
good.

> ----> mounting ubifs on /dev/ubi3_0

[snip]

> [   10.467210] UBI error: ubi_io_read: error -74 while reading 126976 
> bytes from PEB 189:4096, read 126976 bytes

OK, we are now mounting UBIFS, which reads the LEB which is mapped to
the faulty PEB 189, which is currently sitting in the 'erroneous' list
in UBI, which is kind of logical.

Also note, most of PEBs which were write-interrupted will belong to the
UBIFS journal. There is another case, as you already identified in your
previous mail, the PEBs which were WL-copied in UBI. But let's
concentrate on your case.

The UBIFS journal scanning code expects -EBADMSG errors, and is designed
to handle them.

> [   10.477007] [<c00279f0>] (dump_stack+0x0/0x14) from [<c0160fa8>] 
> (ubi_io_read+0xf0/0x258)
> [   10.485144] [<c0160eb8>] (ubi_io_read+0x0/0x258) from [<c016035c>] 
> (ubi_eba_read_leb+0x1a0/0x428)
> [   10.494005] [<c01601bc>] (ubi_eba_read_leb+0x0/0x428) from 
> [<c015e3c0>] (ubi_leb_read+0xe8/0x138)
> [   10.502859] [<c015e2d8>] (ubi_leb_read+0x0/0x138) from [<c00d6918>] 
> (ubifs_start_scan+0x7c/0xf4)
> [   10.511633]  r7:c79f3000 r6:00000000 r5:c798b8e0 r4:00000000
> [   10.517276] [<c00d689c>] (ubifs_start_scan+0x0/0xf4) from 
> [<c00d6b4c>] (ubifs_scan+0x2c/0x298)
> [   10.525878]  r8:00000003 r7:c79f3000 r6:00000000 r5:c8d01000 r4:0001f000
> [   10.532560] [<c00d6b20>] (ubifs_scan+0x0/0x298) from [<c00d71dc>] 
> (ubifs_replay_journal+0x14c/0x13a4)
> [   10.541769] [<c00d7090>] (ubifs_replay_journal+0x0/0x13a4) from 
> [<c00cdd68>] (ubifs_fill_super+0xb84/0x1054)
> [   10.551580] [<c00cd1e4>] (ubifs_fill_super+0x0/0x1054) from 
> [<c00ced04>] (ubifs_get_sb+0xc4/0x2ac)
> [   10.560525] [<c00cec40>] (ubifs_get_sb+0x0/0x2ac) from [<c007f04c>] 
> (vfs_kern_mount+0x58/0x94)
> [   10.569124] [<c007eff4>] (vfs_kern_mount+0x0/0x94) from [<c007f0e8>] 
> (do_kern_mount+0x40/0xe8)
> [   10.577736]  r8:c79fa000 r7:c02253ec r6:00000000 r5:c78fb000 r4:00000000
> [   10.584408] [<c007f0a8>] (do_kern_mount+0x0/0xe8) from [<c0095628>] 
> (do_new_mount+0x68/0x8c)
> [   10.592833]  r8:00000000 r7:0000000a r6:c784bef0 r5:00000000 r4:c79fa000
> [   10.599519] [<c00955c0>] (do_new_mount+0x0/0x8c) from [<c00957a8>] 
> (do_mount+0x15c/0x1b8)
> [   10.607694]  r7:c79fa000 r6:c78fb000 r5:c78d9000 r4:00000404
> [   10.613327] [<c009564c>] (do_mount+0x0/0x1b8) from [<c0095890>] 
> (sys_mount+0x8c/0xd4)
> [   10.621144] [<c0095804>] (sys_mount+0x0/0xd4) from [<c0023c00>] 
> (ret_fast_syscall+0x0/0x2c)

OK, this gives us additional info about where we are. 

> [   10.629483]  r7:00000015 r6:00008840 r5:00000000 r4:00000000
> [   10.638307] BA315_STATUS_DEC_ERR : 0 4 on 24525
> [   10.642677] ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   10.667078] UBI DBG (pid 273): ubi_io_read: fixable bit-flip detected 
> at PEB 189

Because of inlining, your stack-dump lacks some function calls. I think
it was: ubifs_replay_journal() -> replay_log_leb() -> ubifs_scan()
-> ... Then we had -EBADMSG, and returned back to 'replay_log_leb()'.
Then we call 'ubifs_recover_log_leb()', which scans the LEB again.

Yes, this is sub-optimal to scan twice, but this is how the thing is
implemented. I can try to fix it later - but this is not so important
now, let's first deal with your issues. But please, feel free to bug me
later and remind about this.

So, we are scanning for the second time. And this time we get a bit-flip
instead of -EBADMSG. 

> [   10.674321] UBI DBG (pid 273): ubi_wl_scrub_peb: schedule PEB 189 for 

And as the stack-dump below shoes, we end up here.

> scrubbing
> [   10.681652] Unable to handle kernel NULL pointer dereference at 
> virtual address 00000000
> [   10.689703] pgd = c79e4000
> [   10.692381] [00000000] *pgd=47841031, *pte=00000000, *ppte=00000000
> [   10.698639] Internal error: Oops: 817 [#1]
> [   10.702713] Modules linked in:
> [   10.705761] CPU: 0    Not tainted  (2.6.27.47-parrot-dirty #212)
> [   10.711769] PC is at prot_queue_del+0x2c/0x50
> [   10.716100] LR is at ubi_wl_scrub_peb+0xec/0x13c
> [   10.720700] pc : [<c0162430>]    lr : [<c01635b4>]    psr: a0000013
> [   10.720716] sp : c784ba70  ip : c78ff290  fp : c784ba7c
> [   10.732157] r10: 00000000  r9 : 00000003  r8 : 000000bd
> [   10.737371] r7 : c789bbcc  r6 : c789bbc0  r5 : c789b800  r4 : c78ff290
> [   10.743883] r3 : 00100100  r2 : 00000001  r1 : 00000000  r0 : ffffffed
> [   10.750398] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
> Segment user
> [   10.757519] Control: 0005317f  Table: 479e4000  DAC: 00000015
> [   10.763249] Process endurance (pid: 273, stack limit = 0xc784a268)
> [   10.769416] Stack: (0xc784ba70 to 0xc784c000)

And oops, because 'ubi_wl_scrub_peb()' is buggy and does not handle the
case when the PEB is erroneous.

[snip long hex dump of the stack]

> [   11.145022] Backtrace:
> [   11.147455] [<c0162404>] (prot_queue_del+0x0/0x50) from [<c01635b4>] 
> (ubi_wl_scrub_peb+0xec/0x13c)
> [   11.156400] [<c01634c8>] (ubi_wl_scrub_peb+0x0/0x13c) from 
> [<c01603bc>] (ubi_eba_read_leb+0x200/0x428)
> [   11.165693]  r8:000000bd r7:c73fd000 r6:c789b800 r5:c8d01000 r4:00000000
> [   11.172379] [<c01601bc>] (ubi_eba_read_leb+0x0/0x428) from 
> [<c015e3c0>] (ubi_leb_read+0xe8/0x138)
> [   11.181237] [<c015e2d8>] (ubi_leb_read+0x0/0x138) from [<c00d6918>] 
> (ubifs_start_scan+0x7c/0xf4)
> [   11.190010]  r7:c79f3000 r6:00000000 r5:c798b8e0 r4:00000000
> [   11.195654] [<c00d689c>] (ubifs_start_scan+0x0/0xf4) from 
> [<c00e3650>] (ubifs_recover_leb+0x3c/0x730)
> [   11.204861]  r8:00000003 r7:c79f3000 r6:c798b8e0 r5:c79f3000 r4:c8d01000
> [   11.211547] [<c00e3614>] (ubifs_recover_leb+0x0/0x730) from 
> [<c00e444c>] (ubifs_recover_log_leb+0xc8/0x2dc)
> [   11.221274] [<c00e4384>] (ubifs_recover_log_leb+0x0/0x2dc) from 

Yeah, I was right, it is log LEB.

> [<c00d7c20>] (ubifs_replay_journal+0xb90/0x13a4)
> [   11.231435] [<c00d7090>] (ubifs_replay_journal+0x0/0x13a4) from 
> [<c00cdd68>] (ubifs_fill_super+0xb84/0x1054)
> [   11.241249] [<c00cd1e4>] (ubifs_fill_super+0x0/0x1054) from 
> [<c00ced04>] (ubifs_get_sb+0xc4/0x2ac)
> [   11.250194] [<c00cec40>] (ubifs_get_sb+0x0/0x2ac) from [<c007f04c>] 
> (vfs_kern_mount+0x58/0x94)
> [   11.258793] [<c007eff4>] (vfs_kern_mount+0x0/0x94) from [<c007f0e8>] 
> (do_kern_mount+0x40/0xe8)
> [   11.267390]  r8:c79fa000 r7:c02253ec r6:00000000 r5:c78fb000 r4:00000000
> [   11.274077] [<c007f0a8>] (do_kern_mount+0x0/0xe8) from [<c0095628>] 
> (do_new_mount+0x68/0x8c)
> [   11.282501]  r8:00000000 r7:0000000a r6:c784bef0 r5:00000000 r4:c79fa000
> [   11.289188] [<c00955c0>] (do_new_mount+0x0/0x8c) from [<c00957a8>] 
> (do_mount+0x15c/0x1b8)
> [   11.297352]  r7:c79fa000 r6:c78fb000 r5:c78d9000 r4:00000404
> [   11.302997] [<c009564c>] (do_mount+0x0/0x1b8) from [<c0095890>] 
> (sys_mount+0x8c/0xd4)
> [   11.310813] [<c0095804>] (sys_mount+0x0/0xd4) from [<c0023c00>] 
> (ret_fast_syscall+0x0/0x2c)
> [   11.319151]  r7:00000015 r6:00008840 r5:00000000 r4:00000000
> [   11.324794] Code: 089da800 e59c1004 e59c2000 e59f3018 (e5812000)
> [   11.330924] Kernel panic - not syncing: Fatal exception

The patch at the end should fix this oops. With this patch you would not
have an oops. Instead, 'ubi_wl_scrub_peb()' would just ignore the PEB
and would just return.

Then 'ubifs_recover_leb()' would finish the scanning, collected all good
nodes, and then it would refresh this LEB (!!!) using 'ubi_leb_change()'
(see ubifs_recover_leb() -> fix_unclean_leb() -> ubi_leb_change()).

So the result would be that this faulty PEB would be scheduled for
erasure, i.e., exactly what you want.

Here is the patch. I only compile-tested it, but it looks correct and
obvious to me, and I'd even sent it to Linus for 2.6.36 inclusion, if
you'd test it or approved.

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: do not oops when erroneous PEB is scheduled for scrubbing

When an erroneous PEB is scheduling for scrubbing, we end up with the
following oops:

[<c0162404>] (prot_queue_del+0x0/0x50) from [<c01635b4>] (ubi_wl_scrub_peb+0xec/0x13c)
[<c01634c8>] (ubi_wl_scrub_peb+0x0/0x13c) from [<c01603bc>] (ubi_eba_read_leb+0x200/0x428)
[<c01601bc>] (ubi_eba_read_leb+0x0/0x428) from [<c015e3c0>] (ubi_leb_read+0xe8/0x138)
[<c015e2d8>] (ubi_leb_read+0x0/0x138) from [<c00d6918>] (ubifs_start_scan+0x7c/0xf4)
[<c00d689c>] (ubifs_start_scan+0x0/0xf4) from [<c00e3650>] (ubifs_recover_leb+0x3c/0x730)
[<c00e3614>] (ubifs_recover_leb+0x0/0x730) from [<c00e444c>] (ubifs_recover_log_leb+0xc8/0x2dc)
[<c00e4384>] (ubifs_recover_log_leb+0x0/0x2dc) from [<c00d7c20>] (ubifs_replay_journal+0xb90/0x13a4)
[<c00d7090>] (ubifs_replay_journal+0x0/0x13a4) from [<c00cdd68>] (ubifs_fill_super+0xb84/0x1054)
[<c00cd1e4>] (ubifs_fill_super+0x0/0x1054) from [<c00ced04>] (ubifs_get_sb+0xc4/0x2ac)
[<c00cec40>] (ubifs_get_sb+0x0/0x2ac) from [<c007f04c>] (vfs_kern_mount+0x58/0x94)
[<c007eff4>] (vfs_kern_mount+0x0/0x94) from [<c007f0e8>] (do_kern_mount+0x40/0xe8)
[<c007f0a8>] (do_kern_mount+0x0/0xe8) from [<c0095628>] (do_new_mount+0x68/0x8c)
[<c00955c0>] (do_new_mount+0x0/0x8c) from [<c00957a8>] (do_mount+0x15c/0x1b8)
[<c009564c>] (do_mount+0x0/0x1b8) from [<c0095890>] (sys_mount+0x8c/0xd4)
[<c0095804>] (sys_mount+0x0/0xd4) from [<c0023c00>] (ret_fast_syscall+0x0/0x2c)
Kernel panic - not syncing: Fatal exception

The problem is that 'ubi_wl_scrub_peb()' does not expect that PEBs may
be in the erroneous tree, which is a bug. This patch fixes the bug
and adds corresponding check to 'ubi_wl_scrub_peb()'. Now it will simply
ignore erroneous PEBs, instead of causing an oops.

Reported-by: Matthieu CASTET <matthieu.castet@parrot.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/wl.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index ee7b1d8..97a4356 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1212,7 +1212,8 @@ int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum)
 retry:
 	spin_lock(&ubi->wl_lock);
 	e = ubi->lookuptbl[pnum];
-	if (e == ubi->move_from || in_wl_tree(e, &ubi->scrub)) {
+	if (e == ubi->move_from || in_wl_tree(e, &ubi->scrub) ||
+				   in_wl_tree(e, &ubi->erroneous)) {
 		spin_unlock(&ubi->wl_lock);
 		return 0;
 	}
-- 
1.7.2.2

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
