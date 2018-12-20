Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1k1-0001vk-HI
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 17:04:10 +0000
Received: by mail-io1-xd2c.google.com with SMTP id l14so1379407ioj.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2018 09:03:58 -0800 (PST)
MIME-Version: 1.0
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <3974794.HFKrkWXeJj@blindfold>
 <CABatt_yRNnfrkysYwWuPJ=80nTa5ePNrpmvAq=B=bkcHvA5yig@mail.gmail.com>
 <1722601.NPUxFaVKW8@blindfold>
In-Reply-To: <1722601.NPUxFaVKW8@blindfold>
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Thu, 20 Dec 2018 17:03:46 +0000
Message-ID: <CABatt_ygjLLSUWkt5X5W2P3dL2E8zm-71OHaTyKya2Vgj9iwNg@mail.gmail.com>
Subject: Re: hung task detected in ubifs
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 20, 2018 at 3:42 PM Richard Weinberger <richard@nod.at> wrote:
>
> Am Donnerstag, 20. Dezember 2018, 16:04:10 CET schrieb Martin Townsend:
> > > Basically we need to figure why and where exactly cma_alloc() hangs.
> > > And of course also we need to know if it is really cma_alloc().
> > >
> > > Can you please dig into that?
> > Will do, would CMA_DEBUG help or would it produce too much log information?
>
> I don't know. I'd first try to figure where exactly it hangs and why.
>
> Thanks,
> //richard
>
>
>
I'm starting to think that MTD/UBI is a victim here.  I tried to
reproduce what the client was seeing with no luck then on one boot I
triggered a lockup really early in the boot:

