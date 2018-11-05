Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJnmo-0001YB-V1
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 22:55:59 +0000
Date: Mon, 5 Nov 2018 23:55:47 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: docg3: don't set conflicting BCH_CONST_PARAMS
 option
Message-ID: <20181105235547.062dbf9f@bbrezillon>
In-Reply-To: <20181011110639.2649053-1-arnd@arndb.de>
References: <20181011110639.2649053-1-arnd@arndb.de>
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

On Thu, 11 Oct 2018 13:06:16 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> I noticed during the creation of another bugfix that the BCH_CONST_PARAMS
> option that is set by DOCG3 breaks setting variable parameters for any
> other users of the BCH library code.
> 
> The only other user we have today is the MTD_NAND software BCH
> implementation (most flash controllers use hardware BCH these days
> and are not affected). I considered removing BCH_CONST_PARAMS entirely
> because of the inherent conflict, but according to the description in
> lib/bch.c there is a significant performance benefit in keeping it.
> 
> To avoid the immediate problem of the conflict between MTD_NAND_BCH
> and DOCG3, this only sets the constant parameters if MTD_NAND_BCH
> is disabled, which should fix the problem for all cases that
> are affected. This should also work for all stable kernels.
> 
> Note that there is only one machine that actually seems to use the
> DOCG3 driver (arch/arm/mach-pxa/mioa701.c), so most users should have
> the driver disabled, but it almost certainly shows up if we wanted
> to test random kernels on machines that use software BCH in MTD.
> 
> Fixes: d13d19ece39f ("mtd: docg3: add ECC correction code")
> Cc: stable@vger.kernel.org
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/devices/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index e514d57a0419..aa983422aa97 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -207,7 +207,7 @@ comment "Disk-On-Chip Device Drivers"
>  config MTD_DOCG3
>  	tristate "M-Systems Disk-On-Chip G3"
>  	select BCH
> -	select BCH_CONST_PARAMS
> +	select BCH_CONST_PARAMS if !MTD_NAND_BCH
>  	select BITREVERSE
>  	help
>  	  This provides an MTD device driver for the M-Systems DiskOnChip
