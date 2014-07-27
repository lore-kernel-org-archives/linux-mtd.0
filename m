Message-ID: <53D56FC9.8050909@infradead.org>
Date: Sun, 27 Jul 2014 14:31:53 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: fix linux/mtd/nand.h kernel-doc warning
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@infradead.org>

Fix kernel-doc warning in <linux/mtd/nand.h>:

Warning(..//include/linux/mtd/nand.h:795): No description found for parameter 'ecc'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc:	David Woodhouse <dwmw2@infradead.org>
Cc:	Brian Norris <computersforpeace@gmail.com>
Cc:	linux-mtd@lists.infradead.org
---
 include/linux/mtd/nand.h |    1 +
 1 file changed, 1 insertion(+)

Index: lnx-316-rc7/include/linux/mtd/nand.h
===================================================================
--- lnx-316-rc7.orig/include/linux/mtd/nand.h
+++ lnx-316-rc7/include/linux/mtd/nand.h
@@ -766,6 +766,7 @@ struct nand_chip {
  * @options: stores various chip bit options
  * @id_len: The valid length of the @id.
  * @oobsize: OOB size
+ * @ecc: ECC correctability and step information from the datasheet.
  * @ecc.strength_ds: The ECC correctability from the datasheet, same as the
  *                   @ecc_strength_ds in nand_chip{}.
  * @ecc.step_ds: The ECC step required by the @ecc.strength_ds, same as the
