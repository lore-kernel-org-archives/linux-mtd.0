Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apdOr-0004f4-KR
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 15:05:17 +0000
Date: Mon, 11 Apr 2016 10:04:45 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 17/17] mtd: nand: omap2: Implement NAND ready using
 gpiolib
Message-ID: <20160411150445.GA5482@rob-hp-laptop>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
 <1460023715-19332-18-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460023715-19332-18-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 07, 2016 at 01:08:35PM +0300, Roger Quadros wrote:
> The GPMC WAIT pin status are now available over gpiolib.
> Update the omap_dev_ready() function to use gpio instead of
> directly accessing GPMC register space.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/omap2.c                           | 29 ++++++++++++++--------
>  include/linux/platform_data/mtd-nand-omap2.h       |  2 +-
>  3 files changed, 21 insertions(+), 12 deletions(-)
