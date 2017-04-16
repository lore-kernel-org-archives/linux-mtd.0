Received: from 4.mo177.mail-out.ovh.net ([46.105.37.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czrwM-0006Jk-E7
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 21:42:40 +0000
Received: from player714.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3EA7951372
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 23:42:14 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, kdasu.kdev@gmail.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, jartur@cadence.com, mar.krzeminski@gmail.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v6 0/4] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
Date: Sun, 16 Apr 2017 23:41:54 +0200
Message-Id: <cover.1492374675.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

based on git-hub/spi-nor.
The 4 patches have passed the checkpatch test.

DISCLAIMER: despite what the subjet claims, I've removed the SFDP patches from this
version since they are still RFC/WIP. However I've chosen not to change the subjet
line so it's easier to make the link between this series and its pervious versions.
You can still find the SFDP patches in v5.

Patches 3 and 4 are RFC and are not really needed for now. They are
provided to help Kamal with his own series about adding system
suspend/resume support to the spi-nor framework.


Some words about the reason why I kept the quad_enable() hook inside the
'struct spi_nor_flash_parameter':

Before patch 1:

static int set_quad_mode(struct spi_nor *nor, const struct flash_info *info)
{
	int status;

	switch (JEDEC_MFR(info)) {
	case SNOR_MFR_MACRONIX:
		status = macronix_quad_enable(nor);
		if (status) {
			dev_err(nor->dev, "Macronix quad-read not enabled\n");
			return -EINVAL;
		}
		return status;
	case SNOR_MFR_MICRON:
		return 0;
	default:
		status = spansion_quad_enable(nor);
		if (status) {
			dev_err(nor->dev, "Spansion quad-read not enabled\n");
			return -EINVAL;
		}
		return status;
	}
}
[...]

int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
{

	[...]
	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
		ret = set_quad_mode(nor, info);
		if (ret) {
			dev_err(dev, "quad mode not supported\n");
			return ret;
		}
		nor->flash_read = SPI_NOR_QUAD;
	[...]
}

Since the 'enum read_mode' has been replaced by the
'struct spi_nor_hwcaps', we have to update the if () statement from
spi_nor_scan() because SPI_NOR_QUAD no longer exists.

The original if () statement, checked the memory hardware capabilities
(info->flags & SPI_NOR_QUAD_READ) and the controller harware capabilities
(mode == SPI_NOR_QUAD) to decide whether or not some *_quad_enable()
function had to be called.

After patch 1, things are split into 2 phases:

- phase 1 handled by spi_nor_init_params() to discover the hardware
  capabilities of the SPI flash memory and to initilize the
  'struct spi_nor_flash_parameter' accordingly. For now this structure
  is iniatlized only base on info and JEDEC_MFR(info).
  However we already know that later some flash parameters will be
  overridden when parsing the SFDP tables from spi_nor_init_params().
  Especially the choice of the *_quad_enable() function will be
  directly given by a dedicated field within the Basic Flash Parameter
  Table. That's why params->quad_enable() is set from
  spi_nor_init_params() and not later. It's one of the flash parameters
  after all!
  However at this step, we don't know yet whether or not
  params->quad_enable() should be called.

- phase 2 handled by spi_nor_setup() selects the right settings (best
  matches) for Fast Read, Page Program and Sector Erase operations
  based on the hardware capabilities supported by both the (Q)SPI flash
  memory and the (Q)SPI controller.
  If any Quad SPI protocol (SPI x-y-4) is selected either for Fast Read
  or for Page Progam or for both operations, we must set the QE bit by
 calling params->quad_enable().


I've chosen to integrate ->quad_enable() in the
'struct spi_nor_flash_parameter' also in patch 1 and not in a dedicated
patch because I think we should stay backward compatible and keep the same
features as befor: adding quad_enable() in a dedicated patch would have
not respect the logic of spi_nor_init_params() VS spi_nor_setup() and/or
may have introduce bug if bisecting between patch 1 and patch 1-bis.

Sorry for this LONG explaination but it seemed that some of my choices
needed to be justified some more. I hope those detailed explainations
whould help to clarify what I've done :)



original cover-letter:
"""
This new series of patchs aims to upgrade to spi-nor framework. We need to
take into account latest SPI memories which cannot be handled correctly by
the current implementation.

For instance, SPI NOR memories like Spansion S25FS512S or Macronix
MX25U4035 support only the Fast Read 1-4-4 (EBh) command but not the
Fast Read 1-1-4 (6Bh) command. However the current spi-nor framework
supports only Fast Read 1-1-4 (6Bh).

Also the Spansion S25FS512S memory (and others) may use a non-uniform
sector erase map, whereas the spi-nor framework assumes that a single
sector erase size and opcode can be used anywhere inside the data array.
This assumption is no longer valid.

Then parsing SFDP tables is an attempt to solve many of those issues by
discovering dynamically most of the parameters and settings of the SPI NOR
memory:
- the flash size
- the page size for Page Program commands
- the supported Fast Read commands with the associated opcodes and number
  of mode/wait-state (dummy) cycles.
- the supported Sector/Block Erase commands with the associated opcodes
  and sizes.
- the erase sector map (for non-uniform memory).


Besides, most QSPI controllers from the different vendors are capable to
support the SPI 1-2-2 and 1-4-4 protocols but the spi-nor framework was
not ready to use them. This series also fixes this issue and computes the
best match between the hardware capabilies of both the SPI memory and the
SPI controler (master) to select the right opcodes and dummy cycles for
Fast Read and Page Program operations.

The new 'struct spi_nor_hwcaps' uses a bitmask to describe all the
supported hardware capabilies and makes the difference between Fast Read
and Page Program operations and also between the different SPI protocols
(SPI 1-1-2 vs SPI 1-2-2 or SPI 1-1-4 vs SPI 1-4-4).
"""

Best Regards,

Cyrille


ChangeLog:

v5 -> v6
- rebase onto the 'next' branch of github/spi-nor to patch the new
  stm32_quadspi driver.
- remove many unnecessary parentheses and add some new lines.
- add the 'const' keywork to some 'struct spi_nor_hwcaps' initialized on
  the stack.
- fix a typo in some comment.
- change the encoding scheme of the 'enum spi_nor_protocol' as suggested
  by Marek to simplify the extraction of the number of bits (I/O lines)
  for instruction, address and data clock cycles.
- extact the nor->flash_quad_enable() hook from spi-nor.h from patch 1 and
  place it into the new dedicated patch 3 as suggested by Marek.
  Patch 3 is a tiny transitionnal patch needed by patch 4 which is based
  on an original patch from Kamal Dasu.

v4 -> v5
- rework the whole series.
- introduce support for Octo SPI protocols.
- introduce support for Double Transfer Rate (DTR) protocols.
- introduce support for memories with non-uniform sector erase sizes.

v3 -> v4
- replace dev_info() by dev_dbg() in patch 1.
- split former patch 2 into 2 patches:
  + new patch 2 deals with the rename of SPINOR_OP_READ4_* macros
  + new patch 3 deals with the alternative methode to support memory
> 16MiB
- add comment in patch 3 to describe the dichotomic search performed by
  spi_nor_convert_opcode().
- change return type from int to void for m25p80_proto2nbits() in patch 6.
- remove former patches 8 & 9 from the v2 series: the support of the
  Macronix mx66l1g45g memory will be sent in a separated patch.

v2 -> v3
- tested with new samples: Micron n25q512, n25q01g and Macronix
  mx25v1635f, mx25l3235f, mx25l3273f.
- add "Reviewed-by: Jagan Teki <jagan@openedev.com>" on patch 1.
- add "Tested-by: Vignesh R <vigneshr@ti.com>" on patch 2.
- fix some checkpatch warnings.
- add call of spi_nor_wait_till_ready() in spansion_new_quad_enable()
  and sr2_bit7_quad_enable(), as suggested by Joel Esponde on patch 6.
- test JESD216 rev A (minor 5) instead of rev B (minor 6) with the return
  code of spi_nor_parse_sfdp() from spi_nor_init_params() on patch 6.
  The seven additional DWORDs of the Basic Flash Parameter Table were
  introduced in rev A, not rev B, so the 15th DWORD was already available
  in rev A. The 15th DWORD provides us with the Quad Enable Requirements
  (QER) bits.
  Basic Flash Parameter Table size:
  + JESD216 :  9 DWORDS
  + JESD216A: 16 DWORDS
  + JESD216B: 16 DWORDS

v1 -> v2
- fix patch 3 to resolve compiler errors on hisi-sfc.c and cadence-quadspi.c
  drivers


Cyrille Pitchen (4):
  mtd: spi-nor: introduce more SPI protocols and the Dual Transfer Mode
  mtd: m25p80: add support of SPI 1-2-2 and 1-4-4 protocols
  mtd: spi-nor: transitional patch
  mtd: spi-nor: add spi_nor_init() function

 drivers/mtd/devices/m25p80.c          | 121 +++++---
 drivers/mtd/spi-nor/aspeed-smc.c      |  23 +-
 drivers/mtd/spi-nor/atmel-quadspi.c   |  83 ++++--
 drivers/mtd/spi-nor/cadence-quadspi.c |  18 +-
 drivers/mtd/spi-nor/fsl-quadspi.c     |   6 +-
 drivers/mtd/spi-nor/hisi-sfc.c        |  31 +-
 drivers/mtd/spi-nor/intel-spi.c       |   7 +-
 drivers/mtd/spi-nor/mtk-quadspi.c     |  15 +-
 drivers/mtd/spi-nor/nxp-spifi.c       |  22 +-
 drivers/mtd/spi-nor/spi-nor.c         | 530 ++++++++++++++++++++++++++--------
 drivers/mtd/spi-nor/stm32-quadspi.c   |  27 +-
 include/linux/mtd/spi-nor.h           | 168 ++++++++++-
 12 files changed, 815 insertions(+), 236 deletions(-)

-- 
2.9.3
