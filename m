Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKmNz-0007mt-NQ
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 11:52:32 +0000
Date: 30 Jul 2015 11:52:00 -0000
In-Reply-To: <CAOMqctSvTiDgbmjvkpF=GiJa6Zi8avaAqoRmvgJvYuhaDHuwPw@mail.gmail.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
 <20150730091730.1774291d@bbrezillon>
 <CAOMqctSvTiDgbmjvkpF=GiJa6Zi8avaAqoRmvgJvYuhaDHuwPw@mail.gmail.com>
Message-Id: <7db2069b03cd249eed3d76a74bd1bfc83f2290be.1438255877.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v2] mtd: nand: print full chip ID
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Hans de Goede <hdegoede@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Full chip ID is printed so user has data to paste from syslog in case
of chip misidentification.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>

---
v2:

 - remove superfluous hunk
 - join printed lines
---
 drivers/mtd/nand/nand_base.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..7c10e06 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3631,6 +3631,22 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
+ * Print full detail of chip ID read from chip.
+ */
+static void nand_print_chip_info(int maf_id, int dev_id, u8 id_data[8])
+{
+	u8 delim[8] = { [0 ... 7] = ',' };
+
+	/* Kernel inserts newline after every other printk so format in one go. */
+	delim[7] = ' ';
+	delim[nand_id_len(id_data, 8) - 1] = ';';
+	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x, ID data: 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c\n",
+		maf_id, dev_id,
+		id_data[0], delim[0], id_data[1], delim[1], id_data[2], delim[2], id_data[3], delim[3],
+		id_data[4], delim[4], id_data[5], delim[5], id_data[6], delim[6], id_data[7], delim[7]);
+}
+
+/*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
@@ -3743,8 +3759,7 @@ ident_done:
 		 * Check, if buswidth is correct. Hardware drivers should set
 		 * chip correct!
 		 */
-		pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
-			*maf_id, *dev_id);
+		nand_print_chip_info(*maf_id, *dev_id, id_data);
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
 		pr_warn("bus width %d instead %d bit\n",
 			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
@@ -3775,8 +3790,7 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
-	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
-		*maf_id, *dev_id);
+	nand_print_chip_info(*maf_id, *dev_id, id_data);
 
 	if (chip->onfi_version)
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
-- 
2.1.4
