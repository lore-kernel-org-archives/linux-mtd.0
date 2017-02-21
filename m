Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5Qr-0008TE-EH
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:04:23 +0000
Subject: Re: [PATCH 10/11] nand: spi: Add generic SPI controller support
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-11-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <2ad6a42c-598d-b1e9-8487-63dbeae5e0bb@nod.at>
Date: Tue, 21 Feb 2017 09:03:55 +0100
MIME-Version: 1.0
In-Reply-To: <1487664010-25926-11-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter,

Am 21.02.2017 um 09:00 schrieb Peter Pan:
> This commit supports to use generic spi controller
> as SPI NAND controller.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>

...

> +static void spi_nand_mt29f_ecc_status(struct spi_nand_chip *chip,
> +					unsigned int status,
> +					unsigned int *corrected,
> +					unsigned int *ecc_error)
> +{
> +	unsigned int ecc_status = status & SPI_NAND_MT29F_ECC_MASK;
> +
> +	*ecc_error = (ecc_status == SPI_NAND_MT29F_ECC_UNCORR);
> +	switch (ecc_status) {
> +	case SPI_NAND_MT29F_ECC_0_BIT:
> +		*corrected = 0;
> +		break;
> +	case SPI_NAND_MT29F_ECC_1_3_BIT:
> +		*corrected = 3;
> +		break;
> +	case SPI_NAND_MT29F_ECC_4_6_BIT:
> +		*corrected = 6;
> +		break;
> +	case SPI_NAND_MT29F_ECC_7_8_BIT:
> +		*corrected = 8;
> +		break;
> +	}
> +}

I'm confused. What value will the corrected value be when only 1 bit flipped and got corrected?

Thanks,
//richard
