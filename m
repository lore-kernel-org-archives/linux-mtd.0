Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfUss-0007C7-0k
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 13:49:14 +0000
Message-ID: <3921496816192fe04ed3cdbb562fc6d8.squirrel@www.codeaurora.org>
In-Reply-To: <20140430121846.GI1821@guralp.com>
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
 <20140430121846.GI1821@guralp.com>
Date: Wed, 30 Apr 2014 13:48:51 -0000
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
From: "Dolev Raviv" <draviv@codeaurora.org>
To: "Laurence Withers" <lwithers@guralp.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hujianyang and Laurence,
I'm hitting an assertion in very similar code during the callback
ubifs_releasepage(). I'm quite new to this code area, and currently diving
in to understanding the race you described (before I attempt to look at
the patch).

I was wondering if this assertion is related?

[  862.695278] UBIFS assert failed in ubifs_releasepage at 1434 (pid 11088)
[  862.700952] CPU: 0 PID: 11088 Comm: busybox Tainted: G        W   
3.10.0+ #1
[  862.714460] [<c00147f4>] (unwind_backtrace+0x0/0x11c) from [<c0011bc0>]
(show_stack+0x10/0x14)
[  862.722047] [<c0011bc0>] (show_stack+0x10/0x14) from [<c0187fe8>]
(ubifs_releasepage+0x70/0xb8)
[  862.746573] [<c0187fe8>] (ubifs_releasepage+0x70/0xb8) from
[<c00c7228>] (try_to_release_page+0x44/0x5c)
[  862.755865] [<c00c7228>] (try_to_release_page+0x44/0x5c) from
[<c00d3b58>] (invalidate_inode_page+0x60/0x94)
[  862.764955] vbat_low_handler: vbat low
[  862.768728] [<c00d3b58>] (invalidate_inode_page+0x60/0x94) from
[<c00d3c00>] (invalidate_mapping_pages+0x74/0x114)
[  862.779244] [<c00d3c00>] (invalidate_mapping_pages+0x74/0x114) from
[<c0145004>] (drop_pagecache_sb+0x7c/0xbc)
[  862.789079] [<c0145004>] (drop_pagecache_sb+0x7c/0xbc) from
[<c0104ab4>] (iterate_supers+0x74/0xc8)
[  862.798092] [<c0104ab4>] (iterate_supers+0x74/0xc8) from [<c0145088>]
(drop_caches_sysctl_handler+0x44/0x90)
[  862.808907] [<c0145088>] (drop_caches_sysctl_handler+0x44/0x90) from
[<c014f280>] (proc_sys_call_handler+0x84/0xa0)
[  862.821868] [<c014f280>] (proc_sys_call_handler+0x84/0xa0) from
[<c014f2ac>] (proc_sys_write+0x10/0x14)
[  862.830349] [<c014f2ac>] (proc_sys_write+0x10/0x14) from [<c01022fc>]
(vfs_write+0xd4/0x16c)
[  862.838719] [<c01022fc>] (vfs_write+0xd4/0x16c) from [<c010263c>]
(SyS_write+0x3c/0x60)
[  862.846738] [<c010263c>] (SyS_write+0x3c/0x60) from [<c000e440>]
(ret_fast_syscall+0x0/0x30)


> On Wed, Apr 30, 2014 at 02:06:06PM +0800, hujianyang wrote:
>> According to this situation, my v2 fix returns from page_mkwrite
>> without performing unlock_page. We return VM_FAULT_LOCKED instead
>> of just return 0. After doing this, the race above will not happen.
>
> Hi,
>
> I have been testing patch v1 on our hardware. Normally, at higher data
> rates,
> we can hit the assert in under 8 hours. So far I have been running for 48
> hours on one system without seeing the assert message.
>
> I will now switch to running v2 and see if I can't find a few more systems
> to
> run in parallel.
>
> Many thanks, and bye for now,
> --
> Laurence Withers, <lwithers@guralp.com>
> http://www.guralp.com/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
