Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMMqW-0002lp-EI
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 21:00:33 +0000
Subject: Re: [PATCH v2 16/35] ubifs: fill ->s_dev in ubifs_fill_super
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-17-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFD659.7030800@nod.at>
Date: Mon, 3 Aug 2015 23:00:09 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-17-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> Some tools in userspace, such as quota-tools, are using
> stat() to get the st_dev of a mount point then to find
> out the device mounted on this mount point.
> 
> So we have to fill ->s_dev here to tell them which device
> is mounted on this point.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 27e1739..161b1a6 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -36,6 +36,7 @@
>  #include <linux/mount.h>
>  #include <linux/math64.h>
>  #include <linux/writeback.h>
> +#include <linux/cdev.h>
>  #include "ubifs.h"
>  
>  /*
> @@ -2033,6 +2034,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	sb->s_bdi = &c->bdi;
>  	sb->s_cdev = ubi_get_volume_cdev(c->ubi);
> +	sb->s_dev = sb->s_cdev->dev;
>  	sb->s_fs_info = c;
>  	sb->s_magic = UBIFS_SUPER_MAGIC;
>  	sb->s_blocksize = UBIFS_BLOCK_SIZE;
> 

As long userspace is fine with the fact that UBI device nodes are dynamically allocated it should work. :)

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
