Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHetY-0004yu-83
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 21:16:13 +0000
Message-ID: <55AEB685.9030904@nod.at>
Date: Tue, 21 Jul 2015 23:15:49 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 jack@suse.com
CC: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 00/25] Add quota supporting in ubifs
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
> Hi Atem, Richard and others,
> 	This is a patchset to add quota supporting in ubifs.
> [1/25] - [7/25] are working to make quotactl to support filesystems
> which are running on char device.
> 
> Others are about making ubifs to support quota
> Please help to review or test it. Any comment is welcome :).
> 
> Hi Jan Kara,
> 	I am not sure I am using the quota APIs correctly, please
> help to correct me if I am wrong.
> 
> Also you can get the code from:
> https://github.com/yangdongsheng/linux.git  ubifs_quota_v1
> 
> 	My simple testing is shown as below:

I get this lockdep splat. Have you seen it too?

[   63.779453]
[   63.779633] ======================================================
[   63.780006] [ INFO: possible circular locking dependency detected ]
[   63.780006] 4.2.0-rc3+ #45 Not tainted
[   63.780006] -------------------------------------------------------
[   63.780006] dd/2668 is trying to acquire lock:
[   63.780006]  (&type->s_umount_key#28){+++++.}, at: [<ffffffff81306031>] ubifs_budget_space+0x2c1/0x660
[   63.780006]
[   63.780006] but task is already holding lock:
[   63.780006]  (&sb->s_type->i_mutex_key#12){+.+.+.}, at: [<ffffffff811434c5>] generic_file_write_iter+0x35/0x1f0
[   63.780006]
[   63.780006] which lock already depends on the new lock.
[   63.780006]
[   63.780006]
[   63.780006] the existing dependency chain (in reverse order) is:
[   63.780006]
-> #2 (&sb->s_type->i_mutex_key#12){+.+.+.}:
[   63.780006]        [<ffffffff810a2103>] lock_acquire+0xd3/0x270
[   63.780006]        [<ffffffff819cee7b>] mutex_lock_nested+0x6b/0x3a0
[   63.780006]        [<ffffffff81202d23>] vfs_load_quota_inode+0x4f3/0x560
[   63.780006]        [<ffffffff81203203>] dquot_quota_on+0x53/0x60
[   63.780006]        [<ffffffff8120786a>] SyS_quotactl+0x66a/0x890
[   63.780006]        [<ffffffff819d2d57>] entry_SYSCALL_64_fastpath+0x12/0x6f
[   63.780006]
-> #1 (&s->s_dquot.dqonoff_mutex){+.+...}:
[   63.780006]        [<ffffffff810a2103>] lock_acquire+0xd3/0x270
[   63.780006]        [<ffffffff819cee7b>] mutex_lock_nested+0x6b/0x3a0
[   63.780006]        [<ffffffff81203603>] dquot_writeback_dquots+0x33/0x280
[   63.780006]        [<ffffffff812f2e3e>] ubifs_sync_fs+0x2e/0xb0
[   63.780006]        [<ffffffff811d0d54>] sync_filesystem+0x74/0xb0
[   63.780006]        [<ffffffff8119cf5f>] generic_shutdown_super+0x2f/0x100
[   63.780006]        [<ffffffff8119d281>] kill_anon_super+0x11/0x20
[   63.780006]        [<ffffffff812f22d5>] kill_ubifs_super+0x15/0x30
[   63.780006]        [<ffffffff8119d709>] deactivate_locked_super+0x39/0x70
[   63.780006]        [<ffffffff8119deb9>] deactivate_super+0x49/0x70
[   63.780006]        [<ffffffff811bcb4e>] cleanup_mnt+0x3e/0x90
[   63.780006]        [<ffffffff811bcbed>] __cleanup_mnt+0xd/0x10
[   63.780006]        [<ffffffff81076258>] task_work_run+0x88/0xb0
[   63.780006]        [<ffffffff81003abd>] do_notify_resume+0x3d/0x50
[   63.780006]        [<ffffffff819d2f2c>] int_signal+0x12/0x17
[   63.780006]
-> #0 (&type->s_umount_key#28){+++++.}:
[   63.780006]        [<ffffffff810a1a17>] __lock_acquire+0x1907/0x1ea0
[   63.780006]        [<ffffffff810a2103>] lock_acquire+0xd3/0x270
[   63.780006]        [<ffffffff819d03cc>] down_read+0x4c/0xa0
[   63.780006]        [<ffffffff81306031>] ubifs_budget_space+0x2c1/0x660
[   63.780006]        [<ffffffff812eef5d>] ubifs_write_begin+0x23d/0x500
[   63.780006]        [<ffffffff81140bda>] generic_perform_write+0xaa/0x1a0
[   63.780006]        [<ffffffff81143433>] __generic_file_write_iter+0x183/0x1e0
[   63.780006]        [<ffffffff81143574>] generic_file_write_iter+0xe4/0x1f0
[   63.780006]        [<ffffffff812eda96>] ubifs_write_iter+0xc6/0x180
[   63.780006]        [<ffffffff8119a958>] __vfs_write+0xa8/0xe0
[   63.780006]        [<ffffffff8119afb7>] vfs_write+0xa7/0x190
[   63.780006]        [<ffffffff8119bcf4>] SyS_write+0x44/0xa0
[   63.780006]        [<ffffffff819d2d57>] entry_SYSCALL_64_fastpath+0x12/0x6f
[   63.780006]
[   63.780006] other info that might help us debug this:
[   63.780006]
[   63.780006] Chain exists of:
  &type->s_umount_key#28 --> &s->s_dquot.dqonoff_mutex --> &sb->s_type->i_mutex_key#12

[   63.780006]  Possible unsafe locking scenario:
[   63.780006]
[   63.780006]        CPU0                    CPU1
[   63.780006]        ----                    ----
[   63.780006]   lock(&sb->s_type->i_mutex_key#12);
[   63.780006]                                lock(&s->s_dquot.dqonoff_mutex);
[   63.780006]                                lock(&sb->s_type->i_mutex_key#12);
[   63.780006]   lock(&type->s_umount_key#28);
[   63.780006]
[   63.780006]  *** DEADLOCK ***
[   63.780006]
[   63.780006] 2 locks held by dd/2668:
[   63.780006]  #0:  (sb_writers#8){.+.+.+}, at: [<ffffffff8119b086>] vfs_write+0x176/0x190
[   63.780006]  #1:  (&sb->s_type->i_mutex_key#12){+.+.+.}, at: [<ffffffff811434c5>] generic_file_write_iter+0x35/0x1f0
[   63.780006]
[   63.780006] stack backtrace:
[   63.780006] CPU: 2 PID: 2668 Comm: dd Not tainted 4.2.0-rc3+ #45
[   63.780006] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.7.5-0-ge51488c-20140816_022509-build35 04/01/2014
[   63.780006]  ffffffff829ef340 ffff880000037988 ffffffff819c4998 0000000000000000
[   63.780006]  ffffffff829f6f40 ffff8800000379d8 ffffffff819c0647 0000000000000002
[   63.780006]  ffff880000037a28 ffff8800000379d8 ffff8800798b97c0 ffff8800798b9fd8
[   63.780006] Call Trace:
[   63.780006]  [<ffffffff819c4998>] dump_stack+0x4c/0x65
[   63.780006]  [<ffffffff819c0647>] print_circular_bug+0x202/0x213
[   63.780006]  [<ffffffff810a1a17>] __lock_acquire+0x1907/0x1ea0
[   63.780006]  [<ffffffff810a2103>] lock_acquire+0xd3/0x270
[   63.780006]  [<ffffffff81306031>] ? ubifs_budget_space+0x2c1/0x660
[   63.780006]  [<ffffffff819d03cc>] down_read+0x4c/0xa0
[   63.780006]  [<ffffffff81306031>] ? ubifs_budget_space+0x2c1/0x660
[   63.780006]  [<ffffffff819d23c6>] ? _raw_spin_unlock+0x26/0x40
[   63.780006]  [<ffffffff81306031>] ubifs_budget_space+0x2c1/0x660
[   63.780006]  [<ffffffff819cf25b>] ? __mutex_unlock_slowpath+0xab/0x160
[   63.780006]  [<ffffffff812eef5d>] ubifs_write_begin+0x23d/0x500
[   63.780006]  [<ffffffff81140bda>] generic_perform_write+0xaa/0x1a0
[   63.780006]  [<ffffffff81143433>] __generic_file_write_iter+0x183/0x1e0
[   63.780006]  [<ffffffff81143574>] generic_file_write_iter+0xe4/0x1f0
[   63.780006]  [<ffffffff812eda96>] ubifs_write_iter+0xc6/0x180
[   63.780006]  [<ffffffff8119a958>] __vfs_write+0xa8/0xe0
[   63.780006]  [<ffffffff8119afb7>] vfs_write+0xa7/0x190
[   63.780006]  [<ffffffff8119bcf4>] SyS_write+0x44/0xa0
[   63.780006]  [<ffffffff819d2d57>] entry_SYSCALL_64_fastpath+0x12/0x6f

Thanks,
//richard
