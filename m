MIME-Version: 1.0
In-Reply-To: <1441355402-6837-2-git-send-email-vigneshr@ti.com>
References: <1441355402-6837-1-git-send-email-vigneshr@ti.com>
 <1441355402-6837-2-git-send-email-vigneshr@ti.com>
Date: Fri, 4 Sep 2015 16:55:33 +0530
Message-ID: <CAD6G_RT8Q+Uyp1ZjzHf54Tno1wHm0SmLKEwRAe2gkdp772FD9A@mail.gmail.com>
Subject: Re: [PATCH 1/5] spi: introduce mmap read support for spi flash devices
From: Jagan Teki <jteki@openedev.com>
To: Vignesh R <vigneshr@ti.com>
Cc: Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>,
 hramrach@gmail.com, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-omap@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 September 2015 at 13:59, Vignesh R <vigneshr@ti.com> wrote:
> In addition to providing direct access to SPI bus, some spi controller
> hardwares (like ti-qspi) provide special memory mapped port
> to accesses SPI flash devices in order to increase read performance.
> This means the controller can automatically send the SPI signals
> required to read data from the SPI flash device.
> For this, spi controller needs to know flash specific information like
> read command to use, dummy bytes and address width. Once these settings
> are populated in hardware registers, any read accesses to flash's memory
> map region(SoC specific) through memcpy or mem-to-mem DMA copy will be
> handled by controller hardware. The hardware will automatically generate
> spi signals required to read data from flash and present it to CPU or
> DMA engine.
>
> Introduce spi_mtd_mmap_read() method to support memory mapped read
> over SPI flash devices. SPI master drivers can implement this method to
> support memory mapped read interfaces. m25p80 flash driver and other
> flash drivers can call this to request memory mapped read. The interface
> should only be used mtd flashes and cannot be used with other spi devices.
>
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  include/linux/spi/spi.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index d673072346f2..b74a3f169fc2 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -293,6 +293,23 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
>   * @handle_err: the subsystem calls the driver to handle an error that occurs
>   *             in the generic implementation of transfer_one_message().
>   * @unprepare_message: undo any work done by prepare_message().
> + * @spi_mtd_mmap_read: some spi-controller hardwares provide memory
> + *                     mapped interface to communicate with mtd flashes.
> + *                     For this, spi  controller needs to know flash
> + *                     memory settings like read command to use, dummy
> + *                     bytes and address width. Once these settings are
> + *                     populated in hardware registers, any read
> + *                     accesses to flash's memory map region(as defined
> + *                     by SoC) through memcpy or mem-to-mem DMA copy
> + *                     will be handled by controller hardware. The
> + *                     hardware will automatically generate spi signals
> + *                     required to read data from flash and present it
> + *                     to CPU or DMA. SPI master drivers can use this
> + *                     callback to implement memory mapped read
> + *                     interface. Flash driver (like m25p80) requests
> + *                     memory mapped read via this method. The interface
> + *                     should  only be used mtd flashes and cannot be
> + *                     used with other spi devices.
>   * @cs_gpios: Array of GPIOs to use as chip select lines; one per CS
>   *     number. Any individual value may be -ENOENT for CS lines that
>   *     are not GPIOs (driven by the SPI controller itself).
> @@ -438,6 +455,10 @@ struct spi_master {
>                                struct spi_message *message);
>         int (*unprepare_message)(struct spi_master *master,
>                                  struct spi_message *message);
> +       int (*spi_mtd_mmap_read)(struct  spi_device *spi,
> +                                loff_t from, size_t len, size_t *retlen,
> +                                u_char *buf, u8 read_opcode,
> +                                u8 addr_width, u8 dummy_bytes);

This looks un-manageable to know spi core or master knows what are the
command or opcode used by spi-nor flash and also I think mmap support
seems to be flash related or any justification this is spi bus
master/controller feature?

thanks!
-- 
Jagan | openedev.
