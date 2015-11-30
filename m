Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3RbL-0002iP-7c
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 16:46:56 +0000
From: Marek Vasut <marex@denx.de>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] spi/nor: Fix error message with unrecognized JEDEC
Date: Mon, 30 Nov 2015 17:46:29 +0100
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)" <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1448897111-30713-1-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1448897111-30713-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201511301746.29684.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, November 30, 2015 at 04:25:11 PM, Ricardo Ribalda Delgado wrote:
> The error message was:
> 
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
> 
> The new error message:
> 
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00, 00, 00
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b7c038c75684..7d2b96d5f350 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -890,7 +890,7 @@ static const struct flash_info *spi_nor_read_id(struct
> spi_nor *nor) return &spi_nor_ids[tmp];
>  		}
>  	}
> -	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %2x, %2x\n",
> +	dev_err(nor->dev, "unrecognized JEDEC id bytes: %.2x, %.2x, %.2x\n",

You can change it to %02x to make it consistent, no ? What do you think ?

>  		id[0], id[1], id[2]);
>  	return ERR_PTR(-ENODEV);
>  }

Best regards,
Marek Vasut
