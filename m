Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apdNp-0004Hd-T4
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 15:04:12 +0000
Date: Mon, 11 Apr 2016 10:03:44 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/17] memory: omap-gpmc: Support WAIT pin edge
 interrupts
Message-ID: <20160411150344.GA3549@rob-hp-laptop>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
 <1460023715-19332-16-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460023715-19332-16-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 07, 2016 at 01:08:33PM +0300, Roger Quadros wrote:
> OMAPs can have 2 to 4 WAITPINs that can be used as edge triggered
> interrupts if not used for memory wait state insertion.
> 
> Support these interrupts via the gpmc IRQ domain.
> 
> The gpmc IRQ domain interrupt map is:
> 
> 0 - NAND_fifoevent
> 1 - NAND_termcount
> 2 - GPMC_WAIT0 edge
> 3 - GPMC_WAIT1 edge, and so on
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt      |   5 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/memory/omap-gpmc.c                         | 106 +++++++++++++++++----
>  2 files changed, 92 insertions(+), 19 deletions(-)
