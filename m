Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi1I1-0006Y6-Mr
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 12:49:38 +0000
Date: Wed, 7 May 2014 08:49:13 -0400
From: Jason Cooper <jason@lakedaemon.net>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/3] mtd: nand: pxa3xx: Make of_device_id array const
Message-ID: <20140507124913.GZ28159@titan.lakedaemon.net>
References: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
 <021f01cf69d1$38d99a60$aa8ccf20$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <021f01cf69d1$38d99a60$aa8ccf20$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2014 at 05:49:13PM +0900, Jingoo Han wrote:
> Make of_device_id array const, because all OF functions
> handle it as const.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
