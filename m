Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elLic-00051d-Ic
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 21:33:00 +0000
Date: Mon, 12 Feb 2018 22:32:46 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 1/3] mtd: nand: vf610_nfc: remove unused function
Message-ID: <20180212223246.5e236413@bbrezillon>
In-Reply-To: <20180208235921.31840-2-stefan@agner.ch>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-2-stefan@agner.ch>
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

On Fri,  9 Feb 2018 00:59:19 +0100
Stefan Agner <stefan@agner.ch> wrote:

> The function count_written_bits has been replaced by the generic
> nand_check_erased_ecc_chunk() function with commit 48c25cf44118
> ("mtd: nand: vf610_nfc: use nand_check_erased_ecc_chunk() helper").
> Remove the unused function.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/vf610_nfc.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 80d31a58e558..2fa61cbdbaf7 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -511,21 +511,6 @@ static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)
>  	vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
>  }
>  
> -/* Count the number of 0's in buff up to max_bits */
> -static inline int count_written_bits(uint8_t *buff, int size, int max_bits)
> -{
> -	uint32_t *buff32 = (uint32_t *)buff;
> -	int k, written_bits = 0;
> -
> -	for (k = 0; k < (size / 4); k++) {
> -		written_bits += hweight32(~buff32[k]);
> -		if (unlikely(written_bits > max_bits))
> -			break;
> -	}
> -
> -	return written_bits;
> -}
> -
>  static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>  					 uint8_t *oob, int page)
>  {



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
