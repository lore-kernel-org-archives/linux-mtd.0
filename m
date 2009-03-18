Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ljrx9-0006S9-Go
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 09:20:54 +0000
Subject: Re: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
	devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
References: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Mar 2009 11:20:29 +0200
Message-Id: <1237368029.3622.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-17 at 18:13 -0700, Kevin Cernekee wrote:
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index 86defe1..10ebb7c 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -1,6 +1,4 @@
>  /*
> - * $Id: mtd-abi.h,v 1.13 2005/11/07 11:14:56 gleixner Exp $
> - *
>   * Portions of MTD ABI definition which are shared by kernel and user space
>   */
> 
> @@ -12,10 +10,21 @@ struct erase_info_user {
>  	uint32_t length;
>  };
> 
> +struct erase_info_user64 {
> +	uint64_t start;
> +	uint64_t length;
> +};
> +
>  struct mtd_oob_buf {
>  	uint32_t start;
>  	uint32_t length;
> -	unsigned char *ptr;
> +	unsigned char __user *ptr;
> +};
> +
> +struct mtd_oob_buf64 {
> +	uint64_t start;
> +	uint32_t length;
> +	unsigned char __user *ptr;
>  };
> 
>  #define MTD_ABSENT		0
> @@ -29,7 +38,7 @@ struct mtd_oob_buf {
>  #define MTD_WRITEABLE		0x400	/* Device is writeable */
>  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
>  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
> -#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
> +#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
> 
>  // Some common devices / combinations of capabilities
>  #define MTD_CAP_ROM		0
> @@ -62,6 +71,15 @@ struct mtd_info_user {
>  	uint32_t eccsize;
>  };
> 
> +struct mtd_info_user64 {
> +	uint32_t type;
> +	uint32_t flags;
> +	uint64_t size;	 // Total size of the MTD
> +	uint32_t erasesize;
> +	uint32_t writesize;
> +	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
> +};
> +
>  struct region_info_user {
>  	uint32_t offset;		/* At which this region starts,
>  					 * from the beginning of the MTD */
> @@ -70,6 +88,14 @@ struct region_info_user {
>  	uint32_t regionindex;
>  };
> 
> +struct region_info_user64 {
> +	uint64_t offset;		/* At which this region starts,
> +					 * from the beginning of the MTD */
> +	uint32_t erasesize;		/* For this region */
> +	uint32_t numblocks;		/* Number of blocks in this region */
> +	uint32_t regionindex;
> +};

I think dwmw2 put it clearly that he will not accept new
_informational_ ioctls like MEMGETINFO64 and so on. This should
be exposed via sysfs instead.

Vs other inctl's, could you please reserve some space there for
possible future inmprovements by adding

uint8_t padding[128]; /* Unused, reserved for future, should be 0'd */

or something like this, please? We suffered from lack of fields like
this in the past.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
