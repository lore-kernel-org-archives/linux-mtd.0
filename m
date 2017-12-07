Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eN2gw-0007ik-Ri
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 20:24:25 +0000
Date: Thu, 7 Dec 2017 21:22:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: samsung: add ECC requirements for K9F4G08U0D
Message-ID: <20171207212214.5faaa9e0@bbrezillon>
In-Reply-To: <20171207093358.32234-1-miquel.raynal@free-electrons.com>
References: <20171207093358.32234-1-miquel.raynal@free-electrons.com>
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

On Thu,  7 Dec 2017 10:33:58 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Samsung NAND chip K9F4G08U0D minimum ECC strength requirement is 1 bit
> per 512 bytes. As the chip is not ONFI nor JEDEC and because of the lack
> of these values, boards using it fail to probe the NAND controller
> driver. Fix this by setting up the default values.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Applied.

Thanks,

Boris

> ---
> 
> Changes since v1:
>   - Added the chip reference in the commit title
>   - Removed unnecessary checks.
> 
>  drivers/mtd/nand/nand_samsung.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
> index d348f0129ae7..f6b0a63a068c 100644
> --- a/drivers/mtd/nand/nand_samsung.c
> +++ b/drivers/mtd/nand/nand_samsung.c
> @@ -91,6 +91,12 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
>  		}
>  	} else {
>  		nand_decode_ext_id(chip);
> +
> +		/* Datasheet values for SLC Samsung K9F4G08U0D-S[I|C]B0(T00) */
> +		if (nand_is_slc(chip) && chip->id.data[1] == 0xDC) {
> +			chip->ecc_step_ds = 512;
> +			chip->ecc_strength_ds = 1;
> +		}
>  	}
>  }
>  
