Received: from mail-dm3nam05on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe51::614]
 helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVtJT-0004Bh-JZ
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 06:43:40 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.com>, <honghui.zhang@mediatek.com>,
 <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>, <michals@xilinx.com>, Naga Sureshkumar
 Relli <naga.sureshkumar.relli@xilinx.com>
Subject: [[LINUX PATCH v10] 3/4] Documentation: nand: pl353: Add documentation
 for controller and driver
Date: Thu, 21 Jun 2018 12:12:30 +0530
Message-ID: <1529563351-2241-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

Added notes about the controller and driver.

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v10:
 - None
Changes in v9:
 - Addressed the comments given by Miquel and Randy
Changes in v8
 - None
Changes in v7:
- None
Changes in v6:
- None
Changes in v5:
- Fixed the review comments
Changes in v4:
- None
---
 Documentation/mtd/nand/pl353-nand.txt | 99 +++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/mtd/nand/pl353-nand.txt

diff --git a/Documentation/mtd/nand/pl353-nand.txt b/Documentation/mtd/nand/pl353-nand.txt
new file mode 100644
index 0000000..c352c87
--- /dev/null
+++ b/Documentation/mtd/nand/pl353-nand.txt
@@ -0,0 +1,99 @@
+This document provides some notes about the ARM pl353 SMC controller used in
+Zynq SOC and confined to NAND specific details.
+
+Overview of the controller
+==========================
+	The SMC (PL353) supports two memory interfaces:
+	Interface 0 type SRAM.
+	Interface 1 type NAND.
+	This configuration supports the following configurable options:
+	   . 32-bit or 64-bit AXI data width
+	   . 8-bit, 16-bit, or 32-bit memory data width for interface 0
+	   . 8-bit, or 16-bit memory data width for interface 1
+	   . 1-4 chip selects on each interface
+	   . SLC ECC block for interface 1
+
+For more information, refer the below link for TRM
+http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/DDI0380G_smc_pl350_series_r2p1_trm.pdf
+
+NAND memory accesses
+====================
+	. Two phase NAND accesses
+	. NAND command phase transfers
+	. NAND data phase transfers
+
+Two phase NAND accesses
+	The SMC defines two phases of commands when transferring data to or from
+NAND flash.
+
+Command phase
+	Commands and optional address information are written to the NAND flash.
+The command and address can be associated with either a data phase operation to
+write to or read from the array, or a status/ID register transfer.
+
+Data phase
+ Data is either written to or read from the NAND flash. This data can be either
+data transferred to or from the array, or status/ID register information.
+
+NAND AXI address setup
+       AXI address      Command phase      Data phase
+	[31:24]         Chip address       Chip address
+	[23]            NoOfAddCycles_2    Reserved
+	[22]            NoOfAddCycles_1    Reserved
+	[21]            NoOfAddCycles_0    ClearCS
+	[20]            End command valid  End command valid
+	[19]            0                  1
+	[18:11]         End command        End command
+	[10:3]          Start command      [10] ECC Last
+					   [9:3] Reserved
+	[2:0]           Reserved           Reserved
+
+ECC
+===
+    It operates on a number of 512 byte blocks of NAND memory and can be
+programmed to store the ECC codes after the data in memory. For writes,
+the ECC is written to the spare area of the page. For reads, the result of
+a block ECC check are made available to the device driver.
+
+------------------------------------------------------------------------
+|               n * 512 blocks                  | extra  | ecc    |     |
+|                                               | block  | codes  |     |
+------------------------------------------------------------------------
+
+The ECC calculation uses a simple Hamming code, using 1-bit correction 2-bit
+detection. It starts when a valid read or write command with a 512 byte aligned
+address is detected on the memory interface.
+
+Driver details
+==============
+	The NAND driver has dependency with the pl353_smc memory controller
+driver for initializing the NAND timing parameters, bus width, ECC modes,
+control and status information.
+
+Since the controller expects that the chip select bit would be cleared for the
+last data transfer i.e last 4 data bytes, the existing nand page
+read/write routines for soft ECC and ECC none modes will not work. So, in order
+to make this driver work, it always updates the ECC mode as HW ECC and
+implements the page read/write functions for supporting the SW ECC.
+i.e. There is a limitation in SMC controller, that we must set ECC LAST on
+last data phase access, to tell ECC block not to expect any data further.
+Ex:  When number of ECC STEPS are 4, then till 3 we will write to flash
+using SMC with HW ECC enabled. And for the last ECC STEP, we will subtract
+4bytes from page size, and will initiate a transfer. And the remaining 4 as
+one more transfer with ECC_LAST bit set in NAND data phase register to notify
+ECC block not to expect any more data. The last block should be align with end
+of 512 byte block. Because of this limitation, we are not using core routines.
+
+HW ECC mode:
+	Up to 2K page size is supported and beyond that it returns
+-ENOTSUPPORT error. If the flash has on-die ECC controller then the
+priority is given to the on-die ECC controller. Also the current
+implementation has support for up to 64 bytes of OOB data.
+
+SW ECC mode:
+	It supports all the page sizes. But since, Zynq SOC bootrom uses
+HW ECC for the devices that have page <= 2K. so, When the kernel is not
+aware of the ECC mode, it uses HW ECC by default.
+
+For devicetree binding information please refer to the below dt binding file
+Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt.
-- 
2.7.4
