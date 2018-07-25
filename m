Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiMCb-00008f-08
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 15:59:50 +0000
Date: Wed, 25 Jul 2018 17:59:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Stefan
 Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 15/17] mtd: rawnand: do not export
 nand_scan_[ident|tail]() anymore
Message-ID: <20180725175927.67337ede@bbrezillon>
In-Reply-To: <20180725133152.30898-16-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-16-miquel.raynal@bootlin.com>
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

On Wed, 25 Jul 2018 15:31:50 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Both nand_scan_ident() and nand_scan_tail() helpers used to be called
> directly from controller drivers that needed to tweak some ECC-related
> parameters before nand_scan_tail(). This separation prevented dynamic
> allocations during the phase of NAND identification, which was
> inconvenient.
> 
> All controller drivers have been moved to use nand_scan(), in
> conjunction with the chip->ecc.[attach|detach]_chip() hooks that
> actually do the required tweaking sequence between both ident/tail
> calls, allowing programmers to use dynamic allocation as they need all
> across the scanning sequence.
> 
> Declare nand_scan_[ident|tail]() statically now.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 16 +++++++++-------
>  include/linux/mtd/rawnand.h      | 18 ++++++------------
>  2 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 42a7a934a17b..34ea44f90fd8 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5924,7 +5924,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  }
>  
>  /**
> - * nand_scan_ident - [NAND Interface] Scan for the NAND device
> + * nand_scan_ident - Scan for the NAND device
>   * @mtd: MTD device structure
>   * @maxchips: number of chips to scan for
>   * @table: alternative NAND ID table
> @@ -5932,9 +5932,13 @@ static int nand_dt_init(struct nand_chip *chip)
>   * This is the first phase of the normal nand_scan() function. It reads the
>   * flash ID and sets up MTD fields accordingly.
>   *
> + * This helper used to be called directly from controller drivers that needed
> + * to tweak some ECC-related parameters before nand_scan_tail(). This separation
> + * prevented dynamic allocations during this phase which was unconvenient and
> + * as been banned for the benefit of the ->init_ecc()/cleanup_ecc() hooks.
>   */
> -int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> -		    struct nand_flash_dev *table)
> +static int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> +			   struct nand_flash_dev *table)
>  {
>  	int i, nand_maf_id, nand_dev_id;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> @@ -6008,7 +6012,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(nand_scan_ident);
>  
>  static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
>  {
> @@ -6385,14 +6388,14 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>  }
>  
>  /**
> - * nand_scan_tail - [NAND Interface] Scan for the NAND device
> + * nand_scan_tail - Scan for the NAND device
>   * @mtd: MTD device structure
>   *
>   * This is the second phase of the normal nand_scan() function. It fills out
>   * all the uninitialized function pointers with the defaults and scans for a
>   * bad block table if appropriate.
>   */
> -int nand_scan_tail(struct mtd_info *mtd)
> +static int nand_scan_tail(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
> @@ -6716,7 +6719,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(nand_scan_tail);
>  
>  static int nand_attach(struct nand_chip *chip)
>  {
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index a20c78e25878..eaf000b09222 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -35,17 +35,6 @@ static inline int nand_scan(struct mtd_info *mtd, int max_chips)
>  	return nand_scan_with_ids(mtd, max_chips, NULL);
>  }
>  
> -/*
> - * Separate phases of nand_scan(), allowing board driver to intervene
> - * and override command or ECC setup according to flash type.
> - */
> -int nand_scan_ident(struct mtd_info *mtd, int max_chips,
> -			   struct nand_flash_dev *table);
> -int nand_scan_tail(struct mtd_info *mtd);
> -
> -/* Unregister the MTD device and free resources held by the NAND device */
> -void nand_release(struct mtd_info *mtd);
> -
>  /* Internal helper for board drivers which need to override command function */
>  void nand_wait_ready(struct mtd_info *mtd);
>  
> @@ -1739,8 +1728,13 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
>  int nand_write_data_op(struct nand_chip *chip, const void *buf,
>  		       unsigned int len, bool force_8bit);
>  
> -/* Free resources held by the NAND device */
> +/*
> + * Free resources held by the NAND device, must be called on error after a

								      ^ and

> + * sucessful nand_scan().
> + */
>  void nand_cleanup(struct nand_chip *chip);
> +/* Unregister the MTD device and calls nand_cleanup() */
> +void nand_release(struct mtd_info *mtd);
>  
>  /* Default extended ID decoding function */
>  void nand_decode_ext_id(struct nand_chip *chip);
