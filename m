Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLYOt-0001yi-R2
 for linux-mtd@lists.infradead.org; Thu, 15 Jun 2017 17:17:46 +0000
Received: by mail-wr0-x241.google.com with SMTP id z45so4355914wrb.2
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2017 10:17:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Update SPI NOR subsystem git
 repositories
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
References: <20170613194624.9815-1-cyrille.pitchen@wedev4u.fr>
Cc: linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <053a3410-62cf-5d34-d4c2-5d3c5b7a5f87@gmail.com>
Date: Thu, 15 Jun 2017 19:12:28 +0200
MIME-Version: 1.0
In-Reply-To: <20170613194624.9815-1-cyrille.pitchen@wedev4u.fr>
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

On 06/13/2017 09:46 PM, Cyrille Pitchen wrote:
> SPI NOR branches are now hosted on MTD repos, spi-nor/next is on l2-mtd
> and spi-nor/fixes is on linux-mtd.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

Excellent.

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
> ChangeLog
> 
> v1 -> v2
> - add branch names 'spi-nor/fixes' and 'spi-nor/next' after url.
> 
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bf9897f8df4..46177688a4e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12282,7 +12282,8 @@ M:	Marek Vasut <marek.vasut@gmail.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://github.com/spi-nor/linux.git
> +T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
> +T:	git git://git.infradead.org/l2-mtd.git spi-nor/next
>  S:	Maintained
>  F:	drivers/mtd/spi-nor/
>  F:	include/linux/mtd/spi-nor.h
> 


-- 
Best regards,
Marek Vasut
