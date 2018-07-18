Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffudd-0004bv-9Q
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 22:09:39 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: make subop helpers return unsigned values
Date: Thu, 19 Jul 2018 00:09:12 +0200
Message-Id: <20180718220912.7758-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A report from Colin Ian King pointed a CoverityScan issue where error
values on these helpers where not checked in the drivers. These
helpers can error out only in case of a software bug in driver code,
not because of a runtime/hardware error. Hence, let's WARN_ON() in this
case and return 0 which is harmless anyway.

Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v1:
=================
* At first I decided to continue returning negative errors and
  handling these cases in the drivers. Not sure this was the right thing
  to do as reported by Boris so now the core WARN_ON() on error (only
  due to some bug in a controller driver) and return an harmless
  value. The drivers are not touched anymore, hence this patch is alone
  now. 

 drivers/mtd/nand/raw/nand_base.c | 44 ++++++++++++++++++++--------------------
 include/linux/mtd/rawnand.h      | 16 +++++++--------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4fa5e20d9690..9bb76ddff4be 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2668,8 +2668,8 @@ static bool nand_subop_instr_is_valid(const struct nand_subop *subop,
 	return subop && instr_idx < subop->ninstrs;
 }
 
-static int nand_subop_get_start_off(const struct nand_subop *subop,
-				    unsigned int instr_idx)
+static unsigned int nand_subop_get_start_off(const struct nand_subop *subop,
+					     unsigned int instr_idx)
 {
 	if (instr_idx)
 		return 0;
@@ -2688,12 +2688,12 @@ static int nand_subop_get_start_off(const struct nand_subop *subop,
  *
  * Given an address instruction, returns the offset of the first cycle to issue.
  */
-int nand_subop_get_addr_start_off(const struct nand_subop *subop,
-				  unsigned int instr_idx)
+unsigned int nand_subop_get_addr_start_off(const struct nand_subop *subop,
+					   unsigned int instr_idx)
 {
-	if (!nand_subop_instr_is_valid(subop, instr_idx) ||
-	    subop->instrs[instr_idx].type != NAND_OP_ADDR_INSTR)
-		return -EINVAL;
+	if (WARN_ON(!nand_subop_instr_is_valid(subop, instr_idx) ||
+		    subop->instrs[instr_idx].type != NAND_OP_ADDR_INSTR))
+		return 0;
 
 	return nand_subop_get_start_off(subop, instr_idx);
 }
@@ -2710,14 +2710,14 @@ EXPORT_SYMBOL_GPL(nand_subop_get_addr_start_off);
  *
  * Given an address instruction, returns the number of address cycle to issue.
  */
-int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
-				unsigned int instr_idx)
+unsigned int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
+					 unsigned int instr_idx)
 {
 	int start_off, end_off;
 
-	if (!nand_subop_instr_is_valid(subop, instr_idx) ||
-	    subop->instrs[instr_idx].type != NAND_OP_ADDR_INSTR)
-		return -EINVAL;
+	if (WARN_ON(!nand_subop_instr_is_valid(subop, instr_idx) ||
+		    subop->instrs[instr_idx].type != NAND_OP_ADDR_INSTR))
+		return 0;
 
 	start_off = nand_subop_get_addr_start_off(subop, instr_idx);
 
@@ -2742,12 +2742,12 @@ EXPORT_SYMBOL_GPL(nand_subop_get_num_addr_cyc);
  *
  * Given a data instruction, returns the offset to start from.
  */
-int nand_subop_get_data_start_off(const struct nand_subop *subop,
-				  unsigned int instr_idx)
+unsigned int nand_subop_get_data_start_off(const struct nand_subop *subop,
+					   unsigned int instr_idx)
 {
-	if (!nand_subop_instr_is_valid(subop, instr_idx) ||
-	    !nand_instr_is_data(&subop->instrs[instr_idx]))
-		return -EINVAL;
+	if (WARN_ON(!nand_subop_instr_is_valid(subop, instr_idx) ||
+		    !nand_instr_is_data(&subop->instrs[instr_idx])))
+		return 0;
 
 	return nand_subop_get_start_off(subop, instr_idx);
 }
@@ -2764,14 +2764,14 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_start_off);
  *
  * Returns the length of the chunk of data to send/receive.
  */
-int nand_subop_get_data_len(const struct nand_subop *subop,
-			    unsigned int instr_idx)
+unsigned int nand_subop_get_data_len(const struct nand_subop *subop,
+				     unsigned int instr_idx)
 {
 	int start_off = 0, end_off;
 
-	if (!nand_subop_instr_is_valid(subop, instr_idx) ||
-	    !nand_instr_is_data(&subop->instrs[instr_idx]))
-		return -EINVAL;
+	if (WARN_ON(!nand_subop_instr_is_valid(subop, instr_idx) ||
+		    !nand_instr_is_data(&subop->instrs[instr_idx])))
+		return 0;
 
 	start_off = nand_subop_get_data_start_off(subop, instr_idx);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e383c7f32574..876a9dd47e74 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1007,14 +1007,14 @@ struct nand_subop {
 	unsigned int last_instr_end_off;
 };
 
-int nand_subop_get_addr_start_off(const struct nand_subop *subop,
-				  unsigned int op_id);
-int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
-				unsigned int op_id);
-int nand_subop_get_data_start_off(const struct nand_subop *subop,
-				  unsigned int op_id);
-int nand_subop_get_data_len(const struct nand_subop *subop,
-			    unsigned int op_id);
+unsigned int nand_subop_get_addr_start_off(const struct nand_subop *subop,
+					   unsigned int op_id);
+unsigned int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
+					 unsigned int op_id);
+unsigned int nand_subop_get_data_start_off(const struct nand_subop *subop,
+					   unsigned int op_id);
+unsigned int nand_subop_get_data_len(const struct nand_subop *subop,
+				     unsigned int op_id);
 
 /**
  * struct nand_op_parser_addr_constraints - Constraints for address instructions
-- 
2.14.1
