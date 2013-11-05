From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 28/28] mtd: nand: pxa3xx: Add documentation about the
 controller
Date: Tue,  5 Nov 2013 09:55:35 -0300
Message-Id: <1383656135-8627-29-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 linux-doc@vger.kernel.org, Daniel Mack <zonque@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Given there's no public specification to this date, and in order
to capture some important details and singularities about the
controller let's document them once and for good.

Cc: linux-doc@vger.kernel.org
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 Documentation/mtd/nand/pxa3xx-nand.txt | 101 +++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/mtd/nand/pxa3xx-nand.txt

diff --git a/Documentation/mtd/nand/pxa3xx-nand.txt b/Documentation/mtd/nand/pxa3xx-nand.txt
new file mode 100644
index 0000000..912f7c6
--- /dev/null
+++ b/Documentation/mtd/nand/pxa3xx-nand.txt
@@ -0,0 +1,101 @@
+
+About this document
+===================
+
+Some notes about Marvell's NAND controller available in PXA and Armada 370/XP
+SoC (aka NFCv1 and NFCv2), with an emphasis on the latter.
+
+NFCv2 controller background
+===========================
+
+The controller has a 2176 bytes FIFO buffer. Therefore, in order to support
+larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set of
+chunked transfers.
+
+For instance, if we choose a 2048 data chunk and set "BCH" ECC (see below)
+we'll have this layout in the pages:
+
+  ------------------------------------------------------------------------------
+  | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC | ... |
+  ------------------------------------------------------------------------------
+
+The driver reads the data and spare portions independently and builds an internal
+buffer with this layout (in the 4 KiB page case):
+
+  ------------------------------------------
+  |     4096B data     |     64B spare     |
+  ------------------------------------------
+
+Also, for the READOOB command the driver disables the ECC and reads a 'spare + ECC'
+OOB, one per chunk read.
+
+  -------------------------------------------------------------------
+  |     4096B data     |  32B spare | 30B ECC | 32B spare | 30B ECC |
+  -------------------------------------------------------------------
+
+So, in order to achieve reading (for instance), we issue several READ0 commands
+(with some additional controller-specific magic) and read two chunks of 2080B
+(2048 data + 32 spare) each.
+The driver accomodates this data to expose the NAND core a contiguous buffer
+(4096 data + spare) or (4096 + spare + ECC + spare + ECC).
+
+ECC
+===
+
+The controller has built-in hardware ECC capabilities. In addition it is
+configurable between two modes: 1) Hamming, 2) BCH.
+
+Note that the actual BCH mode: BCH-4 or BCH-8 will depend on the way
+the controller is configured to transfer the data.
+
+In the BCH mode the ECC code will be calculated for each transfered chunk
+and expected to be located (when reading/programming) right after the spare
+bytes as the figure above shows.
+
+So, repeating the above scheme, a 2048B data chunk will be followed by 32B
+spare, and then the ECC controller will read/write the ECC code (30B in
+this case):
+
+  ------------------------------------
+  | 2048B data | 32B spare | 30B ECC |
+  ------------------------------------
+
+If the ECC mode is 'BCH' then the ECC is *always* 30 bytes long.
+If the ECC mode is 'Hamming' the ECC is 6 bytes long, for each 512B block.
+So in Hamming mode, a 2048B page will have a 24B ECC.
+
+Despite all of the above, the controller requires the driver to only read or
+write in multiples of 8-bytes, because the data buffer is 64-bits.
+
+OOB
+===
+
+Because of the above scheme, and because the "spare" OOB is really located in
+the middle of a page, spare OOB cannot be read or write independently of the
+data area. In other words, in order to read the OOB (aka READOOB), the entire
+page (aka READ0) has to be read.
+
+In the same sense, in order to write to the spare OOB the driver has to write
+an *entire* page.
+
+Factory bad blocks handling
+===========================
+
+Given the ECC BCH requires to layout the device's pages in a splitted
+data/OOB/data/OOB way, the controller has a view of the flash page that's
+different from the specified (aka the manufacturer's) view. In other words,
+
+Factory view:
+
+  -----------------------------------------------
+  |                    Data           |x  OOB   |
+  -----------------------------------------------
+
+Driver's view:
+
+  -----------------------------------------------
+  |      Data      | OOB |      Data   x  | OOB |
+  -----------------------------------------------
+
+It can be seen from the above, that the factory bad block marker must be
+searched within the 'data' region, and not in the usual OOB region.
-- 
1.8.1.5
