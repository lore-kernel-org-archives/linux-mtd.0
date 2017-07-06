Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT0Z9-0001o8-Sf
 for linux-mtd@lists.infradead.org; Thu, 06 Jul 2017 06:47:09 +0000
Message-ID: <1499323603.18035.44.camel@gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: Only require 17 LEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Romain Izard <romain.izard.pro@gmail.com>, David Oberhollenzer
 <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Date: Thu, 06 Jul 2017 09:46:43 +0300
In-Reply-To: <20170705163411.23546-1-romain.izard.pro@gmail.com>
References: <20170705163411.23546-1-romain.izard.pro@gmail.com>
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

If this change is done in userspace, it should also be done in the
kernel, which also can "format" the media.

I cannot remember now, but very small volumes were very problematic.
May be it was very inprecise free space estimation. Or something like
-ENOSPC when trying to remove a file.

The point is, make sure to test the tiny volumes very thoroughly before
this is merged.

On Wed, 2017-07-05 at 18:34 +0200, Romain Izard wrote:
> The minimum size for a UBIFS volume is 17 LEBs. As mkfs.ubifs counted
> the reserved log and orphan blocks twice, the program did not allow
> such a small volume.
> 
> Fix the calculations to be able to build an image with 17 LEBs. With
> this, the following command works:
> 
> mkfs.ubifs -c 17 -l2 -m 2048 -e 124KiB -o small.ubifs
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
>  ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-
> utils/mkfs.ubifs/mkfs.ubifs.c
> index 9e69a4f..ba0293c 100644
> --- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> +++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> @@ -331,6 +331,9 @@ static long long add_space_overhead(long long
> size)
>          return size / divisor;
>  }
>  
> +#define UBIFS_MIN_LEB_NOLOG   (UBIFS_MIN_LEB_CNT -
> UBIFS_MIN_LOG_LEBS)
> +#define UBIFS_MIN_LEB_NOORPH  (UBIFS_MIN_LEB_CNT -
> UBIFS_MIN_ORPH_LEBS)
> +
>  static int validate_options(void)
>  {
>  	int tmp;
> @@ -372,15 +375,15 @@ static int validate_options(void)
>  	if (c->log_lebs < UBIFS_MIN_LOG_LEBS)
>  		return err_msg("too few log LEBs, minimum is %d",
>  			       UBIFS_MIN_LOG_LEBS);
> -	if (c->log_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
> +	if (c->log_lebs > c->max_leb_cnt - UBIFS_MIN_LEB_NOLOG)
>  		return err_msg("too many log LEBs, maximum is %d",
> -			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
> +			       c->max_leb_cnt -
> UBIFS_MIN_LEB_NOLOG);
>  	if (c->orph_lebs < UBIFS_MIN_ORPH_LEBS)
>  		return err_msg("too few orphan LEBs, minimum is %d",
>  			       UBIFS_MIN_ORPH_LEBS);
> -	if (c->orph_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
> +	if (c->orph_lebs > c->max_leb_cnt - UBIFS_MIN_LEB_NOORPH)
>  		return err_msg("too many orphan LEBs, maximum is
> %d",
> -			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
> +			       c->max_leb_cnt -
> UBIFS_MIN_LEB_NOORPH);
>  	tmp = UBIFS_SB_LEBS + UBIFS_MST_LEBS + c->log_lebs + c-
> >lpt_lebs;
>  	tmp += c->orph_lebs + 4;
>  	if (tmp > c->max_leb_cnt)
