Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuIY4-0001ay-IE
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 10:45:30 +0000
Date: Mon, 18 May 2015 11:45:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Message-ID: <20150518104501.GD3551@leverpostej>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150515195541.GL11598@ld-irv-0074>
Cc: Marek Vasut <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kumar Gala <galak@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 15, 2015 at 08:55:41PM +0100, Brian Norris wrote:
> It really helps if I test patches...
> 
> On Thu, May 14, 2015 at 10:32:53AM -0700, Brian Norris wrote:
> > In commit 8ff16cf77ce3 ("Documentation: devicetree: m25p80: add "nor-jedec"
> > binding"), we added a generic "nor-jedec" binding to catch all
> > mostly-compatible SPI NOR flash which can be detected via the READ ID
> > opcode (0x9F). This was discussed and reviewed at the time, however
> > objections have come up since then as part of this discussion:
> > 
> >   http://lkml.kernel.org/g/20150511224646.GJ32500@ld-irv-0074
> > 
> > It seems the parties involved agree that "jedec,spi-nor" does a better
> > job of capturing the fact that this is SPI-specific, not just any NOR
> > flash.
> > 
> > This binding was only merged for v4.1-rc1, so it's still OK to change
> > the naming.
> > 
> > At the same time, let's move the documentation to a better name.
> > 
> > Next up: prune the m25p_ids[] table to the minimal necessary listing, so
> > we can stop referring to code (drivers/mtd/devices/m25p80.c) from the
> > documentation.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Stephen Warren <swarren@wwwdotorg.org>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Rafał Miłecki <zajec5@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Pawel Moll <pawel.moll@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> > Cc: Kumar Gala <galak@codeaurora.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> > I'd *really* like to get an 'ack' from a DT maintainer for this, those those
> > are apparently very hard to come by. And I'd really not like to have to revisit
> > this again in a few weeks. We have patches getting queued up for 4.2 that are
> > using the "nor-jedec" binding, and I'd like to nip those in the bud ASAP.
> > 
> >  .../devicetree/bindings/mtd/{m25p80.txt => jedec,spi-nor.txt}       | 6 +++---
> >  drivers/mtd/devices/m25p80.c                                        | 6 +++---
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  rename Documentation/devicetree/bindings/mtd/{m25p80.txt => jedec,spi-nor.txt} (85%)
> > 
> ...
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 7c8b1694a134..3d59ebc16b6e 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -223,7 +223,7 @@ static int m25p_probe(struct spi_device *spi)
> >  	 */
> >  	if (data && data->type)
> >  		flash_name = data->type;
> > -	else if (!strcmp(spi->modalias, "nor-jedec"))
> > +	else if (!strcmp(spi->modalias, "jedec,spi-nor"))
> >  		flash_name = NULL; /* auto-detect */
> >  	else
> >  		flash_name = spi->modalias;
> > @@ -255,7 +255,7 @@ static int m25p_remove(struct spi_device *spi)
> >   * since most of these flash are compatible to some extent, and their
> >   * differences can often be differentiated by the JEDEC read-ID command, we
> >   * encourage new users to add support to the spi-nor library, and simply bind
> > - * against a generic string here (e.g., "nor-jedec").
> > + * against a generic string here (e.g., "jedec,spi-nor").
> >   *
> >   * Many flash names are kept here in this list (as well as in spi-nor.c) to
> >   * keep them available as module aliases for existing platforms.
> > @@ -305,7 +305,7 @@ static const struct spi_device_id m25p_ids[] = {
> >  	 * Generic support for SPI NOR that can be identified by the JEDEC READ
> >  	 * ID opcode (0x9F). Use this, if possible.
> >  	 */
> > -	{"nor-jedec"},
> > +	{"jedec,spi-nor"},
> 
> So I forgot (again; we hit this before) that the SPI/OF framework strips
> everything before the first comma before binding devices. See
> of_modalias_node(). So I'll have to squash in the patch below to get a
> usable binding.

Is it not possible to use the of_match_table on spi_driver::driver? If
not, we really should make it so.

Mark.
