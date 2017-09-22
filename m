Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dvKrP-0008DY-Se
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 10:07:09 +0000
Date: Fri, 22 Sep 2017 12:06:45 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 00/12] mtd: nand: denali: more clean-ups
Message-ID: <20170922120645.62739279@bbrezillon>
In-Reply-To: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
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

On Fri, 22 Sep 2017 12:46:37 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This series make the Denali driver even cleaner and more correct.
> 

Applied.

Thanks,

Boris

> 
> Masahiro Yamada (12):
>   mtd: nand: denali: squash setup_ecc_for_xfer() helper into caller
>   mtd: nand: denali: prefix detect_max_banks() with denali_
>   mtd: nand: denali: consolidate include directives
>   mtd: nand: denali: squash denali_enable_dma() helper into caller
>   mtd: nand: denali: slight clean up of denali_wait_for_irq()
>   mtd: nand: denali: clean up macros with <linux/bitfield.h>
>   mtd: nand: denali: use more FIELD_PREP / FIELD_GET where appropriate
>   mtd: nand: denali: clean up comments
>   mtd: nand: denali: use upper/lower_32_bits() macro for clean-up
>   mtd: nand: denali: remove unneeded init of ECC_ENABLE register
>   mtd: nand: denali: support direct addressing mode
>   mtd: nand: denali: change the setup_dma choice into hook
> 
>  drivers/mtd/nand/denali.c     | 277 ++++++++++++++++++------------------------
>  drivers/mtd/nand/denali.h     |  44 +++----
>  drivers/mtd/nand/denali_dt.c  |   4 +-
>  drivers/mtd/nand/denali_pci.c |   5 +-
>  4 files changed, 141 insertions(+), 189 deletions(-)
> 
