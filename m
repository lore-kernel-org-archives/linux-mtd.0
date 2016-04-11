Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apdKl-00032G-4s
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 15:01:02 +0000
Date: Mon, 11 Apr 2016 10:00:33 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 13/17] memory: omap-gpmc: Support general purpose
 input for WAITPINs
Message-ID: <20160411150033.GA2064@rob-hp-laptop>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
 <1460023715-19332-14-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460023715-19332-14-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 07, 2016 at 01:08:31PM +0300, Roger Quadros wrote:
> OMAPs can have 2 to 4 WAITPINs that can be used as general purpose
> input if not used for memory wait state insertion.
> 
> The first user will be the OMAP NAND chip to get the NAND
> read/busy status using gpiolib.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt      |   6 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/memory/Kconfig                             |   1 +
>  drivers/memory/omap-gpmc.c                         | 117 ++++++++++++++++++---
>  3 files changed, 112 insertions(+), 12 deletions(-)
