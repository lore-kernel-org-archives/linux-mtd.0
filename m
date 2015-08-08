Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOC1V-0008KE-7N
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 21:51:26 +0000
Subject: Re: [PATCH v2 26/35] ubifs: free quota inode information in
 ubifs_evict_inode
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-27-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C679CB.3050605@nod.at>
Date: Sat, 8 Aug 2015 23:51:07 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-27-git-send-email-yangds.fnst@cn.fujitsu.com>
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
> In evict, we have to call dquot_free_inode() to tell quota
> subsystem there is one inode to be free. Please update the
> quota information.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 06dd7af..20500f0 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -361,6 +361,7 @@ static void ubifs_evict_inode(struct inode *inode)
>  	if (is_bad_inode(inode))
>  		goto out;
>  
> +	dquot_initialize(inode);
>  	ui->ui_size = inode->i_size = 0;
>  	err = ubifs_jnl_delete_inode(c, inode);
>  	if (err)
> @@ -370,7 +371,7 @@ static void ubifs_evict_inode(struct inode *inode)
>  		 */
>  		ubifs_err(c, "can't delete inode %lu, error %d",
>  			  inode->i_ino, err);
> -
> +	dquot_free_inode(inode);
>  out:
>  	if (ui->dirty)
>  		ubifs_release_dirty_inode_budget(c, ui);
> @@ -380,6 +381,7 @@ out:
>  		smp_wmb();
>  	}
>  done:
> +	dquot_drop(inode);

Is it allowed to call this without a dquot_initialize()?
The if (inode->i_nlink) branch will hit that condition.

Thanks,
//richard
