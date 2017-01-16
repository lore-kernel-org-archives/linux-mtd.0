Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTEmL-000274-IU
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 21:25:27 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
From: Marek Vasut <marex@denx.de>
Message-ID: <596c8ae0-06c5-5951-cf98-fa9eaffce374@denx.de>
Date: Mon, 16 Jan 2017 22:24:33 +0100
MIME-Version: 1.0
In-Reply-To: <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/16/2017 10:00 PM, Uwe Kleine-König wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
> 
> 	compatible = "everspin,mr25h40";
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> Changes since (implicit) v1:
>  - use Kib instead of kib
> 
>  drivers/mtd/devices/m25p80.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd28034..aa50bd96de3a 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
>  	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
>  
> +	/* Everspin MRAMs */
> +	{ "mr25h256" }, /* 256 Kib, 40 MHz */
> +	{ "mr25h10" },  /*   1 Mib, 40 MHz */
> +	{ "mr25h40" },  /*   4 Mib, 40 MHz */
> +
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
> 


-- 
Best regards,
Marek Vasut
