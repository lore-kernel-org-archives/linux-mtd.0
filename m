Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eR2WB-000430-Ue
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 21:00:14 +0000
Date: Tue, 19 Dec 2017 07:59:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Move all MTD related branches to a single
 repo
Message-ID: <20171219075952.7953c361@canb.auug.org.au>
In-Reply-To: <20171218154934.6674-1-boris.brezillon@free-electrons.com>
References: <20171218154934.6674-1-boris.brezillon@free-electrons.com>
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

Hi Boris,

On Mon, 18 Dec 2017 16:49:34 +0100 Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa71ab52fd76..10732ecfc937 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8956,7 +8956,7 @@ L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
>  T:	git git://git.infradead.org/linux-mtd.git master
> -T:	git git://git.infradead.org/l2-mtd.git master
> +T:	git git://git.infradead.org/linux-mtd.git mtd/next

Done.  This is the l2-mtd tree.

>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/
>  F:	drivers/mtd/
> @@ -9344,7 +9344,7 @@ L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
>  T:	git git://git.infradead.org/linux-mtd.git nand/fixes
> -T:	git git://git.infradead.org/l2-mtd.git nand/next
> +T:	git git://git.infradead.org/linux-mtd.git nand/next

Done.  This is the nand tree.  I noticed that it has lost its four top commits.

>  S:	Maintained
>  F:	drivers/mtd/nand/
>  F:	include/linux/mtd/*nand*.h
> @@ -12761,7 +12761,7 @@ L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
>  T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
> -T:	git git://git.infradead.org/l2-mtd.git spi-nor/next
> +T:	git git://git.infradead.org/linux-mtd.git spi-nor/next

Done.  This is the spi-nor tree.

-- 
Cheers,
Stephen Rothwell
