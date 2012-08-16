From: Arnd Bergmann <arnd@arndb.de>
To: "Russell King - ARM Linux" <linux@arm.linux.org.uk>
Subject: Re: [PATCH] dma: amba-pl08x: Export pl08x_filter_id
Date: Thu, 16 Aug 2012 09:06:21 +0000
References: <1345107396-27079-1-git-send-email-stigge@antcom.de>
 <20120816090041.GK18957@n2100.arm.linux.org.uk>
In-Reply-To: <20120816090041.GK18957@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201208160906.21950.arnd@arndb.de>
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 August 2012, Russell King - ARM Linux wrote:
> On Thu, Aug 16, 2012 at 10:56:36AM +0200, Roland Stigge wrote:
> > This patch fixes the following when compiling a driver module that uses
> > amba-pl08x:
> > 
> > ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_slc.ko] undefined!
> > ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_mlc.ko] undefined!
> > 
> > (drivers/mtd/nand/lpc32xx_* are still in l2-mtd.git)
> 
> It is currently intended that this be passed from platform code into
> drivers via platform data, so that drivers can decide which DMA engine
> they wish to make use of.
> 
> See how all the AMBA drivers work in this regard (because they need to
> support more than just a single DMA engine implementation.)

Ah, you're right, I forgot about that. I'll take back my Ack then.

	Arnd
