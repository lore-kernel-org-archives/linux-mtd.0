Received: from [209.116.120.7] (helo=tnint11.telogy.design.ti.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Blob-0005bQ-00
	for <linux-mtd@lists.infradead.org>; Sun, 26 May 2002 01:23:17 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Snehaprabha <nsnehaprabha@tnint11.telogy.design.ti.com>
To: linux-mtd@lists.infradead.org
Subject: Problem in chip detection.
Date: Sat, 25 May 2002 20:22:46 -0400
Cc: nsnehaprabha@telogy.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200205252022.46380.nsnehaprabha@tnint11.telogy.design.ti.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I have a board with 32MB flash - (2 chips - x16) Intel E28F640J3A.
with a buswidth of 32 bits. I am running linux kernel version 2.4.17.=20
I have a problem; It looks like only one chip gets detected properly, and
the second one gets detected as an alias. So my mtd device shows follwing
details.

dev:    size   erasesize  name
mtd0: 01000000 00040000 "Physically mapped flash"

Note that the actual size is 32MB, but the size shown by "mtd0" is only=20
16MB, is of one chip.

Here is my configuration:
CONFIG_MTD=3Dy
CONFIG_MTD_DEBUG=3Dy
CONFIG_MTD_DEBUG_VERBOSE=3D3
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set

CONFIG_MTD_CFI=3Dy
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
CONFIG_MTD_CFI_NOSWAP=3Dy
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=3Dy
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=3Dy
# CONFIG_MTD_CFI_B8 is not set
 # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=3Dy
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=3Dy
# CONFIG_MTD_CFI_B8 is not set
# CONFIG_MTD_CFI_I1 is not set
CONFIG_MTD_CFI_I2=3Dy
# CONFIG_MTD_CFI_I4 is not set
CONFIG_MTD_CFI_INTELEXT=3Dy
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

CONFIG_MTD_PHYSMAP=3Dy
CONFIG_MTD_PHYSMAP_START=3D10000000
CONFIG_MTD_PHYSMAP_LEN=3D2000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=3D4
# CONFIG_MTD_CSTM_MIPS_IXX is not set
# CONFIG_MTD_PB1000 is not set
# CONFIG_MTD_PB1500 is not set
# CONFIG_MTD_OCELOT is not set
# CONFIG_MTD_PCI is not set

Here is my console dump :=20
=2E..
physmap flash device: 200000 at 10000000.
Number of erase regions: 1
Primary Vendor Command Set 0001 (Intel/Sharp Extended)
Primary lgorithm Table at 0031
Alternative Vndor Command Set: 0000 (None)
No Altrnate Algorithm Table
Vcc Minimum: 27 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 128 s
Maximum byte/word write timeout: 248 =B5s
Typical full buffer write timeut: 128 =B5s
Maximum full buffer writetimeout: 2048 =B5s
Typical block erasetimeout: 1024 =B5s
Maximum block erasetimeout: 16384 =B5s
Chip erase not supprted
Device size: 0x800000 bytes (8 iB)
Flash Device Interface descriptin: 0x0002
  - supports x8 and x16 vi BYTE# with asynchronous interface
Mx. bytes in buffer write: 0x20
Numberof Erase Block Regions: 1
  Erase Region #0: BlockSize 0x20000 bytes, 64 blocks
mtd: Giving out device 0 to Physically mapped flash
=2E..


Please help me.
Thanks
SP
