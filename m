Date: Sun, 25 May 2014 14:35:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH for v3.15 0/2] ARM: mvebu Specificy ECC scheme for
 A375/385 boards
Message-ID: <20140525213509.GA5241@norris-Latitude-E6410>
References: <1400941030-2123-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140525172906.GL8664@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140525172906.GL8664@titan.lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 25, 2014 at 01:29:06PM -0400, Jason Cooper wrote:
> On Sat, May 24, 2014 at 11:17:08AM -0300, Ezequiel Garcia wrote:
> > Last minute fixes, which help prevent any inconsistencies between the ECC
> > scheme expected by the bootloader, and the one expected by the kernel.
> > 
> > Until now, the kernel was using the ONFI-provided "datasheet ECC requirement",
> > and assume the bootloader did the same thing. However, this is not the case
> > for these boards, where the vendor provided a bootloader with an ECC strength
> > that's weaker than the required.
> > 
> > After the introduction of the NAND ECC devicetree binding, and its support
> > in the pxa3xx-nand driver, we can set these values and expect them to work.
> > 
> > I hope it's not too late for v3.15 already.
> > 
> > Ezequiel Garcia (2):
> >   ARM: dts: Specify the NAND ECC scheme explicitly on Armada 375 DB
> >     board
> >   ARM: dts: Specify the NAND ECC scheme explicitly on Armada 385 DB
> >     board
> > 
> >  arch/arm/boot/dts/armada-375-db.dts | 2 ++
> >  arch/arm/boot/dts/armada-385-db.dts | 2 ++
> >  2 files changed, 4 insertions(+)

For the series:

Acked-by: Brian Norris <computersforpeace@gmail.com>

> As discussed on irc, I'm pushing this for v3.16 right now.  If we later
> determine that it needs to be in v3.15, we can send a stable request for
> these patches.

Not sure what went into the discussion, but for one, the binding is only
used in the pxa3xx_nand driver in the for-3.16 development branch, so it
doesn't quite seem urgent to me.

Regards,
Brian
