Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXCz0-0000xU-Jr
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 18:42:07 +0000
Received: by padhy1 with SMTP id hy1so19766289pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 11:41:45 -0700 (PDT)
Date: Wed, 2 Sep 2015 11:41:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 1/2] mtd: nand: add nand_check_erased helper functions
Message-ID: <20150902184143.GR81844@google.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
 <1440409642-5495-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440409642-5495-2-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

First of all, thanks for the persistence.

On Mon, Aug 24, 2015 at 11:47:21AM +0200, Boris Brezillon wrote:
> Add two helper functions to help NAND controller drivers test whether a
> specific NAND region is erased or not.

What sort of tests (if any) did you run for this?

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 108 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand.h     |   8 ++++
>  2 files changed, 116 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..4d2ef65 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1101,6 +1101,114 @@ out:
>  EXPORT_SYMBOL(nand_lock);
>  
>  /**
> + * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
> + * @buf: buffer to test
> + * @len: buffer length
> + * @bitflips_threshold: maximum number of bitflips
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

Small clarification:

  "Returns a positive number of bitflips less than or equal to
  bitflips_threshold, or -ERROR_CODE for bitflips in excess of the
  threshold."

> + */
> +int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)

I don't have much problem with this function as a helper, but does it
really need to be exported? This is exactly the form I *don't* want to
encourage -- checking a data buffer while ignoring the OOB / ECC. Or did
you have a good reason to export this one? I see you don't use it
outside of this file.

And especially if we don't end up exporting this one, I'd really like
some extra explanatory text next to the public interface
(nand_check_erased_ecc_chunk()) to explain some of the pitfalls.
Particularly, why we must check both the data and spare area, and how we
highly recommend (if not require) that new drivers use the existing
methods rather than roll their own.

> +{
> +	const unsigned char *bitmap = buf;
> +	int bitflips = 0;
> +	int weight;
> +	int longs;
> +

Does it make any sense to have a short-circuit condition for the
threshold == 0 case? We could expect to see that for common 1-bit ECC or
similar.

> +	for (; len && ((unsigned long)bitmap) % sizeof(long);

Cast pointer to unsigned long? I'd expect uintptr_t, but then it sees
those are the same often enough that types.h says they're identical...

> +	     len--, bitmap++) {
> +		weight = hweight8(*bitmap);
> +		bitflips += BITS_PER_BYTE - weight;
> +		if (unlikely(bitflips > bitflips_threshold))
> +			return -EINVAL;

I'm not sure EINVAL is the right thing. This isn't a bad argument, it's
just a bad flash. EUCLEAN would fit typical usage. Same comment applies
elsewhere.

> +	}
> +
> +
> +	for (longs = len / sizeof(long); longs;
> +	     longs--, bitmap += sizeof(long)) {
> +		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);

Please don't add BUG_ON(). The language around it has gotten even
stronger to discourage its use. And in this instance I don't think it's
even helpful; because 'longs' is derived from 'len' (which is an 'int'),
this condition is mathematically impossible, no?

Also (feel free to shoot me down), wouldn't the loop bounds be a little
more straightforward (and consistent with the rest of the function), and
not require the 'longs' variable, when written as the following?

	for (; len >= sizeof(long); len -= sizeof(long), bitmap += sizeof(long)) {
		...
	}

> +		weight = hweight_long(*((unsigned long *)bitmap));
> +		bitflips += BITS_PER_LONG - weight;
> +		if (unlikely(bitflips > bitflips_threshold))
> +			return -EINVAL;
> +	}
> +
> +	len %= sizeof(long);

If you did the above, then you shouldn't need this line.

> +
> +	for (; len > 0; len--, bitmap++) {
> +		weight = hweight8(*bitmap);
> +		bitflips += BITS_PER_BYTE - weight;
> +		if (unlikely(bitflips > bitflips_threshold))
> +			return -EINVAL;
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

Add similar language from above? Also, it's very important to note that
this function wipes the buffers in the nearly-erased case!

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
> +	memset(data, 0xff, datalen);
> +	memset(ecc, 0xff, ecclen);
> +	memset(extraoob, 0xff, extraooblen);
> +
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


Brian
