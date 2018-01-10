Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZC2R-0008GI-Me
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 08:47:13 +0000
Date: Wed, 10 Jan 2018 09:46:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: nand: samsung: Disable subpage writes on E-die
 NAND
Message-ID: <20180110094649.37f828b0@bbrezillon>
In-Reply-To: <20180109131911.GA3907@lenoch>
References: <20180109131911.GA3907@lenoch>
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

On Tue, 9 Jan 2018 14:19:11 +0100
Ladislav Michl <ladis@linux-mips.org> wrote:

> Samsung E-die SLC NAND manufactured using 21nm process (K9F1G08U0E)
> does not support partial page programming, so disable subpage writes
> for it. Manufacturing process is stored in lowest two bits of 5th ID
> byte.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Changes:
>  - v2: 
>    * Reword commit log
>    * Check also for device type
>    * Reimplement if statements using switch
> 
>  drivers/mtd/nand/nand_samsung.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
> index f6b0a63a068c..6971c35b78e9 100644
> --- a/drivers/mtd/nand/nand_samsung.c
> +++ b/drivers/mtd/nand/nand_samsung.c
> @@ -92,10 +92,22 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
>  	} else {
>  		nand_decode_ext_id(chip);
>  
> -		/* Datasheet values for SLC Samsung K9F4G08U0D-S[I|C]B0(T00) */
> -		if (nand_is_slc(chip) && chip->id.data[1] == 0xDC) {
> -			chip->ecc_step_ds = 512;
> -			chip->ecc_strength_ds = 1;
> +		if (nand_is_slc(chip)) {
> +			switch (chip->id.data[1]) {
> +			/* K9F4G08U0D-S[I|C]B0(T00) */
> +			case 0xDC:
> +				chip->ecc_step_ds = 512;
> +				chip->ecc_strength_ds = 1;
> +				break;
> +			/* K9F1G08U0E 21nm chips do not support subpage write */
> +			case 0xF1:
> +				if (chip->id.len > 4 &&
> +				    (chip->id.data[4] & GENMASK(1,0)) == 0x1)
> +					chip->options |= NAND_NO_SUBPAGE_WRITE;
> +				break;
> +			default:
> +				break;
> +			}
>  		}
>  	}
>  }
