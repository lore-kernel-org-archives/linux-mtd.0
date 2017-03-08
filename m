Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1clX1o-0002dm-L2
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 08:33:02 +0000
Date: Wed, 8 Mar 2017 09:32:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v2 5/6] nand: spi: add Micron spi nand support
Message-ID: <20170308093239.67235da9@bbrezillon>
In-Reply-To: <1488358330-23832-6-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-6-git-send-email-peterpandong@micron.com>
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

On Wed, 1 Mar 2017 16:52:09 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This commit is to add support for Micron MT29F2G01ABAGD
> spi nand chip.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/spi/Makefile         |   1 +
>  drivers/mtd/nand/spi/spinand_ids.c    |   5 ++
>  drivers/mtd/nand/spi/spinand_micron.c | 133 ++++++++++++++++++++++++++++++++++

micron.c should be enough.
