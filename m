Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apdCq-0006i7-03
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 14:52:48 +0000
Date: Mon, 11 Apr 2016 09:52:23 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/17] memory: omap-gpmc: Implement IRQ domain for
 NAND IRQs
Message-ID: <20160411145223.GA29936@rob-hp-laptop>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
 <1460023715-19332-6-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460023715-19332-6-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 07, 2016 at 01:08:23PM +0300, Roger Quadros wrote:
> GPMC provides 2 interrupts for NAND use. i.e. fifoevent and termcount.
> Use IRQ domain for this. NAND device tree node can then
> get the necessary interrupts by using gpmc as the interrupt parent.
> 
> Legacy boot uses gpmc_get_client_irq to get the
> NAND interrupts from the GPMC IRQ domain.
> Get rid of custom bitmasks and use IRQ domain for that
> as well.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  Documentation/devicetree/bindings/bus/ti-gpmc.txt |   8 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/memory/omap-gpmc.c                        | 246 ++++++++++++----------
>  include/linux/omap-gpmc.h                         |   5 +-
>  3 files changed, 144 insertions(+), 115 deletions(-)
