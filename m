Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adlER-0001Q1-78
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 21:01:24 +0000
Subject: Re: [PATCH v2] MAINTAINERS: add a maintainer for the NAND subsystem
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56E08F0C.50207@nod.at>
Date: Wed, 9 Mar 2016 22:01:00 +0100
MIME-Version: 1.0
In-Reply-To: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.03.2016 um 21:57 schrieb Boris Brezillon:
> Add myself as the maintainer of the NAND subsystem.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - rename the MAINTAINERS entry to NAND FLASH SUBSYSTEM
> - add Richard as a reviewer
> - add a git tree
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
> +S:	Maintained
> +F:	drivers/mtd/nand/
> +F:	include/linux/mtd/nand*.h
> +

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
