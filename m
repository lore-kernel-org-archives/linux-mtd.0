Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6CGZ-0008GS-Q3
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 23:29:13 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KJV00ALL5872AJ0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 18 May 2009 19:28:55 -0400 (EDT)
Date: Mon, 18 May 2009 19:28:55 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Daniel Ribeiro <drwyrm@gmail.com>
Subject: Re: [PATCH] cfi_cmdset_0001.c: CFI 1.0 and CFI 1.1
In-reply-to: <1242558128.26769.6.camel@brutus>
Message-id: <alpine.LFD.2.00.0905181928310.6741@xanadu.home>
References: <1242558128.26769.6.camel@brutus>
Cc: linux-mtd@lists.infradead.org,
	openezx-devel <openezx-devel@lists.openezx.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 17 May 2009, Daniel Ribeiro wrote:

> This patch allows otpinfo for CFI >= 1.0 and burst read for CFI >= 1.1.
> (sent again with CC to Nicolas Pitre)
> 
> references:
> 1.0:	http://www.datasheetcatalog.org/datasheets2/81/816884_1.pdf
> 
> 1.1:	http://milkymist.org/doc/MT28F640J3.pdf
> 	http://www.delorie.com/agenda/specs/29066709.pdf
> 
> Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>

Acked-by: Nicolas Pitre <nico@cam.org>

> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |   14 ++++++++++----
>  1 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index c240454..bf07d14 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -319,6 +319,7 @@ static inline struct cfi_pri_intelext *
>  read_pri_intelext(struct map_info *map, __u16 adr)
>  {
>  	struct cfi_pri_intelext *extp;
> +	unsigned int extra_size = 0;
>  	unsigned int extp_size = sizeof(*extp);
>  
>   again:
> @@ -340,19 +341,24 @@ read_pri_intelext(struct map_info *map, __u16 adr)
>  	extp->BlkStatusRegMask = le16_to_cpu(extp->BlkStatusRegMask);
>  	extp->ProtRegAddr = le16_to_cpu(extp->ProtRegAddr);
>  
> -	if (extp->MajorVersion == '1' && extp->MinorVersion >= '3') {
> -		unsigned int extra_size = 0;
> -		int nb_parts, i;
> +	if (extp->MinorVersion >= '0') {
> +		extra_size = 0;
>  
>  		/* Protection Register info */
>  		extra_size += (extp->NumProtectionFields - 1) *
>  			      sizeof(struct cfi_intelext_otpinfo);
> +	}
>  
> +	if (extp->MinorVersion >= '1') {
>  		/* Burst Read info */
>  		extra_size += 2;
>  		if (extp_size < sizeof(*extp) + extra_size)
>  			goto need_more;
> -		extra_size += extp->extra[extra_size-1];
> +		extra_size += extp->extra[extra_size - 1];
> +	}
> +
> +	if (extp->MinorVersion >= '3') {
> +		int nb_parts, i;
>  
>  		/* Number of hardware-partitions */
>  		extra_size += 1;
> -- 
> tg: (1406de8..) mtd/cfi1.1-has-extra-too (depends on: master)
> 
> -- 
> Daniel Ribeiro
> 
