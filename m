Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brkEE-0000KE-EM
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 11:19:14 +0000
Date: Wed, 5 Oct 2016 14:18:50 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161005111850.GG1765@lahna.fi.intel.com>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <2cf1530a-8e10-9a4a-51a4-8ae322b26ed9@denx.de>
 <20161005102700.GD1765@lahna.fi.intel.com>
 <8fef3d44-dc1e-2175-b335-9f025b302ab1@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fef3d44-dc1e-2175-b335-9f025b302ab1@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 05, 2016 at 01:11:39PM +0200, Stefan Roese wrote:
> [    3.654301] intel-spi intel-spi: OPMENU0=0x00009f0b
> [    3.654304] intel-spi intel-spi: OPMENU1=0x00000000
> [    3.654306] intel-spi intel-spi: BCR=0x00000009
> [    3.654308] intel-spi intel-spi: Protected regions:
> [    3.654313] intel-spi intel-spi: Flash regions:
> [    3.654316] intel-spi intel-spi:  00 base: 0x00000000 limit: 0x00000fff
> [    3.654320] intel-spi intel-spi:  01 base: 0x00300000 limit: 0x007fffff
> [    3.654323] intel-spi intel-spi:  02 base: 0x00001000 limit: 0x002fffff
> [    3.654325] intel-spi intel-spi:  03 disabled
> [    3.654328] intel-spi intel-spi:  04 disabled
> [    3.654330] intel-spi intel-spi: Using SW sequencer for register access
> [    3.657488] intel-spi intel-spi: s25fl064k (8192 Kbytes)
> [    3.677241] Creating 1 MTD partitions on "intel-spi":
> [    3.682310] 0x000000000000-0x000000800000 : "BIOS"

Cool!

> So how do you suggest to support such BayTrail boards booting
> via U-Boot as bootloader? Should U-Boot write something into
> these OPMENU0/1 registers before booting into Linux?

Typically it's the BIOS who does that so I guess in your case it should
be U-Boot then. I would not like to add that part to the driver itself
unless absolutely necessary ;-)
