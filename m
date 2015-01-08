Received: from mail-qa0-x234.google.com ([2607:f8b0:400d:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y91Vz-0002MI-O7
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 01:03:56 +0000
Received: by mail-qa0-f52.google.com with SMTP id x12so454324qac.11
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 17:03:34 -0800 (PST)
Date: Wed, 7 Jan 2015 17:03:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?=
 <peterpandong@micron.com>
Subject: Re: [PATCH 0/3] An alternative to SPI NAND
Message-ID: <20150108010257.GP9759@ld-irv-0074>
References: <87F60714EC601C4C83DFF1D2E3D390A04AB3F3@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A04AB3F3@NTXXIAMBX02.xacn.micron.com>
Cc: Qi Wang =?utf-8?B?546L6LW3IChxaXdhbmcp?= <qiwang@micron.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Frank Liu =?utf-8?B?5YiY576kIChmcmFua2xpdSk=?= <frankliu@micron.com>,
 Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Melanie Zhang =?utf-8?B?5byg54eVIChtZWxhbmllemhhbmcp?=
 <melaniezhang@micron.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 08, 2015 at 12:47:24AM +0000, Peter Pan 潘栋 (peterpandong) wrote:
> Documentation/devicetree/bindings/mtd/spi-nand.txt |   22 +
> drivers/mtd/Kconfig                                |    2 +
> drivers/mtd/Makefile                               |    1 +
> drivers/mtd/spi-nand/Kconfig                       |    7 +
> drivers/mtd/spi-nand/Makefile                      |    3 +
> drivers/mtd/spi-nand/spi-nand-base.c               | 2034 ++++++++++++++++++++
> drivers/mtd/spi-nand/spi-nand-bbt.c                | 1279 ++++++++++++

I can already tell by the diffstat that I don't like this. We probably
don't need 3000 new lines of code for this, but we especially don't want
to duplicate nand_bbt.c. It won't take a lot of work to augment
nand_bbt.c to make it shareable. (I can whip that patch up if needed.)

I'll still take a look at the rest of the code eventually, but just
wanted to give my 2 cents up front.

> drivers/mtd/spi-nand/spi-nand-device.c             |  281 +++
> include/linux/mtd/spi-nand.h                       |  317 +++
> 9 files changed, 3946 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
> create mode 100644 drivers/mtd/spi-nand/Kconfig
> create mode 100644 drivers/mtd/spi-nand/Makefile
> create mode 100644 drivers/mtd/spi-nand/spi-nand-base.c
> create mode 100644 drivers/mtd/spi-nand/spi-nand-bbt.c
> create mode 100644 drivers/mtd/spi-nand/spi-nand-device.c
> create mode 100644 include/linux/mtd/spi-nand.h

Brian
