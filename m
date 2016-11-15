Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6kkq-0001nW-Lu
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 20:54:57 +0000
Received: by mail-wm0-x242.google.com with SMTP id g23so4089242wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2016 12:54:36 -0800 (PST)
Subject: Re: [PATCH] nand gpmi fix erased block bitflip counting
To: w.cappelle@televic.com, linux-mtd@lists.infradead.org
References: <1478694920-6453-1-git-send-email-w.cappelle@televic.com>
 <1478694920-6453-2-git-send-email-w.cappelle@televic.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stefan Wahren <stefan.wahren@i2se.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8aa7c7cb-5093-3bee-2807-f2734b7c7b06@gmail.com>
Date: Tue, 15 Nov 2016 21:54:32 +0100
MIME-Version: 1.0
In-Reply-To: <1478694920-6453-2-git-send-email-w.cappelle@televic.com>
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

On 11/09/2016 01:35 PM, w.cappelle@televic.com wrote:
> From: Wouter Cappelle <w.cappelle@televic.com>

Please add commit message explaining the purpose of the patch.
CCing some more interested people.

> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 8339d4f..6ae118c 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1217,6 +1217,7 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
>  	int base = geo->ecc_chunkn_size * chunk;
>  	unsigned int flip_bits = 0, flip_bits_noecc = 0;
>  	uint64_t *buf = (uint64_t *)this->data_buffer_dma;
> +	unsigned char *chunkbuf =(unsigned char*) this->data_buffer_dma;
>  	unsigned int threshold;
>  	int i;
>  
> @@ -1224,13 +1225,6 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
>  	if (threshold > geo->ecc_strength)
>  		threshold = geo->ecc_strength;
>  
> -	/* Count bitflips */
> -	for (i = 0; i < geo->ecc_chunkn_size; i++) {
> -		flip_bits += hweight8(~data[base + i]);
> -		if (flip_bits > threshold)
> -			return false;
> -	}
> -
>  	/*
>  	 * Read out the whole page with ECC disabled, and check it again,
>  	 * This is more strict then just read out a chunk, and it makes
> @@ -1246,6 +1240,12 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
>  			return false;
>  	}
>  
> +	/* Count bitflips in the current chunk for correct stats reporting */
> +	for (i = 0; i < geo->ecc_chunkn_size; i++) {
> +		flip_bits += hweight8(~chunkbuf[base + i]);
> +	}
> +
> +
>  	/* Tell the upper layer the bitflips we corrected. */
>  	mtd->ecc_stats.corrected += flip_bits;
>  	*max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
> 


-- 
Best regards,
Marek Vasut
