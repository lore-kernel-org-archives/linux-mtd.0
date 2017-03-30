Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctXPb-00067Y-20
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:34:41 +0000
Date: Thu, 30 Mar 2017 19:34:12 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
 Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, adrian.hunter@intel.com,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>, kernel-team@lge.com
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
Message-ID: <20170330103412.GA12014@sebu>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <1490864181-2192-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Richard,

On Thu, Mar 30, 2017 at 10:56:21AM +0200, Richard Weinberger wrote:
> It is perfectly fine to link a tmpfile back using linkat().
> Since tmpfiles are created with a link count of 0 they appear
> on the orphan list, upon re-linking the inode has to be removed
> from the orphan list again.
> 
> Cc: <stable@vger.kernel.org>
> Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Cc: Amir Goldstein <amir73il@gmail.com
> Reported-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Reported-by: Amir Goldstein <amir73il@gmail.com
> Fixes: 474b93704f321 ("ubifs: Implement O_TMPFILE")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/dir.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 0858213a4e63..0139155045fe 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -748,6 +748,11 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
>  		goto out_fname;
>  
>  	lock_2_inodes(dir, inode);
> +
> +	/* Handle O_TMPFILE corner case, it is allowed to link a O_TMPFILE. */
> +	if (inode->i_nlink == 0)
> +		ubifs_delete_orphan(c, inode->i_ino);
> +
I guess that ubifs_delete_orphan should be called if ubifs_jnl_update
succeeds.

>  	inc_nlink(inode);
>  	ihold(inode);
>  	inode->i_ctime = ubifs_current_time(inode);
> -- 
> 2.7.3
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename=fix-unlink

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 528369f..a2e4a4b 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -757,6 +757,8 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
+	if (inode->i_nlink == 1)
+		ubifs_delete_orphan(c, inode->i_ino);
 	unlock_2_inodes(dir, inode);
 
 	ubifs_release_budget(c, &req);

--yrj/dFKFPuw6o+aM--
