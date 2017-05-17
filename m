Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAsv4-0006p8-Ke
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 06:58:52 +0000
Subject: Re: [PATCH 1/2] ubifs: Fix inode data budget in ubifs_mknod
To: Hyunchul Lee <cheol.lee@lge.com>
References: <1494979038-19361-1-git-send-email-cheol.lee@lge.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <12b604d9-22e9-f0e5-288a-e478d2ba4e4f@nod.at>
Date: Wed, 17 May 2017 08:58:23 +0200
MIME-Version: 1.0
In-Reply-To: <1494979038-19361-1-git-send-email-cheol.lee@lge.com>
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

Am 17.05.2017 um 01:57 schrieb Hyunchul Lee:
> Assign inode data budget to budget request correctly.
> 
> Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
> ---
>  fs/ubifs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index b777bdd..df67236 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1050,7 +1050,6 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
>  	int sz_change;
>  	int err, devlen = 0;
>  	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
> -					.new_ino_d = ALIGN(devlen, 8),
>  					.dirtied_ino = 1 };
>  	struct fscrypt_name nm;
>  
> @@ -1068,6 +1067,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
>  		devlen = ubifs_encode_dev(dev, rdev);
>  	}
>  
> +	req.new_ino_d = ALIGN(devlen, 8);

Good find!

Thanks,
//richard
