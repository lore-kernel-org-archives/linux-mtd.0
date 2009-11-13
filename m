Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8yRp-00084b-0G
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 15:52:33 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4AFD76AB.20301@aimvalley.nl>
References: <4ACF3478.1060503@aimvalley.nl>
	<1255269148.16942.95.camel@localhost> <4AD30069.8060101@aimvalley.nl>
	<1255510600.32489.130.camel@localhost> <4AFADE3B.3050406@aimvalley.nl>
	<1258100455.21596.1187.camel@localhost> <4AFD76AB.20301@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2009 17:52:10 +0200
Message-Id: <1258127530.21596.1260.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-11-13 at 16:09 +0100, Norbert van Bolhuis wrote:
> OK, so now I understand commit_sem is a RW semaphore which can be acquired multiple
> times by readers but only once for writers. I failed to see that initially.
> I think this problem is not related to the commit_sem though.

OK.

> I changed the logging a bit and added the PID info.
> The problem is indeed caused by a third task holding the "MTD chip lock". This
> blocks the application which is blocking pdflush.

OK.

> This 3rd task is the UBI background thread. It starts to erase many NOR PEBs very soon.

The only reason I see why it would do this is because you attach an
empty flash to UBI. In this case, UBI has to format it. And it is doing
the formatting asynchronously, in the background thread.

The idea was that we can allow using the UBI volume even if it is not
fully formatted, and format in parallel. For NAND with its fast erase it
works fine. With NOR it appears to be not so goot.

Please, attach UBI, then wait until the UBI background thread is done,
and then mount and start using UBIFS.

The other option is to format the flash _properly_ before attaching it
to UBI. In this case the background thread will not have to do that job.
Use ubiformat for this:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_format_mtd

Please, confirm that you do not have this problem in that case.

