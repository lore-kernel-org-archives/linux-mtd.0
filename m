From: ahaas@airmail.net (Art Haas)
Date: Wed, 26 Feb 2003 15:04:03 -0600
Subject: [PATCH] C99 initializer for drivers/mtd/nand/spia.c
Message-ID: <20030226210403.GG8966@debian>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi.

Here is a small patch that converts the file to use C99 initializers. It
is against the current 2.5 BK.

Art Haas

===== drivers/mtd/nand/spia.c 1.4 vs edited =====
--- 1.4/drivers/mtd/nand/spia.c	Sat Mar  2 05:53:22 2002
+++ edited/drivers/mtd/nand/spia.c	Wed Feb 26 13:44:53 2003
@@ -66,12 +66,15 @@
  * Define partitions for flash device
  */
 const static struct mtd_partition partition_info[] = {
-	{ name: "SPIA flash partition 1",
-	  offset: 0,
-	  size: 2*1024*1024 },
-	{ name: "SPIA flash partition 2",
-	  offset: 2*1024*1024,
-	  size: 6*1024*1024 }
+	{
+		.name	= "SPIA flash partition 1",
+		.size	= 2*1024*1024
+	},
+	{
+		.name	= "SPIA flash partition 2",
+		.offset	= 2*1024*1024,
+		.size	= 6*1024*1024
+	}
 };
 #define NUM_PARTITIONS 2
 
-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
