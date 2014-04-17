Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaoVb-0007F6-T9
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 15:45:52 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [RFC PATCH] mtd: spi-nor: add DDR quad read support
Date: Thu, 17 Apr 2014 16:24:36 +0200
References: <1397641641-11430-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1397641641-11430-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404171624.36700.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, sourav.poddar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 16, 2014 at 11:47:21 AM, Huang Shijie wrote:
[...]

> @@ -74,6 +74,11 @@ static int read_cr(struct spi_nor *nor)
>  static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
>  {
>  	switch (nor->flash_read) {
> +	case SPI_NOR_DDR_QUAD:
> +		/*
> +		 * We set 8 for the DDR Quad read, the SPI NOR controller
> +		 * can change it to 6 or 4 with DeviceTree property.
> +		 */

Isn't the number of dummy cycles a property of the chip ?
[...]

> +static int set_ddr_quad_mode(struct spi_nor *nor, u32 jedec_id)
> +{
> +	int status;
> +
> +	switch (JEDEC_MFR(jedec_id)) {
> +	default: /* Spansion */

This should really _check_ the jedec ID here and only enable the quad mode for 
spansion on spansion flashes. The default case should just return -ENOTSUP or 
something.
[...]

> @@ -1016,8 +1038,15 @@ int spi_nor_scan(struct spi_nor *nor, const struct
> spi_device_id *id, if (info->flags & SPI_NOR_NO_FR)
>  		nor->flash_read = SPI_NOR_NORMAL;
> 
> -	/* Quad/Dual-read mode takes precedence over fast/normal */
> -	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
> +	/* DDR Quad/Quad/Dual-read mode takes precedence over fast/normal */
> +	if (mode == SPI_NOR_DDR_QUAD && info->flags & SPI_NOR_DDR_QUAD_READ) {
> +		ret = set_ddr_quad_mode(nor, info->jedec_id);
> +		if (ret) {
> +			dev_err(dev, "DDR quad mode not supported\n");
> +			return ret;

Is it really necessary to fail here? Can we not fall back to some "lower" mode ?
[...]

Best regards,
Marek Vasut
