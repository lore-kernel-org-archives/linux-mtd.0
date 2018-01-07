Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYHUu-0002bR-C7
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 20:24:50 +0000
Subject: Re: [PATCH 3/3] spi-nor: intel-spi: Remove unused preopcodes field
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
 <20180104090744.67654-3-mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <daa6bd0b-c029-a8ab-7309-4604a926a7db@wedev4u.fr>
Date: Sun, 7 Jan 2018 21:24:26 +0100
MIME-Version: 1.0
In-Reply-To: <20180104090744.67654-3-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 04/01/2018 à 10:07, Mika Westerberg a écrit :
> This field is not used in the driver anymore so remove it.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to the spi-nor/next branch of linux-mtd

Thanks!

> ---
>  drivers/mtd/spi-nor/intel-spi.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index bba762aa0c8d..8d54da46da30 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -138,7 +138,6 @@
>   * @erase_64k: 64k erase supported
>   * @opcodes: Opcodes which are supported. This are programmed by BIOS
>   *           before it locks down the controller.
> - * @preopcodes: Preopcodes which are supported.
>   */
>  struct intel_spi {
>  	struct device *dev;
> @@ -155,7 +154,6 @@ struct intel_spi {
>  	bool swseq_erase;
>  	bool erase_64k;
>  	u8 opcodes[8];
> -	u8 preopcodes[2];
>  };
>  
>  static bool writeable;
> @@ -400,10 +398,6 @@ static int intel_spi_init(struct intel_spi *ispi)
>  				ispi->opcodes[i] = opmenu0 >> i * 8;
>  				ispi->opcodes[i + 4] = opmenu1 >> i * 8;
>  			}
> -
> -			val = readl(ispi->sregs + PREOP_OPTYPE);
> -			ispi->preopcodes[0] = val;
> -			ispi->preopcodes[1] = val >> 8;
>  		}
>  	}
>  
> 
