Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1vzE-0002LG-TY
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 09:03:29 +0000
Date: Thu, 16 Aug 2012 10:00:41 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH] dma: amba-pl08x: Export pl08x_filter_id
Message-ID: <20120816090041.GK18957@n2100.arm.linux.org.uk>
References: <1345107396-27079-1-git-send-email-stigge@antcom.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345107396-27079-1-git-send-email-stigge@antcom.de>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: srinivas.bakki@nxp.com, arnd@arndb.de, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 16, 2012 at 10:56:36AM +0200, Roland Stigge wrote:
> This patch fixes the following when compiling a driver module that uses
> amba-pl08x:
> 
> ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_slc.ko] undefined!
> ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_mlc.ko] undefined!
> 
> (drivers/mtd/nand/lpc32xx_* are still in l2-mtd.git)

It is currently intended that this be passed from platform code into
drivers via platform data, so that drivers can decide which DMA engine
they wish to make use of.

See how all the AMBA drivers work in this regard (because they need to
support more than just a single DMA engine implementation.)
