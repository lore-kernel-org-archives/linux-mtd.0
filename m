Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBKMV-0004jp-BL
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 09:35:40 +0000
Date: Wed, 14 Jan 2015 10:34:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] nand_base: SOFT_BCH: Request strength over bytes
Message-ID: <20150114103449.331342ba@bbrezillon>
In-Reply-To: <889558859.110937.1421109355675.JavaMail.zimbra@xes-inc.com>
References: <2021171878.109755.1421108768347.JavaMail.zimbra@xes-inc.com>
 <889558859.110937.1421109355675.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Aaron,

On Mon, 12 Jan 2015 18:35:55 -0600 (CST)
Aaron Sierra <asierra@xes-inc.com> wrote:

> Previously, we requested that drivers pass ecc.size and ecc.bytes when
> using NAND_ECC_SOFT_BCH. However, a driver is likely to only know the ECC
> strength required for its NAND, so each driver would need to perform a
> strength-to-bytes calculation.
> 
> Avoid duplicating this calculation in each driver by asking drivers to
> pass ecc.size and ecc.strength so that the strength-to-bytes calculation
> need only be implemented once.
> 
> This reverts/generalizes this commit:
>     mtd: nand: Base BCH ECC bytes on required strength

Apart from the nit below, you can add my:

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
>  drivers/mtd/nand/nand_base.c  | 21 +++++++++++++++------
>  drivers/mtd/nand/sunxi_nand.c |  2 --
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 41585df..993612c 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4028,22 +4028,31 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		ecc->read_oob = nand_read_oob_std;
>  		ecc->write_oob = nand_write_oob_std;
>  		/*
> -		 * Board driver should supply ecc.size and ecc.bytes values to
> -		 * select how many bits are correctable; see nand_bch_init()
> -		 * for details. Otherwise, default to 4 bits for large page
> -		 * devices.
> +		 * Board driver should supply ecc.size and ecc.strength values
> +		 * to select how many bits are correctable. Otherwise, default
> +		 * to 4 bits for large page devices.
>  		 */
>  		if (!ecc->size && (mtd->oobsize >= 64)) {
>  			ecc->size = 512;
> -			ecc->bytes = DIV_ROUND_UP(13 * ecc->strength, 8);
> +			ecc->strength = 4;
>  		}
> +
> +		/*
> +		 * We previously recommended drivers pass ecc.size and
> +		 * ecc.bytes. Continue to support drivers that do.
> +		 * See nand_bch_init() for details.
> +		 */
> +		if (ecc->bytes && !ecc->strength)
> +			ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);

How about fixing all NAND_ECC_SOFT_BCH users (AFAICT the only remaining
one is nandsim, since you fixed sunxi_nand) instead of keeping this
backward compat code.


Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
