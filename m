Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bh16k-0005yE-P8
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 21:07:11 +0000
Date: Mon, 5 Sep 2016 23:06:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] ubi: Fix Fastmap's update_vol()
Message-ID: <20160905230639.42fe2a94@bbrezillon>
In-Reply-To: <1472042175-8655-3-git-send-email-richard@nod.at>
References: <1472042175-8655-1-git-send-email-richard@nod.at>
 <1472042175-8655-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 24 Aug 2016 14:36:15 +0200
Richard Weinberger <richard@nod.at> wrote:

> Usually Fastmap is free to consider every PEB in one of the pools
> as newer than the existing PEB. Since PEBs in a pool are by definition
> newer than everything else.
> But update_vol() missed the case that a pool can contain more than
> one candidate.

Hm, it's not really that update_vol() was not taking this case into
account (actually it is comparing 2 LEBs and picking the latest
version), it's just that it's not updating ->sqnum as it should be. Or,
am I missing something?

> 
> Cc: <stable@vger.kernel.org>
> Fixes: dbb7d2a88d ("UBI: Add fastmap core")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Anyway, apart from the commit message,

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/fastmap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index da33100..ccb3ceb 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -328,6 +328,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  			aeb->pnum = new_aeb->pnum;
>  			aeb->copy_flag = new_vh->copy_flag;
>  			aeb->scrub = new_aeb->scrub;
> +			aeb->sqnum = new_aeb->sqnum;
>  			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
>  
>  		/* new_aeb is older */
