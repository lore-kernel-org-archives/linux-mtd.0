Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWtAi-0005rA-9g
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2016 22:05:08 +0000
Date: Fri, 19 Feb 2016 14:04:42 -0800
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/26] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20160219220442.GR21202@atomide.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455916548-3441-1-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [160219 13:27]:
> Hi,
> 
> @Tony
> Patches 15 and 24 are new and will need your review.
> I've modified patch 22 to include the new am335x boards introduced since v4.4.
> 
> Patches are based on top of omap-for-v4.6/dt so that the DT changes apply cleanly.

Looks OK to me. Can we merge the dts changes separately? Otherwise
we will easily end up with tons of conflicts..

Regards,

Tony
