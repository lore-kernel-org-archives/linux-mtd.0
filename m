Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDA29-00010r-9k
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 08:49:10 +0000
Message-ID: <1362559787.21850.19.camel@sauron>
Subject: Re: [PATCH 03/11] arm: defconfigs: lpc32xx_defconfig: remove the
 museum NAND option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, Roland Stigge
 <stigge@antcom.de>
Date: Wed, 06 Mar 2013 10:49:47 +0200
In-Reply-To: <1362489444-27762-4-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
 <1362489444-27762-4-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 15:17 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> The MTD_NAND_MUSEUM_IDS configuration options was removed - update the
> lpc32xx_defconfig file.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  arch/arm/configs/lpc32xx_defconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
> index 92386b2..e77326f 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -55,7 +55,6 @@ CONFIG_MTD_CHAR=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_M25P80=y
>  CONFIG_MTD_NAND=y
> -CONFIG_MTD_NAND_MUSEUM_IDS=y
>  CONFIG_MTD_NAND_SLC_LPC32XX=y
>  CONFIG_MTD_NAND_MLC_LPC32XX=y
>  CONFIG_BLK_DEV_LOOP=y

Let me add Roland as this config file was added by him. Roland, FYI.

-- 
Best Regards,
Artem Bityutskiy
