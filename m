Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhKi7-0000Dc-Hg
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 16:58:32 +0000
Date: Wed, 30 Sep 2015 18:52:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Bill Pringlemeir
 <bpringlemeir@nbsps.com>, Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH] mtd: nand: vf610_nfc: use
 nand_check_erased_ecc_chunk() helper
Message-ID: <20150930185246.6bfdda29@bbrezillon>
In-Reply-To: <1443561116-139851-1-git-send-email-computersforpeace@gmail.com>
References: <1443561116-139851-1-git-send-email-computersforpeace@gmail.com>
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

On Tue, 29 Sep 2015 14:11:56 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> I forgot about this feedback. How does this patch look? Just compile tested.

Looks good to me, but I can't test it either :-).

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
>  drivers/mtd/nand/vf610_nfc.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 42dad8e4b26f..598faf655f5b 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -560,7 +560,6 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>  	u32 ecc_status_off = NFC_MAIN_AREA(0) + ECC_SRAM_ADDR + ECC_STATUS;
>  	u8 ecc_status;
>  	u8 ecc_count;
> -	int flips;
>  	int flips_threshold = nfc->chip.ecc.strength / 2;
>  
>  	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
> @@ -577,16 +576,9 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>  	 * On an erased page, bit count (including OOB) should be zero or
>  	 * at least less then half of the ECC strength.
>  	 */
> -	flips = count_written_bits(dat, nfc->chip.ecc.size, flips_threshold);
> -	flips += count_written_bits(oob, mtd->oobsize, flips_threshold);
> -
> -	if (unlikely(flips > flips_threshold))
> -		return -EINVAL;
> -
> -	/* Erased page. */
> -	memset(dat, 0xff, nfc->chip.ecc.size);
> -	memset(oob, 0xff, mtd->oobsize);
> -	return flips;
> +	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
> +					   mtd->oobsize, NULL, 0,
> +					   flips_threshold);
>  }
>  
>  static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
