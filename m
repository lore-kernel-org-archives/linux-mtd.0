Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWoo-0008Qw-PC
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:04:50 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/17] mtd: nand: allow vendor specific
 detection/initialization
Date: Mon,  9 Jan 2017 11:04:07 +0100
Message-Id: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I know I said it would be the last round, but I decided to change a few
things after Marek's review.

Marek, Richard, I dropped your R-b/A-b tags on "mtd: nand: Add
manufacturer specific initialization/detection steps" (patch 8) and
"mtd: nand: Kill the MTD_NAND_IDS Kconfig option" (patch 6) since they
changed a bit in v6.
Can you have a look?

Marek, I did not address your concern regarding the use of the extern
keyword for struct nand_manufacturer_ops defs. Let me know if this is
something you really find important, and why. If you have a good reason
to hide these objects behind an accessor, I might reconsider your
suggestion.

This patch series is a step forward in supporting vendor-specific
functionalities.
This series is mainly moving vendor-specific initialization or
detection code out of the core, but also introduces an infrastructure
allowing support for vendor-specific features.

While those features might seem useless to most users, some of them are
actually required on modern MLC/TLC NANDs (this is the case of read-retry
support, which AFAICT has not been standardized by the JEDEC consortium).

Now, let's detail what's inside this patch-set.

Patches 1 to 5 are simple reworks simplifying auto-detection function
prototypes, and clarifying their purpose.

Patch 6 is removing the MTD_NAND_IDS Kconfig option to avoid creating
a nand_ids.ko module when MTD_NAND is enabled as a module. This prevents
a future cross-dependency between nand.ko where all vendor specific
code will rely and nand_ids.ko which will reference vendor-specific ops
in its manufacturer table, which in turn is referenced by the core code
linked in nand.ko.

Patch 7 is hiding NAND manufacturer table internals and exposing a
helper to get a nand_manufacturer object from a manufacturer ID.

Patch 8 is introducing the vendor-specific initialization
infrastructure.

Patches 9 to 14 are moving vendor-specific code into their respective
nand_<vendor>.c files.

Patch 15 is taking a patch proposed by Hans and adding support for ECC
requirements extraction from the samsung extended IDs. It seems to apply
to all Samsung MLCs, but even if it's not the case, the detection code
should be improved to support the new formats.

Patch 16 is adding support for advanced NAND ID decoding to the Hynix
driver (OOB size, ECC and scrambling requirements extraction). Again
this detection code might be incomplete, but I'd like people to extend
it if required rather than adding new full-id entries in the nand_ids
table.

And finally, patch 17 is showing how useful this vendor-specific stuff
can be by implementing read-retry support for Hynix 1x nm MLCs. And
trust me, you don't want to try using such a NAND without read-retry
support ;).

As always, I'm open to any suggestion to improve this vendor-specific
infrastructure, so please review the code :).

Thanks,

Boris

Changes since v5:
- Move extern extern struct nand_manufacturer_ops definitions to nand.h
  to fix checkpatch warnings
- Remove MODULE_XX() and EXPORT_SYMBOL() calls in nand_ids.c
- Do not expose the NAND manufacturer table
- Drop the 's' in struct nand_manufacturer*s*
- Provide a pointer to a nand_manufacturer object instead of
  nand_manufacturer_ops in struct nand_chip

Changes since v4:
- Fix copyright headers in nand_<vendor>.c files
- Fix comments referring to Samsung in nand_hynix.c
- Fix commit message of patch 4

Changes since v3:
- Fix coding style issues 

Changes since v2:
- Fix nand_command_lp() implementation to allow reading the ID
  after switching from ->cmdfunc() from nand_command() to
  nand_command_lp().
- Include slab.h in hynix_nand.c
- Avoid selecting/unselecting the NAND chip in Hynix ->init()
  hook (the chip is already selected by the core)
- Add wrappers to call the ->detect() and ->init() hooks

Changes since v1:
- split detection and initialization steps to avoid keeping
  information retrieved by nand_decode_ext_id() if it's not
  appropriate (Aleksei reported a bug where NAND_BUSWIDTH_16
  was set by nand_decode_ext_id() and not cleared by the
  samsung ->init() function).
  The new approach is to call ->detect() if it's provided and
  fallback to nand_decode_ext_id() if it's not. ->detect()
  implementation should can call nand_decode_ext_id() if needed.

Boris Brezillon (16):
  mtd: nand: Get rid of the mtd parameter in all auto-detection
    functions
  mtd: nand: Store nand ID in struct nand_chip
  mtd: nand: Get rid of busw parameter
  mtd: nand: Rename nand_get_flash_type() into nand_detect()
  mtd: nand: Rename the nand_manufacturers struct
  mtd: nand: Kill the MTD_NAND_IDS Kconfig option
  mtd: nand: Do not expose the NAND manufacturer table directly
  mtd: nand: Add manufacturer specific initialization/detection steps
  mtd: nand: Move Samsung specific init/detection logic in
    nand_samsung.c
  mtd: nand: Move Hynix specific init/detection logic in nand_hynix.c
  mtd: nand: Move Toshiba specific init/detection logic in
    nand_toshiba.c
  mtd: nand: Move Micron specific init logic in nand_micron.c
  mtd: nand: Move AMD/Spansion specific init/detection logic in
    nand_amd.c
  mtd: nand: Move Macronix specific initialization in nand_macronix.c
  mtd: nand: hynix: Rework NAND ID decoding to extract more information
  mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs

Hans de Goede (1):
  mtd: nand: samsung: Retrieve ECC requirements from extended ID

 arch/cris/arch-v32/drivers/Kconfig |   1 -
 drivers/mtd/nand/Kconfig           |   4 -
 drivers/mtd/nand/Makefile          |   9 +-
 drivers/mtd/nand/nand_amd.c        |  51 +++
 drivers/mtd/nand/nand_base.c       | 408 +++++++++---------------
 drivers/mtd/nand/nand_hynix.c      | 629 +++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand_ids.c        |  39 ++-
 drivers/mtd/nand/nand_macronix.c   |  30 ++
 drivers/mtd/nand/nand_micron.c     |  86 +++++
 drivers/mtd/nand/nand_samsung.c    | 112 +++++++
 drivers/mtd/nand/nand_toshiba.c    |  51 +++
 include/linux/mtd/nand.h           |  88 ++++--
 12 files changed, 1209 insertions(+), 299 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_amd.c
 create mode 100644 drivers/mtd/nand/nand_hynix.c
 create mode 100644 drivers/mtd/nand/nand_macronix.c
 create mode 100644 drivers/mtd/nand/nand_micron.c
 create mode 100644 drivers/mtd/nand/nand_samsung.c
 create mode 100644 drivers/mtd/nand/nand_toshiba.c

-- 
2.7.4
