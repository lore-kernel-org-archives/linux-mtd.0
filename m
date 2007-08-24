Received: from hu-out-0506.google.com ([72.14.214.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOWbN-0000Hj-T0
	for linux-mtd@lists.infradead.org; Fri, 24 Aug 2007 06:41:21 -0400
Received: by hu-out-0506.google.com with SMTP id 34so450128hui
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Aug 2007 03:41:15 -0700 (PDT)
From: Denys Vlasenko <vda.linux@googlemail.com>
To: Jesper Juhl <jesper.juhl@gmail.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
Date: Fri, 24 Aug 2007 11:41:06 +0100
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
In-Reply-To: <5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708241141.06358.vda.linux@googlemail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 24 August 2007 00:52, Jesper Juhl wrote:
> kmalloc() returns a void pointer.
> No need to cast it.

> -	msp_flash = (struct mtd_info **)kmalloc(
> -			fcnt * sizeof(struct map_info *), GFP_KERNEL);
> -	msp_parts = (struct mtd_partition **)kmalloc(
> -			fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> -	msp_maps = (struct map_info *)kmalloc(
> -			fcnt * sizeof(struct mtd_info), GFP_KERNEL);
> +	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
> +	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> +	msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
>  	memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));

This one wants kzalloc.

> -		msp_parts[i] = (struct mtd_partition *)kmalloc(
> -			pcnt * sizeof(struct mtd_partition), GFP_KERNEL);
> +		msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
> +			GFP_KERNEL);
>  		memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
>
>  		/* now initialize the devices proper */

Same
--
vda
