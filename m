Received: from mail.hevs.ch ([153.109.23.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWTEg-0005DS-Lu
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 09:47:15 +0000
From: Marc Pignat <marc.pignat@hevs.ch>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: [PATCH] [NAND] This patch add support for HW ECC (HSIAO code) on
	AT91SAM9G20.
Date: Fri, 22 Aug 2008 11:47:02 +0200
References: <1516faed0808211959w793d22a0xeea14cf1096012be@mail.gmail.com>
In-Reply-To: <1516faed0808211959w793d22a0xeea14cf1096012be@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808221147.03690.marc.pignat@hevs.ch>
Cc: Hong Xu <hongxu.cn@gmail.com>, linux@arm.linux.org.uk, "Lin,
	JM" <JM.Lin@atmel.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, linux@maxim.org.za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

On Friday 22 August 2008, Hong Xu wrote:
> >From ce6b68cf009a94ab12a31d7f007003173b6cad2c Mon Sep 17 00:00:00 2001
> From: Hong Xu <hong.xu@atmel.com>
> Date: Fri, 22 Aug 2008 10:29:10 +0800
> Subject: [PATCH] This patch add support for HW ECC on AT91SAM9G20.
> 
> AT91SAM9G20 ECC controller is capable of 1-bits error correction
> and 2-bit random detection for every 256 bytes of data. And this
> patch chooses a working mode which can be compatible with software
> ECC.

...

> 
> +#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
> +static struct nand_ecclayout nand_oob_16 = {
> +	.eccbytes = 6,
> +	.eccpos = {0, 1, 2, 3, 6, 7},
> +	.oobfree = {
> +		{.offset = 8,
> +		 . length = 8} }
> +};

static const?

> +
> +static struct nand_ecclayout nand_oob_64 = {
> +	.eccbytes = 24,
> +	.eccpos = {
> +		   40, 41, 42, 43, 44, 45, 46, 47,
> +		   48, 49, 50, 51, 52, 53, 54, 55,
> +		   56, 57, 58, 59, 60, 61, 62, 63 },
> +	.oobfree = {
> +	        {.offset = 2,
> +		 .length = 38} }
> +};
> +
> +static struct nand_ecclayout nand_oob_128 = {
> +	.eccbytes = 48,
> +	.eccpos = {
> +		    80,  81,  82,  83,  84,  85,  86,  87,
> +		    88,  89,  90,  91,  92,  93,  94,  95,
> +		    96,  97,  98,  99, 100, 101, 102, 103,
> +		   104, 105, 106, 107, 108, 109, 110, 111,
> +		   112, 113, 114, 115, 116, 117, 118, 119,
> +	           120, 121, 122, 123, 124, 125, 126, 127},
> +	.oobfree = {
> +		{.offset = 2,
> +		 .length = 38} }
> +};
...
>   * Enable HW ECC : unused on most chips
> @@ -476,14 +565,22 @@ static int __init atmel_nand_probe(struct
> platform_device *pdev)
>  			res = -EIO;
>  			goto err_ecc_ioremap;
>  		}
> -		nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;
>  		nand_chip->ecc.calculate = atmel_nand_calculate;
> -		nand_chip->ecc.correct = atmel_nand_correct;
>  		nand_chip->ecc.hwctl = atmel_nand_hwctl;
> +#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
> +		nand_chip->ecc.mode = NAND_ECC_HW;
> +		nand_chip->ecc.correct = nand_correct_data;

no nand_chip->ecc.read_page?

> +		nand_chip->ecc.bytes = 3;
> +		nand_chip->ecc.prepad = 0;
> +		nand_chip->ecc.postpad = 0;
> +#else
> +		nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;
> +		nand_chip->ecc.correct = atmel_nand_correct;
>  		nand_chip->ecc.read_page = atmel_nand_read_page;
>  		nand_chip->ecc.bytes = 4;
>  		nand_chip->ecc.prepad = 0;
>  		nand_chip->ecc.postpad = 0;
...

> diff --git a/drivers/mtd/nand/atmel_nand_ecc.h
> b/drivers/mtd/nand/atmel_nand_ecc.h
> index 1ee7f99..41e072e 100644
> --- a/drivers/mtd/nand/atmel_nand_ecc.h
> +++ b/drivers/mtd/nand/atmel_nand_ecc.h
> @@ -26,6 +26,30 @@
>  #define		ATMEL_ECC_ECCERR		(1 << 1)		/* ECC Single Bit Error */
>  #define		ATMEL_ECC_MULERR		(1 << 2)		/* Multiple Errors */
> 
> +#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
> +
> +#define ATMEL_ECC_PER_256	(1 << 4)
> +
> +#define ATMEL_ECC_PR0		0x0c
> +#define ATMEL_ECC_PR1		0x10
> +#define ATMEL_ECC_SR2		0x14
> +#define ATMEL_ECC_PR2		0x18
> +#define ATMEL_ECC_PR3		0x1c
> +#define ATMEL_ECC_PR4		0x20
> +#define ATMEL_ECC_PR5		0x24
> +#define ATMEL_ECC_PR6		0x28
> +#define ATMEL_ECC_PR7		0x2c
> +#define ATMEL_ECC_PR8		0x30
> +#define ATMEL_ECC_PR9		0x34
> +#define ATMEL_ECC_PR10		0x38
> +#define ATMEL_ECC_PR11		0x3c
> +#define ATMEL_ECC_PR12		0x40
> +#define ATMEL_ECC_PR13		0x44
> +#define ATMEL_ECC_PR14		0x48
> +#define ATMEL_ECC_PR15		0x4c
> +
> +#else
> +
>  #define ATMEL_ECC_PR		0x0c			/* Parity register */

Never used, perhaps a future use?

...
>  #endif

Best regards

Marc
