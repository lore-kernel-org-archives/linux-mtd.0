Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIfth-0007vL-SI
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 17:04:51 +0000
From: Marek Vasut <marex@denx.de>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 11 Jan 2016 17:32:23 +0100
Cc: linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "R, Vignesh" <vigneshr@ti.com>,
 "Yves Vandervennet" <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <5693D306.9070001@opensource.altera.com>
In-Reply-To: <5693D306.9070001@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201601111732.23954.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, January 11, 2016 at 05:06:30 PM, Dinh Nguyen wrote:
> Hi Marek,

Hi!

> On 01/10/2016 10:34 PM, Marek Vasut wrote:
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
> > Cc: "R, Vignesh" <vigneshr@ti.com>
> > Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> > Cc: devicetree@vger.kernel.org
> > ---
> 
> I think you also need to CC the following people for proper review of
> these bindings:
> 
> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> Pawel Moll <pawel.moll@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)
> Ian Campbell <ijc+devicetree@hellion.org.uk> (maintainer:OPEN FIRMWARE
> AND FLATTENED DEVICE TREE BINDINGS)
> Kumar Gala <galak@codeaurora.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)

Isn't it enough to submit them to devicetree@vger ?

Best regards,
Marek Vasut
