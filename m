Received: from h2.hallyn.com ([78.46.35.8])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSa7s-0007ag-2a
 for linux-mtd@lists.infradead.org; Sat, 23 Dec 2017 03:05:31 +0000
Date: Fri, 22 Dec 2017 21:05:16 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Dongsu Park <dongsu@kinvolk.io>
Cc: linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
 containers@lists.linux-foundation.org,
 Seth Forshee <seth.forshee@canonical.com>, Alban Crequy <alban@kinvolk.io>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Sargun Dhillon <sargun@sargun.me>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 02/11] mtd: Check permissions towards mtd block device
 inode when mounting
Message-ID: <20171223030516.GB6837@mail.hallyn.com>
References: <cover.1512741134.git.dongsu@kinvolk.io>
 <945d325a2239efcd55273abb2bac41cfc7264fea.1512041070.git.dongsu@kinvolk.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <945d325a2239efcd55273abb2bac41cfc7264fea.1512041070.git.dongsu@kinvolk.io>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 22, 2017 at 03:32:26PM +0100, Dongsu Park wrote:
> From: Seth Forshee <seth.forshee@canonical.com>
> 
> Unprivileged users should not be able to mount mtd block devices
> when they lack sufficient privileges towards the block device
> inode.  Update mount_mtd() to validate that the user has the
> required access to the inode at the specified path. The check
> will be skipped for CAP_SYS_ADMIN, so privileged mounts will
> continue working as before.
> 
> Patch v3 is available: https://patchwork.kernel.org/patch/7640011/
> 
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> Signed-off-by: Dongsu Park <dongsu@kinvolk.io>

Acked-by: Serge Hallyn <serge@hallyn.com>

> ---
>  drivers/mtd/mtdsuper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
> index 4a4d40c0..3c8734f3 100644
> --- a/drivers/mtd/mtdsuper.c
> +++ b/drivers/mtd/mtdsuper.c
> @@ -129,6 +129,7 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
>  #ifdef CONFIG_BLOCK
>  	struct block_device *bdev;
>  	int ret, major;
> +	int perm;
>  #endif
>  	int mtdnr;
>  
> @@ -180,7 +181,10 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
>  	/* try the old way - the hack where we allowed users to mount
>  	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
>  	 */
> -	bdev = lookup_bdev(dev_name, 0);
> +	perm = MAY_READ;
> +	if (!(flags & MS_RDONLY))
> +		perm |= MAY_WRITE;
> +	bdev = lookup_bdev(dev_name, perm);
>  	if (IS_ERR(bdev)) {
>  		ret = PTR_ERR(bdev);
>  		pr_debug("MTDSB: lookup_bdev() returned %d\n", ret);
> -- 
> 2.13.6
> 
> _______________________________________________
> Containers mailing list
> Containers@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/containers
