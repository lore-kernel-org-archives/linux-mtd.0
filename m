Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPD5-0002Uy-Ev
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 13:59:07 +0000
Subject: NAND: Verify probe by retrying to checking the results match
Message-Id: <20080414135858.404403374@fluff.org.uk>
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-nand-doubleprobe.patch
Date: Mon, 14 Apr 2008 14:58:58 +0100
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With modern systems using bus-hold instead of bus pull-up, it can
often lead to erroneous reporting of NAND devices where there are
none. Do a double probe to ensure that the result we got the first
time is repeatable, and if it is not then return that there is no
chip there.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.24-quilt17/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.24-quilt17.orig/drivers/mtd/nand/nand_base.c	2008-03-18 10:07:07.000000000 +0000
+++ linux-2.6.24-quilt17/drivers/mtd/nand/nand_base.c	2008-04-14 14:49:06.000000000 +0100
@@ -2229,6 +2229,7 @@ static struct nand_flash_dev *nand_get_f
 {
 	struct nand_flash_dev *type = NULL;
 	int i, dev_id, maf_idx;
+	int tmp_id, tmp_manf;
 
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -2239,6 +2240,26 @@ static struct nand_flash_dev *nand_get_f
 	/* Read manufacturer and device IDs */
 	*maf_id = chip->read_byte(mtd);
 	dev_id = chip->read_byte(mtd);
+	
+	/* Try again to make sure, as some systems the bus-hold or other
+	 * interface concerns can cause random data which looks like a
+	 * possibly credible NAND flash to appear. If the two results do
+	 * not match, ignore the device completely.
+	 */
+
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+
+	/* Read manufacturer and device IDs */
+
+	tmp_manf = chip->read_byte(mtd);
+	tmp_id = chip->read_byte(mtd);
+
+	if (tmp_manf != *maf_id || tmp_id != dev_id) {
+		printk(KERN_INFO "%s: second ID read did not match "
+		       "%02x,%02x against %02x,%02x\n", __func__,
+		       *maf_id, dev_id, tmp_manf, tmp_id);
+		return ERR_PTR(-ENODEV);
+	}
 
 	/* Lookup the flash id */
 	for (i = 0; nand_flash_ids[i].name != NULL; i++) {

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
