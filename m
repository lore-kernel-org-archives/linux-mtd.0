Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FppnR-000770-5Z
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 13:01:54 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0R00D97BAUES50@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 13:01:43 -0400 (EDT)
Date: Mon, 12 Jun 2006 13:01:42 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] MTD: fix endian issue of additional protection fields
In-reply-to: <20060612153458.GJ24758@tweety>
To: Christian Hohnstaedt <chohnstaedt@innominate.com>
Message-id: <Pine.LNX.4.64.0606121301080.2703@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060612153458.GJ24758@tweety>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Jun 2006, Christian Hohnstaedt wrote:

> add byte-swapping for extended OTP areas (NumProtectionFields > 1)
> 
> Signed-off-by: Christian Hohnstaedt <chohnstaedt@innominate.com>

Signed-off-by: Nicolas Pitre <nico@cam.org>

> 
> ---
> 
>  drivers/mtd/chips/cfi_cmdset_0001.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> 0bdeefafb76db54cdb12a10e8fcc5c197221c276
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 0d43581..3227d1e 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -279,11 +279,24 @@ read_pri_intelext(struct map_info *map, 
>  	if (extp->MajorVersion == '1' && extp->MinorVersion >= '3') {
>  		unsigned int extra_size = 0;
>  		int nb_parts, i;
> +		struct cfi_intelext_otpinfo *otp;
>  
>  		/* Protection Register info */
>  		extra_size += (extp->NumProtectionFields - 1) *
>  			      sizeof(struct cfi_intelext_otpinfo);
>  
> +		if (extp_size < sizeof(*extp) + extra_size)
> +			goto need_more;
> +
> +		/* Byteswapping for additional ProtectionFields */
> +		otp = (struct cfi_intelext_otpinfo*)(extp->extra);
> +		for (i=1; i<extp->NumProtectionFields; i++) {
> +			otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
> +			otp->FactGroups = le16_to_cpu(otp->FactGroups);
> +			otp->UserGroups = le16_to_cpu(otp->UserGroups);
> +			otp++;
> +		}
> +
>  		/* Burst Read info */
>  		extra_size += 2;
>  		if (extp_size < sizeof(*extp) + extra_size)
> -- 
> Christian Hohnstaedt
> Software Engineer
> 
> Innominate Security Technologies AG  /device attached security/
> tel: +49.30.6392-3285
> fax: +49.30.6392-3307
> Albert-Einstein-Str. 14
> D-12489 Berlin, Germany
> http://www.innominate.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


Nicolas
