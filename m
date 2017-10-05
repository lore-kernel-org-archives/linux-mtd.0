Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e00VQ-00029q-NL
 for linux-mtd@lists.infradead.org; Thu, 05 Oct 2017 07:23:42 +0000
Date: Thu, 5 Oct 2017 09:23:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Shadi Ammouri <shadi@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>,
 Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Igal
 Liberman <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: Update Kconfig information
Message-ID: <20171005092319.48231d15@bbrezillon>
In-Reply-To: <20170929133424.7205-1-gregory.clement@free-electrons.com>
References: <20170929133424.7205-1-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 Sep 2017 15:34:24 +0200
Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> More and more SoCs use the pxa3xx_nand driver for their controller but
> the list of them was not updated. This patch add the last SoCs using the
> driver.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
> Changelog v1->v2:
> 
> - Improve wording thanks to Thomas Petazzoni
> 
>  drivers/mtd/nand/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 3f2036f31da4..bb48aafed9a2 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -317,8 +317,11 @@ config MTD_NAND_PXA3xx
>  	tristate "NAND support on PXA3xx and Armada 370/XP"
>  	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU
>  	help
> +
>  	  This enables the driver for the NAND flash device found on
> -	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
> +	  PXA3xx processors (NFCv1) and also on 32-bit Armada
> +	  platforms (XP, 370, 375, 38x, 39x) and 64-bit Armada
> +	  platforms (7K, 8K) (NFCv2).
>  
>  config MTD_NAND_SLC_LPC32XX
>  	tristate "NXP LPC32xx SLC Controller"
