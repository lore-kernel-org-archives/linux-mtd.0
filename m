Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjSF0-0005Az-7y
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 17:11:07 +0000
Date: Tue, 15 Jan 2019 18:10:55 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <boris.brezillon@bootlin.co>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as SPI NOR co-maintainer
Message-ID: <20190115181038.2a670a4e@bbrezillon>
In-Reply-To: <20190115165740.32450-1-tudor.ambarus@microchip.com>
References: <20190115165740.32450-1-tudor.ambarus@microchip.com>
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

Hi Tudor,

On Tue, 15 Jan 2019 16:57:52 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> I have been reviewing and contributing to the SPI NOR subsystem
> for the last few months and I'm willing to continue doing so.
> Volunteer as a maintainer for the SPI NOR part of the MTD subsystem.

I'll wait a bit before applying this patch to let other maintainers ack
or nack it if they want, but I must say that's a huge relief for me to
have a new person handling SPI NOR patches on board.

Thanks a lot for doing that.

Regards,

Boris

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6682420421c1..7deb0e91e3ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14081,6 +14081,7 @@ F:	arch/arm/mach-spear/
>  
>  SPI NOR SUBSYSTEM
>  M:	Marek Vasut <marek.vasut@gmail.com>
> +M:	Tudor Ambarus <tudor.ambarus@microchip.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
