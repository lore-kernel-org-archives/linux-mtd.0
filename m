Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZL4T7-0002TB-4i
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 07:11:02 +0000
Date: Fri, 31 Jul 2015 09:10:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: nand: add nand_check_erased helper functions
Message-ID: <20150731091037.09c7ee57@bbrezillon>
In-Reply-To: <1438277694-23763-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1438277694-23763-1-git-send-email-boris.brezillon@free-electrons.com>
 <1438277694-23763-2-git-send-email-boris.brezillon@free-electrons.com>
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

On Thu, 30 Jul 2015 19:34:53 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Add two helper functions to help NAND controller drivers test whether a
> specific NAND region is erased or not.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 104 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand.h     |   8 ++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..1542ea7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1101,6 +1101,110 @@ out:
>  EXPORT_SYMBOL(nand_lock);
>  
>  /**
> + * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
> + * @buf: buffer to test
> + * @len: buffer length
> + * @bitflips_threshold:maximum number of bitflips
> + *
> + * Check if a buffer contains only 0xff, which means the underlying region
> + * has been erased and is ready to be programmed.
> + * The bitflips_threshold specify the maximum number of bitflips before
> + * considering the region is not erased.
> + * Note: The logic of this function has been extracted from the memweight
> + * implementation, except that nand_check_erased_buf function exit before
> + * testing the whole buffer if the number of bitflips exceed the
> + * bitflips_threshold value.
> + *
> + * Returns a positive number of bitflips or -ERROR_CODE.
> + */
> +int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
> +{
> +	const unsigned char *bitmap = buf;
> +	int bitflips = 0;
> +	int weight;
> +	int longs;
> +
> +	for (; len && ((unsigned long)bitmap) % sizeof(long);
> +	     len--, bitmap++) {
> +		weight = hweight8(*bitmap);
> +
> +		bitflips += sizeof(u8) - weight;
> +		if (bitflips > bitflips_threshold)
> +			return -EINVAL;
> +	}
> +
> +
> +	for (longs = len / sizeof(long); longs;
> +	     longs--, bitmap += sizeof(long)) {
> +		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);
> +		weight = hweight_long(*((unsigned long *)bitmap));
> +
> +		bitflips += sizeof(long) - weight;
> +		if (bitflips > bitflips_threshold)
> +			return -EINVAL;
> +	}
> +
> +	len %= sizeof(long);
> +
> +	for (; len > 0; len--, bitmap++) {
> +		weight = hweight8(*bitmap);
> +		bitflips += sizeof(u8) - weight;
> +	}
> +
> +	return bitflips;
> +}
> +EXPORT_SYMBOL(nand_check_erased_buf);
> +
> +/**
> + * nand_check_erased_ecc_chunk - check if an ECC chunk contains (almost) only
> + *				 0xff data
> + * @data: data buffer to test
> + * @datalen: data length
> + * @ecc: ECC buffer
> + * @ecclen: ECC length
> + * @extraoob: extra OOB buffer
> + * @extraooblen: extra OOB length
> + * @bitflips_threshold: maximum number of bitflips
> + *
> + * Check if a data buffer and its associated ECC and OOB data contains only
> + * 0xff pattern, which means the underlying region has been erased and is
> + * ready to be programmed.
> + * The bitflips_threshold specify the maximum number of bitflips before
> + * considering the region as not erased.
> + *
> + * Returns a positive number of bitflips or -ERROR_CODE.
> + */
> +int nand_check_erased_ecc_chunk(void *data, int datalen,
> +				void *ecc, int ecclen,
> +				void *extraoob, int extraooblen,
> +				int bitflips_threshold)
> +{
> +	int bitflips = 0;
> +	int ret;
> +
> +	ret = nand_check_erased_buf(data, datalen, bitflips_threshold);
> +	if (ret < 0)
> +		return ret;
> +
> +	bitflips += ret;
> +	bitflips_threshold -= ret;
> +
> +	ret = nand_check_erased_buf(ecc, ecclen, bitflips_threshold);
> +	if (ret < 0)
> +		return ret;
> +
> +	bitflips += ret;
> +	bitflips_threshold -= ret;
> +
> +	ret = nand_check_erased_buf(extraoob, extraooblen, bitflips_threshold);
> +	if (ret < 0)
> +		return ret;
> +

Forgot the memset operations here:

	memset(data, 0xff, datalen);
	memset(ecc, 0xff, ecclen);
	memset(extraoob, 0xff, extraooblen);

> +	return bitflips + ret;
> +}
> +EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
> +
> +/**
>   * nand_read_page_raw - [INTERN] read raw page data without ecc
>   * @mtd: mtd info structure
>   * @chip: nand chip info structure
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 272f429..ae06a07 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -1030,4 +1030,12 @@ struct nand_sdr_timings {
>  
>  /* get timing characteristics from ONFI timing mode. */
>  const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
> +
> +int nand_check_erased_buf(void *data, int datalen,
> +			  int threshold);
> +
> +int nand_check_erased_ecc_chunk(void *data, int datalen,
> +				void *ecc, int ecclen,
> +				void *extraoob, int extraooblen,
> +				int threshold);
>  #endif /* __LINUX_MTD_NAND_H */



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
