Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwpRU-00017J-Mo
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 10:49:26 +0000
To: hujianyang <hujianyang@huawei.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 mpa@pengutronix.de
From: Richard Weinberger <richard@nod.at>
Subject: UBIFS assert failed in ubifs_log_start_commit at 412 (pid 6)
Message-ID: <56446E97.3040004@nod.at>
Date: Thu, 12 Nov 2015 11:48:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Markus is facing this assert:

UBIFS assert failed in ubifs_log_start_commit at 412 (pid 6)
CPU: 0 PID: 6 Comm: kworker/u2:0 Not tainted 4.1.0-20150730-1 #1
Hardware name: Freescale i.MX53 (Device Tree Support)
Workqueue: writeback bdi_writeback_workfn (flush-ubifs_0_1)
[<c000fe89>] (unwind_backtrace) from [<c000ed8b>] (show_stack+0xb/0xc)
[<c000ed8b>] (show_stack) from [<c00e9327>] (ubifs_log_start_commit+0xff/0x264)
[<c00e9327>] (ubifs_log_start_commit) from [<c00e9cc5>] (do_commit+0x145/0x3a0)
[<c00e9cc5>] (do_commit) from [<c00db4ad>] (make_reservation+0x211/0x29c)
[<c00db4ad>] (make_reservation) from [<c00dbb4f>] (ubifs_jnl_write_data+0xfb/0x1c0)
[<c00dbb4f>] (ubifs_jnl_write_data) from [<c00dcd2f>] (do_writepage+0x8f/0x180)
[<c00dcd2f>] (do_writepage) from [<c0044ff3>] (__writepage+0xb/0x34)
[<c0044ff3>] (__writepage) from [<c0045fa9>] (write_cache_pages+0x165/0x1ea)
[<c0045fa9>] (write_cache_pages) from [<c004604f>] (generic_writepages+0x21/0x36)
[<c004604f>] (generic_writepages) from [<c007423d>] (__writeback_single_inode+0x25/0xd8)
[<c007423d>] (__writeback_single_inode) from [<c00744cd>] (writeback_sb_inodes+0x121/0x22c)
[<c00744cd>] (writeback_sb_inodes) from [<c0074619>] (__writeback_inodes_wb+0x41/0x68)
[<c0074619>] (__writeback_inodes_wb) from [<c00746df>] (wb_writeback+0x9f/0xe0)
[<c00746df>] (wb_writeback) from [<c0074853>] (bdi_writeback_workfn+0x133/0x208)
[<c0074853>] (bdi_writeback_workfn) from [<c00207d7>] (process_one_work+0x11b/0x1dc)
[<c00207d7>] (process_one_work) from [<c0020a63>] (worker_thread+0x1b1/0x28e)
[<c0020a63>] (worker_thread) from [<c0023263>] (kthread+0x87/0x98)
[<c0023263>] (kthread) from [<c000cde1>] (ret_from_fork+0x11/0x30)

Hu, this ubifs_assert was added by your commit 25601a3c9737fed554169759582c690b98ead5d4.
If I understand it correctly the assert is harmless as UBIFS can deal with that condition just fine.
The assertion was added to identify code paths where this can be triggered as you thought
you have fixed all paths?

IMHO the ubifs_assert() should be converted to a plain ubifs_msg().

Thanks,
//richard
