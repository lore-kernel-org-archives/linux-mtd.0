Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGNZn-0004Lp-F0
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 09:39:04 +0000
Date: Fri, 24 Jun 2016 11:38:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v5 0/8] MTD: xway: fix driver
Message-ID: <20160624113841.491f5c7b@bbrezillon>
In-Reply-To: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
References: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
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

On Mon, 20 Jun 2016 23:32:06 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Without these patches the driver does not work for me.
> Some of these patches are in OpenWrt for years now and should go 
> upstream. In addition this converts it from some hack with the 
> plat_nand driver to a normal platform driver.
> 
> I will try to convert the spinlock to a mutex in a separate patch 
> because this affects other parts of the kernel. 

Applied the whole series. But please try to find a clean solution for
the spinlock issue.

Thanks,

Boris

> 
> changes since:
> v4:
>  - do not call NAND reset manually
> 
> v3:
>  - update some commit comments
>  - reorder last 2 patches
>  - do not set ->IO_ADDR_R/W any more
> 
> v2:
>  - reorder patches
>  - use of_property_read_u32()
>  - rework error handling in xway_nand_probe()
>  - simplify latched command handling
>  - remove xway_reset_chip()
>  - remove cast of nandaddr
>  - add nandaddr to xway_nand_data
>  - add csflags to xway_nand_data
> 
> v1:
>  - convert to normal platform driver
>  - do not use global variable xway_latchcmd
>  - use mtd_to_nand()
> 
> Hauke Mehrtens (6):
>   mtd: nand: xway: add some more documentation
>   mtd: nand: xway: convert to normal platform driver
>   mtd: nand: xway: remove manual reset
>   mtd: nand: xway: extract read and write function
>   mtd: nand: xway: add missing write_buf and read_buf to nand driver
>   mtd: nand: xway: add nandaddr to own struct
> 
> John Crispin (2):
>   mtd: nand: xway: Avoid messing up with IO_ADDR_W in ->cmd_ctrl()
>   mtd: nand: xway: fix nand locking
> 
>  drivers/mtd/nand/Kconfig     |   1 -
>  drivers/mtd/nand/xway_nand.c | 231 ++++++++++++++++++++++++++-----------------
>  2 files changed, 141 insertions(+), 91 deletions(-)
> 
