Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOBu4-0005P8-F5
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 21:43:45 +0000
Subject: Re: [PATCH v2 25/35] ubifs: record quota information about inode in
 ubifs_new_inode
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-26-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C677F7.1030600@nod.at>
Date: Sat, 8 Aug 2015 23:43:19 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-26-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> Initialize quota and alloc a inode quota information in
> ubifs_new_inode(). Then quota would be aware of a new
> inode is allocated.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/dir.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 8d93427..5bfce44 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -41,6 +41,7 @@
>   */
>  
>  #include "ubifs.h"
> +#include <linux/quotaops.h>
>  
>  /**
>   * inherit_flags - inherit flags of the parent inode.
> @@ -90,12 +91,13 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
>  {
>  	struct inode *inode;
>  	struct ubifs_inode *ui;
> +	int err = 0;
>  
>  	inode = new_inode(c->vfs_sb);
> -	ui = ubifs_inode(inode);
>  	if (!inode)
>  		return ERR_PTR(-ENOMEM);
>  
> +	ui = ubifs_inode(inode);

Seems like an unrelated change.
All ubifs_inode() does is a container_of(), inode = NULL won't hurt.

Thanks,
//richard
