Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XelI7-0000hS-Jy
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 13:40:32 +0000
Date: Thu, 16 Oct 2014 14:39:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Message-ID: <20141016133947.GB24714@leverpostej>
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
 <20141013111611.GC15326@leverpostej> <543BB7FE.3030604@atmel.com>
 <543CFC41.2060506@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <543CFC41.2060506@atmel.com>
Content-Language: en-US
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "nicolas.ferre@atmel.com" <nicolas.ferre@atmel.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "voice.shen@atmel.com" <voice.shen@atmel.com>,
 "galak@codeaurora.org" <galak@codeaurora.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[...]

> >> That said, if we can build this dynamically, can't we always do so, and
> >> never need this property?
> >
> > Since board like at91sam9x5, sama5d3xek has a rom lookup table. And 
> > the sama5d4ek has no rom lookup table.
> > To present this, I make this property as optional.
> >
> > But yes, the pmecc lookup table related properties can be removed as 
> > driver can build it in runtime.
> > The cost is we need to use more memory to store the table.
> 
> In precisely, the table need to 32k bytes memory for 512-sector, and 64k 
> bytes for 1024-sector.
> 
> Also I spend time to testing the performance of this version.
> Compare with the version which use the SRAM rom lookup table, this 
> version (build table in runtim) cost about 5~10ms more.
> 
> So I prefer to keep this property as optional.

Sure. It sounds like it's always possible to ignore it later if we
choose to.

I just wouldn't mention what the driver should do in the binding --
whether or not the property is optional, the behaviour of the driver is
not a detail of the device.

Thanks,
Mark.
