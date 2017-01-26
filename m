Received: from mail-wm0-f45.google.com ([74.125.82.45])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWj4T-0000Au-UY
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2017 12:22:35 +0000
Received: by mail-wm0-f45.google.com with SMTP id c206so81118390wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2017 04:22:13 -0800 (PST)
Date: Thu, 26 Jan 2017 12:21:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and MTD due for the
 v4.11 merge window
Message-ID: <20170126122108.zyt2atuumm4jiamv@dell>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20170103173750.GA27589@dell>
 <20170125155116.GW17297@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170125155116.GW17297@lahna.fi.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Jan 2017, Mika Westerberg wrote:

> On Tue, Jan 03, 2017 at 05:37:50PM +0000, Lee Jones wrote:
> > MTD Maintainers,
> > 
> > Enjoy!
> > 
> > The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> > 
> >   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-mtd-v4.11
> > 
> > for you to fetch changes up to 87eb832ae9748fab00588b98c2e33e89de065438:
> > 
> >   mfd: lpc_ich: Add support for Intel Apollo Lake SoC (2017-01-03 17:34:16 +0000)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between MFD and MTD due for the v4.11 merge window
> > 
> > ----------------------------------------------------------------
> > Mika Westerberg (3):
> >       spi-nor: Add support for Intel SPI serial flash controller
> >       mfd: lpc_ich: Add support for SPI serial flash host controller
> >       mfd: lpc_ich: Add support for Intel Apollo Lake SoC
> > 
> >  Documentation/mtd/intel-spi.txt          |  88 ++++
> >  drivers/mfd/lpc_ich.c                    | 131 ++++++
> >  drivers/mtd/spi-nor/Kconfig              |  20 +
> >  drivers/mtd/spi-nor/Makefile             |   2 +
> >  drivers/mtd/spi-nor/intel-spi-platform.c |  57 +++
> >  drivers/mtd/spi-nor/intel-spi.c          | 777 +++++++++++++++++++++++++++++++
> >  drivers/mtd/spi-nor/intel-spi.h          |  24 +
> >  include/linux/mfd/lpc_ich.h              |   3 +
> >  include/linux/platform_data/intel-spi.h  |  31 ++
> >  9 files changed, 1133 insertions(+)
> >  create mode 100644 Documentation/mtd/intel-spi.txt
> >  create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
> >  create mode 100644 drivers/mtd/spi-nor/intel-spi.c
> >  create mode 100644 drivers/mtd/spi-nor/intel-spi.h
> >  create mode 100644 include/linux/platform_data/intel-spi.h
> 
> Hmm, I don't see the driver in linux-next. Is there something preventing
> you from merging the branch to your next branch?

Should be in -next by tomorrow.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
