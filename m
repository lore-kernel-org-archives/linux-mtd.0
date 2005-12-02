Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ei4JF-0001x2-VS
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 01:22:24 -0500
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IQU006UGXOX8H@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 15:22:09 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0IQU005U3XOX0Z@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 15:22:09 +0900 (KST)
Date: Fri, 02 Dec 2005 15:22:09 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0IQU005U4XOX0Z@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: [MTD] OneNAND: check correct manufacturer
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

There's a bug releated with checking manufacturer

It compares the index with manufacturer ID.

Regards,

Kyungmin Park


Index: drivers/mtd/onenand/onenand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/onenand/onenand_base.c,v
retrieving revision 1.8
diff -u -p -r1.8 onenand_base.c
--- drivers/mtd/onenand/onenand_base.c	29 Nov 2005 14:49:36 -0000	1.8
+++ drivers/mtd/onenand/onenand_base.c	2 Dec 2005 06:20:29 -0000
@@ -1346,7 +1346,6 @@ static void onenand_print_device_info(in
 
 static const struct onenand_manufacturers onenand_manuf_ids[] = {
         {ONENAND_MFR_SAMSUNG, "Samsung"},
-        {ONENAND_MFR_UNKNOWN, "Unknown"}
 };
 
 /**
@@ -1357,17 +1356,22 @@ static const struct onenand_manufacturer
  */
 static int onenand_check_maf(int manuf)
 {
+	int size = ARRAY_SIZE(onenand_manuf_ids);
+	char *name;
         int i;
 
-        for (i = 0; onenand_manuf_ids[i].id; i++) {
+        for (i = 0; i < size; i++)
                 if (manuf == onenand_manuf_ids[i].id)
                         break;
-        }
 
-        printk(KERN_DEBUG "OneNAND Manufacturer: %s (0x%0x)\n",
-                onenand_manuf_ids[i].name, manuf);
+	if (i < size)
+		name = onenand_manuf_ids[i].name;
+	else
+		name = "Unknown";
+
+        printk(KERN_DEBUG "OneNAND Manufacturer: %s (0x%0x)\n", name,
manuf);
 
-        return (i != ONENAND_MFR_UNKNOWN);
+        return (i == size);
 }
 
 /**
Index: include/linux/mtd/onenand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/onenand.h,v
retrieving revision 1.8
diff -u -p -r1.8 onenand.h
--- include/linux/mtd/onenand.h	7 Nov 2005 11:14:55 -0000	1.8
+++ include/linux/mtd/onenand.h	2 Dec 2005 06:20:30 -0000
@@ -140,7 +140,6 @@ struct onenand_chip {
  * OneNAND Flash Manufacturer ID Codes
  */
 #define ONENAND_MFR_SAMSUNG	0xec
-#define ONENAND_MFR_UNKNOWN	0x00
 
 /**
  * struct nand_manufacturers - NAND Flash Manufacturer ID Structure
