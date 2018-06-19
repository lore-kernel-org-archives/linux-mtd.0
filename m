Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV9r3-0001Ro-3H
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 06:11:03 +0000
Date: Tue, 19 Jun 2018 08:09:59 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 6/6] mtd: rawnand: micron: support 8/512 on-die ECC
Message-ID: <20180619080959.3e0416f8@bbrezillon>
In-Reply-To: <20180619053125.16792-7-chris.packham@alliedtelesis.co.nz>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-7-chris.packham@alliedtelesis.co.nz>
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

On Tue, 19 Jun 2018 17:31:25 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Micron MT29F1G08ABAFAWP-ITE:F supports an on-die ECC with 8 bits
> per 512 bytes. Add support for this combination.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> This seems deceptively easy so I've probably missed something. I have
> tested with running some of the ubifs stress tests from mtd-utils and
> things seem OK.
> 
> Changes in v2:
> - New
> 
>  drivers/mtd/nand/raw/nand_micron.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index d1e8f57544a0..2164dd112f5c 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -240,9 +240,9 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>  
>  	/*
>  	 * Some Micron NANDs have an on-die ECC of 4/512, some other
> -	 * 8/512. We only support the former.
> +	 * 8/512.
>  	 */
> -	if (chip->ecc_strength_ds != 4)
> +	if (chip->ecc_strength_ds != 4 && chip->ecc_strength_ds != 8)
>  		return MICRON_ON_DIE_UNSUPPORTED;

I remember that chips with 8bits/512bytes on-die ECC had an extra
command to query a more precise number of bitflips (see this
discussion [1]). It's probably worth implementing that, since those
chips are more likely to have bitflips than the 4bit/512 versions, and
you don't want to move the data around as soon as you have one bitflip. 

>  
>  	return MICRON_ON_DIE_SUPPORTED;
> @@ -274,9 +274,9 @@ static int micron_nand_init(struct nand_chip *chip)
>  			return -EINVAL;
>  		}
>  
> -		chip->ecc.bytes = 8;
> +		chip->ecc.bytes = chip->ecc_strength_ds * 2;
>  		chip->ecc.size = 512;
> -		chip->ecc.strength = 4;
> +		chip->ecc.strength = chip->ecc_strength_ds;
>  		chip->ecc.algo = NAND_ECC_BCH;
>  		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
>  		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;

[1]http://lists.infradead.org/pipermail/linux-mtd/2017-March/072974.html
