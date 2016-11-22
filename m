To: linux-mtd@lists.infradead.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mtd: fix nand.h kernel-doc warnings
Message-ID: <131b4b61-e800-2343-14d4-ab8e128126ea@infradead.org>
Date: Mon, 21 Nov 2016 18:32:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@infradead.org>

Fix kernel-doc warnings in <linux/mtd/nand.h>:

..//include/linux/mtd/nand.h:658: warning: No description found for parameter 'tCEH_min'
..//include/linux/mtd/nand.h:877: warning: No description found for parameter 'data_interface'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/linux/mtd/nand.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

I haven't been able to find tCEH_min in any NAND datasheets (yet).

--- lnx-49-rc6.orig/include/linux/mtd/nand.h
+++ lnx-49-rc6/include/linux/mtd/nand.h
@@ -589,7 +589,7 @@ struct nand_buffers {
  * @tALS_min: ALE setup time
  * @tAR_min: ALE to RE# delay
  * @tCEA_max: CE# access time
- * @tCEH_min:
+ * @tCEH_min: CE# XXX time
  * @tCH_min:  CE# hold time
  * @tCHZ_max: CE# high to output hi-Z
  * @tCLH_min: CLE hold time
@@ -771,6 +771,7 @@ nand_get_sdr_timings(const struct nand_d
  *			supported, 0 otherwise.
  * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
  *			supported, 0 otherwise.
+ * @data_interface:	[INTERN] NAND interface timing information
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
