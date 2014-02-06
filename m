Received: from chrysocolla.lwithers.me.uk ([2001:41c8:1:5763::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBYAa-0005s7-7y
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 23:15:45 +0000
Received: from rhodium.guralpsystems.co.uk
 ([2001:8b0:1a5:0:1e6f:65ff:fe94:20b4] helo=rhodium.platinum.guralp.com)
 by chrysocolla.lwithers.me.uk with esmtpsa
 (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
 (envelope-from <lwithers@guralp.com>) id 1WBY9x-0006CR-JR
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 23:15:08 +0000
Received: from lwithers by rhodium.platinum.guralp.com with local (Exim 4.80)
 (envelope-from <lwithers@guralp.com>) id 1WBY9x-0007zA-2D
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 23:15:05 +0000
Date: Thu, 6 Feb 2014 23:15:04 +0000
From: Laurence Withers <lwithers@guralp.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20140206231504.GA26821@guralp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Subject: UBIFS assert failed in ubifs_set_page_dirty
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>From time to time I'm seeing some assertion failures in UBIFS. The system is
running a mainline 3.10 kernel (though I've previously seen this on 3.2) with
only drivers/board support for my particular setup. There are no vendor
patches, MM patches or FS patches. The system has been run extensively with
the mtdtests kernel modules too.

There is some evidence that this corresponds to memory pressure: it only
seems to trigger when our userspace applications (which among other things
are writing to memory-mapped ring buffers, all on UBIFS volumes) are writing
at higher data rates. This only happens after several hours of normal
operation.

The first assertion failure, triggered by one of the processes writing to a
memory-mapped ring buffer, is as follows:

 [19788.903790] UBIFS assert failed in ubifs_set_page_dirty at 1421 (pid 2121)
 [19788.910734] CPU: 0 PID: 2121 Comm: gdi2gcf Not tainted 3.10.0cmg-das+ #645 
 [19788.953116] [<c0012b6c>] (unwind_backtrace+0x0/0xec) from [<c0010ef8>] (show_stack+0x20/0x24)
 [19788.961762] [<c0010ef8>] (show_stack+0x20/0x24) from [<c03c09d4>] (dump_stack+0x20/0x28)
 [19788.992887] [<c03c09d4>] (dump_stack+0x20/0x28) from [<c0177460>] (ubifs_set_page_dirty+0x48/0x5c)
 [19789.001954] [<c0177460>] (ubifs_set_page_dirty+0x48/0x5c) from [<c00b2ae0>] (set_page_dirty+0x5c/0x9c)
 [19789.019483] [<c00b2ae0>] (set_page_dirty+0x5c/0x9c) from [<c00c2540>] (__do_fault+0x3c4/0x470)
 [19789.029815] [<c00c2540>] (__do_fault+0x3c4/0x470) from [<c00c4df8>] (handle_pte_fault+0x270/0xb84)
 [19789.040442] [<c00c4df8>] (handle_pte_fault+0x270/0xb84) from [<c00c57bc>] (handle_mm_fault+0xb0/0xd8)
 [19789.051283] [<c00c57bc>] (handle_mm_fault+0xb0/0xd8) from [<c03c5d30>] (do_page_fault+0x188/0x3bc)
 [19789.061927] [<c03c5d30>] (do_page_fault+0x188/0x3bc) from [<c00085ec>] (do_DataAbort+0x44/0xa8)
 [19789.072234] [<c00085ec>] (do_DataAbort+0x44/0xa8) from [<c03c43e4>] (__dabt_usr+0x44/0x60)
 [19789.082046] Exception stack(0xc2c7bfb0 to 0xc2c7bff8)
 [19789.088604] bfa0:                                     b64d4000 01747ff0 00000360 4a0000c8
 [19789.098324] bfc0: c4b6796e f01c1f45 fa24b500 d5ffffff 0d010100 000003e8 000166a8 017468b0
 [19789.110848] bfe0: edf9f5fb be933ac4 0f0cfe13 b6c422e0 20000010 ffffffff

shortly followed by:

 [19797.503315] UBIFS assert failed in ubifs_writepage at 1009 (pid 2121)
 [19797.509825] CPU: 0 PID: 2121 Comm: gdi2gcf Not tainted 3.10.0cmg-das+ #645 
 [19797.521942] [<c0012b6c>] (unwind_backtrace+0x0/0xec) from [<c0010ef8>] (show_stack+0x20/0x24)
 [19797.532198] [<c0010ef8>] (show_stack+0x20/0x24) from [<c03c09d4>] (dump_stack+0x20/0x28)
 [19797.541963] [<c03c09d4>] (dump_stack+0x20/0x28) from [<c0176bf4>] (ubifs_writepage+0x94/0x22c)
 [19797.552171] [<c0176bf4>] (ubifs_writepage+0x94/0x22c) from [<c00b2a0c>] (__writepage+0x24/0x54)
 [19797.563086] [<c00b2a0c>] (__writepage+0x24/0x54) from [<c00b305c>] (write_cache_pages+0x28c/0x3c8)
 [19797.576415] [<c00b305c>] (write_cache_pages+0x28c/0x3c8) from [<c00b31e8>] (generic_writepages+0x50/0x70)
 [19797.588095] [<c00b31e8>] (generic_writepages+0x50/0x70) from [<c00b46a0>] (do_writepages+0x3c/0x48)
 [19797.598831] [<c00b46a0>] (do_writepages+0x3c/0x48) from [<c00ab364>] (__filemap_fdatawrite_range+0x70/0x7c)
 [19797.610182] [<c00ab364>] (__filemap_fdatawrite_range+0x70/0x7c) from [<c00ab48c>] (filemap_write_and_wait_range+0x44/0x84)
 [19797.623006] [<c00ab48c>] (filemap_write_and_wait_range+0x44/0x84) from [<c0176dd4>] (ubifs_fsync+0x48/0xc0)
 [19797.634342] [<c0176dd4>] (ubifs_fsync+0x48/0xc0) from [<c01034f8>] (vfs_fsync_range+0x44/0x54)
 [19797.644566] [<c01034f8>] (vfs_fsync_range+0x44/0x54) from [<c010353c>] (vfs_fsync+0x34/0x3c)
 [19797.654626] [<c010353c>] (vfs_fsync+0x34/0x3c) from [<c0103608>] (do_fsync+0x38/0x60)
 [19797.664416] [<c0103608>] (do_fsync+0x38/0x60) from [<c0103a00>] (SyS_fdatasync+0x1c/0x20)
 [19797.676560] [<c0103a00>] (SyS_fdatasync+0x1c/0x20) from [<c000dea0>] (ret_fast_syscall+0x0/0x44)
 [19797.688599] UBIFS assert failed in do_writepage at 936 (pid 2121)
 [19797.696302] CPU: 0 PID: 2121 Comm: gdi2gcf Not tainted 3.10.0cmg-das+ #645 
 [19797.704803] [<c0012b6c>] (unwind_backtrace+0x0/0xec) from [<c0010ef8>] (show_stack+0x20/0x24)
 [19797.714961] [<c0010ef8>] (show_stack+0x20/0x24) from [<c03c09d4>] (dump_stack+0x20/0x28)
 [19797.724770] [<c03c09d4>] (dump_stack+0x20/0x28) from [<c0176abc>] (do_writepage+0x144/0x1e8)
 [19797.734776] [<c0176abc>] (do_writepage+0x144/0x1e8) from [<c0176d2c>] (ubifs_writepage+0x1cc/0x22c)
 [19797.745400] [<c0176d2c>] (ubifs_writepage+0x1cc/0x22c) from [<c00b2a0c>] (__writepage+0x24/0x54)
 [19797.755791] [<c00b2a0c>] (__writepage+0x24/0x54) from [<c00b305c>] (write_cache_pages+0x28c/0x3c8)
 [19797.768717] [<c00b305c>] (write_cache_pages+0x28c/0x3c8) from [<c00b31e8>] (generic_writepages+0x50/0x70)
 [19797.780001] [<c00b31e8>] (generic_writepages+0x50/0x70) from [<c00b46a0>] (do_writepages+0x3c/0x48)
 [19797.802655] [<c00b46a0>] (do_writepages+0x3c/0x48) from [<c00ab364>] (__filemap_fdatawrite_range+0x70/0x7c)
 [19797.839018] [<c00ab364>] (__filemap_fdatawrite_range+0x70/0x7c) from [<c00ab48c>] (filemap_write_and_wait_range+0x44/0x84)
 [19797.851770] [<c00ab48c>] (filemap_write_and_wait_range+0x44/0x84) from [<c0176dd4>] (ubifs_fsync+0x48/0xc0)
 [19797.865732] [<c0176dd4>] (ubifs_fsync+0x48/0xc0) from [<c01034f8>] (vfs_fsync_range+0x44/0x54)
 [19797.876072] [<c01034f8>] (vfs_fsync_range+0x44/0x54) from [<c010353c>] (vfs_fsync+0x34/0x3c)
 [19797.886194] [<c010353c>] (vfs_fsync+0x34/0x3c) from [<c0103608>] (do_fsync+0x38/0x60)
 [19797.896192] [<c0103608>] (do_fsync+0x38/0x60) from [<c0103a00>] (SyS_fdatasync+0x1c/0x20)
 [19797.906013] [<c0103a00>] (SyS_fdatasync+0x1c/0x20) from [<c000dea0>] (ret_fast_syscall+0x0/0x44)

This then seems to send the system into a spiral of trouble involving the
following two assertion failures:

 [20050.671332] UBIFS assert failed in ubifs_release_budget at 567 (pid 2196)
 [20051.141033] UBIFS assert failed in ubifs_budget_space at 464 (pid 2168)

Does anybody know where to start looking to discover the root cause of this
problem?

>From a little digging it looks like some of the other FS do exactly the same
as ubifs_set_page_dirty(), except that they simply pass back the return value
from __set_page_dirty_nobuffers() without checking it. However, given that
this first assert is always followed by more things going wrong, it does seem
there is more going on here.

Many thanks, and bye for now,
-- 
Laurence Withers, <lwithers@guralp.com>                http://www.guralp.com/
