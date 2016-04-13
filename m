Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqSHt-0005mm-8K
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 21:25:26 +0000
Date: Wed, 13 Apr 2016 14:25:00 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 javier@dowhile0.org, fcooper@ti.com, nsekhar@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/17] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20160413212500.GD5995@atomide.com>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460023715-19332-1-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [160407 03:10]:
> Hi,
> 
> As this series has cross dependency between omap and mtd subsystems,
> I'll set up a immutable branch which omap-soc and l2-mtd must
> merge in together to avoid any conflicts/breakage during integration.
> 
> Brian has acked all mtd patches. Tony needs to give his Ack for the
> gpmc driver part and then I can provide the immutable branch.

Looks good to me, please feel free to add:

Acked-by: Tony Lindgren <tony@atomide.com>
