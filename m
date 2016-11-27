Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB2NI-0008Vf-L8
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 16:32:21 +0000
Date: Sun, 27 Nov 2016 17:31:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: Re: [PATCH 00/39] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Message-ID: <20161127173158.57ceb4f6@bbrezillon>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:05:46 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> As I said in the 1st round series, I am tackling on this driver
> to use it for my SoCs.
> 
> The previous series was just cosmetic things, but this series
> includes *real* changes.
> 
> After some more cleanups, I will start to add changes that
> are really necessary.
> One of the biggest problems I want to solve is a bunch of
> hard-coded parameters that prevent me from using this driver for
> my SoCs.
> 
> I will introduce capability flags that are associated with DT
> compatible and make platform-dependent parameters overridable.
> 
> I still have lots of reworks to get done (so probably 3rd round
> series will come), but I hope it is getting better and
> I am showing a big picture now.
> 

I still need to carefully review some of those patches, but I must
admit I like some of the cleanups/rework you're doing here.

Thanks for all your work.

Boris

> 
> 
> Masahiro Yamada (39):
>   mtd: nand: allow to set only one of ECC size and ECC strength from DT
>   mtd: nand: denali: remove unused CONFIG option and macros
>   mtd: nand: denali: remove redundant define of BANK(x)
>   mtd: nand: denali: remove more unused struct members
>   mtd: nand: denali: fix comment of denali_nand_info::flash_mem
>   mtd: nand: denali: fix write_oob_data() function
>   mtd: nand: denali: transfer OOB only when oob_required is set
>   mtd: nand: denali: introduce capability flag
>   mtd: nand: denali: fix erased page check code
>   mtd: nand: denali: remove redundant if conditional of erased_check
>   mtd: nand: denali: increment ecc_stats.failed by one per error
>   mtd: nand: denali: return 0 for uncorrectable ECC error
>   mtd: nand: denali: increment ecc_stats->corrected
>   mtd: nand: denali: replace uint{8/16/32}_t with u{8/16/32}
>   mtd: nand: denali: improve readability of handle_ecc()
>   mtd: nand: denali: rename handle_ecc() to denali_sw_ecc_fixup()
>   mtd: nand: denali: support HW_ECC_FIXUP capability
>   mtd: nand: denali: move denali_read_page_raw() above
>     denali_read_page()
>   mtd: nand: denali: perform erased check against raw transferred page
>   mtd: nand: denali_dt: enable HW_ECC_FIXUP capability for DT platform
>   mtd: nand: denali: support 64bit capable DMA engine
>   mtd: nand: denali_dt: remove dma-mask DT property
>   mtd: nand: denali_dt: use pdev instead of ofdev for platform_device
>   mtd: nand: denali: add NEW_N_BANKS_FORMAT capability
>   mtd: nand: denali: use nand_chip to hold frequently accessed data
>   mtd: nand: denali: call nand_set_flash_node() to set DT node
>   mtd: nand: denali: do not set mtd->name
>   mtd: nand: denali: move multi NAND fixup code to a helper function
>   mtd: nand: denali: refactor multi NAND fixup code in more generic way
>   mtd: nand: denali: set DEVICES_CONNECTED 1 if not set
>   mtd: nand: denali: remove meaningless writes to read-only registers
>   mtd: nand: denali: remove unnecessary writes to ECC_CORRECTION
>   mtd: nand: denali: support 1024 byte ECC step size
>   mtd: nand: denali: fix the condition for 15 bit ECC strength
>   mtd: nand: denali: calculate ecc.strength and ecc.bytes generically
>   mtd: nand: denali: allow to use SoC-specific ECC strength
>   mtd: nand: denali: support "nand-ecc-strength" DT property
>   mtd: nand: denali: remove Toshiba, Hynix specific fixup code
>   mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  19 +-
>  drivers/mtd/nand/Kconfig                           |  11 -
>  drivers/mtd/nand/denali.c                          | 740 ++++++++++++---------
>  drivers/mtd/nand/denali.h                          |  84 +--
>  drivers/mtd/nand/denali_dt.c                       |  95 ++-
>  drivers/mtd/nand/denali_pci.c                      |   2 +
>  drivers/mtd/nand/nand_base.c                       |   6 -
>  7 files changed, 515 insertions(+), 442 deletions(-)
> 
