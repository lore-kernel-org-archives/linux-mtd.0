Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUqfL-0003nC-0a
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 09:41:40 +0000
Received: by mail-pg0-x243.google.com with SMTP id e11-v6so7269776pgq.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2018 02:41:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: m25p80: Remove unneeded m25p->command field
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20180601100325.11165-1-boris.brezillon@bootlin.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <44d7bade-19c9-3929-4e79-e501877e7e61@gmail.com>
Date: Mon, 18 Jun 2018 11:40:41 +0200
MIME-Version: 1.0
In-Reply-To: <20180601100325.11165-1-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/01/2018 12:03 PM, Boris Brezillon wrote:
> The ->command field is no longer used, remove it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

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
> 


-- 
Best regards,
Marek Vasut
