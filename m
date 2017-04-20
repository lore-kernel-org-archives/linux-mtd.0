Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1Ft2-00013n-Rw
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 17:28:58 +0000
Received: by mail-wm0-x241.google.com with SMTP id o81so12100145wmb.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 10:28:36 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] mtd: dataflash: Add flash_info for AT45DB641E
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org
References: <20170420162952.5181-1-andrew.smirnov@gmail.com>
 <20170420162952.5181-6-andrew.smirnov@gmail.com>
Cc: cphealy@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a1a00d99-ea79-3420-0afb-b2728459c2cf@gmail.com>
Date: Thu, 20 Apr 2017 19:28:05 +0200
MIME-Version: 1.0
In-Reply-To: <20170420162952.5181-6-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/20/2017 06:29 PM, Andrey Smirnov wrote:
> Cc: cphealy@gmail.com
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
> Changes since [v3]:
> 
> 	- Update the patch ot use SUP_EXTID
> 
> No changes between v3 to v1.
> 
> [v3] http://lkml.kernel.org/r/20170419152305.17226-6-andrew.smirnov@gmail.com
> 
> 
>  drivers/mtd/devices/mtd_dataflash.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index 9342cc47..7e6cdfe 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -736,6 +736,9 @@ static struct flash_info dataflash_data[] = {
>  
>  	{ "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
>  	{ "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
> +
> +	{ "AT45DB641E",  0x1f28000100, 32768, 264, 9, SUP_EXTID | SUP_POW2PS},
> +	{ "at45db641e",  0x1f28000100, 32768, 256, 8, SUP_EXTID | SUP_POW2PS | IS_POW2PS},
>  };
>  
>  static struct flash_info *jedec_lookup(struct spi_device *spi,
> 


-- 
Best regards,
Marek Vasut
