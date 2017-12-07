Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eN2gB-0003Yv-JZ
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 20:22:01 +0000
Date: Thu, 7 Dec 2017 21:21:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, Kyungmin Park
 <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: onenand: Remove obsolete url from Kconfig help
Message-ID: <20171207212127.1ccd5964@bbrezillon>
In-Reply-To: <20171127225256.GA18990@lenoch>
References: <20171127225256.GA18990@lenoch>
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

On Mon, 27 Nov 2017 23:52:56 +0100
Ladislav Michl <ladis@linux-mips.org> wrote:

> Samsung website no longer host information about OneNAND,
> delete it.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  drivers/mtd/onenand/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
> index dcae2f6a2b11..aaeb30458139 100644
> --- a/drivers/mtd/onenand/Kconfig
> +++ b/drivers/mtd/onenand/Kconfig
> @@ -4,8 +4,7 @@ menuconfig MTD_ONENAND
>  	depends on HAS_IOMEM
>  	help
>  	  This enables support for accessing all type of OneNAND flash
> -	  devices. For further information see
> -	  <http://www.samsung.com/Products/Semiconductor/OneNAND/index.htm>
> +	  devices.
>  
>  if MTD_ONENAND
>  
