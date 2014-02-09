Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCbOT-0001fJ-5A
 for linux-mtd@lists.infradead.org; Sun, 09 Feb 2014 20:54:26 +0000
Message-ID: <1391979242.25855.37.camel@x220>
Subject: Re: [PATCH 15/28] Remove TI_AEMIF
From: Paul Bolle <pebolle@tiscali.nl>
To: Richard Weinberger <richard@nod.at>
Date: Sun, 09 Feb 2014 21:54:02 +0100
In-Reply-To: <1391971686-9517-16-git-send-email-richard@nod.at>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
 <1391971686-9517-16-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 open list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-02-09 at 19:47 +0100, Richard Weinberger wrote:
> The symbol is an orphan, get rid of it.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 90ff447..a195d57 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -465,7 +465,7 @@ config MTD_NAND_SH_FLCTL
>  
>  config MTD_NAND_DAVINCI
>          tristate "Support NAND on DaVinci/Keystone SoC"
> -        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
> +        depends on ARCH_DAVINCI || ARCH_KEYSTONE
>          help
>  	  Enable the driver for NAND flash chips on Texas Instruments
>  	  DaVinci/Keystone processors.

What's strange about the current dependency is that the only aemif code
I could find lives at arch/arm/mach-davinci/aemif.c. Is that reachable
for code in arch/arm/mach-keystone?


Paul Bolle
