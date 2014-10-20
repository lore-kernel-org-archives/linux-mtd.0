From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>
Subject: [PATCH v4 1/4] mtd: nand: provide detailed description for raw
 read/write page methods
Date: Mon, 20 Oct 2014 10:46:14 +0200
Message-Id: <1413794777-32220-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1413794777-32220-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1413794777-32220-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mike Voytovich <mvoytovich@paypal.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roy Lee <roylee@paypal.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

read_page_raw and write_page_raw method description is not clear enough.
It clearly specifies that ECC correction should not be involved but does
not talk about specific layout (by layout I mean where in-band and
out-of-band data are stored on the NAND media) used by NAND/ECC
controllers.

Those specific layouts might impact MTD users and thus should be hidden (as
already done in the standard NAND_ECC_HW_SYNDROME implementation).

Clearly state this constraint in the nand_ecc_ctrl struct documentation.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/linux/mtd/nand.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e4d451e..b14d190 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -455,8 +455,21 @@ struct nand_hw_control {
  *		be provided if an hardware ECC is available
  * @calculate:	function for ECC calculation or readback from ECC hardware
  * @correct:	function for ECC correction, matching to ECC generator (sw/hw)
- * @read_page_raw:	function to read a raw page without ECC
- * @write_page_raw:	function to write a raw page without ECC
+ * @read_page_raw:	function to read a raw page without ECC. This function
+ *			should hide the specific layout used by the ECC
+ *			controller and always return contiguous in-band and
+ *			out-of-band data even if they're not stored
+ *			contiguously on the NAND chip (e.g.
+ *			NAND_ECC_HW_SYNDROME interleaves in-band and
+ *			out-of-band data).
+ * @write_page_raw:	function to write a raw page without ECC. This function
+ *			should hide the specific layout used by the ECC
+ *			controller and consider the passed data as contiguous
+ *			in-band and out-of-band data. ECC controller is
+ *			responsible for doing the appropriate transformations
+ *			to adapt to its specific layout (e.g.
+ *			NAND_ECC_HW_SYNDROME interleaves in-band and
+ *			out-of-band data).
  * @read_page:	function to read a page according to the ECC generator
  *		requirements; returns maximum number of bitflips corrected in
  *		any single ECC step, 0 if bitflips uncorrectable, -EIO hw error
-- 
1.9.1
