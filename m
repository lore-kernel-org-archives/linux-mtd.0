Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1clXDD-0006YC-9y
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 08:44:48 +0000
Date: Wed, 8 Mar 2017 09:44:25 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v2 6/6] nand: spi: Add generic SPI controller support
Message-ID: <20170308094425.694c5e07@bbrezillon>
In-Reply-To: <1488358330-23832-7-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-7-git-send-email-peterpandong@micron.com>
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

On Wed, 1 Mar 2017 16:52:10 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This commit supports to use generic spi controller
> as spi nand controller.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/spi/Kconfig             |   2 +
>  drivers/mtd/nand/spi/Makefile            |   1 +
>  drivers/mtd/nand/spi/chips/Kconfig       |   5 +
>  drivers/mtd/nand/spi/chips/Makefile      |   1 +
>  drivers/mtd/nand/spi/chips/generic_spi.c | 158 +++++++++++++++++++++++++++++++

Hm, I would name the directory controllers and not chips. What could go
into chips are all the vendor specific drivers.

>  5 files changed, 167 insertions(+)
>  create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
>  create mode 100644 drivers/mtd/nand/spi/chips/Makefile
>  create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c

Just controllers/generic.c?
