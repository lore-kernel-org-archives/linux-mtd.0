Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adlyo-0008Kz-LM
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 21:49:19 +0000
Received: by mail-pa0-x22b.google.com with SMTP id tt10so49773843pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 13:48:58 -0800 (PST)
Date: Wed, 9 Mar 2016 13:48:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: add a maintainer for the NAND subsystem
Message-ID: <20160309214855.GA30131@google.com>
References: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 09, 2016 at 09:57:24PM +0100, Boris Brezillon wrote:
> Add myself as the maintainer of the NAND subsystem.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - rename the MAINTAINERS entry to NAND FLASH SUBSYSTEM
> - add Richard as a reviewer
> - add a git tree

Acked-by: Brian Norris <computersforpeace@gmail.com>

Thanks for stepping up! I'll plan to take this tomorrow, and get it into
the next merge window. I'll leave it for another day, in case any others
want to weigh in.

> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30aca4a..4afa65f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7393,6 +7393,17 @@ W:	https://www.myricom.com/support/downloads/myri10ge.html
>  S:	Supported
>  F:	drivers/net/ethernet/myricom/myri10ge/
>  
> +NAND FLASH SUBSYSTEM
> +M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +R:	Richard Weinberger <richard@nod.at>
> +L:	linux-mtd@lists.infradead.org
> +W:	http://www.linux-mtd.infradead.org/
> +Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> +T:	git git://github.com/linux-nand/linux.git

We'll want to send this to Stephen Rothwell, once we've added this to
MAINTAINERS.

Brian

> +S:	Maintained
> +F:	drivers/mtd/nand/
> +F:	include/linux/mtd/nand*.h
> +
>  NATSEMI ETHERNET DRIVER (DP8381x)
>  S:	Orphan
>  F:	drivers/net/ethernet/natsemi/natsemi.c
> -- 
> 2.1.4
> 
