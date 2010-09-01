Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqsVN-0004zk-59
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 18:57:54 +0000
Received: by pzk3 with SMTP id 3so3525817pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 11:57:51 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>, Adrian.Hunter@nokia.com
In-Reply-To: <AANLkTinHmSpucwL4nKc5RNaBVc6fdt7bT_hTd2-fkQhB@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
	<AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
	<AANLkTinHmSpucwL4nKc5RNaBVc6fdt7bT_hTd2-fkQhB@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 21:57:48 +0300
Message-ID: <1283367468.2209.33.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: JamesLNute@eaton.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2010-08-31 at 11:36 -0400, Matthew L. Creech wrote:
> UBIFS error (pid 455): ubifs_read_node: bad node type (255 but expected 1)
> UBI DBG (pid 455): ubi_is_mapped: test LEB 0:7746
> UBIFS error (pid 455): ubifs_read_node: bad node at LEB 7746:110360,
> LEB mapping status 0

OK, so this LEB is unmapped.

> Not a node, first 24 bytes:
> 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff                          ........................
> Call Trace:
> [c7b69bf0] [c0008410] show_stack+0x54/0x134 (unreliable)
> [c7b69c30] [c00cfeb8] ubifs_read_node+0x2f0/0x308
> [c7b69c60] [c00ef4a8] ubifs_tnc_read_node+0x60/0x188
> [c7b69ca0] [c00d34a4] ubifs_tnc_locate+0xd0/0x1d8
> [c7b69d00] [c00c5818] do_readpage+0x1d0/0x4b8
> [c7b69d50] [c00c7410] ubifs_readpage+0x3ec/0x400
> --- Exception: 901 at flush_dcache_icache_page+0x24/0x30
>     LR = flush_dcache_icache_page+0x20/0x30
> [c7b69db0] [c0048c44] generic_file_aio_read+0x454/0x630 (unreliable)
> [c7b69e50] [c00698d4] do_sync_read+0xa4/0xe0
> [c7b69ef0] [c0069f5c] vfs_read+0xc4/0x16c
> [c7b69f10] [c006a29c] sys_read+0x4c/0x80
> [c7b69f40] [c000f40c] ret_from_syscall+0x0/0x38
> --- Exception: c01 at 0xfb45b4c
>     LR = 0xfb45b34
> 
> Is this what was expected?

Well, it is what I thought it wold be.

> FYI, this particular device only has corruption on a file that's not
> boot-critical, so it continues the boot process somewhat normally.  A
> partial log (cut off once it seemed that nothing else useful was
> happening) is here, if that's of any use:
> 
> http://mcreech.com/work/ubifs-mapping-status.txt
> 
> It's also worth mentioning that when enabling UBI & UBIFS self checks
> on this device, the boot process halts after some errors are detected.
>  The pertinent portion is:
> 
> UBIFS error (pid 1): scan_check_cb: bad accounting of LEB 31: free 0,
> dirty 560 flags 0x0, should be free 129024, dirty 0
> (pid 1) start dumping LEB 31
> UBIFS DBG (pid 1): ubifs_start_scan: scan LEB 31:0
> UBI DBG (pid 1): ubi_leb_read: read 129024 bytes from LEB 0:31:0
> UBI DBG (pid 1): ubi_eba_read_leb: read 129024 bytes from offset 0 of
> LEB 0:31 (unmapped)
> UBIFS DBG (pid 1): ubifs_scan: look at LEB 31:0 (129024 bytes left)
> UBIFS DBG (pid 1): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1): ubifs_end_scan: stop scanning LEB 31 at offset 0
> LEB 31 has 0 nodes ending at 0
> (pid 1) finish dumping LEB 31
> UBIFS error (pid 1): do_commit: commit failed, error -22
> UBIFS warning (pid 1): ubifs_ro_mode: switched to read-only mode, error -22
> Call Trace:
> [c7827d00] [c0008410] show_stack+0x54/0x134 (unreliable)
> [c7827d40] [c00ce774] ubifs_ro_mode+0x60/0x70
> [c7827d50] [c00daf40] do_commit+0x5f0/0x5fc
> [c7827dd0] [c00eab14] ubifs_rcvry_gc_commit+0x440/0x46c
> [c7827e10] [c00cc900] ubifs_get_sb+0xe60/0x1734
> [c7827ea0] [c006c794] vfs_kern_mount+0x68/0xf0
> [c7827ed0] [c006c85c] do_kern_mount+0x40/0xf0
> [c7827f00] [c0080dd8] do_mount+0x634/0x6a0
> [c7827f50] [c0080f28] sys_mount+0x90/0xcc
> [c7827f80] [c02cdec8] mount_block_root+0x108/0x284
> [c7827fd0] [c02ce288] prepare_namespace+0xac/0x1e8
> [c7827fe0] [c02cd820] kernel_init+0x144/0x154
> [c7827ff0] [c000f230] kernel_thread+0x4c/0x68
> 
> I've no idea if this is related or not, but there's a full log of that
> run available here:
> 
> http://mcreech.com/work/ubifs-self-checks.txt
> 
> Please let me know if there are any other tests you'd like run on this
> device.  Otherwise, we'll probably try booting 2.6.35 and see what
> happens.

I need to take some time and carefully look at this. And think. Please,
make a copy of the contents of your flash, if you can. 

>From your side what would be helpful is if you tried to figure out how
to reproduce this. Since I do not have your HW I cannot reproduce this,
so the only thing I can do is to ask you to reproduce the problem with
various debugging patches.

CCing Adrian - may be he has ideas.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
