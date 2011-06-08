Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUFr6-0008PY-HC
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 10:19:21 +0000
Received: by wyb28 with SMTP id 28so305703wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 03:19:18 -0700 (PDT)
Date: Wed, 8 Jun 2011 11:19:09 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
Message-ID: <20110608101909.GG21174@pulham.picochip.com>
References: <20110607134429.GE21174@pulham.picochip.com>
	<1307461738-16811-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307461738-16811-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Jamie Iles <jamie@jamieiles.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 07, 2011 at 07:48:58PM +0400, Dmitry Eremin-Solenikov wrote:
> Lots (nearly all) mtd drivers contain nearly the similar code that
> calls parse_mtd_partitions, provides some platform-default values, if
> parsing fails, and registers  mtd device.
> 
> This is an aim to provide single implementation of this scenario:
> mtd_device_parse_register() which will handle all this parsing and
> defaults.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/mtdcore.c   |   47 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |    5 +++++
>  2 files changed, 52 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c510aff..d538e0a 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -452,6 +452,53 @@ int mtd_device_register(struct mtd_info *master,
>  EXPORT_SYMBOL_GPL(mtd_device_register);
>  
>  /**
> + * mtd_device_parse_register - register an MTD device.
> + *
> + * @mtd: the MTD device to register
> + * @part_probe_types: the list of MTD partition probes to try
> + * @origin: start address of MTD device. =0 unless you are sure you need this.
> + * @defparts: default partition information to register. Only valid if
> + *		defnr_parts > 0
> + * @defnr_parts: the number of partitions in defparts.  If zero then the full
> + *		MTD device is registered if no partition info is found
> + *
> + * Extract partition info and register MTD device (partitions or a whole device)
> + * It calls parse_mtd_partitions(), checks the result. If there were no
> + * partitions found, it uses default info specified (via defparts/defnr_parts)
> + * and then registers either partitions, or (if no partitions were
> + * found/specified) the whow MTD.

s/whow/whole ?

> + */
> +int mtd_device_parse_register(struct mtd_info *mtd,
> +			      const char **part_probe_types,
> +			      unsigned long origin,
> +			      const struct mtd_partition *defparts,
> +			      int defnr_parts)
> +{
> +	int err;
> +	struct mtd_partition *parts;
> +
> +	err = parse_mtd_partitions(mtd, part_probe_types, &parts, origin);
> +	if (err <= 0 && defnr_parts) {
> +		parts = kmemdup(defparts, sizeof(*parts) * defnr_parts,
> +				GFP_KERNEL);
> +		if (!parts)
> +			err = -ENOMEM;
> +	}

I see that some of your patches for drivers (e.g. plat_nand) remove the 
kfree() of the partitions but this doesn't appear to be handled anywhere 
else afaict.  I don't think this can be done in mtd_device_unregister() 
as it doesn't have the mtd_partition array so probably needs to remain 
in the driver.

Jamie
