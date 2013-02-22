Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U8mlx-0002be-25
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2013 07:10:22 +0000
Message-ID: <1361517037.2734.145.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC 4/5] UBIFS: Add security.* XATTR support for the UBIFS
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 22 Feb 2013 09:10:37 +0200
In-Reply-To: <1360750998-15191-5-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
 <1360750998-15191-5-git-send-email-mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Subodh Nijsure <snijsure@grid-net.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK, the lockdep warnings clearly tell the reason:

        CPU0                    CPU1
        ----                    ----
   lock(&ui->ui_mutex);
                                lock(&sb->s_type->i_mutex_key#10);
                                lock(&ui->ui_mutex);
   lock(&sb->s_type->i_mutex_key#10);

And then there are 2 tracebacks which are useful and show that you
unnecessarily initialize the inode security contenxt whil holding the
parent inode lock. I think you do not need to hold that lock. Move the
initialization out of the protected section.

See below my suggestions.

On Wed, 2013-02-13 at 11:23 +0100, Marc Kleine-Budde wrote:
> @@ -280,6 +280,10 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>  	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
>  	if (err)
>  		goto out_cancel;
> +
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err)
> +		goto out_cancel;
>  	mutex_unlock(&dir_ui->ui_mutex);

Can you move ubifs_init_security() up to before
'mutex_lock(&dir_ui->ui_mutex)'

> @@ -742,6 +746,10 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
...
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err)
> +		goto out_cancel;
>  	mutex_unlock(&dir_ui->ui_mutex);

Ditto.

> @@ -818,6 +826,10 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
...
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err)
> +		goto out_cancel;
>  	mutex_unlock(&dir_ui->ui_mutex);

Ditto.

> @@ -894,6 +906,10 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
...
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err)
> +		goto out_cancel;
>  	mutex_unlock(&dir_ui->ui_mutex);

Ditto.

> +int ubifs_init_security(struct inode *dentry, struct inode *inode,
> +			const struct qstr *qstr)
> +{
> +	int err;
> +
> +	mutex_lock(&inode->i_mutex);
> +	err = security_inode_init_security(inode, dentry, qstr,
> +					   &ubifs_initxattrs, 0);
> +	mutex_unlock(&inode->i_mutex);

I did not verify, but I doubt that you need i_mutex here, because you
only call this function when you create an inode, before it becomes
visible to VFS. Please, double-check this.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
