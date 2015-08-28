Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVB57-0001ut-2A
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 04:16:01 +0000
Received: from mail-lb0-f178.google.com ([209.85.217.178]:36196)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZVB4l-003JG7-M1
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 00:15:40 -0400
Received: by lbbpu9 with SMTP id pu9so23245131lbb.3
 for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2015 21:15:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440669139-84122-1-git-send-email-mika.westerberg@linux.intel.com>
References: <1440669139-84122-1-git-send-email-mika.westerberg@linux.intel.com>
Date: Fri, 28 Aug 2015 09:45:38 +0530
Message-ID: <CAD6G_RR0Vy4ZUtadEnvZ=U=kyZkKuW2dN+hKUezA_YMYJUo98w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for Micron n25q064a serial flash
From: Jagan Teki <jteki@openedev.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 August 2015 at 15:22, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Add Micron (n25q064a) 8MB flash to the list of supported chips.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---

I have not tested this, but I just verified the read_id other flash details.

Reviewed-by: Jagan Teki <jteki@openedev.com>

>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d78831b4422b..28190e8a1170 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -590,6 +590,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>         /* Micron */
>         { "n25q032",     INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
>         { "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SPI_NOR_QUAD_READ) },
> +       { "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> --
> 2.5.0
>
>

thanks!
-- 
Jagan | openedev.
