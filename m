Received: from mail-bn1bon0094.outbound.protection.outlook.com
 ([157.56.111.94] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhjkD-0002YS-Fe
 for linux-mtd@lists.infradead.org; Fri, 24 Oct 2014 18:37:50 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 0/2] mtd: spi-nor: Cadence QSPI Flash Controller driver
Date: Fri, 24 Oct 2014 13:34:19 -0500
Message-ID: <1414175661-9249-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Here is a kernel driver for the Cadence QSPI Flash Controller driver
which uses the spi-nor framework.  I'm putting it out here for 
comments.

Here at Altera, we use the Cadence QSPI in our SoCFPGA systems.  We've had
a spi driver for this IP for some time now, but it needed some patches
in the spi subsystem. and so was going to be difficult to upstream.

I ported it over to the spi-nor framework which got rid of the ugly
patches, and also got rid of a bunch of spi_transfer code.

It's based on the master branch of l2-mtd.git.  Tested on Altera's
Cyclone5 dev kit.

So here it is, let me know what you all think, please.

Thanks,
Graham Moore

Graham Moore (2):
  This is the documentation of the device tree bindings for the    
    Cadence QSPI Flash Controller driver.
  This is a kernel driver for the Cadence QSPI Flash     Controller. 
    It uses the spi-nor framework.

 .../devicetree/bindings/mtd/cadence_quadspi.txt    |   30 +
 drivers/mtd/spi-nor/Kconfig                        |    6 +
 drivers/mtd/spi-nor/Makefile                       |    1 +
 drivers/mtd/spi-nor/cadence-quadspi.c              | 1349 ++++++++++++++++++++
 4 files changed, 1386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c

-- 
1.7.9.5
