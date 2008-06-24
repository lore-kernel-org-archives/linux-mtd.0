Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KB89Z-0006su-HS
	for linux-mtd@lists.infradead.org; Tue, 24 Jun 2008 13:01:46 +0000
Message-ID: <414312276.02836@cqu.edu.cn>
Subject: [MTD][NAND] nandsim: modify report wear information function
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 24 Jun 2008 21:01:06 +0800
Message-Id: <1214312466.3201.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

a smart wear information report function, which can print wear leveling
information more obviously and vividly.

--- a/nandsim.c	2008-06-14 08:47:29.000000000 +0800
+++ b/nandsim.c	2008-06-14 08:47:29.000000000 +0800
@@ -101,6 +101,7 @@
 static char *gravepages = NULL;
 static unsigned int rptwear = 0;
 static unsigned int overridesize = 0;
+static unsigned int pile_num = 10;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -123,6 +124,7 @@
 module_param(gravepages,     charp, 0400);
 module_param(rptwear,        uint, 0400);
 module_param(overridesize,   uint, 0400);
+module_param(pile_num,		uint,0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash
'read ID' command (manufacturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND
Flash 'read ID' command (chip ID)");
@@ -154,6 +156,7 @@
 MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size
overriding the ID bytes. "
 				 "The size is specified in erase blocks and as the exponent of a
power of two"
 				 " e.g. 5 means a size of 32 erase blocks");
+MODULE_PARM_DESC(pile_num,	"Length of the array deciles[] and
decile_max[], 10 is default");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -842,7 +845,9 @@
 static void update_wear(unsigned int erase_block_no)
 {
 	unsigned long wmin = -1, wmax = 0, avg;
-	unsigned long deciles[10], decile_max[10], tot = 0;
+	unsigned long *deciles = NULL, *decile_max = NULL;
+	unsigned long tot = 0, wear = 0;
+	unsigned long span;
 	unsigned int i;
 
 	if (!erase_block_wear)
@@ -857,25 +862,41 @@
 	if (rptwear_cnt < rptwear)
 		return;
 	rptwear_cnt = 0;
+	
+	deciles = (unsigned long *)kzalloc(sizeof(unsigned long)*pile_num,
GFP_KERNEL);
+	if (!deciles) {
+		NS_ERR("Too many items for deciles\n");
+		return ;
+	}	
+	decile_max = (unsigned long *)kmalloc(sizeof(unsigned long)*pile_num,
GFP_KERNEL);
+	if (!decile_max) {
+		NS_ERR("Too many items for decile_max\n");
+		kfree(deciles);
+		return;
+	}		
+	
 	/* Calc wear stats */
 	for (i = 0; i < wear_eb_count; ++i) {
-		unsigned long wear = erase_block_wear[i];
+		wear = erase_block_wear[i];
 		if (wear < wmin)
 			wmin = wear;
 		if (wear > wmax)
 			wmax = wear;
 		tot += wear;
 	}
-	for (i = 0; i < 9; ++i) {
-		deciles[i] = 0;
-		decile_max[i] = (wmax * (i + 1) + 5) / 10;
-	}
-	deciles[9] = 0;
-	decile_max[9] = wmax;
+	
+	span = wmax - wmin;
+	
+	for (i = 0; i < pile_num - 1; ++i) {
+		decile_max[i] = (span * (i + 1) + (pile_num >> 1)) / pile_num + wmin;
+	}
+	
+	decile_max[pile_num - 1] = wmax;
+	
 	for (i = 0; i < wear_eb_count; ++i) {
 		int d;
 		unsigned long wear = erase_block_wear[i];
-		for (d = 0; d < 10; ++d)
+		for (d = 0; d < pile_num; ++d)
 			if (wear <= decile_max[d]) {
 				deciles[d] += 1;
 				break;
@@ -883,22 +904,23 @@
 	}
 	avg = tot / wear_eb_count;
 	/* Output wear report */
-	NS_INFO("*** Wear Report ***\n");
+	NS_INFO("****** Wear Report ******\n");
 	NS_INFO("Total numbers of erases:  %lu\n", tot);
 	NS_INFO("Number of erase blocks:   %u\n", wear_eb_count);
 	NS_INFO("Average number of erases: %lu\n", avg);
 	NS_INFO("Maximum number of erases: %lu\n", wmax);
 	NS_INFO("Minimum number of erases: %lu\n", wmin);
-	for (i = 0; i < 10; ++i) {
-		unsigned long from = (i ? decile_max[i - 1] + 1 : 0);
+	NS_INFO("Number of ebs with erase counts:\n");
+	for (i = 0; i < pile_num; ++i) {
+		unsigned long from = (i ? decile_max[i - 1] + 1 : wmin);
 		if (from > decile_max[i])
 			continue;
-		NS_INFO("Number of ebs with erase counts from %lu to %lu : %lu\n",
-			from,
-			decile_max[i],
-			deciles[i]);
+		NS_INFO("from %lu to %lu : %lu\n",from,decile_max[i],deciles[i]);
 	}
 	NS_INFO("*** End of Wear Report ***\n");
+	
+	kfree(decile_max);
+	kfree(deciles);
 }
 
 /*
