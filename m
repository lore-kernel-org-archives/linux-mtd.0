Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCr4N-0007GB-3P
 for linux-mtd@lists.infradead.org; Thu, 09 Nov 2017 17:56:52 +0000
Date: Thu, 9 Nov 2017 09:56:26 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Roger Quadros <rogerq@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 1/7] memory: omap-gpmc: Refactor OneNAND support
Message-ID: <20171109175626.GD28152@atomide.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091253.lvrzi5kbaykkxlcb@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171109091253.lvrzi5kbaykkxlcb@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Ladislav Michl <ladis@linux-mips.org> [171109 09:14]:
> Use generic probe function to deal with OneNAND node and remove now useless
> gpmc_probe_onenand_child function.
> Import sync mode timing calculation function from mach-omap2/gpmc-onenand.c
> and prepare for MTD driver DTfication.

I tried giving this series a try on n900, but looks like onenand is no longer
seen on n900 after this first patch.

Regards,

Tony
