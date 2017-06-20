Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dNDad-0007eE-5N
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 07:28:45 +0000
Date: Tue, 20 Jun 2017 09:28:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v7 00/16] mtd: nand: denali: Denali NAND IP improvements
Message-ID: <20170620092811.33d2dfff@bbrezillon>
In-Reply-To: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
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

On Tue, 13 Jun 2017 22:45:34 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This patch series intends to solve various problems.
> 
> [1] The driver just retrieves the OOB area as-is
>     whereas the controller uses syndrome page layout.
> [2] ONFi devices are not working
> [3] It can not read Bad Block Marker
> 
> Outstanding changes are:
>  - Fix raw/oob callbacks for syndrome page layout
>  - Implement setup_data_interface() callback
>  - Fix/implement more commands for ONFi devices
>  - Allow to skip the driver internal bounce buffer
>  - Support PIO in case DMA is not supported
>  - Switch from ->cmdfunc over to ->cmd_ctrl
> 
> 18 patches were merged by v2.
> 11 patches were merged by v3.
> 2 patches were merged by v4.
> 5 patches were merged by v5.
> Here is the rest of the series.
> 
> v1: https://lkml.org/lkml/2016/11/26/144
> v2: https://lkml.org/lkml/2017/3/22/804
> v3: https://lkml.org/lkml/2017/3/30/90
> v4: https://lkml.org/lkml/2017/6/5/1005
> 
> 
> Masahiro Yamada (16):
>   mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
>   mtd: nand: denali: remove unneeded find_valid_banks()
>   mtd: nand: denali: handle timing parameters by setup_data_interface()
>   mtd: nand: denali: rework interrupt handling
>   mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
>   mtd: nand: denali: fix bank reset function to detect the number of
>     chips
>   mtd: nand: denali: use interrupt instead of polling for bank reset
>   mtd: nand: denali: propagate page to helpers via function argument
>   mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
>   mtd: nand: denali: use flag instead of register macro for direction
>   mtd: nand: denali: fix raw and oob accessors for syndrome page layout
>   mtd: nand: denali: support hardware-assisted erased page detection
>   mtd: nand: denali: skip driver internal bounce buffer when possible
>   mtd: nand: denali: use non-managed kmalloc() for DMA buffer
>   mtd: nand: denali: enable bad block table scan
>   mtd: nand: denali: avoid magic numbers and rename for clarification

Applied patches 1 to 15 and v8 of patch 16.

Thanks a lot for your patience and the cleanup/rework you've done.

BTW, I'd be happy to have you flagged as the maintainer of the NAND
denali driver. If you like the idea, just send a patch adding an entry
in MAINTAINERS.

Regards,

Boris

> 
>  drivers/mtd/nand/denali.c     | 1724 ++++++++++++++++++-----------------------
>  drivers/mtd/nand/denali.h     |   63 +-
>  drivers/mtd/nand/denali_dt.c  |   15 +-
>  drivers/mtd/nand/denali_pci.c |   22 +-
>  4 files changed, 806 insertions(+), 1018 deletions(-)
> 
