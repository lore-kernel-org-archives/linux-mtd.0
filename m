Date: Sat, 20 Sep 2014 13:03:15 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: nand: add sunxi NAND flash controller support
Message-ID: <20140920130315.197ab359@bbrezillon>
In-Reply-To: <20140920043438.GD8127@brian-ubuntu>
References: <1408382788-32153-1-git-send-email-boris.brezillon@free-electrons.com>
 <20140920043438.GD8127@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 "Dmitriy B." <rzk333@gmail.com>, Jonas Meyer <quitte@gmail.com>,
 linux-kernel@vger.kernel.org, Yassin Jaffer <yassinjaffer@gmail.com>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, 19 Sep 2014 21:34:38 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Mon, Aug 18, 2014 at 07:26:26PM +0200, Boris BREZILLON wrote:
> > This patch series adds support for the sunxi NAND Flash Controller (NFC)
> > block.
> > 
> > These two patches only add support for the basic NAND stuff:
> >  - NAND controller operations
> >  - SW and HW ECC handling (with both syndrome and normal ECC scheme)
> > 
> > If you want support for advanced features you can find it on my github
> > repo [1]:
> >  - HW randomization support
> >  - per partition ECC/Randomizer to handle bootloader partitions
> > 
> > DMA transfers are not supported yet, but I have reworked the OOB layout
> > when using the HW ECC scheme to match the one used when accessing the NAND
> > with DMA transfers (the available OOB bytes are placed at the end of the
> > OOB area).
> > 
> > This patch series depends on this other one [2] which adds support for ONFI
> > timing mode retrieval on non-ONFI NANDs.
> 
> Were you planning to send v2 of your series [2]? I see you made a
> mistake you were planning on fixing:
> 
>   https://lkml.org/lkml/2014/7/30/423

Yep, I was just waiting for your feedback before fixing it ;-).

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
