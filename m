Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctWX0-0004CA-HL
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 09:38:16 +0000
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1490864181-2192-1-git-send-email-richard@nod.at>
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com,
 stable@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
Date: Thu, 30 Mar 2017 12:32:18 +0300
MIME-Version: 1.0
In-Reply-To: <1490864181-2192-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30/03/17 11:56, Richard Weinberger wrote:
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

Isn't there also a deletion inode in the journal?  If the recovery sees that
won't it delete the file data?
