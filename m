Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOrgE-0003eN-Cw
 for linux-mtd@lists.infradead.org; Fri, 20 Feb 2015 17:47:59 +0000
Received: by padbj1 with SMTP id bj1so9646726pad.5
 for <linux-mtd@lists.infradead.org>; Fri, 20 Feb 2015 09:47:36 -0800 (PST)
Date: Fri, 20 Feb 2015 09:47:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Li Wang <li.wang@windriver.com>, dwmw2@infradead.org
Subject: Re: [PATCH] mtd: put flash block erasing into wait queue, if has any
 thread in queue
Message-ID: <20150220174732.GB8351@norris-Latitude-E6410>
References: <1408009833-26494-1-git-send-email-li.wang@windriver.com>
 <1408009833-26494-2-git-send-email-li.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408009833-26494-2-git-send-email-li.wang@windriver.com>
Cc: stefani@seibold.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, do you think you could check this out?

On Thu, Aug 14, 2014 at 05:50:33PM +0800, Li Wang wrote:
> When erases many flash blocks, it maybe stop flash writing operation:
> =====
> erase thread:
> for(;;) {
>   do_erase_oneblock() {
>     mutex_lock(&chip->mutex);
>     chip->state = FL_ERASING;
>     mutex_unlock(&chip->mutex);
>     msleep();   <--- erase wait
>     mutex_lock(&chip->mutex);
>     chip->state = FL_READY;
>     mutex_unlock(&chip->mutex);   <--- finish one block erasing
>   }
> }
> 
> write thread:
>  retry:
>   mutex_lock(&cfi->chips[chipnum].mutex);
>   if (cfi->chips[chipnum].state != FL_READY) {
>     set_current_state(TASK_UNINTERRUPTIBLE);
>     add_wait_queue(&cfi->chips[chipnum].wq, &wait);
>     mutex_unlock(&cfi->chips[chipnum].mutex);
>     schedule();                   <--- write wait
>     remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
>     goto retry;
> =====
> Only when finishes one block erasing, writing operation just has chance to run.
> But, if writing operation is put into wait queue(write wait), the mutex_unlock
> (finish one block erasing) can not wake up writing operation. So, if many blocks
> need erase, writing operation has no chance to run.
> it will cause the following backtrace:
> =====
> INFO: task sh:727 blocked for more than 120 seconds.
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> sh D 0fe76ad0 0 727 711 0x00000000
> Call Trace:
> [df0cdc40] [00000002] 0x2 (unreliable)
> [df0cdd00] [c0008974] __switch_to+0x64/0xd8
> [df0cdd10] [c043f2e4] schedule+0x218/0x408
> [df0cdd60] [c04401f4] __mutex_lock_slowpath+0xd0/0x174
> [df0cdda0] [c044087c] mutex_lock+0x5c/0x60
> [df0cddc0] [c00ff18c] do_truncate+0x60/0xa8
> [df0cde10] [c010d1d0] do_last+0x5a0/0x6d0
> [df0cde40] [c010f778] do_filp_open+0x1d4/0x5e8
> [df0cdf20] [c00fe0d0] do_sys_open+0x64/0x19c
> [df0cdf40] [c0010d04] ret_from_syscall+0x0/0x4
> --- Exception: c01 at 0xfe76ad0
>     LR = 0xffd3ae8
> ...
> sh D 0fe77068 0 607 590 0x00000000 
> Call Trace: 
> [dbca98e0] [c009ad4c] rcu_process_callbacks+0x38/0x4c (unreliable) 
> [dbca99a0] [c0008974] __switch_to+0x64/0xd8 
> [dbca99b0] [c043f2e4] schedule+0x218/0x408 
> [dbca9a00] [c034bfa4] cfi_amdstd_write_words+0x364/0x480 
> [dbca9a80] [c034c9b4] cfi_amdstd_write_buffers+0x8f4/0xca8 
> [dbca9b10] [c03437ac] part_write+0xb0/0xe4 
> [dbca9b20] [c02051f8] jffs2_flash_direct_writev+0xdc/0x140 
> [dbca9b70] [c02079ac] jffs2_flash_writev+0x38c/0x4fc 
> [dbca9bc0] [c01fc6ac] jffs2_write_dnode+0x140/0x5bc 
> [dbca9c40] [c01fd0dc] jffs2_write_inode_range+0x288/0x514 
> [dbca9cd0] [c01f5ed4] jffs2_write_end+0x190/0x37c 
> [dbca9d10] [c00bf2f0] generic_file_buffered_write+0x100/0x26c 
> [dbca9da0] [c00c1828] __generic_file_aio_write+0x2c0/0x4fc 
> [dbca9e10] [c00c1ad4] generic_file_aio_write+0x70/0xf0 
> [dbca9e40] [c0100398] do_sync_write+0xac/0x120 
> [dbca9ee0] [c0101088] vfs_write+0xb4/0x184 
> [dbca9f00] [c01012cc] sys_write+0x50/0x10c 
> [dbca9f40] [c0010d04] ret_from_syscall+0x0/0x4 
> --- Exception: c01 at 0xfe77068 
>     LR = 0xffd3c8c
> ...
> flash_erase R running 0 869 32566 0x00000000 
> Call Trace: 
> [dbc6dae0] [c0017ac0] kunmap_atomic+0x14/0x3c (unreliable) 
> [dbc6dba0] [c0008974] __switch_to+0x64/0xd8 
> [dbc6dbb0] [c043f2e4] schedule+0x218/0x408 
> [dbc6dc00] [c043fbe4] schedule_timeout+0x170/0x2cc 
> [dbc6dc50] [c00531f0] msleep+0x1c/0x34 
> [dbc6dc60] [c034d538] do_erase_oneblock+0x7d0/0x944 
> [dbc6dcd0] [c0349dfc] cfi_varsize_frob+0x1a8/0x2cc 
> [dbc6dd20] [c034e4d4] cfi_amdstd_erase_varsize+0x30/0x60 
> [dbc6dd30] [c0343abc] part_erase+0x80/0x104 
> [dbc6dd40] [c0345c80] mtd_ioctl+0x3e0/0xc3c 
> [dbc6de80] [c0111050] vfs_ioctl+0xcc/0xe4 
> [dbc6dea0] [c011122c] do_vfs_ioctl+0x80/0x770 
> [dbc6df10] [c01119b0] sys_ioctl+0x94/0x108 
> [dbc6df40] [c0010d04] ret_from_syscall+0x0/0x4 
> --- Exception: c01 at 0xff586a0 
>     LR = 0xff58608 
> =====
> So, if there is any thread in wait queue, puts erasing operation into queue.
> It makes writing operation have chance to run.
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 5a4bfe3..53f5774 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2400,6 +2400,19 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  	chip->state = FL_READY;
>  	DISABLE_VPP(map);
>  	put_chip(map, chip, adr);
> +	if (waitqueue_active(&chip->wq)) {
> +		set_current_state(TASK_UNINTERRUPTIBLE);
> +		add_wait_queue(&chip->wq, &wait);
> +		mutex_unlock(&chip->mutex);

Hmm, I don't quite understand why the erasing thread has to wait here.
It's already finished with its operation, so all it needs to do is make
sure to wake up anyone else on the wait queue. Isn't put_chip() (the
line above) sufficient? It finishes with a call to wake_up(&chip->wq).

So I'm thinking your problem probably lies somewhere else. I'm not too
familiar with this driver though.

> +		/*
> +		 * If the other thread in queue misses to wake up erasing in
> +		 * 3ms, erasing will wake up itself. The way makes erasing not
> +		 * to hang up by the error of the other thread in queue.
> +		 */
> +		schedule_timeout(msecs_to_jiffies(3));
> +		remove_wait_queue(&chip->wq, &wait);
> +		return ret;
> +	}
>  	mutex_unlock(&chip->mutex);
>  	return ret;
>  }

Brian
