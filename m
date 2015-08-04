Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMiUK-0003yY-Ip
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 20:07:05 +0000
Received: by pacgq8 with SMTP id gq8so16106288pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2015 13:06:42 -0700 (PDT)
Date: Tue, 4 Aug 2015 13:06:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Salah Triki <salah.triki@acm.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] jffs2: Remove NULL checks from jffs2_destroy_slab_caches
Message-ID: <20150804200639.GP10676@google.com>
References: <1438717590-4263-1-git-send-email-salah.triki@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438717590-4263-1-git-send-email-salah.triki@acm.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 04, 2015 at 08:46:30PM +0100, Salah Triki wrote:
> kmem_cache_destroy can be called with NULL values. Thus, the checks that
> precede the calls are useless.

This isn't *currently* true. Only after a bit of work did I find that
this is queued to change in the next release -- akpm has a patch:

commit 3e54c0cd3abdca0cf91854278c8633fc7df6beb1
Author: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Date:   Thu Jul 30 09:55:36 2015 +1000

    mm/slab_common: allow NULL cache pointer in kmem_cache_destroy()

Please provide the appropriate context next time. And for the moment, I will
not apply this, because this does not work on the current MTD development tree.
Try your patch bomb on the next release, as it's not worth my time to
cross-merge a -next branch just for a "cleanup".

Brian

> Signed-off-by: Salah Triki <salah.triki@acm.org>
> ---
>  fs/jffs2/malloc.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
> index b8fd651..ce11897 100644
> --- a/fs/jffs2/malloc.c
> +++ b/fs/jffs2/malloc.c
> @@ -97,25 +97,16 @@ int __init jffs2_create_slab_caches(void)
>  
>  void jffs2_destroy_slab_caches(void)
>  {
> -	if(full_dnode_slab)
> -		kmem_cache_destroy(full_dnode_slab);
> -	if(raw_dirent_slab)
> -		kmem_cache_destroy(raw_dirent_slab);
> -	if(raw_inode_slab)
> -		kmem_cache_destroy(raw_inode_slab);
> -	if(tmp_dnode_info_slab)
> -		kmem_cache_destroy(tmp_dnode_info_slab);
> -	if(raw_node_ref_slab)
> -		kmem_cache_destroy(raw_node_ref_slab);
> -	if(node_frag_slab)
> -		kmem_cache_destroy(node_frag_slab);
> -	if(inode_cache_slab)
> -		kmem_cache_destroy(inode_cache_slab);
> +	kmem_cache_destroy(full_dnode_slab);
> +	kmem_cache_destroy(raw_dirent_slab);
> +	kmem_cache_destroy(raw_inode_slab);
> +	kmem_cache_destroy(tmp_dnode_info_slab);
> +	kmem_cache_destroy(raw_node_ref_slab);
> +	kmem_cache_destroy(node_frag_slab);
> +	kmem_cache_destroy(inode_cache_slab);
>  #ifdef CONFIG_JFFS2_FS_XATTR
> -	if (xattr_datum_cache)
> -		kmem_cache_destroy(xattr_datum_cache);
> -	if (xattr_ref_cache)
> -		kmem_cache_destroy(xattr_ref_cache);
> +	kmem_cache_destroy(xattr_datum_cache);
> +	kmem_cache_destroy(xattr_ref_cache);
>  #endif
>  }
>  
> -- 
> 1.9.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
