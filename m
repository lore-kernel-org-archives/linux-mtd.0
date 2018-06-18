Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUq5k-0005Fl-5b
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 09:04:53 +0000
Date: Mon, 18 Jun 2018 11:04:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: m25p80: Remove unneeded m25p->command field
Message-ID: <20180618110430.5fff1052@bbrezillon>
In-Reply-To: <20180601100325.11165-1-boris.brezillon@bootlin.com>
References: <20180601100325.11165-1-boris.brezillon@bootlin.com>
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

Hi Marek,

Can you add your Acked-by or Reviewed-by if you're okay with these
changes?

Thanks,

Boris

On Fri,  1 Jun 2018 12:03:24 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> The ->command field is no longer used, remove it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/devices/m25p80.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 3dc022d3b53e..73dd74330227 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -28,11 +28,9 @@
>  #include <linux/spi/flash.h>
>  #include <linux/mtd/spi-nor.h>
>  
> -#define	MAX_CMD_SIZE		6
>  struct m25p {
>  	struct spi_mem		*spimem;
>  	struct spi_nor		spi_nor;
> -	u8			command[MAX_CMD_SIZE];
>  };
>  
>  static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
