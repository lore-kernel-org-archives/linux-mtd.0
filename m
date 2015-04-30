From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
Date: Thu, 30 Apr 2015 20:34:36 +0200
References: <cover.1430403750.git.hramrach@gmail.com>
 <OF23B05612.4290AF80-ONC1257E37.00589292-C1257E37.005AB106@rohde-schwarz.com>
 <CAOMqctRLnCJfVCYGjsmhORYNk+HCf07wwSXnZv4oqDxbaQqKGw@mail.gmail.com>
In-Reply-To: <CAOMqctRLnCJfVCYGjsmhORYNk+HCf07wwSXnZv4oqDxbaQqKGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201504302034.36753.marex@denx.de>
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas.Betker@rohde-schwarz.com,
 Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo ????????? \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 30, 2015 at 06:56:18 PM, Michal Suchanek wrote:
> On 30 April 2015 at 18:30,  <Thomas.Betker@rohde-schwarz.com> wrote:
> > Hello Michal:
> >> I tried to connect a SPI NOR flash to my sunxi board and due to the
> > 
> > current
> > 
> >> sunxi SPI driver limitations it does not work.
> >> 
> >> The SPI driver returns an error when more than 64 bytes are
> >> transferred at once
> >> due to lack of DMA support.
> > 
> > Wouldn't it be easier to fix the SPI driver to handle transfers larger
> > than 64 bytes, filling and draining the FIFO multiple times if
> > neccessary? (As far as I can tell, most SPI drivers do this.)
> 
> Yes, the intent is to fix this by adding dma support to the driver,
> eventually.
> 
> The patch might be still useful for other hardware with developing SPI
> support.

Please just fix the controller driver to correctly handle arbitrary transfer
lengths.

Best regards,
Marek Vasut
