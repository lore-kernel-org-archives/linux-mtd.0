From: Marek Vasut <marex@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
Date: Thu, 22 Aug 2013 22:29:01 +0200
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <20130822193453.GB10038@ld-irv-0074.broadcom.com>
 <20130822195559.GU26118@sirena.org.uk>
In-Reply-To: <20130822195559.GU26118@sirena.org.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201308222229.01778.marex@denx.de>
Cc: devicetree@vger.kernel.org, shawn.guo@linaro.org, b44548@freescale.com,
 dedekind1@gmail.com, b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Mark Brown,

> On Thu, Aug 22, 2013 at 12:34:53PM -0700, Brian Norris wrote:
> > On Mon, Aug 19, 2013 at 12:10:01PM +0800, Huang Shijie wrote:
> > > +- m25p,quad-read : Use the "quad read" opcode to read data from the
> > > chip instead +                   of the usual "read" opcode. This
> > > opcode is not supported by +                   all chips and support
> > > for it can not be detected at runtime. +                   Refer to
> > > your chips' datasheet to check if this is supported +                 
> > >  by your chip.
> > 
> > Why can't this be detected at runtime? We added a "no fast read" flag to
> > the device table, so why not "dual/quad mode supported"? And believe it
> > or not, not all m25p80 users have device tree. So it isn't very logical
> > to tie this support to device-tree only.
> 
> There needs to be some way of saying if the additional data lines are
> actually wired up or not; it could be a negative property (flagging if
> the lines are not present) but that runs the risk of breaking systems
> if a driver acquires the ability to support extra data lines but a
> system doesn't have it.
> 
> This should be a generic property for all quad devices to use, though,
> since the same thing applies everywhere.

Full ACK, "m25p,dual-read" and "m25p,quad-read" sound like a good prop names?

Best regards,
Marek Vasut
