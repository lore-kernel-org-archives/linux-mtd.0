Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLqUZ-0007wi-BJ
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 13:09:05 +0000
Subject: Re: [PATCH v2] drivers:mtd:spi-nor:checkup FSR error bits
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <c93093d3f0b94665936e6b03cc952c88@SIWEX5A.sing.micron.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0ad87365-c33e-b647-405d-9ea6ed7fb59e@wedev4u.fr>
Date: Mon, 4 Dec 2017 14:08:30 +0100
MIME-Version: 1.0
In-Reply-To: <c93093d3f0b94665936e6b03cc952c88@SIWEX5A.sing.micron.com>
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

Le 04/12/2017 à 13:34, Bean Huo (beanhuo) a écrit :
> For Micron spi nor device, when erase/program operation
> fails, especially the failure results from intending to
> modify protected space, spi-nor upper layers still get
> the return which shows the operation succeeds. This is
> because current spi_nor_fsr_ready() only uses FSR bit.7
> (flag status register) to check device whether ready.
> This patch fixs this issue by checking relevant error

s/fixs/fixes/

> bits in FSR.
> The FSR is a powerful tool to investigate the staus of

s/staus/status/

> device, checking information regarding what is actually
> doing the memory and detecting possible error conditions.
> 
> Signed-off-by: beanhuo <beanhuo@micron.com>

Otherwise,
Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

No need to resend, I'll fix these tiny issues myself :)

Best regards,

Cyrille

> ---
>  v1 - v2:
> 	- Changed some error comments based on Cyrille's reviews.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 18 ++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  6 +++++-
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 19c00072..4423605 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -328,8 +328,22 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
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
> +			"Attempted to modify a protected sector.\n");
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
> index 1f0a7fc..da8e0d5 100644
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
> +#define FSR_READY		BIT(7)	/* Device status, 0 = Busy, 1 = Ready */
> +#define FSR_E_ERR		BIT(5)	/* Erase operation status */
> +#define FSR_P_ERR		BIT(4)	/* Program operation status */
> +#define FSR_PT_ERR		BIT(1)	/* Protection error bit */
>  
>  /* Configuration Register bits. */
>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
> 
