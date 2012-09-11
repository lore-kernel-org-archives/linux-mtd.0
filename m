Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBSrh-0006cG-CH
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 15:59:05 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: expand description of read_page method in comment
 header
Date: Tue, 11 Sep 2012 08:59:03 -0700
Message-Id: <1347379143-3607-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the absence of any formal documentation of the nand interface, I thought this
patch to the header file might be helpful.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 include/linux/mtd/nand.h |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8f99d36..8d18313 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -326,9 +326,10 @@ struct nand_hw_control {
  * @read_page_raw:	function to read a raw page without ECC
  * @write_page_raw:	function to write a raw page without ECC
  * @read_page:	function to read a page according to the ECC generator
- *		requirements.
+ *		requirements.  Returns maximum number of bitflips corrected in
+ *		any single ecc step, 0 if bitflips uncorrectible, -EIO hw error.
  * @read_subpage:	function to read parts of the page covered by ECC.
+ *			Returns same as read_page().
  * @write_page:	function to write a page according to the ECC generator
  *		requirements.
  * @write_oob_raw:	function to write chip OOB data without ECC
-- 
1.7.3.4
