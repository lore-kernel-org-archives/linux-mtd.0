Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LoxH9-0003Pz-74
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 10:02:34 +0000
Subject: Re: [resending][PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <34437.192.168.10.89.1238579632.squirrel@dbdmail.itg.ti.com>
References: <34437.192.168.10.89.1238579632.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2009 13:01:50 +0300
Message-Id: <1238580110.20906.73.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-01 at 15:23 +0530, vimal singh wrote:
> I do not see this patch on tree, yet.
> 
> ------------------------------ Original Message -------------------------------
> Subject: [PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
> From:    "vimal singh" <vimalsingh@ti.com>
> Date:    Mon, February 23, 2009 1:46 pm
> To:      linux-mtd@lists.infradead.org
> -------------------------------------------------------------------------------
> 
> Type of 'byte_addr' needed to change for 512 byte ecc support.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>

Probably because you did not try to CC the author of the
code and get his ack. Isn't this logical step to do?

I've CCed Frams.

> ---
> 
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c index
> 868147a..6b19058 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -429,7 +429,8 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char
> *buf,
>  		      unsigned char *read_ecc, unsigned char *calc_ecc)
>  {
>  	unsigned char b0, b1, b2;
> -	unsigned char byte_addr, bit_addr;
> +	uint32_t byte_addr;
> +	unsigned char bit_addr;
>  	/* 256 or 512 bytes/ecc  */
>  	const uint32_t eccsize_mult =
>  			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
> 

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
