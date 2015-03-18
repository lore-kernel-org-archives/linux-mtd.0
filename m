Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YY4Vv-00037O-KJ
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 03:19:24 +0000
Received: by pdnc3 with SMTP id c3so29009329pdn.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2015 20:19:02 -0700 (PDT)
Date: Tue, 17 Mar 2015 20:18:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Taesoo Kim <tsgatesv@gmail.com>
Subject: Re: [PATCH 1/1] UBIFS: fix incorrect unlocking handling
Message-ID: <20150318031858.GO32500@ld-irv-0074>
References: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
Cc: taesoo@gatech.edu, Subodh Nijsure <snijsure@grid-net.com>,
 dedekind1@gmail.com, Ben Shelton <ben.shelton@ni.com>, sanidhya@gatech.edu,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Terry Wilcox <terry.wilcox@ni.com>, linux-mtd@lists.infradead.org,
 blee@gatech.edu, Marc Kleine-Budde <mkl@pengutronix.de>,
 Gratian Crisan <gratian.crisan@ni.com>, csong84@gatech.edu,
 changwoo@gatech.edu, Brad Mouring <brad.mouring@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 17, 2015 at 10:09:26PM -0400, Taesoo Kim wrote:
> When ubifs_init_security() fails, 'ui_mutex' is incorrectly
> unlocked and incorrectly restores 'i_size'. There are four
> such places that were introduce by the last commit.

"The last commit" is not very descriptive. Are you speaking of this
commit?

commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
Author: Subodh Nijsure <snijsure@grid-net.com>
Date:   Fri Oct 31 13:50:30 2014 -0500

    UBIFS: Add security.* XATTR support for the UBIFS

CC'ing authors/reviewers.

Brian

> Signed-off-by: Taesoo Kim <tsgatesv@gmail.com>
> ---
>  fs/ubifs/dir.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 0fa6c80..5b24bc4 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -272,7 +272,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
> 
>  	err = ubifs_init_security(dir, inode, &dentry->d_name);
>  	if (err)
> -		goto out_cancel;
> +		goto out_inode;
> 
>  	mutex_lock(&dir_ui->ui_mutex);
>  	dir->i_size += sz_change;
> @@ -292,6 +292,7 @@ out_cancel:
>  	dir->i_size -= sz_change;
>  	dir_ui->ui_size = dir->i_size;
>  	mutex_unlock(&dir_ui->ui_mutex);
> +out_inode:
>  	make_bad_inode(inode);
>  	iput(inode);
>  out_budg:
> @@ -732,7 +733,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
> 
>  	err = ubifs_init_security(dir, inode, &dentry->d_name);
>  	if (err)
> -		goto out_cancel;
> +		goto out_inode;
> 
>  	mutex_lock(&dir_ui->ui_mutex);
>  	insert_inode_hash(inode);
> @@ -757,6 +758,7 @@ out_cancel:
>  	dir_ui->ui_size = dir->i_size;
>  	drop_nlink(dir);
>  	mutex_unlock(&dir_ui->ui_mutex);
> +out_inode:
>  	make_bad_inode(inode);
>  	iput(inode);
>  out_budg:
> @@ -816,7 +818,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
> 
>  	err = ubifs_init_security(dir, inode, &dentry->d_name);
>  	if (err)
> -		goto out_cancel;
> +		goto out_inode;
> 
>  	mutex_lock(&dir_ui->ui_mutex);
>  	dir->i_size += sz_change;
> @@ -836,6 +838,7 @@ out_cancel:
>  	dir->i_size -= sz_change;
>  	dir_ui->ui_size = dir->i_size;
>  	mutex_unlock(&dir_ui->ui_mutex);
> +out_inode:
>  	make_bad_inode(inode);
>  	iput(inode);
>  out_budg:
> @@ -896,7 +899,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
> 
>  	err = ubifs_init_security(dir, inode, &dentry->d_name);
>  	if (err)
> -		goto out_cancel;
> +		goto out_inode;
> 
>  	mutex_lock(&dir_ui->ui_mutex);
>  	dir->i_size += sz_change;
> --
> 2.3.3
> 
