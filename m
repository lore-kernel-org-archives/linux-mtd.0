Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrLcy-0006Te-Ny
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 07:58:37 +0000
Date: Wed, 28 Oct 2015 08:58:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, Marek Vasut <marex@denx.de>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park
 <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>, Huang Shijie
 <shijie.huang@arm.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
Message-ID: <20151028085813.4b0b3ac8@bbrezillon>
In-Reply-To: <20151027175446.GT13239@google.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <1445913070-17950-2-git-send-email-computersforpeace@gmail.com>
 <20151027084200.2434180f@bbrezillon>
 <20151027175446.GT13239@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, 27 Oct 2015 10:54:46 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Tue, Oct 27, 2015 at 08:42:00AM +0100, Boris Brezillon wrote:
> > On Mon, 26 Oct 2015 19:31:06 -0700
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > 
> > > It seems more logical to use a device node directly associated with the
> > > MTD master device (i.e., mtd->dev.of_node field) rather than requiring
> > > auxiliary partition parser information to be passed in by the driver in
> > > a separate struct.
> > > 
> > > This patch supports the mtd->dev.of_node field, deprecates the parser
> > > data 'of_node' field, and begins using the new convention for nand_base.
> > > Other NAND driver conversions may now follow.
> > > 
> > > Additional side benefit to assigning mtd->dev.of_node rather than using
> > > parser data: the driver core will automatically create a device -> node
> > > symlink for us.
> > 
> > I like the idea, but how about pushing the solution even further and
> > killing the ->flash_node field which AFAICT is rendered useless by
> > your patch?
> 
> I suppose we could do that. I do think there's something to be said for
> layering, though. Historically, we haven't done a very good job of
> layering in MTD, so low-level drivers often have to poke around in the
> MTD structures, even if they really should only have to know a few
> things about their helper subsystem/library, like NAND or SPI NOR. So
> with that in mind, I think the ->flash_node serves some purpose --
> drivers can just initialize struct nand_chip/spi_nor and be assured that
> the NAND/SPI-NOR subsystems will take care of things.
> 
> Now, I don't think there's much reason to suspect that we'd have a more
> complex mapping than 1:1 between struct mtd_info and struct nand_chip or
> struct spi_nor, so maybe we don't actually need duplicate storage
> (mtd.dev.of_node and {spi_nor,nand_chip}.flash_node), and the layering
> is just have these APIs:
> 
> 	nand_set_flash_node()
> 	spi_nor_set_flash_node()
> 
> which just call mtd_set_of_node()?

I'm fine with that, but as you stated in your next answer this is not
that simple for the NAND subsystem since a lot of drivers are doing
their own custom initialization.

I'll try to come up with something to address that soon (I'll probably
revive the nand_chip nand_controller separation series too) based on
other subsystems like SPI or I2C.
How about providing several simple functions and progressively migrating
all NAND controller drivers to it:

struct nand_controller *nand_controller_alloc(struct device *dev, ...);
struct nand_chip *nand_alloc(struct nand_controller *ctrl, ...);

...

> 
> Speaking of layering: why do we have NAND drivers initializing mtd->priv
> for us, yet nand_base just assumes that it points to a struct nand_chip?

I guess it's been like this from the beginning, and nobody bothered
moving this boilerplate into a function provided by the NAND subsystem.

> And why isn't struct mtd_info just embedded in struct nand_chip?

I always wondered the same thing.

> Are
> there ever cases we want more than one (master) MTD per nand_chip? Or
> vice versa?

Nope, I'd say that you always have a 1:1 relationship between a master
MTD device and a NAND device.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
