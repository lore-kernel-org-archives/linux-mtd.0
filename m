Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byexy-0001m6-M8
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:07:07 +0000
Subject: Re: [PATCH] MAINTAINERS: add more people to the MTD maintainer team
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <9e70dbc8-d234-fdb4-b7a6-0cfd91aca1cf@atmel.com>
Date: Mon, 24 Oct 2016 15:06:39 +0200
MIME-Version: 1.0
In-Reply-To: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Le 24/10/2016 à 14:35, Boris Brezillon a écrit :
> Brian has been maintaining the MTD subsystem alone for several years
> now, and maintaining such a subsystem can really be time consuming.
> 
> Create a maintainer team formed of the most active MTD contributors
> to help Brian with this task, which will hopefully improve the
> subsystem reactivity.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

thanks! :)

Cyrille
> ---
> Hi all,
> 
> I'm just trying to summarize what I understood the process would be,
> don't hesitate to correct me if I'm wrong.
> 
> For each release we will assign a specific MTD maintainer which will be
> responsible for taking MTD core patches and pulling spi-nor and nand PRs
> into the MTD tree and eventually send one or several PRs to Linus.
> 
> For fixes that are submitted after -rc1, I usually ask Brian to apply
> them directly into the MTD tree (I don't think there's a real need to
> prepare spi-nor and nand PRs for fixes), so we can proceed the same
> way: ask the maintainer assigned to this release to also take care of
> applying fixes and sending PRs to Linus before each -rc.
> 
> If you have other ideas, or would like to proceed differently, don't
> hesitate propose them.
> 
> Thanks,
> 
> Boris
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1cd38a7e0064..cbf9583fdbe7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7912,6 +7912,10 @@ F:	mm/
>  MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	David Woodhouse <dwmw2@infradead.org>
>  M:	Brian Norris <computersforpeace@gmail.com>
> +M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Marek Vasut <marek.vasut@gmail.com>
> +M:	Richard Weinberger <richard@nod.at>
> +M:	Cyrille Pitchen <cyrille.pitchen@atmel.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> 
