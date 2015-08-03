Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMO4M-0001wW-AD
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 22:18:55 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH v2 1/6] mtd: spi-nor: change return value of read/write
Date: Mon, 3 Aug 2015 23:46:35 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 " =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?=" <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Gabor Juhos <juhosg@openwrt.org>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?=" <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com
References: <cover.1438626500.git.hramrach@gmail.com>
 <38c818599e1de5530ba0fe86d262d26d737ee7a2.1438626500.git.hramrach@gmail.com>
In-Reply-To: <38c818599e1de5530ba0fe86d262d26d737ee7a2.1438626500.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508032346.36032.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, August 03, 2015 at 08:39:01 PM, Michal Suchanek wrote:
> Change the return value of spi-nor device read and write methods to
> allow returning amount of data transferred and errors as
> read(2)/write(2) does.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  include/linux/mtd/spi-nor.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index e540952..7d782cb 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -185,9 +185,9 @@ struct spi_nor {
>  	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
>  			int write_enable);
> 
> -	int (*read)(struct spi_nor *nor, loff_t from,
> +	ssize_t (*read)(struct spi_nor *nor, loff_t from,
>  			size_t len, size_t *retlen, u_char *read_buf);
> -	void (*write)(struct spi_nor *nor, loff_t to,
> +	ssize_t (*write)(struct spi_nor *nor, loff_t to,
>  			size_t len, size_t *retlen, const u_char *write_buf);
>  	int (*erase)(struct spi_nor *nor, loff_t offs);

You realize that if someone does bisect and has only this patch applied,
the compiler will complain loudly about mismatching data types, right ? :)

Best regards,
Marek Vasut
