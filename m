Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjP2n-0001m6-GJ
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 10:00:25 +0000
Date: Tue, 6 Oct 2015 03:00:01 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20151006100000.GN23801@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <560BC0DB.5020205@ti.com> <20151006083346.GL23801@atomide.com>
 <56139A72.6040600@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56139A72.6040600@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [151006 02:59]:
> On 06/10/15 11:33, Tony Lindgren wrote:
> > Does build and boot and use NAND work throughtout the series?
> > Otherwise we'll have hard time bisecting anything..
> 
> Yes it does with the following exceptions.
> 
> - Patch 7 "memory: omap-gpmc: Remove NAND IRQ code" breaks prefetch-irq mode
> but none of the boards seem to be using it so it shouldn't break NAND on existing boards.
> At patch 9 "mtd: nand: omap2: manage NAND interrupts" prefetch-irq mode is working again.
> Do you want me to squash patches 7,8,9 so that pre-fetch irq is not broken at any point?

OK, no that's fine, no need to squash them together then.

> - Then at patch 11 "mtd: nand: omap: Clean up device tree support" we break NAND on all DT
> boards as we expect NAND to be a real child node with compatible id. Simply applying the
> DT patch at this point makes it work again.

Hmm can we at least warn about incompatible DT entry when somebody boots
with an older dtb?

> >> Test procedure was to read an existing ubifs partition,
> >> create a new one and read it back.
> >>
> >> Need you to Ack if it looks good.
> >> Do you mind taking it via omap-soc once MTD maintainers ack their relevant parts?
> > 
> > Sure. I'll try to do some testing on the series first too.
> > 
> Thanks.
> 
> > Can the dts changes be merged separtely? Otherwise we'll have
> > a dependency between dts branch and the GPMC/NAND changes.
> 
> I'm afraid no. Patch 11 makes us incompatible with the old DT.

OK. If we can warn about that, then the out of tree users will
have easier time to update their dts file.

Regards,

Tony
