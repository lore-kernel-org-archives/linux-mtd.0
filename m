Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD8Mk-0007XJ-QN
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 11:52:44 +0000
Date: Tue, 23 May 2017 13:52:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] mtd: mchp23k256: device tree and mchp23lcv1024
Message-ID: <20170523115217.GM13759@lunn.ch>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
 <20170523093957.24110476@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170523093957.24110476@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 23, 2017 at 09:39:57AM +0200, Boris Brezillon wrote:
> On Tue, 23 May 2017 12:43:12 +1200
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> 
> > This series adds device tree support to the mchp23k256 driver and
> > support for the mchp23lcv1024 chip. I suspect there are more compatible
> > variants that we could now enumerate if desired.
> > 
> > Chris Packham (5):
> >   mtd: mchp23k256: Add OF device ID table
> >   mtd: mchp23k256: switch to mtd_device_register()
> >   mtd: handle partitioning on devices with 0 erasesize
> >   mtd: mchp23k256: add partitioning support
> >   mtd: mchp23k256: Add support for mchp23lcv1024
> 
> Shouldn't we add a spi_device_id table to allow non-DT users to probe
> mchp23lcv1024 chips?

Hi Boris

This is something which can be added at any time. Currently there is
no need for it, so i personally would wait until somebody does need
it.

	Andrew
