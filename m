Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2xiW-0002y3-OV
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 09:24:37 +0000
Received: by mail-wm0-x244.google.com with SMTP id g17so4629356wme.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2016 02:24:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
References: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 18 May 2016 11:23:35 +0200
Message-ID: <CAOMqctR75awkRbwzG4_U91wuZqdZJH9MGrcfCtQm7f6qP=ezUw@mail.gmail.com>
Subject: Re: [RESEND][PATCH] mtd: devices: m25p80: add support for mmap read
 request
To: Vignesh R <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 29 March 2016 at 07:46, Vignesh R <vigneshr@ti.com> wrote:
> Certain SPI controllers may provide accelerated hardware interface to
> read from m25p80 type flash devices in order to provide better read
> performance. SPI core supports such devices with spi_flash_read() API.
> Call spi_flash_read(), if supported, to make use of such interface.
>
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>
> Resend v5:
> Rebased on top of v4.6-rc1
> v5: http://www.spinics.net/lists/devicetree/msg106696.html
>
>  drivers/mtd/devices/m25p80.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c9c3b7fa3051..7730e633d7d3 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -131,6 +131,26 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>         /* convert the dummy cycles to the number of bytes */
>         dummy /= 8;
>
> +       if (spi_flash_read_supported(spi)) {
> +               struct spi_flash_read_message msg;
> +               int ret;
> +
> +               msg.buf = buf;
> +               msg.from = from;
> +               msg.len = len;
> +               msg.read_opcode = nor->read_opcode;
> +               msg.addr_width = nor->addr_width;
> +               msg.dummy_bytes = dummy;
> +               /* TODO: Support other combinations */
> +               msg.opcode_nbits = SPI_NBITS_SINGLE;
> +               msg.addr_nbits = SPI_NBITS_SINGLE;
> +               msg.data_nbits = m25p80_rx_nbits(nor);
> +
> +               ret = spi_flash_read(spi, &msg);
> +               *retlen = msg.retlen;

This is wrong. The previous retlen is never passed into msg so it must
be added and not assigned as is seen a few lines below:

        ret = m.actual_length - m25p_cmdsz(nor) - dummy;
        if (ret < 0)
                return -EIO;
        *retlen += ret;

This interface with odd design and poor documentation will be
hopefully weeded out with
mtd: spi-nor: stop passing around retlen
so there is probably no need to patch this separately.

Thanks

Michal
