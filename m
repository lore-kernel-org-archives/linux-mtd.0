Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d61HH-0008LO-Rs
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 20:53:41 +0000
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 840DD3FEE3
 for <linux-mtd@lists.infradead.org>; Wed,  3 May 2017 22:53:16 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: allow building with
 COMPILE_TEST
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <20170502011300.137397-1-computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Ludovic Barre <ludovic.barre@st.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <a238bf76-828a-5df2-fba7-ebe93939b4a4@wedev4u.fr>
Date: Wed, 3 May 2017 22:53:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170502011300.137397-1-computersforpeace@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Le 02/05/2017 à 03:13, Brian Norris a écrit :
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

Do you want me to take it into the github/spi-nor tree or do you want to
take it directly in the l2-mtd.git tree for 4.12 ?

Best regards,

Cyrille

> ---
>  drivers/mtd/spi-nor/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index bfdfb1e72b38..293c8a4d1e49 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -108,7 +108,7 @@ config SPI_INTEL_SPI_PLATFORM
>  
>  config SPI_STM32_QUADSPI
>  	tristate "STM32 Quad SPI controller"
> -	depends on ARCH_STM32
> +	depends on ARCH_STM32 || COMPILE_TEST
>  	help
>  	  This enables support for the STM32 Quad SPI controller.
>  	  We only connect the NOR to this controller.
> 
