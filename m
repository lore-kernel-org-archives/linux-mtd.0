Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAHZI-0004jW-4w
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 14:01:23 +0000
Received: by mail-oi0-f68.google.com with SMTP id k63so4484522oib.2
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2016 07:00:59 -0700 (PDT)
Date: Tue, 7 Jun 2016 09:00:57 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>, Vignesh R <vigneshr@ti.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver
Message-ID: <20160607140057.GA20256@rob-hp-laptop>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465000774-7762-1-git-send-email-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 04, 2016 at 02:39:33AM +0200, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> Add binding document for the Cadence QSPI controller.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alan Tull <atull@opensource.altera.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Graham Moore <grmoore@opensource.altera.com>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> Cc: devicetree@vger.kernel.org
> ---
> V2: Add cdns prefix to driver-specific bindings.
> V3: Use existing property "is-decoded-cs" instead of creating a
>     duplicate, "ext-decoder". Timing parameters are in nanoseconds,
>     not master reference clocks. Remove bus-num completely.
> V4: Add new properties fifo-width and trigger-address
> V7: - Prefix all of the Cadence-specific properties with cdns prefix,
>       those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
>       "cdns,fifo-width", "cdns,trigger-address".
>     - Drop bogus properties which were not used and were incorrect.
> V8: Align lines to 80 chars.
> ---
>  .../devicetree/bindings/mtd/cadence-quadspi.txt    | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt

Acked-by: Rob Herring <robh@kernel.org>
