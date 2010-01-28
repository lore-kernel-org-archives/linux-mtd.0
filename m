Subject: Re: [PATCHv2 3/7] nandsim: Define CONFIG_NANDSIM_MAX_PARTS and use
	it instead of MAX_MTD_DEVICES
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1263337726.3011.20.camel@achroite.uk.solarflarecom.com>
References: <1263337726.3011.20.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Jan 2010 18:13:02 +0200
Message-ID: <1264695182.1973.149.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-12 at 23:08 +0000, Ben Hutchings wrote:
> MAX_MTD_DEVICES is about to be removed.
> 
> Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
> ---
>  drivers/mtd/nand/nandsim.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 7281000..58c255e 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -80,6 +80,9 @@
>  #ifndef CONFIG_NANDSIM_DBG
>  #define CONFIG_NANDSIM_DBG        0
>  #endif
> +#ifndef CONFIG_NANDSIM_MAX_PARTS
> +#define CONFIG_NANDSIM_MAX_PARTS  32
> +#endif

Since this is not a Kconfig option, please, remove the CONFIG_ prefix.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
