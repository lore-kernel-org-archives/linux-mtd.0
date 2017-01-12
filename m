Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRezT-00013S-BR
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 13:00:31 +0000
Subject: Re: [PATCH 1/3] mtd/ftl: Use kmalloc_array() in build_maps()
To: SF Markus Elfring <elfring@users.sourceforge.net>,
 <linux-mtd@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Marek
 Vasut" <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
 <b379ba57-d926-2572-17ec-5bbe166b0e37@users.sourceforge.net>
CC: LKML <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <4be87294-5e91-5ced-770f-8630ccab689a@atmel.com>
Date: Thu, 12 Jan 2017 14:00:03 +0100
MIME-Version: 1.0
In-Reply-To: <b379ba57-d926-2572-17ec-5bbe166b0e37@users.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 12/01/2017 à 11:35, SF Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 12 Jan 2017 10:42:25 +0100
> 
> * Multiplications for the size determination of memory allocations
>   indicated that array data structures should be processed.
>   Thus use the corresponding function "kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of data types by pointer dereferences
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mtd/ftl.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
> index 9fb3b0dcdac2..ef2f38b6a837 100644
> --- a/drivers/mtd/ftl.c
> +++ b/drivers/mtd/ftl.c
> @@ -207,15 +207,14 @@ static int build_maps(partition_t *part)
>      /* Set up erase unit maps */
>      part->DataUnits = le16_to_cpu(part->header.NumEraseUnits) -
>  	part->header.NumTransferUnits;
> -    part->EUNInfo = kmalloc(part->DataUnits * sizeof(struct eun_info_t),
> -			    GFP_KERNEL);
> +	part->EUNInfo = kmalloc_array(part->DataUnits, sizeof(*part->EUNInfo),
> +				      GFP_KERNEL);

The indentation has been changed and the new one looks wrong...

I understand the original indentation, with spaces, doesn't follow the
Linux coding style but at least it's consistent and readable.

Your patch uses a different indentation with tabs, which now mixes two
different indentations: IMHO, this is worst than before.

If you want to fix the indentation to make it compliant with the Linux
coding style, do it on the whole file so every thing is uniform.

Reviewing such dummy/automatic patches is a pure waste of time, so
personally I think we should just ignore them.

>      if (!part->EUNInfo)
>  	    goto out;
>      for (i = 0; i < part->DataUnits; i++)
>  	part->EUNInfo[i].Offset = 0xffffffff;
> -    part->XferInfo =
> -	kmalloc(part->header.NumTransferUnits * sizeof(struct xfer_info_t),
> -		GFP_KERNEL);
> +	part->XferInfo = kmalloc_array(part->header.NumTransferUnits,
> +				       sizeof(*part->XferInfo), GFP_KERNEL);

Another indentation issue is introduced here too...

>      if (!part->XferInfo)
>  	    goto out_EUNInfo;
>  
> @@ -275,8 +274,8 @@ static int build_maps(partition_t *part)
>      memset(part->VirtualBlockMap, 0xff, blocks * sizeof(uint32_t));
>      part->BlocksPerUnit = (1 << header.EraseUnitSize) >> header.BlockSize;
>  
> -    part->bam_cache = kmalloc(part->BlocksPerUnit * sizeof(uint32_t),
> -			      GFP_KERNEL);
> +	part->bam_cache = kmalloc_array(part->BlocksPerUnit,
> +					sizeof(*part->bam_cache), GFP_KERNEL);

+1
>      if (!part->bam_cache)
>  	    goto out_VirtualBlockMap;
>  
> 
