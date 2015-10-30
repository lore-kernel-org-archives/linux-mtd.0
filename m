Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsGs0-0000Jx-Mf
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 21:05:57 +0000
Received: by pasz6 with SMTP id z6so84384092pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 14:05:35 -0700 (PDT)
Date: Fri, 30 Oct 2015 14:05:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: provide default erase_sector
 implementation
Message-ID: <20151030210533.GK13239@google.com>
References: <1446168261-4102-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446168261-4102-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 29, 2015 at 06:24:20PM -0700, Brian Norris wrote:
> Some spi-nor drivers perform sector erase by duplicating their
> write_reg() command. Let's not require that the driver fill this out,
> and provide a default instead.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 30 ++++++++++++++++++++++++++----
>  include/linux/mtd/spi-nor.h   |  3 ++-
>  2 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 49883905a434..58a435372be7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -313,6 +313,29 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>  }
>  
>  /*
> + * Initiate the erasure of a single sector
> + */
> +static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> +{
> +	u8 buf[nor->addr_width];

Hmm, I see some warnings about variable length arrays here. Probably
better to just set a MAX macro with the value of 4, since the extra byte
really doesn't matter that much.

I'll send v2.

Brian
