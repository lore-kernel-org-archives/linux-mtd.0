Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c812e-0005ni-RU
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2016 08:30:33 +0000
Date: Sat, 19 Nov 2016 09:30:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Alan Cox <alan@linux.intel.com>, David
 Woodhouse <David.Woodhouse@intel.com>, Jason Roberts
 <jason.e.roberts@intel.com>, Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>, linux-kernel@vger.kernel.org, Marek
 Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 00/11] mtd: nand: denali: first round of cleanups of
 Denali NAND driver
Message-ID: <20161119093011.17b53356@bbrezillon>
In-Reply-To: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

On Wed,  9 Nov 2016 13:35:19 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> I am tackling on this driver to use it for my SoCs.
> The difficulty is a bunch of platform specific stuff
> (more specifically, Intel MRST specific) is hard-coded in this driver.
> 
> I need lots of rework to utilize the driver for generic cases,
> but at the same time, I found the driver code is really dirty,
> lots of unused code, odd comments, etc.
> 
> The first thing I needed to do was to clean up the code.
> My work is still under the way, but I decided to drop this series
> for now.  I hope this series is easy to review, so I guess
> splitting into a small chunks is better than a one-shot patch bomb.

Well, all I've seen coming from you so far are minor cleanups and
cosmetic changes (including one introducing a regression).
I'll apply this series, but please, next time, try to send the whole
series, so that we can see the big picture, and not just random
cleanups.

Thanks,

Boris

> 
> 
> 
> Masahiro Yamada (11):
>   mtd: nand: denali: remove unneeded <linux/slab.h> includes
>   mtd: nand: denali: remove unused struct member denali_nand_info::idx
>   mtd: nand: denali: remove bogus comment about interrupt handler setup
>   mtd: nand: denali: remove detect_partition_feature()
>   mtd: nand: denali: remove "Spectra:" prefix from printk strings
>   mtd: nand: denali: remove unused struct member totalblks, blksperchip
>   mtd: nand: denali: use managed devm_irq_request()
>   mtd: nand: denali: return error code from devm_request_irq() on error
>   mtd: nand: denali: return error code from nand_scan_ident/tail on
>     error
>   mtd: nand: denali: remove unneeded parentheses
>   mtd: nand: denali: remove debug lines of __FILE__, __LINE__, __func__
> 
>  drivers/mtd/nand/denali.c     | 101 +++++++++---------------------------------
>  drivers/mtd/nand/denali.h     |  12 -----
>  drivers/mtd/nand/denali_dt.c  |   1 -
>  drivers/mtd/nand/denali_pci.c |   1 -
>  4 files changed, 21 insertions(+), 94 deletions(-)
> 
