Date: Tue, 6 Sep 2016 14:15:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 3/7] mtd: nand: convert ONFI mode into data interface
Message-ID: <20160906141515.13ee9f39@bbrezillon>
In-Reply-To: <1473158355-22451-4-git-send-email-s.hauer@pengutronix.de>
References: <1473158355-22451-1-git-send-email-s.hauer@pengutronix.de>
 <1473158355-22451-4-git-send-email-s.hauer@pengutronix.de>
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

On Tue,  6 Sep 2016 12:39:11 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> struct nand_data_interface is the designated type to pass to
> the NAND drivers to configure the timing. To simplify this introduce
> onfi_async_timing_mode_to_data_interface() to convert a ONFI
> mode into a nand_data_interface.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/nand_timings.c | 444 +++++++++++++++++++++-------------------
>  include/linux/mtd/nand.h        |   2 +
>  2 files changed, 240 insertions(+), 206 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
> index e81470a..260b074 100644
> --- a/drivers/mtd/nand/nand_timings.c
> +++ b/drivers/mtd/nand/nand_timings.c
> @@ -13,228 +13,246 @@
>  #include <linux/export.h>
>  #include <linux/mtd/nand.h>
>  

[...]

> +
> +/**
> + * onfi_async_timing_mode_to_data_interface - [NAND Interface] Retrieve NAND
> + * data interface according to the given ONFI timing mode
> + * @mode: ONFI timing mode
> + */
> +const struct nand_data_interface *onfi_async_timing_mode_to_data_interface(int mode)
> +{
> +	if (mode < 0 || mode >= ARRAY_SIZE(onfi_sdr_timings))
> +		return ERR_PTR(-EINVAL);
> +
> +	return &onfi_sdr_timings[mode];
> +}
> +EXPORT_SYMBOL(onfi_async_timing_mode_to_data_interface);

On second thought, I'd prefer to have the following helper:

int onfi_init_data_interface(struct nand_data_interface *iface,
			     enum nand_data_interface_type type,
			     int timing_mode)
{
	if (type != NAND_SDR_IFACE)
		return -EINVAL;

	if (timing_mode < 0 ||
	    timing_mode >= ARRAY_SIZE(onfi_sdr_timings))
		return -EINVAL;

	iface->type = NAND_SDR_IFACE;
	iface->timings.sdr = onfi_sdr_timings[timing_mode];

	return 0;
}
