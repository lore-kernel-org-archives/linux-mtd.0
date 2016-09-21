Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmifh-0000Cd-VL
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 14:38:50 +0000
Subject: Re: [PATCH v2 02/46] mtd: nand: Provide nand_cleanup() function to
 free NAND related resources
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <8b9dd116b40fb7965a29fe0d051bd8b85e3f036b.1474450295.git.dwalter@sigma-star.at>
 <20160921162521.4b9f83d7@bbrezillon>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
From: Daniel Walter <dwalter@sigma-star.at>
Message-ID: <83ce4313-f63e-3b08-53d7-2d5eb8c97bda@sigma-star.at>
Date: Wed, 21 Sep 2016 16:38:28 +0200
MIME-Version: 1.0
In-Reply-To: <20160921162521.4b9f83d7@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 09/21/2016 04:25 PM, Boris Brezillon wrote:
> Daniel, Richard,
> 
> On Wed, 21 Sep 2016 11:44:41 +0200
> Daniel Walter <dwalter@sigma-star.at> wrote:
> 
>> From: Richard Weinberger <richard@nod.at>
>>
>> Provide a nand_cleanup() function to free all nand related resources
>> without unregistering the mtd device.
>> This should allow drivers to call mtd_device_unregister() and handle
>> its return value and still being able to cleanup all nand related
>> resources.
>>
> 
> Can you check this version?

looks good to me.
I'll incooperate the change in v3 (AFAIR this change will break the last
patch of the series).



> 
> --->8---
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0cd663040a9c..9ee50189f98a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4798,19 +4798,15 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
>  EXPORT_SYMBOL(nand_scan);
>  
>  /**
> - * nand_release - [NAND Interface] Free resources held by the NAND device
> - * @mtd: MTD device structure
> + * nand_cleanup - [NAND Interface] Free resources held by the NAND device
> + * @chip: NAND chip object
>   */
> -void nand_release(struct mtd_info *mtd)
> +void nand_cleanup(struct nand_chip *chip)
>  {
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -
>  	if (chip->ecc.mode == NAND_ECC_SOFT &&
>  	    chip->ecc.algo == NAND_ECC_BCH)
>  		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
>  
> -	mtd_device_unregister(mtd);
> -
>  	nand_release_data_interface(chip);
>  
>  	/* Free bad block table memory */
> @@ -4823,6 +4819,18 @@ void nand_release(struct mtd_info *mtd)
>  			& NAND_BBT_DYNAMICSTRUCT)
>  		kfree(chip->badblock_pattern);
>  }
> +EXPORT_SYMBOL_GPL(nand_cleanup);
> +
> +/**
> + * nand_release - [NAND Interface] Unregister the MTD device and free resources
> + *		  held by the NAND device
> + * @mtd: MTD device structure
> + */
> +void nand_release(struct mtd_info *mtd)
> +{
> +	mtd_device_unregister(mtd);
> +	nand_cleanup(mtd_to_nand(mtd));
> +}
>  EXPORT_SYMBOL_GPL(nand_release);
>  
>  MODULE_LICENSE("GPL");
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 331caf987b16..c5d3d5024fc8 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -38,7 +38,7 @@ int nand_scan_ident(struct mtd_info *mtd, int max_chips,
>  			   struct nand_flash_dev *table);
>  int nand_scan_tail(struct mtd_info *mtd);
>  
> -/* Free resources held by the NAND device */
> +/* Unregister the MTD device and free resources held by the NAND device */
>  void nand_release(struct mtd_info *mtd);
>  
>  /* Internal helper for board drivers which need to override command function */
> @@ -1186,4 +1186,7 @@ int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  /* Reset and initialize a NAND device */
>  int nand_reset(struct nand_chip *chip);
>  
> +/* Free resources held by the NAND device */
> +void nand_cleanup(struct nand_chip *chip);
> +
>  #endif /* __LINUX_MTD_NAND_H */
> 

-- 
sigma star gmbh | Eduard-Bodem-Gasse 6, 6020 Innsbruck, Austria
UID/VAT Nr: ATU 66964118 | FN: 374287y
