Received: from emvm-gh1-uea08.nsa.gov ([63.239.67.9] helo=nsa.gov)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIgl9-000479-LX
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 13:41:56 +0000
Subject: Re: [PATCH v3] Add security.* XATTR support for the UBIFS
From: Stephen Smalley <sds@tycho.nsa.gov>
To: subodh.nijsure@gmail.com
In-Reply-To: <1334179707-31754-1-git-send-email-snijsure@grid-net.com>
References: <1334179707-31754-1-git-send-email-snijsure@grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Apr 2012 09:41:52 -0400
Message-ID: <1334324512.10274.21.camel@moss-pluto>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-04-11 at 14:28 -0700, subodh.nijsure@gmail.com wrote:
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index ec9f187..422bcec 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -292,6 +292,18 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>  
>  	ubifs_release_budget(c, &req);
>  	insert_inode_hash(inode);
> +
> +#ifdef CONFIG_UBIFS_FS_XATTR
> +
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err) {
> +		ubifs_err("cannot initialize extended attribute, error %d",
> +			  err);
> +		goto out_cancel;
> +	}
> +
> +#endif
> +
>  	d_instantiate(dentry, inode);
>  	return 0;

I don't know this code very well, but simply reusing the out_cancel
error path when ubifs_init_security() fails looks wrong to me.  You'll
end up calling ubifs_release_budget() a second time.  You could move the
ubifs_init_security() call a bit earlier, prior to the
ubifs_release_budget() call, so that it only happens once on the error
path.  I also am unclear on what if anything you need to do about the
prior ubifs_jnl_update() if ubifs_init_security() fails; it seems like
you either need to update the journal again to reflect the inode
deletion or you need to move ubifs_init_security() prior to
ubifs_jnl_update() as well.

I don't know if this would work, but I would be inclined to move the
call to ubifs_init_security() immediately after the ubifs_new_inode()
call, and introduce a new out_security: label just before the
make_bad_inode() call to which you can jump on error.  However, that
might produce a strange state in the journal, with the setxattr recorded
before the inode creation.  Optimally they would both be part of the
same journal transaction, as in ext4, and thus applied atomically or not
at all (i.e. a file is either created with a security xattr or not at
all).

-- 
Stephen Smalley
National Security Agency
