Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEivW-0005sG-Bu
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 21:39:28 +0000
Date: Tue, 14 Nov 2017 13:39:02 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4 02/16] ARM: dts: OMAP2+: Add compatible property to
 onenand node
Message-ID: <20171114213902.GD28152@atomide.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111211735.2a3q5lw4itsltjrw@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171111211735.2a3q5lw4itsltjrw@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ladislav Michl <ladis@linux-mips.org> [171111 21:19]:
> OMAP onenand nodes are missing compatible property, add it.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

Best to merge this one with the MTD patches, otherwise it will be a
layered mess of merges:

Acked-by: Tony Lindgren <tony@atomide.com>
