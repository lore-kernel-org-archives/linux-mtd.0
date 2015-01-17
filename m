Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCYdG-00038u-1K
 for linux-mtd@lists.infradead.org; Sat, 17 Jan 2015 19:02:03 +0000
Date: Sat, 17 Jan 2015 20:01:37 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75%
 of correction strength
Message-ID: <20150117200137.71c1aca0@bbrezillon>
In-Reply-To: <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 12 Jan 2015 12:51:29 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> The MTD API reports -EUCLEAN only if the maximum number of bitflips
> found in any ECC block exceeds a certain threshold. This is done to
> avoid excessive -EUCLEAN reports to MTD users, which may induce
> additional scrubbing of data, even when the ECC algorithm in use is
> perfectly capable of handling the bitflips.
> 
> This threshold can be controlled by user-space (via sysfs), to allow
> users to determine what they are willing to tolerate in their
> application. But it still helps to have sane defaults.
> 
> In recent discussion [1], it was pointed out that our default threshold
> is equal to the correction strength. That means that we won't actually
> report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
> are almost too many to handle. It was determined that 3/4 of the
> correction strength is probably a better default.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 816b5c1fd416..3f24b587304f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4171,7 +4171,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	 * properly set.
>  	 */
>  	if (!mtd->bitflip_threshold)
> -		mtd->bitflip_threshold = mtd->ecc_strength;
> +		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);

Just sharing my experience with MLC NANDs requiring read-retry: the
number of reported bitflips often raise ecc_strength value (at least
with the current read-retry approach).
This patch will definitely make UBI move NAND blocks over and over
again considering the threshold has been raised and the block is not
reliable anymore.

While I like the idea of limiting the threshold to something smaller
than what's recommended on the datasheet (or reported by ONFI) I wonder
if it won't make things worst in some cases.

Regarding the read-retry code, it currently stops retrying reading the
page once the page has been successfully retrieved (or in other terms
all bitflips have been fixed). But it might stop to soon, because by
changing the bit level threshold (in other term retrying one more time)
it might successfully read the page with less bitflips than the
previous attempt (these are just supposition, I haven't tested it yet).
If we can achieve that we could retry until we reach something below
the bitflips threshold value, and if we fail to find any, just consider
the lower number of bitflips found during those read-retry operations.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
