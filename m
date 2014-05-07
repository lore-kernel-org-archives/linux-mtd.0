Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi7fX-0000RK-QL
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 19:38:20 +0000
Date: Wed, 7 May 2014 16:37:24 -0300
From: 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
To: Jingoo Han <jg1.han@samsung.com>, Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 2/3] mtd: nand: pxa3xx: Make of_device_id array const
Message-ID: <20140507193724.GA9366@arch.cereza>
References: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
 <021f01cf69d1$38d99a60$aa8ccf20$%han@samsung.com>
 <20140507124913.GZ28159@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140507124913.GZ28159@titan.lakedaemon.net>
Cc: linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07 May 08:49 AM, Jason Cooper wrote:
> On Wed, May 07, 2014 at 05:49:13PM +0900, Jingoo Han wrote:
> > Make of_device_id array const, because all OF functions
> > handle it as const.
> > 
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> 

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
