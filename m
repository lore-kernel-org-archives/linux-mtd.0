Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqSGi-0001Az-Df
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 18:42:54 +0000
From: Marek Vasut <marex@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv2 00/10] Add memory mapped support for ti qspi,
 m25p80 serial flash.
Date: Tue, 10 Dec 2013 19:34:01 +0100
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <201312101922.10618.marex@denx.de> <20131210182904.GG11468@sirena.org.uk>
In-Reply-To: <20131210182904.GG11468@sirena.org.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312101934.01300.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, Sourav Poddar <sourav.poddar@ti.com>,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, December 10, 2013 at 07:29:04 PM, Mark Brown wrote:
> On Tue, Dec 10, 2013 at 07:22:10PM +0100, Marek Vasut wrote:
> > On Tuesday, December 10, 2013 at 05:11:43 PM, Mark Brown wrote:
> > > There is some stuff that pushes up into the controller in that while
> > > the device is in memory mapped mode as far as I can tell it's not safe
> > > to do other accesses so if someone's put more than one device on the
> > > SPI bus we need to handle interactions there.
> > 
> > OK, so it's either-or . That seems OK, you might want to have two drivers
> > for this ip block, one to handle it as a SPI block and one to handle it
> > as a SPI-NOR block. ... that is of course, if these two modes can't work
> > together.
> 
> Or the client disables the memory map when it's not actively being used
> and the stops other transfers starting while the mapping is in place.
> I'd expect we'll have to cope with shared use at some point, hardware
> engineers will probably build such systems.

Aren't we fixing the problem at the wrong place ? Maybe it's about time to fix 
the engineers ;-)

Best regards,
Marek Vasut
