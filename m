Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb0ep-0006tw-0x
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 07:57:49 +0000
Subject: Re: [PATCH] ubifs: return ENOSPC if running out of inode number
To: Sheng Yong <shengyong1@huawei.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
References: <20170207072808.17816-1-shengyong1@huawei.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <59847b44-37b8-a2f4-b993-dc48710036fe@nod.at>
Date: Tue, 7 Feb 2017 08:57:14 +0100
MIME-Version: 1.0
In-Reply-To: <20170207072808.17816-1-shengyong1@huawei.com>
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

Sheng Yong,

Am 07.02.2017 um 08:28 schrieb Sheng Yong:
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>  fs/ubifs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 528369f..00517dc 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -164,7 +164,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
>  			ubifs_err(c, "out of inode numbers");
>  			make_bad_inode(inode);
>  			iput(inode);
> -			return ERR_PTR(-EINVAL);
> +			return ERR_PTR(-ENOSPC);

Can you please explain *why* this has to be changed to -ENOSPC?

Thanks,
//richard
