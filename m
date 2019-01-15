Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjSyu-0004gS-2A
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 17:58:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id t6so3967511wrr.12
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2019 09:58:31 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: add myself as SPI NOR co-maintainer
To: Tudor.Ambarus@microchip.com, boris.brezillon@bootlin.co, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190115165740.32450-1-tudor.ambarus@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <df26353e-a40f-811a-b9d7-7c40777b889a@gmail.com>
Date: Tue, 15 Jan 2019 18:54:07 +0100
MIME-Version: 1.0
In-Reply-To: <20190115165740.32450-1-tudor.ambarus@microchip.com>
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

On 1/15/19 5:57 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> I have been reviewing and contributing to the SPI NOR subsystem
> for the last few months and I'm willing to continue doing so.
> Volunteer as a maintainer for the SPI NOR part of the MTD subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

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
> 


-- 
Best regards,
Marek Vasut
