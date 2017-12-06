Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMV0D-0007tZ-Lc
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:24:27 +0000
Date: Wed, 6 Dec 2017 09:24:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: samsung: add datasheet minimum strength
 requirements for a chip
Message-ID: <20171206092401.1a625db7@bbrezillon>
In-Reply-To: <20171130151041.15132-1-miquel.raynal@free-electrons.com>
References: <20171130151041.15132-1-miquel.raynal@free-electrons.com>
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

Hi Miquel,

On Thu, 30 Nov 2017 16:10:41 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

Why not naming the chip in the subject line?

"mtd: nand: samsung: add ECC requirements for K9F4G08U0D"

> Samsung NAND chip K9F4G08U0D minimum ECC strength requirement is 1 bit
> per 512 bytes. As the chip is not ONFI nor JEDEC and because of the lack
> of these values, boards using it failed to probe the NAND controller
> driver. Fix this by adding the default values if needed.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_samsung.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
> index d348f0129ae7..5dc4fa4862d7 100644
> --- a/drivers/mtd/nand/nand_samsung.c
> +++ b/drivers/mtd/nand/nand_samsung.c
> @@ -91,6 +91,13 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
>  		}
>  	} else {
>  		nand_decode_ext_id(chip);
> +
> +		/* Datasheet values for SLC Samsung K9F4G08U0D-S[I|C]B0(T00) */
> +		if (nand_is_slc(chip) && chip->id.data[1] == 0xDC &&
> +		    (!chip->ecc_step_ds || !chip->ecc_strength_ds)) {

Why do you test chip->ecc_step_ds and chip->ecc_strenght_ds values? I
mean, the chip is not ONFI or JEDEC compliant, so there's no reason
these fields would have been assigned to something != 0, and if they
were, it's a bug.

> +			chip->ecc_step_ds = 512;
> +			chip->ecc_strength_ds = 1;
> +		}
>  	}
>  }
>  
