Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqz4F-0001MS-IJ
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 07:53:16 +0000
Date: Tue, 27 Oct 2015 08:52:53 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Marek Vasut
 <marex@denx.de>, Scott Wood <scottwood@freescale.com>, Josh Wu
 <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park
 <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>, Huang Shijie
 <shijie.huang@arm.com>
Subject: Re: [PATCH 2/5] mtd: nand: drop unnecessary partition parser data
Message-ID: <20151027085253.34eebbaa@bbrezillon>
In-Reply-To: <1445913070-17950-3-git-send-email-computersforpeace@gmail.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <1445913070-17950-3-git-send-email-computersforpeace@gmail.com>
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

On Mon, 26 Oct 2015 19:31:07 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> All of these drivers set up a parser data struct just to communicate DT
> partition data. This field has been deprecated and is instead supported
> by telling nand_scan_ident() about the 'flash_node'.
> 
> This patch:
>  * sets chip->flash_node for those drivers that didn't already (but used
>    OF partitioning)

As mentioned in patch 1, I think we should get rid of the ->flash_node
field and directly set mtd->dev.of_node instead. If we want to hide
MTD internals we could provide this kind of helper:

static inline void mtd_set_of_node(struct mtd_device *mtd,
				   struct device_node *np)
{
	mtd->dev.of_node = np;
}

>  * drops the parser data
>  * switches to the simpler mtd_device_register() where possible, now
>    that we've eliminated one of the auxiliary parameters
> 
> Now that we've assigned chip->flash_node for these drivers, we can
> probably rely on nand_dt_init() to do more of the DT parsing for us, but
> for now, I don't want to fiddle with each of these drivers. The parsing
> is done in duplicate for now on some drivers. I don't think this should
> break things. (Famous last words.)
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

For the sunxi_nand driver

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
