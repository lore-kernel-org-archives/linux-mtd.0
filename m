Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwaD-0003VR-VB
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:44:38 +0000
Received: by wwb39 with SMTP id 39so3859889wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:44:34 -0700 (PDT)
Date: Tue, 7 Jun 2011 14:44:30 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
Message-ID: <20110607134429.GE21174@pulham.picochip.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-2-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307453803-31950-2-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dmitry,

This sounds like a good idea.  Nitpick inline.

Jamie

On Tue, Jun 07, 2011 at 05:36:00PM +0400, Dmitry Eremin-Solenikov wrote:
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
>  drivers/mtd/mtdcore.c   |   30 ++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |    5 +++++
>  2 files changed, 35 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c510aff..ac871ad 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -451,6 +451,36 @@ int mtd_device_register(struct mtd_info *master,
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_register);
>  
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
> +		unsigned long size = sizeof(*parts) * defnr_parts;
> +		err = defnr_parts;
> +		parts = kzalloc(size, GFP_KERNEL);
> +		memcpy(parts, defparts, size);

Shouldn't this check the return of kzalloc()?  How about using kmemdup() 
instead of kzalloc() + memcpy()?  Also some kernel-doc to describe the 
search order would be nice.

Jamie
