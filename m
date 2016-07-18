Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPBuv-0007CD-8B
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 17:01:17 +0000
Received: by mail-pf0-x244.google.com with SMTP id i6so11923032pfe.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 10:00:57 -0700 (PDT)
Date: Mon, 18 Jul 2016 10:00:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>, Vignesh R <vigneshr@ti.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver
Message-ID: <20160718170054.GG76613@google.com>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <20160607140057.GA20256@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160607140057.GA20256@rob-hp-laptop>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 07, 2016 at 09:00:57AM -0500, Rob Herring wrote:
> On Sat, Jun 04, 2016 at 02:39:33AM +0200, Marek Vasut wrote:
> > From: Graham Moore <grmoore@opensource.altera.com>
> > 
> > Add binding document for the Cadence QSPI controller.
> > 
> > Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Alan Tull <atull@opensource.altera.com>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> > Cc: Graham Moore <grmoore@opensource.altera.com>
> > Cc: Vignesh R <vigneshr@ti.com>
> > Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> > Cc: devicetree@vger.kernel.org
> > ---
> > V2: Add cdns prefix to driver-specific bindings.
> > V3: Use existing property "is-decoded-cs" instead of creating a
> >     duplicate, "ext-decoder". Timing parameters are in nanoseconds,
> >     not master reference clocks. Remove bus-num completely.
> > V4: Add new properties fifo-width and trigger-address
> > V7: - Prefix all of the Cadence-specific properties with cdns prefix,
> >       those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
> >       "cdns,fifo-width", "cdns,trigger-address".
> >     - Drop bogus properties which were not used and were incorrect.
> > V8: Align lines to 80 chars.
> > ---
> >  .../devicetree/bindings/mtd/cadence-quadspi.txt    | 56 ++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> 
> Acked-by: Rob Herring <robh@kernel.org>

Applied to l2-mtd.git
