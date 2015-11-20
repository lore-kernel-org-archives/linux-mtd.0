Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzbuj-0004rx-KN
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 02:59:06 +0000
Received: by pacdm15 with SMTP id dm15so101153989pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 18:58:45 -0800 (PST)
Date: Thu, 19 Nov 2015 18:58:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Han Xu <han.xu@freescale.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/11] mtd: assign mtd->dev.of_node when creating
 partition devices
Message-ID: <20151120025842.GT64635@google.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446424721-23471-1-git-send-email-boris.brezillon@free-electrons.com>
 <20151112001550.GD96199@google.com>
 <20151112142220.374154b7@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151112142220.374154b7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 02:22:20PM +0100, Boris Brezillon wrote:
> On Wed, 11 Nov 2015 16:15:50 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > IOW, I think we can grab the reference in add_mtd_device() and drop it
> > in del_mtd_device(). This would handle both the partition and
> > non-partition case the same.
> 
> Hm, actually I think we need it. When you iterate over child nodes with
> for_each_child_of_node(), the node is released (of_node_put() is
> called) after each iteration. While this is not a problem for mtd
> device registration (because the controller usually retain the
> reference when add_mtd_device() is called), this is not true for the
> partitions. And if the partitions are ever defined using an overlay,
> this can be a problem.

Yep.

> To sum-up, I think we should retain the node reference until
> add_mtd_device() has retained it, so maybe we should have a ->cleanup()
> function in mtd part parsers.

OK. I'll drop my patch and send out my ->cleanup() stuff instead, so you
can patch on top of that.

Brian
