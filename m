Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwdE3-00015X-8H
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 21:46:43 +0000
Received: by pasz6 with SMTP id z6so43556275pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 13:46:22 -0800 (PST)
Date: Wed, 11 Nov 2015 13:46:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH v2 01/11] mtd: add get/set of_node/flash_node helpers
Message-ID: <20151111214619.GM12143@google.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446262410-45754-2-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 30, 2015 at 08:33:20PM -0700, Brian Norris wrote:
> We are going to begin using the mtd->dev.of_node field for MTD device
> nodes, so let's add helpers for it. Also, we'll be making some
> conversions on spi_nor (and nand_chip eventually) too, so get that ready
> with their own helpers.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v2: new

Pushed the first 5 to l2-mtd.git/next. Still re-reviewing the comments
on the latter half of the series.
