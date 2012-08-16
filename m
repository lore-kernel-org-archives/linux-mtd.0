Message-ID: <502CF20C.20801@antcom.de>
Date: Thu, 16 Aug 2012 15:13:48 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] dma: amba-pl08x: Export pl08x_filter_id
References: <1345107396-27079-1-git-send-email-stigge@antcom.de>
 <20120816090041.GK18957@n2100.arm.linux.org.uk>
In-Reply-To: <20120816090041.GK18957@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 08/16/2012 11:00 AM, Russell King - ARM Linux wrote:
> On Thu, Aug 16, 2012 at 10:56:36AM +0200, Roland Stigge wrote:
>> This patch fixes the following when compiling a driver module that uses
>> amba-pl08x:
>>
>> ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_slc.ko] undefined!
>> ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_mlc.ko] undefined!
>>
>> (drivers/mtd/nand/lpc32xx_* are still in l2-mtd.git)
> 
> It is currently intended that this be passed from platform code into
> drivers via platform data, so that drivers can decide which DMA engine
> they wish to make use of.
> 
> See how all the AMBA drivers work in this regard (because they need to
> support more than just a single DMA engine implementation.)

Thanks for the note!

I'll post respective changes to the MTD SLC and MLC drivers of LPC32xx
(for the MTD subsystem) and the adjustment I'll do in mach-lpc32xx (my
lpc32xx tree for arm-soc).
