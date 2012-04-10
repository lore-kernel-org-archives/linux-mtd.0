Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHaU3-0006vZ-Iz
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2012 12:47:44 +0000
Date: Tue, 10 Apr 2012 13:47:21 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120410124721.GS24211@n2100.arm.linux.org.uk>
References: <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
 <20120406022305.GJ7264@S2101-09.ap.freescale.net>
 <4F7EC6AF.6000603@freescale.com>
 <20120410094223.GN24211@n2100.arm.linux.org.uk>
 <20120410123952.GA419@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120410123952.GA419@S2101-09.ap.freescale.net>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, Fabio Estevam <festevam@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Sam Gandhi <samgandhi9@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 10, 2012 at 08:39:58PM +0800, Shawn Guo wrote:
> When mxs-dma driver was created, we chose to only support a single
> descriptor at the beginning, and mxs_dma_issue_pending() is an empty
> function right now .  This is something needs to be improved, but it
> should be orthogonal to the bug fix posted here.

You could view it as being the reason that the bug occurred, because
had the issue_pending() function been used to start the transfer,
things would naturally happen in the right order.

So, one solution to the bug would be to do exactly that - move the
channel enable to the issue pending function, which will have the
same effect as reversing the order of cookie assignment and channel
enable.

However, the risk is that because you have a no-op issue_pending(),
some of your drivers may have decided its not worth calling and omitted
it.
