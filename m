Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHFOk-0007xf-Kh
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 18:02:43 +0000
Received: by pachj5 with SMTP id hj5so104916608pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 11:02:21 -0700 (PDT)
Date: Mon, 20 Jul 2015 11:02:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: chenjie <chenjie6@huawei.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "zhihui.gao@huawei.com" <zhihui.gao@huawei.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: The patch  e72e6497e74811e01d72b4c1b7537b3aea3ee857 have a bug
Message-ID: <20150720180218.GG24125@google.com>
References: <5562F56B.3050900@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5562F56B.3050900@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi chenji,

I just noticed this old report. Not sure I can be much direct help at
the moment, but this looks interesting.

(And ping, David!)

On Mon, May 25, 2015 at 06:11:55PM +0800, chenjie wrote:
> e72e6497e74811e01d72b4c1b7537b3aea3ee857:
> 
> +	if (insert_inode_locked(inode) < 0) {
> +		make_bad_inode(inode);
> +		unlock_new_inode(inode);
> +		iput(inode);
> +		return ERR_PTR(-EINVAL);
> +	}

What makes you suspect the above commit? Just by code inspection?
Bisection? I haven't followed through the code logic yet, I just want to
see your thought process.

> 
> 
> Creat node by insert_inode_locked, write dnode successfully but dirent
> not writed ,so the gc or jffs2_reserve_space may read the block which dnode
> writed, the dnode can not been readed because it was created unfinished.
> 
> lockf2.test     D c02dead8     0 11666      1 0x00000001
> locked:
> c90f9be8   &inode->i_mutex  0  [<c00bf158>] generic_file_aio_write+0x40/0xb0	
> c2c54c44   &c->alloc_sem    1  [<bf056f9c>] jffs2_garbage_collect_pass+0x1c/0xf08 [jffs2]	
> [<c02dead8>] (__schedule+0x458/0x604) from [<c0114090>] (inode_wait+0x8/0x10)
> [<c0114090>] (inode_wait+0x8/0x10) from [<c02dd050>] (__wait_on_bit+0x54/0xa0)
> [<c02dd050>] (__wait_on_bit+0x54/0xa0) from [<c02dd114>] (out_of_line_wait_on_bit+0x78/0x84)
> [<c02dd114>] (out_of_line_wait_on_bit+0x78/0x84) from [<c01157a0>] (iget_locked+0x90/0x1b0)
> [<c01157a0>] (iget_locked+0x90/0x1b0) from [<bf059fe8>] (jffs2_iget+0xc/0x344 [jffs2])
> [<bf059fe8>] (jffs2_iget+0xc/0x344 [jffs2]) from [<bf05a6fc>] (jffs2_gc_fetch_inode+0x104/0x158 [jffs2])
> [<bf05a6fc>] (jffs2_gc_fetch_inode+0x104/0x158 [jffs2]) from [<bf0577f0>] (jffs2_garbage_collect_pass+0x870/0xf08 [jffs2])
> [<bf0577f0>] (jffs2_garbage_collect_pass+0x870/0xf08 [jffs2]) from [<bf051248>] (jffs2_reserve_space+0x154/0x3b4 [jffs2])
> [<bf051248>] (jffs2_reserve_space+0x154/0x3b4 [jffs2]) from [<bf053eac>] (jffs2_write_inode_range+0x58/0x3ac [jffs2])
> [<bf053eac>] (jffs2_write_inode_range+0x58/0x3ac [jffs2]) from [<bf04ec20>] (jffs2_write_end+0x11c/0x224 [jffs2])
> [<bf04ec20>] (jffs2_write_end+0x11c/0x224 [jffs2]) from [<c00bdfa4>] (generic_file_buffered_write+0x160/0x23c)
> [<c00bdfa4>] (generic_file_buffered_write+0x160/0x23c) from [<c00bf0ac>] (__generic_file_aio_write+0x328/0x394)
> [<c00bf0ac>] (__generic_file_aio_write+0x328/0x394) from [<c00bf16c>] (generic_file_aio_write+0x54/0xb0)
> [<c00bf16c>] (generic_file_aio_write+0x54/0xb0) from [<c00fdc24>] (do_sync_write+0x74/0x98)
> [<c00fdc24>] (do_sync_write+0x74/0x98) from [<c00fe550>] (vfs_write+0xcc/0x174)
> [<c00fe550>] (vfs_write+0xcc/0x174) from [<c00fe8a8>] (SyS_write+0x38/0x64)
> [<c00fe8a8>] (SyS_write+0x38/0x64) from [<c000f0c0>] (ret_fast_syscall+0x0/0x58)
> 
> 
> please give me some advise,thank you.

Have you retested on the latest kernel? Or, what kernel are you testing?

Brian
