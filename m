Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcZjn-0005H8-Dd
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 15:05:11 +0000
Received: by mail-oi0-x22e.google.com with SMTP id c15so26227913oig.0
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 08:04:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7595faa3-6baa-a3d2-0bd6-ea0468a007f3@mazeda.se>
References: <7595faa3-6baa-a3d2-0bd6-ea0468a007f3@mazeda.se>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 24 Aug 2016 17:04:45 +0200
Message-ID: <CAFLxGvxzNZqcFGfZzN4Lw28_czzKXBb0tukQrbF41HatnTMeBw@mail.gmail.com>
Subject: Re: UBI: Race between fastmap_write and wear_leveling_worker
To: Anders Olofsson <pingu@mazeda.se>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anders,

On Wed, Aug 24, 2016 at 1:37 PM, Anders Olofsson <pingu@mazeda.se> wrote:
> After enabling fastmap I sometimes get the following warning at boot:
>
> [    2.612424] ubi1: default fastmap pool size: 8
> [    2.616802] ubi1: default fastmap WL pool size: 4
> [    2.621412] ubi1: attaching mtd3
> [    2.739113] ------------[ cut here ]------------
> [    2.743623] WARNING: CPU: 0 PID: 102 at drivers/mtd/ubi/fastmap.c:832
> ubi_scan_fastmap+0x145c/0x1464()
> [    2.752929] Modules linked in:
> [    2.755932] CPU: 0 PID: 102 Comm: ubiattach Not tainted 4.4.19 #24
> [    2.762077] Stack : 80916aaa 00000036 80910000 00000000 00000000 00000000
> 80095c08 8081fca7
>           8fef19d8 00000066 00000000 80904f60 8f49c400 8f592000 00000000
> 80095c38
>           00000000 803b0078 00000002 00000000 807659f8 8f5a7c14 8f5a7bfc
> 8012b6c0
>           00000009 80044808 8f49c400 8f592000 8f5a7c14 00000082 00000200
> 8075ccd8
>           00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
>           ...
> [    2.797492] Call Trace:
> [    2.799939] [<80020894>] show_stack+0x94/0xb0
> [    2.804277] [<803a17d8>] dump_stack+0x88/0xc0
> [    2.808633] [<8004497c>] warn_slowpath_common+0xa4/0xe0
> [    2.813822] [<800449dc>] warn_slowpath_null+0x24/0x30
> [    2.818860] [<80454e98>] ubi_scan_fastmap+0x145c/0x1464
> [    2.824077] [<80451754>] ubi_attach+0x2e8/0x4b4
> [    2.828585] [<80441400>] ubi_attach_mtd_dev+0x9f4/0x10fc
> [    2.833872] [<80441e10>] ctrl_cdev_ioctl+0x100/0x204
> [    2.838837] [<8018d010>] do_vfs_ioctl+0xa4/0x6e4
> [    2.843420] [<8018d6b0>] SyS_ioctl+0x60/0xa0
> [    2.847680] [<800293c8>] syscall_common+0x30/0x54
> [    2.852353]
> [    2.853906] ---[ end trace 02b9cbc0208a022b ]---
> [    2.858486] ubi1 error: ubi_scan_fastmap: Attach by fastmap failed, doing
> a full scan!
>
> After some analysis I've found that the fault is not a lost PEB as the
> comment above the warning seems to indicate but instead a duplicate entry.
> One of the PEBs is present both in the free list and the WL pool. The PEB is
> free so scan_pool() puts it in the free list again with the result that
> count_fastmap_pebs() returns a higher count than expected due to the now
> duplicated entry in the free list.
>
> I've done some debugging of how the fastmap is written and have found the
> following chain of events causing the duplicate entry:
> - ubi_update_fastmap() calls ubi_refill_pools() resulting in the pools
> having only unused PEBs.
> - ubi_update_fastmap() continues to run without wl_lock while it allocates a
> PEB for the fastmap.
> - wear_leveling_worker() wakes up and tries to move a PEB but fails. I've
> seen both "PEB x has no VID header" and ubi_eba_copy_leb() returning
> MOVE_RETRY, but both result in a goto to out_not_moved which will call
> do_sync_erase() that results in the PEB being added to the free list.
> - ubi_write_fastmap() takes wl_lock and creates a fastmap which includes a
> pool with used entries and the used PEB also being in the free list.
>
> That's how far I've followed this. I guess either the worker thread needs to
> stay away from the pools until ubi_update_fastmap() has completed or this
> error needs to checked for and handled either in ubi_write_fastmap() or
> ubi_scan_fastmap().

Hehe, you're lucky I've recently fixed an issue in this area, can you
please try:
http://lists.infradead.org/pipermail/linux-mtd/2016-August/068919.html

I did these fixes on top of an rather old customer kernel and started
upstreaming
them.

-- 
Thanks,
//richard
