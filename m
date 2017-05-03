Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d62kC-0004mq-AH
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 22:27:38 +0000
Subject: Re: [PATCH] MAINTAINERS: Update NAND subsystem git repositories
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1493794135-23074-1-git-send-email-boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d476bb32-617e-3937-902b-9b94989763cb@nod.at>
Date: Thu, 4 May 2017 00:27:05 +0200
MIME-Version: 1.0
In-Reply-To: <1493794135-23074-1-git-send-email-boris.brezillon@free-electrons.com>
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

Am 03.05.2017 um 08:48 schrieb Boris Brezillon:
> NAND branches are now hosted on MTD repos, nand/next is on l2-mtd and
> nand/fixes will be on linux-mtd.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a84d0022d57..4aa9ca992ad4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8605,7 +8605,8 @@ R:	Richard Weinberger <richard@nod.at>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://github.com/linux-nand/linux.git
> +T:	git git://git.infradead.org/linux-mtd.git
> +T:	git git://git.infradead.org/l2-mtd.git

This is great! :-)

Thanks,
//richard
