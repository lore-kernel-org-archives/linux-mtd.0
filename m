Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAsxo-0000b2-FJ
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 07:01:44 +0000
Subject: Re: [PATCH 2/2] ubifs: Fix memory leak in RENAME_WHITEOUT error path
 in do_rename
To: Hyunchul Lee <cheol.lee@lge.com>
References: <1494979082-19414-1-git-send-email-cheol.lee@lge.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <a30a5f31-105e-823f-9336-80cf14cc8f9e@nod.at>
Date: Wed, 17 May 2017 09:01:17 +0200
MIME-Version: 1.0
In-Reply-To: <1494979082-19414-1-git-send-email-cheol.lee@lge.com>
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

Hyunchul,

Am 17.05.2017 um 01:58 schrieb Hyunchul Lee:
> in RENAME_WHITEOUT error path, fscrypt_name should be freed.
> 
> Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
> ---
>  fs/ubifs/dir.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index df67236..0d5f8e7 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1385,17 +1385,14 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
>  
>  		dev = kmalloc(sizeof(union ubifs_dev_desc), GFP_NOFS);
>  		if (!dev) {
> -			ubifs_release_budget(c, &req);
> -			ubifs_release_budget(c, &ino_req);
> -			return -ENOMEM;
> +			err = -ENOMEM;
> +			goto out_release;
>  		}
>  
>  		err = do_tmpfile(old_dir, old_dentry, S_IFCHR | WHITEOUT_MODE, &whiteout);
>  		if (err) {
> -			ubifs_release_budget(c, &req);
> -			ubifs_release_budget(c, &ino_req);
>  			kfree(dev);
> -			return err;
> +			goto out_release;
>  		}
>  
>  		whiteout->i_state |= I_LINKABLE;
> @@ -1483,12 +1480,10 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
>  
>  		err = ubifs_budget_space(c, &wht_req);
>  		if (err) {
> -			ubifs_release_budget(c, &req);
> -			ubifs_release_budget(c, &ino_req);
>  			kfree(whiteout_ui->data);
>  			whiteout_ui->data_len = 0;
>  			iput(whiteout);
> -			return err;
> +			goto out_release;
>  		}
>  
>  		inc_nlink(whiteout);
> @@ -1543,6 +1538,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
>  		iput(whiteout);
>  	}
>  	unlock_4_inodes(old_dir, new_dir, new_inode, whiteout);
> +out_release:
>  	ubifs_release_budget(c, &ino_req);
>  	ubifs_release_budget(c, &req);
>  	fscrypt_free_filename(&old_nm);
> 

Good find too. :-)
This function needs a cleanup, it is much longer than it should be.

Thanks,
//richard
