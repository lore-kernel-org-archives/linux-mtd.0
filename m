Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYY7A-0003pI-SF
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2016 12:00:22 +0000
Message-ID: <1456315196.4719.4.camel@linux.intel.com>
Subject: Re: [PATCH v2] mtd: onenand: fix deadlock in onenand_block_markbad
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Kyungmin Park
 <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Date: Wed, 24 Feb 2016 13:59:56 +0200
In-Reply-To: <1456000068-8862-1-git-send-email-aaro.koskinen@iki.fi>
References: <1456000068-8862-1-git-send-email-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks good, thanks!

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

On Sat, 2016-02-20 at 22:27 +0200, Aaro Koskinen wrote:
> Commit 5942ddbc500d ("mtd: introduce mtd_block_markbad interface")
> incorrectly changed onenand_block_markbad() to call mtd_block_markbad
> instead of onenand_chip's block_markbad function. As a result the
> function
> will now recurse and deadlock. Fix by reverting the change.
> 
> Fixes: 5942ddbc500d ("mtd: introduce mtd_block_markbad interface")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
> 
> 	v2: Don't ignore the return value.
> 
> 	v1: http://lists.infradead.org/pipermail/linux-mtd/2016-Februar
> y/065582.html
> 
>  drivers/mtd/onenand/onenand_base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> index 43b3392..652d018 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2599,6 +2599,7 @@ static int onenand_default_block_markbad(struct
> mtd_info *mtd, loff_t ofs)
>   */
>  static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  {
> +	struct onenand_chip *this = mtd->priv;
>  	int ret;
>  
>  	ret = onenand_block_isbad(mtd, ofs);
> @@ -2610,7 +2611,7 @@ static int onenand_block_markbad(struct
> mtd_info *mtd, loff_t ofs)
>  	}
>  
>  	onenand_get_device(mtd, FL_WRITING);
> -	ret = mtd_block_markbad(mtd, ofs);
> +	ret = this->block_markbad(mtd, ofs);
>  	onenand_release_device(mtd);
>  	return ret;
>  }
-- 
Best Regards,
Artem Bityutskiy
