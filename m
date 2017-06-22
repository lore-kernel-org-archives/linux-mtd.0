Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dO7fU-0008Qk-S1
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 19:21:31 +0000
Date: Thu, 22 Jun 2017 21:21:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Adrian
 Hunter <adrian.hunter@intel.com>, stable@vger.kernel.org, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: Don't leak kernel memory to the MTD
Message-ID: <20170622212107.36f32f86@bbrezillon>
In-Reply-To: <20170616142144.4244-1-richard@nod.at>
References: <20170616142144.4244-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 Jun 2017 16:21:44 +0200
Richard Weinberger <richard@nod.at> wrote:

> When UBIFS prepares data structures which will be written to the MTD it
> ensues that their lengths are multiple of 8. Since it uses kmalloc() the
> padded bytes are left uninitialized and we leak a few bytes of kernel
> memory to the MTD.
> To make sure that all bytes are initialized, let's switch to kzalloc().
> Kzalloc() is fine in this case because the buffers are not huge and in
> the IO path the performance bottleneck is anyway the MTD.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  fs/ubifs/journal.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 294519b98874..981a7ea86674 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -574,7 +574,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>  	/* Make sure to also account for extended attributes */
>  	len += host_ui->data_len;
>  
> -	dent = kmalloc(len, GFP_NOFS);
> +	dent = kzalloc(len, GFP_NOFS);
>  	if (!dent)
>  		return -ENOMEM;
>  
> @@ -967,7 +967,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
>  	if (twoparents)
>  		len += plen;
>  
> -	dent1 = kmalloc(len, GFP_NOFS);
> +	dent1 = kzalloc(len, GFP_NOFS);
>  	if (!dent1)
>  		return -ENOMEM;
>  
> @@ -1117,7 +1117,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
>  	len = aligned_dlen1 + aligned_dlen2 + ALIGN(ilen, 8) + ALIGN(plen, 8);
>  	if (move)
>  		len += plen;
> -	dent = kmalloc(len, GFP_NOFS);
> +	dent = kzalloc(len, GFP_NOFS);
>  	if (!dent)
>  		return -ENOMEM;
>  
> @@ -1500,7 +1500,7 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
>  	hlen = host_ui->data_len + UBIFS_INO_NODE_SZ;
>  	len = aligned_xlen + UBIFS_INO_NODE_SZ + ALIGN(hlen, 8);
>  
> -	xent = kmalloc(len, GFP_NOFS);
> +	xent = kzalloc(len, GFP_NOFS);
>  	if (!xent)
>  		return -ENOMEM;
>  
> @@ -1607,7 +1607,7 @@ int ubifs_jnl_change_xattr(struct ubifs_info *c, const struct inode *inode,
>  	aligned_len1 = ALIGN(len1, 8);
>  	aligned_len = aligned_len1 + ALIGN(len2, 8);
>  
> -	ino = kmalloc(aligned_len, GFP_NOFS);
> +	ino = kzalloc(aligned_len, GFP_NOFS);
>  	if (!ino)
>  		return -ENOMEM;
>  