[  OK  ] Started Dispatch Password Requests to Console Directory Watch.
[  OK  ] Reached target Swap.
[  OK  ] Created slice System Slice.
[  OK  ] Listening on Journal Audit Socket.
[  OK  ] Reached target Remote File Systems.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Started Forward Password Requests to Wall Directory Watch.
[  OK  ] Created slice User and Session Slice.
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Reached target Paths.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Created slice system-serial\x2dgetty.slice.
brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
INFO: task systemd:1 blocked for more than 120 seconds.
      Not tainted 4.9.88-1.0.0+g6507266 #3
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[<80918cac>] (__schedule) from [<809192ec>] (schedule+0x48/0xb0)
[<809192ec>] (schedule) from [<8091dc50>] (schedule_timeout+0x24c/0x448)
[<8091dc50>] (schedule_timeout) from [<809189d4>]
(io_schedule_timeout+0x74/0xa8)
[<809189d4>] (io_schedule_timeout) from [<80919c04>] (bit_wait_io+0x10/0x5c)
[<80919c04>] (bit_wait_io) from [<80919a8c>] (__wait_on_bit_lock+0x60/0xd4)
[<80919a8c>] (__wait_on_bit_lock) from [<801f2960>] (__lock_page+0x7c/0x98)
[<801f2960>] (__lock_page) from [<8023d1a4>] (migrate_pages+0x838/0x95c)
[<8023d1a4>] (migrate_pages) from [<801fe2ec>] (alloc_contig_range+0x164/0x354)
[<801fe2ec>] (alloc_contig_range) from [<80246824>] (cma_alloc+0xd8/0x29c)
[<80246824>] (cma_alloc) from [<80112ecc>] (__alloc_from_contiguous+0x38/0xd8)
[<80112ecc>] (__alloc_from_contiguous) from [<80112fa0>]
(cma_allocator_alloc+0x34/0x3c)
[<80112fa0>] (cma_allocator_alloc) from [<80113170>] (__dma_alloc+0x1c8/0x3ac)
[<80113170>] (__dma_alloc) from [<801133d0>] (arm_dma_alloc+0x40/0x48)
[<801133d0>] (arm_dma_alloc) from [<804af8d0>]
(mxs_dma_alloc_chan_resources+0x164/0x25c)
[<804af8d0>] (mxs_dma_alloc_chan_resources) from [<804a99e4>]
(dma_chan_get+0x68/0xdc)
[<804a99e4>] (dma_chan_get) from [<804a9bb0>] (find_candidate+0xb8/0x188)
[<804a9bb0>] (find_candidate) from [<804a9d64>]
(__dma_request_channel+0x4c/0x8c)
[<804a9d64>] (__dma_request_channel) from [<804aeef0>] (mxs_dma_xlate+0x60/0x84)
[<804aeef0>] (mxs_dma_xlate) from [<804ab8d8>]
(of_dma_request_slave_channel+0x188/0x228)
[<804ab8d8>] (of_dma_request_slave_channel) from [<804a9dd4>]
(dma_request_chan+0x30/0x194)
[<804a9dd4>] (dma_request_chan) from [<804a9f40>]
(dma_request_slave_channel+0x8/0x14)
[<804a9f40>] (dma_request_slave_channel) from [<8055c140>]
(gpmi_runtime_resume+0x4c/0x94)
[<8055c140>] (gpmi_runtime_resume) from [<804fddc4>] (__rpm_callback+0x2c/0x60)
[<804fddc4>] (__rpm_callback) from [<804fde4c>] (rpm_callback+0x54/0x80)
[<804fde4c>] (rpm_callback) from [<804ff1b0>] (rpm_resume+0x4c4/0x794)
[<804ff1b0>] (rpm_resume) from [<804ff4e0>] (__pm_runtime_resume+0x60/0x98)
[<804ff4e0>] (__pm_runtime_resume) from [<8055f6a8>] (gpmi_begin+0x1c/0x52c)
[<8055f6a8>] (gpmi_begin) from [<8055c51c>] (gpmi_select_chip+0x38/0x50)
[<8055c51c>] (gpmi_select_chip) from [<80556fd0>] (nand_do_read_ops+0x64/0x56c)
[<80556fd0>] (nand_do_read_ops) from [<80557850>] (nand_read+0x6c/0xa0)
[<80557850>] (nand_read) from [<80539c84>] (part_read+0x48/0x80)
[<80539c84>] (part_read) from [<805367d4>] (mtd_read+0x68/0xa4)
[<805367d4>] (mtd_read) from [<8056a58c>] (ubi_io_read+0xe0/0x358)
[<8056a58c>] (ubi_io_read) from [<805681b8>] (ubi_eba_read_leb+0x9c/0x438)
[<805681b8>] (ubi_eba_read_leb) from [<80566f34>] (ubi_leb_read+0x74/0xb4)
[<80566f34>] (ubi_leb_read) from [<803991e4>] (ubifs_leb_read+0x2c/0x78)
[<803991e4>] (ubifs_leb_read) from [<8039b848>] (fallible_read_node+0x48/0x120)
[<8039b848>] (fallible_read_node) from [<8039df08>]
(ubifs_tnc_locate+0x104/0x1e0)
[<8039df08>] (ubifs_tnc_locate) from [<80390660>] (do_readpage+0x184/0x438)
[<80390660>] (do_readpage) from [<80391b38>] (ubifs_readpage+0x4c/0x540)
[<80391b38>] (ubifs_readpage) from [<801f63b0>] (filemap_fault+0x51c/0x6a4)
[<801f63b0>] (filemap_fault) from [<80223b64>] (__do_fault+0x80/0x128)
[<80223b64>] (__do_fault) from [<80226f78>] (handle_mm_fault+0x738/0x1278)
[<80226f78>] (handle_mm_fault) from [<80113f64>] (do_page_fault+0x12c/0x350)
[<80113f64>] (do_page_fault) from [<8010134c>] (do_DataAbort+0x4c/0xdc)
[<8010134c>] (do_DataAbort) from [<8010d25c>] (__dabt_usr+0x3c/0x40)
Exception stack(0x960b5fb0 to 0x960b5ff8)
5fa0:                                     00000001 00000000 1e1b0500 76ee28c4
5fc0: 01bf15b0 76f68a58 00000001 00000001 fffffffe 0050119c 01c4f644 01c4f600
5fe0: 76f34318 7e909888 76e10f6c 76e10f88 80070010 ffffffff

Showing all locks held in the system:
5 locks held by systemd/1:
 #0:  (&mm->mmap_sem){......}, at: [<80113ef0>] do_page_fault+0xb8/0x350
 #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
 #2:  (of_dma_lock){......}, at: [<804ab890>]
of_dma_request_slave_channel+0x140/0x228
 #3:  (dma_list_mutex){......}, at: [<804a9d3c>] __dma_request_channel+0x24/0x8c
 #4:  (cma_mutex){......}, at: [<80246814>] cma_alloc+0xc8/0x29c
2 locks held by khungtaskd/14:
 #0:  (rcu_read_lock){......}, at: [<801b7920>] watchdog+0xdc/0x4b0
 #1:  (tasklist_lock){......}, at: [<80162208>] debug_show_all_locks+0x38/0x1ac

This does point to some lockup in the CMA allocator when migrating
pages for a contiguous allocation.  Out of interest do you know why
do_DataAbort ends up calling filemap_fault and hence ending up in the
ubifs layer?
