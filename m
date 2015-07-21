Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHeHD-0007d9-1B
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 20:36:36 +0000
Message-ID: <55AEAD39.1070301@nod.at>
Date: Tue, 21 Jul 2015 22:36:09 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 richard.weinberger@gmail.com, jack@suse.com
CC: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 11/25] ubifs: export read_block() from file.c
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-12-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-12-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
> We want to use read_block to read quota file bypass the page cache.
> So export it from file.c, then we can use it in somewhere else.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/file.c  | 2 +-
>  fs/ubifs/ubifs.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 27de484..dc8bf0b 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -54,7 +54,7 @@
>  #include <linux/namei.h>
>  #include <linux/slab.h>
>  
> -static int read_block(struct inode *inode, void *addr, unsigned int block,
> +int read_block(struct inode *inode, void *addr, unsigned int block,
>  		      struct ubifs_data_node *dn)
>  {
>  	struct ubifs_info *c = inode->i_sb->s_fs_info;
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index ae6723e..a6ad955 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1749,6 +1749,8 @@ const struct ubifs_lprops *ubifs_fast_find_frdi_idx(struct ubifs_info *c);
>  int ubifs_calc_dark(const struct ubifs_info *c, int spc);
>  
>  /* file.c */
> +int read_block(struct inode *inode, void *addr, unsigned int block,
> +		      struct ubifs_data_node *dn);

Please prefix the function name with ubifs_ to avoid namespace pollution.

Thanks,
//richard
