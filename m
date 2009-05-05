Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1CnW-0004go-Ao
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 05:02:46 +0000
Subject: Re: ubifs corrupt
From: Artem Bityutskiy <dedekind@infradead.org>
To: jerry <jerrydreaming@gmail.com>
In-Reply-To: <71103bce0904271851v4004cfadp465f8fee2519f836@mail.gmail.com>
References: <71103bce0904271851v4004cfadp465f8fee2519f836@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 May 2009 08:02:17 +0300
Message-Id: <1241499737.3760.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-28 at 09:51 +0800, jerry wrote:
> > Do you have this patch?
> >
> >        http://git.infradead.org/ubifs-2.6.git?a=commitdiff;h=de0975781a1a8bc92e07eb7681d10ef9bb5e6df9
> >
> 1.I have  this patch:
>      http://git.infradead.org/ubifs-2.6.git?a=commitdiff;h=de0975781a1a8bc92e07eb7681d10ef9bb5e6df9
> 2.The ubifs is updated to 2.6.28.
> 3. kernel version is 2.6.24.
> 4.The information:
> UBIFS error (pid 434): ubifs_read_node: bad node type (255 but expected 2)
> UBIFS error (pid 434): ubifs_read_node: bad node at LEB 16:512360
> Call Trace:
> [<8002057c>] dump_stack+0x8/0x34
> [<80187028>] ubifs_read_node+0x3ac/0x404
> [<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
> [<8018b5b4>] tnc_read_node_nm+0x88/0x28c
> [<8018cf44>] ubifs_tnc_next_ent+0x1cc/0x300
> [<8017ef58>] ubifs_readdir+0x210/0x674
> [<800bf38c>] vfs_readdir+0xd0/0xfc
> [<800bf424>] sys_getdents64+0x6c/0x100
> [<800227b0>] stack_done+0x20/0x3c
> UBIFS error (pid 434): ubifs_readdir: cannot find next direntry, error -22
> UBIFS error (pid 434): ubifs_read_node: bad node type (255 but expected 2)
> UBIFS error (pid 434): ubifs_read_node: bad node at LEB 16:512360
> Call Trace:
> [<8002057c>] dump_stack+0x8/0x34
> [<80187028>] ubifs_read_node+0x3ac/0x404
> [<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
> [<8018b5b4>] tnc_read_node_nm+0x88/0x28c
> [<8018cf44>] ubifs_tnc_next_ent+0x1cc/0x300
> [<8017ef58>] ubifs_readdir+0x210/0x674
> [<800bf38c>] vfs_readdir+0xd0/0xfc
> [<800bf520>] sys_getdents+0x68/0xfc
> [<800227b0>] stack_done+0x20/0x3c
> UBIFS error (pid 434): ubifs_readdir: cannot find next direntry, error -22
> # dmesg
> ff ff ff                          ........................
> Call Trace:
> [<8002057c>] dump_stack+0x8/0x34
> [<80187028>] ubifs_read_node+0x3ac/0x404
> [<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
> [<8018b5b4>] tnc_read_node_nm+0x88/0x28c
> [<8018e298>] ubifs_tnc_locate+0x1e0/0x22c
> [<8018e32c>] ubifs_tnc_lookup_nm+0x48/0x2a0
> [<8017fe90>] ubifs_lookup+0xf0/0x358
> [<800b71fc>] do_lookup+0x1b0/0x1fc
> [<800b95ec>] __link_path_walk+0x850/0x19a0
> [<800ba914>] link_path_walk+0x1d8/0x3ac
> [<800bb0c8>] do_path_lookup+0x188/0x6dc
> [<800bc0f4>] __user_walk_fd+0x54/0x88
> [<800a9fec>] sys_faccessat+0xe0/0x198
> [<800227b0>] stack_done+0x20/0x3c
> UBIFS error (pid 368): ubifs_read_node: bad node type (255 but expected 2)
> UBIFS error (pid 368): ubifs_read_node: bad node at LEB 16:512360
> Not a node, first 24 bytes:<7>00000000: ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ........................
> 5.when I select the UBIFS_FS_DEBUG_CHKS = y,the file system is ok.But
> it is very slow.

Well, the error is that ubifs tries to read a directory entry,
but finds empty space there. It might be related to the way you
join you NAND chips.

Could you try to reproduce this error on a simpler setup? E.g., 
if you do not have multiple chips joined into one, or on nandsim?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
