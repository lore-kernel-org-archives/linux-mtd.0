Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEvYu-0000k8-Jt
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 09:32:10 +0000
Date: Mon, 20 Jun 2016 11:31:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Aleksei Mamlin <mamlinav@gmail.com>, valdis.kletnieks@vt.edu
Subject: Re: [PATCH v3 00/16] mtd: nand: allow vendor specific
 detection/initialization
Message-ID: <20160620113146.1c2b8853@bbrezillon>
In-Reply-To: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Mon, 20 Jun 2016 11:26:46 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> This patch series is a step forward in supporting vendor-specific
> functionalities.
> This series is mainly moving vendor-specific initialization or
> detection code out of the core, but also introduces an infrastructure
> allowing support for vendor-specific features.
> 
> While those features might seem useless to most users, some of them are
> actually required on modern MLC/TLC NANDs (this is the case of read-retry
> support, which AFAICT has not been standardized by the JEDEC consortium).
> 
> Now, let's detail what's inside this patch-set.
> 
> Patch 1 is fixing the nand_command_lp() implementation to allow reading
> the ID after the core has switched from nand_command() to
> nand_command_lp().
> 
> Patches 2 to 5 are simple reworks simplifying auto-detection function
> prototypes, and clarifying their purpose.
> 
> Patch 6 is introducing the vendor-specific initialization
> infrastructure.
> 
> Patch 7 is removing the MTD_NAND_IDS Kconfig option to avoid creating
> a nand_ids.ko module when MTD_NAND is enabled as a module. This prevents
> a future cross-dependency between nand.ko where all vendor specific
> code will rely and nand_ids.ko which will reference vendor-specific ops
> in its manufacturer table, which in turn is referenced by the core code
> linked in nand.ko.
> 
> Patches 8 to 13 are moving vendor-specific code into their respective
> nand_<vendor>.c files.
> 
> Patch 14 is taking a patch proposed by Hans and adding support for ECC
> requirements extraction from the samsung extended IDs. It seems to apply
> to all Samsung MLCs, but even if it's not the case, the detection code
> should be improved to support the new formats.
> 
> Patch 15 is adding support for advanced NAND ID decoding to the Hynix
> driver (OOB size, ECC and scrambling requirements extraction). Again
> this detection code might be incomplete, but I'd like people to extend
> it if required rather than adding new full-id entries in the nand_ids
> table.
> 
> And finally, patch 16 is showing how useful this vendor-specific stuff
> can be by implementing read-retry support for Hynix 1x nm MLCs. And
> trust me, you don't want to try using such a NAND without read-retry
> support ;).
> 
> As always, I'm open to any suggestion to improve this vendor-specific
> infrastructure, so please review the code :).
> 
> Thanks,
> 
> Boris
> 
> Changes since v2:
> - Fix nand_command_lp() implementation to allow reading the ID
>   after switching from ->cmdfunc() from nand_command() to
>   nand_command_lp().
> - Include slab.h in hynix_nand.c
> - Avoid selecting/unselecting the NAND chip in Hynix ->init()
>   hook (the chip is already selected by the core)

Forgot to mention the addition of wrappers to call the ->detect() and
->init() hooks.

> 
> Changes since v1:
> - split detection and initialization steps to avoid keeping
>   information retrieved by nand_decode_ext_id() if it's not
>   appropriate (Aleksei reported a bug where NAND_BUSWIDTH_16
>   was set by nand_decode_ext_id() and not cleared by the
>   samsung ->init() function).
>   The new approach is to call ->detect() if it's provided and
>   fallback to nand_decode_ext_id() if it's not. ->detect()
>   implementation should can call nand_decode_ext_id() if needed.
> 
> Boris Brezillon (15):
>   mtd: nand: Fix nand_command_lp() for 8bits opcodes
>   mtd: nand: get rid of the mtd parameter in all auto-detection
>     functions
>   mtd: nand: store nand ID in struct nand_chip
>   mtd: nand: get rid of busw parameter
>   mtd: nand: rename nand_get_flash_type() into nand_detect()
>   mtd: nand: add manufacturer specific initialization/detection steps
>   mtd: nand: kill the MTD_NAND_IDS Kconfig option
>   mtd: nand: move Samsung specific init/detection logic in
>     nand_samsung.c
>   mtd: nand: move Hynix specific init/detection logic in nand_hynix.c
>   mtd: nand: move Toshiba specific init/detection logic in
>     nand_toshiba.c
>   mtd: nand: move Micron specific init logic in nand_micron.c
>   mtd: nand: move AMD/Spansion specific init/detection logic in
>     nand_amd.c

This file contains coding style issues. I'll fix them in v4.

>   mtd: nand: move Macronix specific initialization in nand_macronix.c
>   mtd: nand: hynix: rework NAND ID decoding to extract more information
>   mtd: nand: hynix: add read-retry support for 1x nm MLC NANDs
> 
> Hans de Goede (1):
>   mtd: nand: samsung: retrieve ECC requirements from extended ID
> 
>  arch/cris/arch-v32/drivers/Kconfig |   1 -
>  drivers/mtd/nand/Kconfig           |   4 -
>  drivers/mtd/nand/Makefile          |   9 +-
>  drivers/mtd/nand/nand_amd.c        |  48 +++
>  drivers/mtd/nand/nand_base.c       | 402 +++++++++---------------
>  drivers/mtd/nand/nand_hynix.c      | 628 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/nand_ids.c        |  21 +-
>  drivers/mtd/nand/nand_macronix.c   |  27 ++
>  drivers/mtd/nand/nand_micron.c     |  84 +++++
>  drivers/mtd/nand/nand_samsung.c    | 109 +++++++
>  drivers/mtd/nand/nand_toshiba.c    |  48 +++
>  include/linux/mtd/nand.h           |  69 ++--
>  12 files changed, 1157 insertions(+), 293 deletions(-)
>  create mode 100644 drivers/mtd/nand/nand_amd.c
>  create mode 100644 drivers/mtd/nand/nand_hynix.c
>  create mode 100644 drivers/mtd/nand/nand_macronix.c
>  create mode 100644 drivers/mtd/nand/nand_micron.c
>  create mode 100644 drivers/mtd/nand/nand_samsung.c
>  create mode 100644 drivers/mtd/nand/nand_toshiba.c
> 
