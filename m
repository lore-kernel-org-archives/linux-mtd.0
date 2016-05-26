Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5vp5-0004YD-VS
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 13:59:41 +0000
Subject: Re: [PATCH] fs: ubifs: Replace kmem_cache_alloc/memset with
 kmem_cache_zalloc
To: Salah Triki <salah.triki@acm.org>, dedekind1@gmail.com,
 adrian.hunter@intel.com
References: <1464213858-4032-1-git-send-email-salah.triki@acm.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5747012E.2070803@nod.at>
Date: Thu, 26 May 2016 15:59:10 +0200
MIME-Version: 1.0
In-Reply-To: <1464213858-4032-1-git-send-email-salah.triki@acm.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.05.2016 um 00:04 schrieb Salah Triki:
> Use kmem_cache_zalloc instead of kmem_cache_alloc/memset.
> 
> Signed-off-by: Salah Triki <salah.triki@acm.org>
> ---
>  fs/ubifs/super.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 7034995..f509200 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -262,12 +262,10 @@ static struct inode *ubifs_alloc_inode(struct super_block *sb)
>  {
>  	struct ubifs_inode *ui;
>  
> -	ui = kmem_cache_alloc(ubifs_inode_slab, GFP_NOFS);
> +	ui = kmem_cache_zalloc(ubifs_inode_slab, GFP_NOFS);
>  	if (!ui)
>  		return NULL;
>  
> -	memset((void *)ui + sizeof(struct inode), 0,
> -	       sizeof(struct ubifs_inode) - sizeof(struct inode));

Your patch fails to explain why it is needed.
Also note that the path slightly changes the semantics.

Thanks,
//richard
