Received: from mail-qa0-x232.google.com ([2607:f8b0:400d:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIUAj-0007Db-Mg
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 02:24:34 +0000
Received: by mail-qa0-f50.google.com with SMTP id cm18so1480995qab.9
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 18:24:11 -0800 (PST)
Date: Tue, 25 Feb 2014 18:17:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: akpm@linux-foundation.org
Subject: Re: [patch 3/4] jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
Message-ID: <20140226021709.GD4194@ld-irv-0074>
References: <20140212204456.E010B5A40F6@corp2gmr1-2.hot.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140212204456.E010B5A40F6@corp2gmr1-2.hot.corp.google.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 lizefan@huawei.com, dwmw2@infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd

Hi Li,

On Wed, Feb 12, 2014 at 12:44:56PM -0800, Andrew Morton wrote:
> From: Li Zefan <lizefan@huawei.com>
> Subject: jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
> 
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

This patch looks good.

> [akpm@linux-foundation.org: don't initialize `ret']
> Signed-off-by: Li Zefan <lizefan@huawei.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  fs/jffs2/nodemgmt.c |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff -puN fs/jffs2/nodemgmt.c~jffs2-avoid-soft-lockup-in-jffs2_reserve_space_gc fs/jffs2/nodemgmt.c
> --- a/fs/jffs2/nodemgmt.c~jffs2-avoid-soft-lockup-in-jffs2_reserve_space_gc
> +++ a/fs/jffs2/nodemgmt.c
> @@ -211,20 +211,25 @@ out:
>  int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
>  			   uint32_t *len, uint32_t sumsize)
>  {
> -	int ret = -EAGAIN;
> +	int ret;
>  	minsize = PAD(minsize);
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

Just curious: would this be a place to use cond_resched_lock(), and keep
the lock outside the loop?

> +		else
> +			break;
>  	}
> -	spin_unlock(&c->erase_completion_lock);
>  	if (!ret)
>  		ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
>  

Anyway, pushed to l2-mtd.git.

Thanks,
Brian
