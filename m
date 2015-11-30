Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Tmb-0003ai-Ly
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 19:06:43 +0000
Date: Mon, 30 Nov 2015 11:06:16 -0800
From: Tony Lindgren <tony@atomide.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 nsekhar@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH v2 4/5] ARM: dts: am437x/am33xx/omap/dm816x: Add gpmc dma
 channel
Message-ID: <20151130190616.GN2517@atomide.com>
References: <1444930648-19313-1-git-send-email-fcooper@ti.com>
 <1444930648-19313-5-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444930648-19313-5-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Franklin S Cooper Jr <fcooper@ti.com> [151015 10:42]:
> Add dma channel information to the gpmc. Although not enabled by
> default this will allow prefetch-dma to be used.

Picking up this patch only out of the series into omap-for-v4.5/dt.
The documentation patch does not apply as it has a dependency to
another series for adding the documentation. Please resend that
one separately once the documentation hits the mainline kernel.

The others patches in this series should get merged via the MTD tree.

Regards,

Tony
