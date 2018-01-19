Received: from mail-cys01nam02on0046.outbound.protection.outlook.com
 ([104.47.37.46] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecSOB-0003FA-74
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 08:51:10 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <han.xu@nxp.com>, <festevam@gmail.com>,
 <prabhakar.kushwaha@nxp.com>, <suresh.gupta@nxp.com>, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v4 0/2] mtd: fsl-quadspi: add support to create dynamic LUT
 entry
Date: Fri, 19 Jan 2018 14:20:42 +0530
Message-ID: <1516351844-9497-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

fsl-quadspi.c driver creates different LUT entries for various cmds like
read, write, erase, readid etc. These entries are created statically when
driver gets intiliazed.

To support various cmds e.g. different read cmds like SPINOR_OP_READ,
SPINOR_OP_READ_4B, SPINOR_OP_READ_FAST_4B, SPINOR_OP_READ_FAST,
SPINOR_OP_READ_1_1_2, SPINOR_OP_READ_1_2_2 etc driver needs to
have different LUT entries for different cmds.

FSL QUADSPI controller has 4 chip select and one can use different flashes
on all different chip select.
We analyzed that the flashes have different parameters for the same command
and this is true for NAND devices.
Also reg_protocol information, needed for read register, read any register
commands, read SFDP register, not available at time of spi_nor_scan.
As FSL QUADSPI controller has limitation in number of LUT entries, max 16,
thus require to have dynamic LUT creation support.

Thus to have support for different flash devices, this patch-set adds
support to create LUT entry in run-time based on the exact cmnd requested.
Information like cmnd opcode, protocol info, dummy bit info etc required
for creating LUT entries parsed from instance of passed 'struct spi_nor'.

Also fix initialize sequence of AHB read, move
fsl_qspi_init_ahb_read() in  fsl_qspi_nor_setup() function.

Tested with "S25FS512S" flash and have checked read, write, erase
functionality using mtd_debug utility.
For read have checked hwcaps as SNOR_HWCAPS_READ_FAST,
SNOR_HWCAPS_READ_1_2_2 and SNOR_HWCAPS_READ_1_4_4
i.e. read cmds SPINOR_OP_READ_FAST_4B [0x0c],
SPINOR_OP_READ_1_2_2_4B [0xbc] and SPINOR_OP_READ_1_4_4_4B [0xec]

Yogesh Gaur (2):
  mtd: fsl-quadspi: add support to create dynamic LUT entry
  mtd: fsl-quadspi: fix init AHB read in  fsl_qspi_nor_setup()

Changes for v4:
- Drop patch
'mtd: fsl-quadspi: update hwcaps read capabilities as READ_1_4_4', it
would be taken care in next-series.
- Added patch for 'fix initialize sequence of AHB read'.

Changes for v3:
- Add STOP instruction for prepared LUT and remove memset of 4 LUT reg.
- Update information in cover letter.

Changes for v2:
- Swap patch sequences in the series to solve git bissect issue.

 drivers/mtd/spi-nor/fsl-quadspi.c | 299 ++++++++++++++++++++------------------
 1 file changed, 155 insertions(+), 144 deletions(-)

-- 
1.9.1
