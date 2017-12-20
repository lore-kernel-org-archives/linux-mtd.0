Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eRgG8-0004wr-Uz
 for linux-mtd@lists.infradead.org; Wed, 20 Dec 2017 15:26:22 +0000
Date: Wed, 20 Dec 2017 16:26:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] MAINTAINERS: Move all MTD related branches to a single
 repo
Message-ID: <20171220162602.071c73bf@bbrezillon>
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

On Mon, 18 Dec 2017 16:49:34 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Historically branches targeting the next release (and pulled in
> linux-next) have been pushed on the l2-mtd repo and fixes branches on
> the linux-mtd one. Now that all MTD maintainers have RW permissions on
> linux-mtd tree, there's no good reason to have two different trees.
> Move all -next branches to linux-mtd.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
> Hi MTD maintainers,
> 
> As discussed a few weeks ago, this patch is moving all MTD related
> branches to the linux-mtd repo in an attempt to make things easier
> for maintainers (it's not unusal to push the next or fixes branch to
> the wrong repo) and developers (it's hard to know where the patch was
> applied, especially when the maintainer does not specify it in his
> reply, which I do a lot :)).
> 
> Once I have gathered acks from all active maintainers, I'll apply this
> patch to the mtd/next branch and ask Stephen to pull next branches from
> their new locations.
> 
> In the meantime, we should try to keep both l2-mtd and linux-mtd synced
> (that means pushing the xxx/next branches on both l2-mtd and mtd-next).

Applied to mtd/next (on the linux-mtd repo). I also created symlinks
for l2-mtd/master, l2-mtd/nand/next and l2-mtd/spi-nor/next as
suggested by David. So please stop pushing things on l2-mtd.

Thanks,

Boris

> 
> Regards,
> 
> Boris
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
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
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/
>  F:	drivers/mtd/
> @@ -9344,7 +9344,7 @@ L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
>  T:	git git://git.infradead.org/linux-mtd.git nand/fixes
> -T:	git git://git.infradead.org/l2-mtd.git nand/next
> +T:	git git://git.infradead.org/linux-mtd.git nand/next
>  S:	Maintained
>  F:	drivers/mtd/nand/
>  F:	include/linux/mtd/*nand*.h
> @@ -12761,7 +12761,7 @@ L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
>  T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
> -T:	git git://git.infradead.org/l2-mtd.git spi-nor/next
> +T:	git git://git.infradead.org/linux-mtd.git spi-nor/next
>  S:	Maintained
>  F:	drivers/mtd/spi-nor/
>  F:	include/linux/mtd/spi-nor.h
