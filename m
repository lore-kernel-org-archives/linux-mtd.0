Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQz9i-0002Jb-6i
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 16:20:16 +0000
Received: by mail-wm0-x241.google.com with SMTP id r126so10565565wmr.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 08:19:53 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: move TRX parsing code to separated
 function
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7e15fb84-296b-e4d6-a965-b47921d5577c@gmail.com>
Date: Tue, 10 Jan 2017 17:19:37 +0100
MIME-Version: 1.0
In-Reply-To: <20170110115045.9134-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/10/2017 12:50 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This change simplifies main parsing loop logic a bit. In future it may
> be useful for moving TRX support to separated module / parser (if we
> implement support for them at some point).
> Finally parsing TRX at the end puts us in a better position as we have
> better flash layout knowledge. It may be useful e.g. if it appears there
> is more than 1 TRX partition.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  drivers/mtd/bcm47xxpart.c | 124 ++++++++++++++++++++++++++++------------------
>  1 file changed, 77 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 283ff7e..d7d1b6e 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -83,6 +83,70 @@ static const char *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
>  	return "rootfs";
>  }
>  
> +static int bcm47xxpart_parse_trx(struct mtd_info *master,
> +				 struct mtd_partition *trx,
> +				 struct mtd_partition *parts,
> +				 size_t parts_len)
> +{
> +	struct mtd_partition *part;
> +	struct trx_header header;
> +	size_t bytes_read;
> +	int curr_part = 0;
> +	int i, err;
> +
> +	if (parts_len < 3) {
> +		pr_warn("No enough space to add TRX partitions!\n");
> +		return -ENOMEM;
> +	}
> +
> +	err = mtd_read(master, trx->offset, sizeof(header), &bytes_read,
> +		       (uint8_t *)&header);
> +	if (err && !mtd_is_bitflip(err)) {
> +		pr_err("mtd_read error while reading TRX header: %d\n", err);
> +		return err;
> +	}
> +
> +	i = 0;
> +
> +	/* We have LZMA loader if offset[2] points to sth */
> +	if (header.offset[2]) {
> +		part = &parts[curr_part++];
> +		part->name = "loader";
> +		part->offset = trx->offset + header.offset[i];
> +		i++;
> +	}
> +
> +	if (header.offset[i]) {
> +		part = &parts[curr_part++];
> +		part->name = "linux";
> +		part->offset = trx->offset + header.offset[i];
> +		i++;
> +	}
> +
> +	if (header.offset[i]) {
> +		size_t offset = trx->offset + header.offset[i];
> +
> +		part = &parts[curr_part++];
> +		part->name = bcm47xxpart_trx_data_part_name(master, offset);
> +		part->offset = offset;

Why don't you still use bcm47xxpart_add_part() here ?

> +		i++;
> +	}
> +
> +	/*
> +	 * Assume that every partition ends at the beginning of the one it is
> +	 * followed by.
> +	 */
> +	for (i = 0; i < curr_part; i++) {
> +		u64 next_part_offset = (i < curr_part - 1) ?
> +					parts[i + 1].offset :
> +					trx->offset + trx->size;
> +
> +		parts[i].size = next_part_offset - parts[i].offset;
> +	}
> +
> +	return curr_part;
> +}
> +
>  static int bcm47xxpart_parse(struct mtd_info *master,
>  			     const struct mtd_partition **pparts,
>  			     struct mtd_part_parser_data *data)
> @@ -93,9 +157,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  	size_t bytes_read;
>  	uint32_t offset;
>  	uint32_t blocksize = master->erasesize;
> -	struct trx_header *trx;
>  	int trx_part = -1;
> -	int last_trx_part = -1;
>  	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
>  	int err;
>  
> @@ -182,54 +244,14 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  
>  		/* TRX */
>  		if (buf[0x000 / 4] == TRX_MAGIC) {
> -			if (BCM47XXPART_MAX_PARTS - curr_part < 4) {
> -				pr_warn("Not enough partitions left to register trx, scanning stopped!\n");
> -				break;
> -			}
> -
> -			trx = (struct trx_header *)buf;
> +			struct trx_header *trx;
>  
>  			trx_part = curr_part;
>  			bcm47xxpart_add_part(&parts[curr_part++], "firmware",
>  					     offset, 0);
>  
> -			i = 0;
> -			/* We have LZMA loader if offset[2] points to sth */
> -			if (trx->offset[2]) {
> -				bcm47xxpart_add_part(&parts[curr_part++],
> -						     "loader",
> -						     offset + trx->offset[i],
> -						     0);
> -				i++;
> -			}
> -
> -			if (trx->offset[i]) {
> -				bcm47xxpart_add_part(&parts[curr_part++],
> -						     "linux",
> -						     offset + trx->offset[i],
> -						     0);
> -				i++;
> -			}
> -
> -			/*
> -			 * Pure rootfs size is known and can be calculated as:
> -			 * trx->length - trx->offset[i]. We don't fill it as
> -			 * we want to have jffs2 (overlay) in the same mtd.
> -			 */
> -			if (trx->offset[i]) {
> -				const char *name;
> -
> -				name = bcm47xxpart_trx_data_part_name(master, offset + trx->offset[i]);
> -				bcm47xxpart_add_part(&parts[curr_part++],
> -						     name,
> -						     offset + trx->offset[i],
> -						     0);
> -				i++;
> -			}
> -
> -			last_trx_part = curr_part - 1;
> -
>  			/* Jump to the end of TRX */
> +			trx = (struct trx_header *)buf;
>  			offset = roundup(offset + trx->length, blocksize);
>  			/* Next loop iteration will increase the offset */
>  			offset -= blocksize;
> @@ -307,9 +329,17 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  				       parts[i + 1].offset : master->size;
>  
>  		parts[i].size = next_part_offset - parts[i].offset;
> -		if (i == last_trx_part && trx_part >= 0)
> -			parts[trx_part].size = next_part_offset -
> -					       parts[trx_part].offset;
> +	}
> +
> +	/* If there was TRX parse it now */
> +	if (trx_part >= 0) {
> +		int num_parts;
> +
> +		num_parts = bcm47xxpart_parse_trx(master, &parts[trx_part],
> +						  parts + curr_part,
> +						  BCM47XXPART_MAX_PARTS - curr_part);
> +		if (num_parts > 0)
> +			curr_part += num_parts;
>  	}
>  
>  	*pparts = parts;
> 


-- 
Best regards,
Marek Vasut
