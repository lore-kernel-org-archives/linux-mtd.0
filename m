Date: Thu, 4 Jul 2013 15:00:17 +0200
From: Johannes Stezenbach <js@sig21.net>
To: yuhang wang <wangyuhang2014@gmail.com>
Subject: Re: SPI: DUAL/QUAD support
Message-ID: <20130704130017.GA25997@sig21.net>
References: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>,
 spi-devel-general@lists.sourceforge.net, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 04, 2013 at 07:36:48PM +0800, yuhang wang wrote:
> 
> I have added the kerneldoc into the patch below to explain the "DUAL"
> and "QUAD" modes.
> Hope for your suggestions.
> 
> Documentation/spi/spi-dual_quad |  102 +++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/devices/m25p80.c    |    2 +
>  drivers/spi/spi.c               |    2 +
>  include/linux/spi/spi.h         |    8 +++

I think what Mark meant is to add new fields to the /** comments
in include/linux/spi/spi.h, then documentation could be generated
(but it seems only outdated copies are online, everyone prefers
to look at the code):
https://www.kernel.org/doc/htmldocs/device-drivers/

> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -354,6 +354,7 @@ static int m25p80_read(struct mtd_info *mtd,
> loff_t from, size_t len,
> 
>         t[1].rx_buf = buf;
>         t[1].len = len;
> +       t[1].bitwidth = flash->spi->rx_bitwidth;
>         spi_message_add_tail(&t[1], &m);
> 
>         mutex_lock(&flash->lock);
> @@ -409,6 +410,7 @@ static int m25p80_write(struct mtd_info *mtd,
> loff_t to, size_t len,
>         spi_message_add_tail(&t[0], &m);
> 
>         t[1].tx_buf = buf;
> +       t[1].bitwidth = flash->spi->tx_bitwidth;
>         spi_message_add_tail(&t[1], &m);
> 
>         mutex_lock(&flash->lock);

Doesn't m25p80 need to use different commands (OPCODEs)
for 2x and 4x speed?  It seems this change is incomplete.

Thanks,
Johannes
