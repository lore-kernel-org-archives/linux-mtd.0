Date: Wed, 20 May 2015 16:54:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
Message-ID: <20150520235447.GZ11598@ld-irv-0074>
References: <cover.1430403750.git.hramrach@gmail.com>
 <OF23B05612.4290AF80-ONC1257E37.00589292-C1257E37.005AB106@rohde-schwarz.com>
 <CAOMqctRLnCJfVCYGjsmhORYNk+HCf07wwSXnZv4oqDxbaQqKGw@mail.gmail.com>
 <201504302034.36753.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201504302034.36753.marex@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo ????????? \(beanhuo\)" <beanhuo@micron.com>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Michal Suchanek <hramrach@gmail.com>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>, devicetree <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Mark Brown <broonie@kernel.org>, Thomas.Betker@rohde-schwarz.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 30, 2015 at 08:34:36PM +0200, Marek Vasut wrote:
> On Thursday, April 30, 2015 at 06:56:18 PM, Michal Suchanek wrote:
> > On 30 April 2015 at 18:30,  <Thomas.Betker@rohde-schwarz.com> wrote:
> > > Hello Michal:
> > >> I tried to connect a SPI NOR flash to my sunxi board and due to the
> > > 
> > > current
> > > 
> > >> sunxi SPI driver limitations it does not work.
> > >> 
> > >> The SPI driver returns an error when more than 64 bytes are
> > >> transferred at once
> > >> due to lack of DMA support.
> > > 
> > > Wouldn't it be easier to fix the SPI driver to handle transfers larger
> > > than 64 bytes, filling and draining the FIFO multiple times if
> > > neccessary? (As far as I can tell, most SPI drivers do this.)
> > 
> > Yes, the intent is to fix this by adding dma support to the driver,
> > eventually.
> > 
> > The patch might be still useful for other hardware with developing SPI
> > support.
> 
> Please just fix the controller driver to correctly handle arbitrary transfer
> lengths.

Just noticed this. Yes, that would definitely be a better option!

Brian
