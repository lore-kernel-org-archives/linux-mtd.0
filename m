Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dABgL-0008JH-Tf
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 08:48:47 +0000
Date: Mon, 15 May 2017 10:48:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: <linux-mtd@lists.infradead.org>, oss@buserror.net, dedekind1@gmail.com
Subject: Re: [PATCH] driver: mtd: update struct map_info's swap as per map
 requirement.
Message-ID: <20170515104824.2ffb5186@bbrezillon>
In-Reply-To: <1493882437-4541-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1493882437-4541-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Hi Prabhakar,

On Thu, 4 May 2017 12:50:37 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> It is not necessary for all device's maps to be CFI_HOST_ENDIAN. Maps device
> can be Bigendian or little endian.
> 
> Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
> CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.
> 
> Now update struct map_info's swap field based on device characteristics
> defined in device tree.

You should update Documentation/devicetree/bindings/mtd/mtd-physmap.txt
and Cc DT maintainers.

> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/maps/physmap_of.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 14e8909..f39607d 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -20,6 +20,7 @@
>  #include <linux/mtd/map.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/concat.h>
> +#include <linux/mtd/cfi_endian.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> @@ -243,6 +244,9 @@ static int of_flash_probe(struct platform_device *dev)
>  		info->list[i].map.bankwidth = be32_to_cpup(width);
>  		info->list[i].map.device_node = dp;
>  
> +		if (of_property_read_bool(dp->parent, "big-endian"))
> +			info->list[i].map.swap = CFI_BIG_ENDIAN;
> +

Shouldn't we have

		else if (of_property_read_bool(dp->parent,
					       "little-endian"))
			info->list[i].map.swap = CFI_LITTE_ENDIAN;
		else if (of_property_read_bool(dp->parent,
					       "host-endian"))
			info->list[i].map.swap = CFI_HOST_ENDIAN;

Otherwise, you'll fallback to CFI_DEFAULT_ENDIAN (determined with the
CONFIG_MTD_CFI_BE/LE_BYTE_SWAP config options) if the endianness is
not big-endian, which is probably not what you want.

You can even make this property a string property:

		if (!of_property_read_string(dp->parent,
					     "cfi-endianness",
					     &endianness)) {
			if (!strcmp("big", endianness))
				info->list[i].map.swap = CFI_BIG_ENDIAN;
			else if (!strcmp("little", endianness))
				info->list[i].map.swap = CFI_LITTLE_ENDIAN;
			else if (!strcmp("host", endianness))
				info->list[i].map.swap = CFI_HOST_ENDIAN;
		}

>  		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
>  		if (err)
>  			return err;

Regards,

Boris
