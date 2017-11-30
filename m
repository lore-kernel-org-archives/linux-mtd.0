Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKOwU-0002m9-Ai
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 13:31:56 +0000
Subject: Re: [PATCH V1] drivers:mtd:spi-nor:checkup FSR error bits
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <825c7a1bb1034369b9d592a7b358030c@SIWEX5A.sing.micron.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <13355c72-6dd2-6431-2d0b-9b2975a8c1a4@wedev4u.fr>
Date: Thu, 30 Nov 2017 14:31:17 +0100
MIME-Version: 1.0
In-Reply-To: <825c7a1bb1034369b9d592a7b358030c@SIWEX5A.sing.micron.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

Le 11/11/2017 à 21:49, Bean Huo (beanhuo) a écrit :
> For the Micron SPI NOR, when the erase/program operation fails, especially,

To be verified but I think you'd rather remove "the" words in this case:

"For Micron SPI NOR memories, when erase/program operation fails, especially ..."

Maybe no comma after "especially".

> for the failure results from intending to modify protected space, spi-nor
> upper layers still get the return which shows the operation succeeds.
> this because spi_nor_fsr_ready() only uses bit.7 to device whether ready.

"This": missing capital letter and maybe a verb too.

> For the most cases, even the error of erase/program occurs, SPI NOR device
> is still ready. The device ready and the error are two different cases.

I don't really understand what you mean here.

> This patch is to fixup this issue and adding FSR (flag status register)

This patch fixes the issue by checking relevant bits in the FSR.

> error bits checkup.
> The FSR(flag status register) is a powerful tool to investigate the staus

"The FSR (flag status register)": please insert a space ' '.

s/staus/status/


> of device,checking information regarding what is actually doing the memory

"of device, checking": missing space 
> and detecting possible error conditions.
>

Globally, I think you need to reword your commit message. IMHO, it is not
clear though I think I've mostly understood what you meant reading the
actual source code.

> Signed-off-by: beanhuo <beanhuo@micron.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 19 +++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  6 +++++-
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bc266f7..200e814 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -330,8 +330,23 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>  	int fsr = read_fsr(nor);
>  	if (fsr < 0)
>  		return fsr;
> -	else
> -		return fsr & FSR_READY;
> +
> +	if (fsr & (FSR_E_ERR | FSR_P_ERR)) {
> +		if (fsr & FSR_E_ERR)
> +			dev_err(nor->dev, "Erase operation failed.\n");
> +		else
> +			dev_err(nor->dev, "Program operation failed.\n");
> +
> +		if (fsr & FSR_PT_ERR)
> +			dev_err(nor->dev,
> +			"The operation has attempted to modify the protected"

A space ' ' is missing after "protected".
Also please verify next version passes the checkpatch test because this
version doesn't.

I think you should check the verb tense consistency:
[...] operation failed. The operation attempted [...]

Also maybe you should write "a protected sector" or "some protected sector":
"the protected sector" sounds like there is only one protected sector.

> +			"sector or the locked OPT space.\n");

You meant OTP (One Time Programmable), didn't you ? s/OPT/OTP/

> +
> +		nor->write_reg(nor, SPINOR_OP_CLFSR, NULL, 0);
> +		return -EIO;
> +	}
> +
> +	return fsr & FSR_READY;
>  }
>  
>  static int spi_nor_ready(struct spi_nor *nor)
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index d0c66a0..46b5608 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -61,6 +61,7 @@
>  #define SPINOR_OP_RDSFDP	0x5a	/* Read SFDP */
>  #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
>  #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
> +#define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
>  
>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>  #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
> @@ -130,7 +131,10 @@
>  #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
>  
>  /* Flag Status Register bits */
> -#define FSR_READY		BIT(7)
> +#define FSR_READY		BIT(7)	/* Device status, 0 = Busy,1 = Ready */

You may insert a space ' ' between "Busy," and "1 = "

Best regards,

Cyrille

> +#define FSR_E_ERR		BIT(5)	/* Erase operation status */
> +#define FSR_P_ERR		BIT(4)	/* Program operation status */
> +#define FSR_PT_ERR		BIT(1)	/* Protection error bit */
>  
>  /* Configuration Register bits. */
>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
> 
