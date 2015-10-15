Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmjXJ-0001xl-3z
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 14:29:42 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
Date: Thu, 15 Oct 2015 16:27:54 +0200
Cc: linux-mtd@lists.infradead.org, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1440148851-14621-1-git-send-email-marex@denx.de>
 <1440148851-14621-2-git-send-email-marex@denx.de>
 <561FB3C0.30700@opensource.altera.com>
In-Reply-To: <561FB3C0.30700@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201510151627.54562.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, October 15, 2015 at 04:10:08 PM, Graham Moore wrote:
> On 08/21/2015 04:20 AM, Marek Vasut wrote:
> > From: Graham Moore <grmoore@opensource.altera.com>
> > 
> > Add support for the Cadence QSPI controller. This controller is
> > present in the Altera SoCFPGA SoCs and this driver has been tested
> > on the Cyclone V SoC.
> > 
> > Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> 
> [...]
> 
> Hi, just checking in.  Are there any more changes to this driver?

This will need to be ported on top of the MTD changes by Cyrille , I have
it in my pipeline, but it wasn't done yet.

Best regards,
Marek Vasut
