Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brkq0-0007zc-H4
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 11:58:17 +0000
Date: Wed, 5 Oct 2016 14:49:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161005114908.GJ1765@lahna.fi.intel.com>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <2cf1530a-8e10-9a4a-51a4-8ae322b26ed9@denx.de>
 <20161005102700.GD1765@lahna.fi.intel.com>
 <8fef3d44-dc1e-2175-b335-9f025b302ab1@denx.de>
 <20161005111850.GG1765@lahna.fi.intel.com>
 <b0b5aa23-bbc6-a2c4-8671-a50a4735ec15@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0b5aa23-bbc6-a2c4-8671-a50a4735ec15@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 05, 2016 at 01:31:20PM +0200, Stefan Roese wrote:
> Sure, I can definitely add something here in U-Boot. Since I'm
> pretty new to this driver / controller and its interface to the BIOS,
> could you perhaps suggest those values please? To enable the Linux
> driver with full read-write support to such chips?

These values are from Minnowboard MAX which is based on Baytrail:

[    8.112316] intel-spi intel-spi: PREOP_OPTYPE=0x7f480606
[    8.118278] intel-spi intel-spi: OPMENU0=0x0405039f
[    8.123754] intel-spi intel-spi: OPMENU1=0x0102d820

Maybe something like that?
