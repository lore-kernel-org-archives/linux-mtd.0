Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlBUI-0005Nx-Cz
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 06:19:22 +0000
Received: by mail-pa0-f53.google.com with SMTP id kp14so2118757pab.12
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 23:19:00 -0700 (PDT)
Date: Thu, 15 May 2014 23:18:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Support of Micron SPI flash (size > 16MB)
Message-ID: <20140516061856.GD2413@norris-Latitude-E6410>
References: <92977332ffca4669b5c1987b42b0d0c5@BY2PR03MB508.namprd03.prod.outlook.com>
 <20140509104404.GK12304@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140509104404.GK12304@sirena.org.uk>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 09, 2014 at 11:44:04AM +0100, Mark Brown wrote:
> On Fri, May 09, 2014 at 10:25:04AM +0000, Mingkai.Hu@freescale.com wrote:
> > 2.       What are the changes needed for SPI controller to support 4 byte addressing?
> 
> If the SPI controller is a genuine SPI controller and not something
> specially optimised for flash it shouldn't need any changes, it doesn't
> know anything about the data it's sending.

Right. A true SPI controller doesn't need to know anything about
addressing modes.

> The SPI flash code might
> need updating though, I don't know about that.

The SPI flash code in MTD (m25p80.c, some of which is moving to
drivers/mtd/spi-nor/ in -next) already supports 4-byte addressing for
most flash. Check for flash support there.

You might also look at my comments in this commit, regarding the
different types of "4-byte addressing":

commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Thu Apr 11 01:34:57 2013 -0700

    mtd: m25p80: utilize dedicated 4-byte addressing commands

But again, most of this should just work(TM) for true SPI controllers.

Regards,
Brian
