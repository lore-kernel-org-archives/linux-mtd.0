Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYyk5-0006yI-7Y
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 13:44:58 +0000
Date: Wed, 23 Oct 2013 10:44:51 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v10 10/10] mtd: nand: omap: remove selection of BCH
 ecc-scheme via KConfig
Message-ID: <20131023134450.GE2458@localhost>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-11-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1382172254-12448-11-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 ijc+devicetree@hellion.org.uk, linux-omap@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 avinashphilipk@gmail.com, swarren@wwwdotorg.org, jp.francois@cynove.com,
 balbi@ti.com, robherring2@gmail.com, bcousson@baylibre.com, olof@lixom.net,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gupta,

I already have a question :-)

On Sat, Oct 19, 2013 at 02:14:14PM +0530, Pekon Gupta wrote:
> With OMAP NAND driver updates, selection of ecc-scheme:
> *DT enabled kernel*
>  	depends on ti,nand-ecc-opt and ti,elm-id DT bindings.
> *Non DT enabled kernel*
> 	depends on elm_dev and ecc-scheme passed along with platform-data
> 	from board file.
> 
> So, selection of ecc-scheme (BCH8 or BCH4) from KConfig can be removed
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/Kconfig | 40 ++++++----------------------------------
>  1 file changed, 6 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index d885298..93ae6a6 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -96,43 +96,15 @@ config MTD_NAND_OMAP2
>  
>  config MTD_NAND_OMAP_BCH
>  	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3

I'm wondering how are you testing this in your SOC_AM33XX board (which
is not ARCH_OMAP3). You probably have ARCH_OMAP3 always selected?

IMO, no need to depend on any ARCH_xxx, just make it depend on the driver
option itself, which already depends on ARCH_OMAP2PLUS (which is the bigger
SoC family).

Care to send a one-patch fix for that, so this *independent* bug can be
taken by Brian? Please add my Reported-by when you do so.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
