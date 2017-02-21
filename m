Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cg631-0008Ud-3s
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:43:49 +0000
Date: Tue, 21 Feb 2017 09:43:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH 00/11] Introduction to SPI NAND framework
Message-ID: <20170221094314.189d8014@bbrezillon>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Feb 2017 15:59:59 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This serie introductes a SPI NAND framework.
> SPI NAND is a new NAND family device with SPI protocol as
> its interface. And its command set is totally different
> with parallel NAND.
> 
> Our first attempt was more than 2 years ago[1]. At that
> time, I didn't make BBT shareable and there were too many
> duplicate code with parallel NAND, so that serie stoped.
> But the discussion never stops. Now Boris has a plan to
> make a generic NAND framework which can be shared with
> both parallel and SPI NAND. Now the first step of the
> new generic NAND framework is finished. And it is waiting
> for a user. After discussion with Boris. We both think it's
> time to rebuild SPI NAND framework based on the new NAND
> framework and send out for reviewing.
> 
> This serie is based on Boris's nand/generic branch[2], which
> is on 4.9-rc1. In this serie, BBT code is totally shared.
> Of course SPI NAND can share more code with parallel, this
> requires to put more in new NAND core (now only BBT included).
> I'd like to send this serie out first, then we can decide
> which part should be in new NAND core.

Thanks for doing that.

> 
> This serie only supports basic SPI NAND features and uses
> generic spi controller for data transfer, on-die ECC for data
> correction. Support advanced features and specific SPI NAND
> controller with hardware ECC is the next step.

Okay, that's actually a good start. We should definitely take support
for external ECC engine into account when designing the framework, but
we don't need to support it right now.

> 
> 
> [1]http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
> [2]https://github.com/bbrezillon/linux-0day/tree/nand/generic
> 
> 
> Peter Pan (11):
>   nand: Add SPI NAND cmd set and register definition
>   nand: spi: create spi_nand_chip struct
>   nand: spi: Abstract SPI NAND cmd set to functions
>   nand: spi: Add read function support
>   nand: spi: Add write function support
>   nand: spi: Add erase function support
>   nand: spi: Add init/release function
>   nand: spi: Add bad block support
>   nand: spi: Add BBT support
>   nand: spi: Add generic SPI controller support
>   nand: spi: Add arguments check for read/write

First comment: I think you're trying to separate things that should
not be. I mean, adding support for spi-nand means adding support for all
basic features at once (read/write/erase). Please squash patches 1 to 6
into a single patch. I'm not sure yet about patch 7 and 8, but according
to the title, they should also be part of this "add basic support for
SPI NANDs" commit.
Then, BBT is clearly an optional feature that should be added in a
separate patch.

> 
>  drivers/mtd/nand/Kconfig                 |    1 +
>  drivers/mtd/nand/Makefile                |    1 +
>  drivers/mtd/nand/spi/Kconfig             |    7 +
>  drivers/mtd/nand/spi/Makefile            |    3 +
>  drivers/mtd/nand/spi/chips/Kconfig       |    5 +
>  drivers/mtd/nand/spi/chips/Makefile      |    1 +
>  drivers/mtd/nand/spi/chips/generic_spi.c |  269 ++++++
>  drivers/mtd/nand/spi/spi-nand-base.c     | 1537 ++++++++++++++++++++++++++++++
>  drivers/mtd/nand/spi/spi-nand-cmd.c      |   69 ++
>  include/linux/mtd/spi-nand.h             |  269 ++++++
>  10 files changed, 2162 insertions(+)
>  create mode 100644 drivers/mtd/nand/spi/Kconfig
>  create mode 100644 drivers/mtd/nand/spi/Makefile
>  create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
>  create mode 100644 drivers/mtd/nand/spi/chips/Makefile
>  create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c
>  create mode 100644 drivers/mtd/nand/spi/spi-nand-base.c
>  create mode 100644 drivers/mtd/nand/spi/spi-nand-cmd.c
>  create mode 100644 include/linux/mtd/spi-nand.h
> 
