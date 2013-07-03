Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuRbZ-0004eF-A1
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 18:16:38 +0000
Received: by mail-lb0-f175.google.com with SMTP id r10so483224lbi.20
 for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2013 11:16:14 -0700 (PDT)
Sender: Mika Westerberg <mika.westerberg@gmail.com>
Date: Wed, 3 Jul 2013 21:15:19 +0300
From: Mika Westerberg <mika.westerberg@iki.fi>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: Re: [PATCH v2 11/11] spi: spi-ep93xx: use master->cur_msg for
 in-flight message
Message-ID: <20130703181519.GG26568@mwesterb-mobl.lan>
References: <201307021011.34369.hartleys@visionengravers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201307021011.34369.hartleys@visionengravers.com>
Cc: Ryan Mallon <rmallon@gmail.com>, hsweeten@visionengravers.com,
 broonie@kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
 grant.likely@linaro.org, spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 02, 2013 at 10:11:33AM -0700, H Hartley Sweeten wrote:
> Instead of carrying the in-flight message in the driver private
> data, use the cur_msg pointer that is already setup by the core.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Ryan Mallon <rmallon@gmail.com>
> Cc: Mika Westerberg <mika.westerberg@iki.fi>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Grant Likely <grant.likely@linaro.org>
> ---
>  drivers/spi/spi-ep93xx.c | 88 ++++++++++++++++++++++++++----------------------
>  1 file changed, 48 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
> index 4c9a50c..e85834d 100644
> --- a/drivers/spi/spi-ep93xx.c
> +++ b/drivers/spi/spi-ep93xx.c
> @@ -76,7 +76,6 @@
>   * @min_rate: minimum clock rate (in Hz) supported by the controller
>   * @max_rate: maximum clock rate (in Hz) supported by the controller
>   * @wait: wait here until given transfer is completed
> - * @current_msg: message that is currently processed (or %NULL if none)
>   * @tx: current byte in transfer to transmit
>   * @rx: current byte in transfer to receive
>   * @fifo_level: how full is FIFO (%0..%SPI_FIFO_SIZE - %1). Receiving one
> @@ -98,7 +97,6 @@ struct ep93xx_spi {
>  	unsigned long			min_rate;
>  	unsigned long			max_rate;
>  	struct completion		wait;
> -	struct spi_message		*current_msg;
>  	size_t				tx;
>  	size_t				rx;
>  	size_t				fifo_level;
> @@ -378,7 +376,7 @@ static void ep93xx_do_read(struct ep93xx_spi *espi, struct spi_transfer *t)
>  
>  /**
>   * ep93xx_spi_read_write() - perform next RX/TX transfer
> - * @espi: ep93xx SPI controller struct
> + * @master: spi_master struct
>   *
>   * This function transfers next bytes (or half-words) to/from RX/TX FIFOs. If
>   * called several times, the whole transfer will be completed. Returns
> @@ -387,9 +385,10 @@ static void ep93xx_do_read(struct ep93xx_spi *espi, struct spi_transfer *t)
>   * When this function is finished, RX FIFO should be empty and TX FIFO should be
>   * full.
>   */
> -static int ep93xx_spi_read_write(struct ep93xx_spi *espi)
> +static int ep93xx_spi_read_write(struct spi_master *master)
>  {
> -	struct spi_message *msg = espi->current_msg;
> +	struct ep93xx_spi *espi = spi_master_get_devdata(master);
> +	struct spi_message *msg = master->cur_msg;

Is there no way to get the master from espi?

This patch changes lots of places to use master just to be able to access
master->cur_msg which looks overkill to me.