> To be absolutely certain I also added log entries for the do_erase_oneblock
> function.
> To better reproduce this problem I decreased the warning threshold from 120 sec to 60 secs.
> 
> Here's the detailed info.
> 
> log entries (LE:xyz is the log entry number):
> ---------------------------------------------
> LE:0235, TIME=3984.244, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0236, TIME=3984.836, pid=1236, M(xy=04)=commit_sem, make_reservation, Req DOWN 1	<- application creating a file
> LE:0237, TIME=3984.836, pid=1236, M(xy=05)=commit_sem, make_reservation, DOWN 1
> LE:0238, TIME=3984.836, pid=1236, M(xy=02)=io_mutex, reserve_space, Req LOCK 1
> LE:0239, TIME=3984.836, pid=1236, M(xy=03)=io_mutex, reserve_space, LOCK 1
> LE:0240, TIME=3985.100, pid=0918, M(xy=01)=do_erase_oneblock, END			<- ubi_bgt0d continuing erasing LEBs
> LE:0241, TIME=3985.100, pid=0918, M(xy=00)=do_erase_oneblock, START
>   <omitted many do_erase_oneblock END/START entries>
> LE:0275, TIME=3998.608, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0276, TIME=3999.256, pid=0108, M(xy=04)=commit_sem, make_reservation, Req DOWN 1
> LE:0277, TIME=3999.256, pid=0108, M(xy=05)=commit_sem, make_reservation, DOWN 1
> LE:0278, TIME=3999.256, pid=0108, M(xy=02)=io_mutex, reserve_space, Req LOCK 1		<- pdflush blocks here
> LE:0279, TIME=3999.444, pid=0918, M(xy=01)=do_erase_oneblock, END
>   <omitted many do_erase_oneblock END/START entries>
> LE:0433, TIME=4062.400, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0434, TIME=4062.400, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0435, TIME=4063.124, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0436, TIME=4063.124, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0437, TIME=4063.308, pid=0004, M(xy=0a)=pdflush error report
> LE:0438, TIME=4066.120, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0439, TIME=4066.120, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0440, TIME=4066.876, pid=1236, M(xy=06)=io_mutex, release_head, Req UNLOCK
> LE:0441, TIME=4066.876, pid=1236, M(xy=07)=io_mutex, release_head, UNLOCK		<- application unlocks io_mutex
> LE:0442, TIME=4066.876, pid=1236, M(xy=08)=commit_sem, finish_reservation, Req UP
> LE:0443, TIME=4066.876, pid=1236, M(xy=09)=commit_sem, finish_reservation, UP
> LE:0444, TIME=4066.880, pid=0108, M(xy=03)=io_mutex, reserve_space, LOCK 1		<- pdflush can continue
> LE:0445, TIME=4066.880, pid=0108, M(xy=06)=io_mutex, release_head, Req UNLOCK
> LE:0446, TIME=4066.880, pid=0108, M(xy=07)=io_mutex, release_head, UNLOCK
> LE:0447, TIME=4066.880, pid=0108, M(xy=08)=commit_sem, finish_reservation, Req UP
> LE:0448, TIME=4066.880, pid=0108, M(xy=09)=commit_sem, finish_reservation, UP
> 
> 
> 
> relevant processes
> ------------------
> pdflush       D 00000000     0   108      2
> Call Trace:
> [ceb51b50] [7f64db78] 0x7f64db78 (unreliable)
> [ceb51c10] [c0008b24] 0xc0008b24        __switch_to
> [ceb51c30] [c0291e40] 0xc0291e40        schedule
> [ceb51c80] [c0292d60] 0xc0292d60        __mutex_lock_slowpath
> [ceb51cb0] [c013d5fc] 0xc013d5fc        make_reservation
> [ceb51d20] [c013ddf8] 0xc013ddf8        ubifs_jnl_write_inode
> [ceb51d60] [c014531c] 0xc014531c        ubifs_write_inode
> [ceb51d80] [c01410ec] 0xc01410ec        ubifs_writepage
> [ceb51db0] [c005b124] 0xc005b124        __writepage
> [ceb51dc0] [c005b948] 0xc005b948        write_cache_pages
> [ceb51e60] [c005babc] 0xc005babc        do_writepages
> [ceb51e70] [c00a3638] 0xc00a3638        __writeback_single_inode
> [ceb51ec0] [c00a3bfc] 0xc00a3bfc        generic_sync_sb_inodes
> [ceb51f00] [c00a439c] 0xc00a439c        writeback_inodes
> [ceb51f20] [c005c7e0] 0xc005c7e0        wb_kupdate
> [ceb51f80] [c005cfdc] 0xc005cfdc        pdflush
> [ceb51fd0] [c003bd88] 0xc003bd88        kthread
> [ceb51ff0] [c00114a0] 0xc00114a0        kernel_thread
> 
> 
> ubi_bgt0d     R running      0   918      2
> Call Trace:
> [ce6e1b80] [00001032] 0x001032 (unreliable)
> [ce6e1c40] [c0008b24] 0xc0008b24        __switch_to
> [ce6e1c60] [c0291e40] 0xc0291e40        schedule
> [ce6e1cb0] [c02926d4] 0xc02926d4        schedule_timeout
> [ce6e1cf0] [c002f684] 0xc002f684        msleep
> [ce6e1d00] [c01ee900] 0xc01ee900        do_erase_oneblock
> [ce6e1d60] [c01e98a0] 0xc01e98a0        cfi_varsize_frob
> [ce6e1da0] [c01ecdc4] 0xc01ecdc4        cfi_amdstd_erase_varsize
> [ce6e1db0] [c01e30b8] 0xc01e30b8        part_erase
> [ce6e1dc0] [c01e5800] 0xc01e5800        concat_erase
> [ce6e1e20] [c01e30b8] 0xc01e30b8        part_erase
> [ce6e1e30] [c01f8134] 0xc01f8134        do_sync_erase
> [ce6e1ec0] [c01f83f0] 0xc01f83f0        ubi_io_sync_erase
> [ce6e1f40] [c01f9658] 0xc01f9658        erase_worker
> [ce6e1f70] [c01f8cc0] 0xc01f8cc0        do_work
> [ce6e1f90] [c01fa078] 0xc01fa078        ubi_thread
> [ce6e1fd0] [c003bd88] 0xc003bd88        kthread
> [ce6e1ff0] [c00114a0] 0xc00114a0        kernel_thread
> 
> mainctrl      D 0fbd3f00     0  1236   1215
> Call Trace:
> [ce7fd9f0] [00000001] 0x000001 (unreliable)
> [ce7fdab0] [c0008b24] 0xc0008b24        __switch_to
> [ce7fdad0] [c0291e40] 0xc0291e40        schedule
> [ce7fdb20] [c01ea090] 0xc01ea090        get_chip
> [ce7fdb90] [c01eb8dc] 0xc01eb8dc        cfi_amdstd_write_buffers
> [ce7fdc20] [c01e2da8] 0xc01e2da8        part_write
> [ce7fdc30] [c01e4128] 0xc01e4128        concat_write
> [ce7fdc70] [c01e2da8] 0xc01e2da8        part_write
> [ce7fdc80] [c01f7854] 0xc01f7854        ubi_io_write
> [ce7fdcb0] [c01f63d4] 0xc01f63d4        ubi_eba_write_leb
> [ce7fdd10] [c01f546c] 0xc01f546c        ubi_leb_write
> [ce7fdd30] [c0148c6c] 0xc0148c6c        ubifs_wbuf_write_nolock
> [ce7fdd70] [c013dd0c] 0xc013dd0c        write_head
> [ce7fdd90] [c013e9e0] 0xc013e9e0        ubifs_jnl_update
> [ce7fde00] [c0143030] 0xc0143030        ubifs_create
> [ce7fde50] [c008caf8] 0xc008caf8        vfs_create
> [ce7fde70] [c0090a20] 0xc0090a20        do_filp_open
> [ce7fdf20] [c008155c] 0xc008155c        do_sys_open
> [ce7fdf40] [c001167c] 0xc001167c        ret_from_syscall
> 
> 
> relevant process (priorities)
> -----------------------------
> F S UID        PID  SPID  PPID  C PRI  NI ADDR SZ  WCHAN STIME TTY          TIME CMD
> 1 S root       108   108     2  0  80   0 -     0  5cf64 22:16 ?        00:00:00 [pdflush]
> 1 S root       918   918     2  0  75  -5 -     0 1fa2dc 22:16 ?        00:00:00 [ubi_bgt0d]
> 0 S root      1236  1236  1221  0  90  10 - 12617  49354 22:17 ttyS1    00:00:00 mainctrl
> 
> 
> 
> So the problem is that the application holding the io_mutex is blocked by the ubi bg task
> because of the "MTD chip lock".

Right, and the task is formatting your flash. Formatting means that for
each eraseblock it
   1. erases (very slow on NOR!)
   2. writes the UBI headers.

Your write task (pid=1236) is then blocked in CFI. If it is unlucky, it
may even wait for several block erasures, and then be able to take the
lock.

> I'm happy I understand the problem now, I guess it's not *that* serious.
> It does cause unnecessary delays however which I'd like to get rid of.

Try the formatting.

> I guess it wouldn't make sense to somehow release the per-journalhead io_mutex whenever
> blocked by the "MTD chip lock" ?

> How can I prevent the UBI background thread to erase so many NOR LEBs so soon ?
> (I hope the only option is not by creating a 156MB UBIFS image (preprogrammed by manufacturing) for
>   our 156 MB NOR partition).

No. The option is to use ubiformat. You can use this utility for
formatting, and also for flashing images, in which case it will flash
data, and the rest of the eraseblocks will be formatted.

> Would it make sense to lower the UBI background thread task prio ?

That would be a hack. You can even add a 'yield()' there, that would
also be a hack.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
