From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: kbuild test robot <lkp@intel.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 ezequiel.garcia@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, sebastian.hesselbarth@gmail.com
Subject: Re: [PATCH v3 1/4] mtd: nand: allow compile test of MTD_NAND_PXA3xx
Date: Thu, 15 Oct 2015 13:44:19 +0200
Message-ID: <5425922.4Qu1HbLqzM@wuerfel>
In-Reply-To: <201510151736.7t9qDlAe%fengguang.wu@intel.com>
References: <201510151736.7t9qDlAe%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 October 2015 17:12:18 kbuild test robot wrote:
>    drivers/mtd/nand/pxa3xx_nand.c: In function 'drain_fifo':
> >> drivers/mtd/nand/pxa3xx_nand.c:507:4: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
>        readsl(info->mmio_base + NDDB, data, 8);
>        ^

It should be easy to fix this by changing the code to use ioread32_rep() instead
of readsl(). They behave the same way on pointers returned from ioremap() etc,
and the other one is available on all architectures.

	Arnd
