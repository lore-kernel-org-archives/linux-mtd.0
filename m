Received: from mail-it1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZuxa-00050I-7r
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 09:49:43 +0000
Received: by mail-it1-x12f.google.com with SMTP id p197so1943832itp.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2018 01:49:30 -0800 (PST)
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Thu, 20 Dec 2018 09:49:17 +0000
Message-ID: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
Subject: hung task detected in ubifs
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

A client has just reported this lock up that I thought I would pass on
in case it's already been fixed and a patch is available or the trace
can help identify a potential deadlock. They are running a vendor
specific 4.9.88 kernel for an i.MX6 UL but as far as I know there are
no modifications to the UBI/MTD layers:

INFO: task kworker/u2:1:92 blocked for more than 120 seconds.
      Tainted: G           O    4.9.88-1.0.0+g6507266 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[<80912e44>] (__schedule) from [<80913484>] (schedule+0x48/0xb0)
[<80913484>] (schedule) from [<80913830>] (schedule_preempt_disabled+0x14/0x20)
[<80913830>] (schedule_preempt_disabled) from [<80914644>]
(mutex_lock_nested+0x1b8/0x3f8)
[<80914644>] (mutex_lock_nested) from [<8038c788>] (make_reservation+0xa0/0x43c)
[<8038c788>] (make_reservation) from [<8038d614>]
(ubifs_jnl_write_inode+0x78/0x224)
[<8038d614>] (ubifs_jnl_write_inode) from [<80395170>]
(ubifs_write_inode+0x90/0x114)
[<80395170>] (ubifs_write_inode) from [<80391348>] (ubifs_writepage+0x168/0x1c4)
[<80391348>] (ubifs_writepage) from [<8020094c>] (__writepage+0x14/0x5c)
[<8020094c>] (__writepage) from [<80200104>] (write_cache_pages+0x1f4/0x558)
[<80200104>] (write_cache_pages) from [<80202968>] (do_writepages+0x90/0xa4)
[<80202968>] (do_writepages) from [<8027c46c>]
(__writeback_single_inode+0x84/0x61c)
[<8027c46c>] (__writeback_single_inode) from [<8027d00c>]
(writeback_sb_inodes+0x1dc/0x4f0)
[<8027d00c>] (writeback_sb_inodes) from [<8027d378>]
(__writeback_inodes_wb+0x58/0x9c)
[<8027d378>] (__writeback_inodes_wb) from [<8027d714>]
(wb_writeback+0x358/0x438)
[<8027d714>] (wb_writeback) from [<8027e210>] (wb_workfn+0x1fc/0x5bc)
[<8027e210>] (wb_workfn) from [<8013f298>] (process_one_work+0x2b4/0x6a8)
[<8013f298>] (process_one_work) from [<8013f6dc>] (worker_thread+0x50/0x5a8)
[<8013f6dc>] (worker_thread) from [<80145270>] (kthread+0x124/0x12c)
[<80145270>] (kthread) from [<80107d30>] (ret_from_fork+0x14/0x24)

Showing all locks held in the system:
6 locks held by kworker/u2:0/6:
 #0:  ("writeback"){......}, at: [<8013f1d0>] process_one_work+0x1ec/0x6a8
 #1:  ((&(&wb->dwork)->work)){......}, at: [<8013f1d0>]
process_one_work+0x1ec/0x6a8
 #2:  (&type->s_umount_key#25){......}, at: [<8024dcac>] trylock_super+0x14/0x58
 #3:  (&ui->ui_mutex){......}, at: [<80395124>] ubifs_write_inode+0x44/0x114
 #4:  (&c->commit_sem){......}, at: [<8038c758>] make_reservation+0x70/0x43c
 #5:  (&wbuf->io_mutex/1){......}, at: [<8038c788>] make_reservation+0xa0/0x43c
2 locks held by khungtaskd/14:
 #0:  (rcu_read_lock){......}, at: [<801b7920>] watchdog+0xdc/0x4b0
 #1:  (tasklist_lock){......}, at: [<80162208>] debug_show_all_locks+0x38/0x1ac
6 locks held by kworker/u2:1/92:
 #0:  ("writeback"){......}, at: [<8013f1d0>] process_one_work+0x1ec/0x6a8
 #1:  ((&(&wb->dwork)->work)){......}, at: [<8013f1d0>]
process_one_work+0x1ec/0x6a8
 #2:  (&type->s_umount_key#25){......}, at: [<8024dcac>] trylock_super+0x14/0x58
 #3:  (&ui->ui_mutex){......}, at: [<80395124>] ubifs_write_inode+0x44/0x114
 #4:  (&c->commit_sem){......}, at: [<8038c758>] make_reservation+0x70/0x43c
 #5:  (&wbuf->io_mutex/1){......}, at: [<8038c788>] make_reservation+0xa0/0x43c
2 locks held by ubifs_bgt0_2/241:
 #0:  (&wbuf->io_mutex/1){......}, at: [<8039a1a8>]
ubifs_bg_wbufs_sync+0x110/0x1b0
 #1:  (&le->mutex){......}, at: [<805686b4>] ubi_eba_write_leb+0x40/0x7a4
2 locks held by ubifs_bgt0_0/720:
 #0:  (&wbuf->io_mutex/1){......}, at: [<8039a1a8>]
ubifs_bg_wbufs_sync+0x110/0x1b0
 #1:  (&le->mutex){......}, at: [<805686b4>] ubi_eba_write_leb+0x40/0x7a4
5 locks held by programmingapp/930:
 #0:  (&mm->mmap_sem){......}, at: [<80113ef0>] do_page_fault+0xb8/0x350
 #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
 #2:  (of_dma_lock){......}, at: [<804ab890>]
of_dma_request_slave_channel+0x140/0x228
 #3:  (dma_list_mutex){......}, at: [<804a9d3c>] __dma_request_channel+0x24/0x8c
 #4:  (cma_mutex){......}, at: [<80246814>] cma_alloc+0xc8/0x29c
3 locks held by ls/938:
 #0:  (&type->i_mutex_dir_key){......}, at: [<8025e924>] iterate_dir+0x40/0x188
 #1:  (&c->tnc_mutex){......}, at: [<8039f3ac>] ubifs_tnc_next_ent+0x4c/0x1f8
 #2:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
2 locks held by ls/941:
 #0:  (&type->i_mutex_dir_key){......}, at: [<80254d28>] lookup_slow+0x84/0x198
 #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438

=============================================

Best Regards,
Martin.
