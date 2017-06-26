Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPTmZ-00006A-7e
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 13:10:25 +0000
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>
Subject: [PATCH v3 0/2] mtd: spi-nor: parse Serial Flash Discoverable
 Parameters (SFDP) tables
Date: Mon, 26 Jun 2017 15:09:58 +0200
Message-ID: <cover.1498481714.git.cyrille.pitchen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

a new version of the SFDP patch based on next-20170626

tested on sama5d2 xplained with the following QSPI memories:
Macronix
- mx25l25673g

Spansion/Cypress
- s25fl164
- s25fl127
- s25fl512

Winbond
- w25q256
- w25m512

SST
- sst26vf064

Micron
- m25q128
- n25q128a
- m25ql512
- m25ql01g

For my tests, I used mtd_debug to erase, write then read back some areas
inside data array of the SPI NOR flash memory.
To verify the integrity of the data, I used sha1sum to compare the
original file with the one read from the SPI flash memory.

For memories with a non-uniform erase map (sst26vf064, s25fl512, ...), I
chose an offset in the data array so the sector size is the one set into
nor->mtd.erasesize.

CONFIG_MTD_SPI_NOR_USE_4K_SECTORS was defined in my .config file.
Older tests were also run with this macro undefined and with other memory
parts.
Here I'm only talking about tests performed within the last few days.

For sst26vf064, the Global Unlock Block Protection command was already
sent to the memory by the bootloader so once in Linux, the memory was in a
rw mode, otherwise Sector Erase and Page Program would fail.

Flash unlock (block protection) and  non-uniform erase map are out of the
scope of this patch and would be addressed later in dedicated patches.

I added/updated few entries in the spi_nor_ids[] array so I could use all
the memory parts listed above with SFDP support.

My s25fl127 sample is buggy and I don't know whether the issue has been
fixed by Cypress with the later revisions of this part number (s25fl128s):
The SFDP data programmed in my sample claim that the memory is compliant
with JESD216 rev B (version 1.6) however DWORDs 10 to 16 of the Basic
Flash Parameter Table are all 0xFFFFFFFF, only the first 9 DWORDs are
programmed correctly as is the memory was only compliant with JESD216
(version 1.0). Hence when testing the QER bits in DWORD15, the reserved
value 111b is read. That why I've changed the default case for QER bits
so it now returns -EINVAL when an unexpected value is read.
So the SFDP data are reported as invalid and just ignored.
I didn't use the SPI_NOR_SKIP_SFDP info->flags because s25fl127 and
s25fl128s share the same JEDEC ID and I want to give a chance to use the
SFDP tables of the later revisions of this memory part if the above
issue has been fixed.

Best regards,

Cyrille


ChangeLog

v2 > v3:
- add a small patch to fix a conflict when the SPINOR_OP_RDSR2 macro was
  defined twice: first in drivers/mtd/devices/serial_flash_cmds.h and
  secondly in include/linux/mtd/spi-nor.h. It resulted in a build warning.
- add the missing () in the kernel-doc comments for functions
- add a Return: section in the kernel-doc comments for functions
- improve spi_nor_read_sfdp() to take into account the case where all SFDP
  data can't be read in a single nor->read() call.

v1 -> v2:
- add kernel-doc to the main functions introduced by this patch.
- rename spansion_new_quad_enable() into spansion_read_cr_quad_enable().
- add spansion_no_read_cr_quad_enable(): the explanation is given in
  the kernel-doc.
- take Marek's comments into account (add new lines, remove parenthesis,
  keep new error messages on the same line as dev_err(), already exisiting
  error messages are left unchanged, use u32 instead of int for >>
  operand, use sizeof(u32) instead of sizeof(uint32_t)).
- propagate return code of spi_nor_read_sfdp().
- handle the default case of the QER bits differently: now returns -EINVAL


Cyrille Pitchen (2):
  mtd: st_spi_fsm: remove SPINOR_OP_RDSR2 and use SPINOR_OP_RDCR instead
  mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables

 drivers/mtd/devices/serial_flash_cmds.h |   1 -
 drivers/mtd/devices/st_spi_fsm.c        |   4 +-
 drivers/mtd/spi-nor/spi-nor.c           | 775 +++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h             |   6 +
 4 files changed, 770 insertions(+), 16 deletions(-)

-- 
2.7.4
