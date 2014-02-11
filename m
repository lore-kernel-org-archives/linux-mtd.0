Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDNAM-0000K0-VC
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 23:55:03 +0000
Date: Tue, 11 Feb 2014 15:54:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Zefan <lizefan@huawei.com>
Subject: Re: [PATCH 2/3] jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
Message-Id: <20140211155440.62c5e90eb498ec2964258969@linux-foundation.org>
In-Reply-To: <52F5934B.4000101@huawei.com>
References: <52F592F2.6010008@huawei.com>
	<52F5934B.4000101@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 8 Feb 2014 10:15:39 +0800 Li Zefan <lizefan@huawei.com> wrote:

> We triggered soft-lockup under stress test on 2.6.34 kernel.
> 
> BUG: soft lockup - CPU#1 stuck for 60009ms! [lockf2.test:14488]
> ...
> [<bf09a4d4>] (jffs2_do_reserve_space+0x420/0x440 [jffs2])
> [<bf09a528>] (jffs2_reserve_space_gc+0x34/0x78 [jffs2])
> [<bf0a1350>] (jffs2_garbage_collect_dnode.isra.3+0x264/0x478 [jffs2])
> [<bf0a2078>] (jffs2_garbage_collect_pass+0x9c0/0xe4c [jffs2])
> [<bf09a670>] (jffs2_reserve_space+0x104/0x2a8 [jffs2])
> [<bf09dc48>] (jffs2_write_inode_range+0x5c/0x4d4 [jffs2])
> [<bf097d8c>] (jffs2_write_end+0x198/0x2c0 [jffs2])
> [<c00e00a4>] (generic_file_buffered_write+0x158/0x200)
> [<c00e14f4>] (__generic_file_aio_write+0x3a4/0x414)
> [<c00e15c0>] (generic_file_aio_write+0x5c/0xbc)
> [<c012334c>] (do_sync_write+0x98/0xd4)
> [<c0123a84>] (vfs_write+0xa8/0x150)
> [<c0123d74>] (sys_write+0x3c/0xc0)]
> 
> Fix this by adding a cond_resched() in the while loop.
> 
> ...
>
> --- a/fs/jffs2/nodemgmt.c
> +++ b/fs/jffs2/nodemgmt.c
> @@ -216,15 +216,20 @@ int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
>  
>  	jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
>  
> -	spin_lock(&c->erase_completion_lock);
> -	while(ret == -EAGAIN) {
> +	while (true) {
> +		spin_lock(&c->erase_completion_lock);
>  		ret = jffs2_do_reserve_space(c, minsize, len, sumsize);
>  		if (ret) {
>  			jffs2_dbg(1, "%s(): looping, ret is %d\n",
>  				  __func__, ret);
>  		}
> +		spin_unlock(&c->erase_completion_lock);
> +
> +		if (ret == -EAGAIN)
> +			cond_resched();
> +		else
> +			break;
>  	}
> -	spin_unlock(&c->erase_completion_lock);
>  	if (!ret)
>  		ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);

Looks OK.  We can do this:

--- a/fs/jffs2/nodemgmt.c~jffs2-avoid-soft-lockup-in-jffs2_reserve_space_gc-fix
+++ a/fs/jffs2/nodemgmt.c
@@ -211,7 +211,7 @@ out:
 int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
 			   uint32_t *len, uint32_t sumsize)
 {
-	int ret = -EAGAIN;
+	int ret;
 	minsize = PAD(minsize);
 
 	jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
_


I now have four jffs2 bugfixes but cannot unload them on anyone. 
Waddup?
