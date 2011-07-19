Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlu-0004Sb-Ma
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:55 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 08/11] mtd: cleanup last uses of MTD_DEBUG config macros
Date: Tue, 19 Jul 2011 10:06:13 -0700
Message-ID: <1311095176-5407-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some messages that were tied to CONFIG_MTD_DEBUG_VERBOSE can now simply
be enabled using dynamic debugging features, if necessary. There's no
need for special debugging functions here.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/inftlmount.c     |  101 ++++++++++++++++++------------------------
 drivers/mtd/maps/pcmciamtd.c |    4 --
 2 files changed, 43 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index bd82b04..d19898c 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -139,24 +139,20 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		mh->FormatFlags = le32_to_cpu(mh->FormatFlags);
 		mh->PercentUsed = le32_to_cpu(mh->PercentUsed);
 
-#ifdef CONFIG_MTD_DEBUG_VERBOSE
-		if (CONFIG_MTD_DEBUG_VERBOSE >= 2) {
-			printk("INFTL: Media Header ->\n"
-				"    bootRecordID          = %s\n"
-				"    NoOfBootImageBlocks   = %d\n"
-				"    NoOfBinaryPartitions  = %d\n"
-				"    NoOfBDTLPartitions    = %d\n"
-				"    BlockMultiplerBits    = %d\n"
-				"    FormatFlgs            = %d\n"
-				"    OsakVersion           = 0x%x\n"
-				"    PercentUsed           = %d\n",
-				mh->bootRecordID, mh->NoOfBootImageBlocks,
-				mh->NoOfBinaryPartitions,
-				mh->NoOfBDTLPartitions,
-				mh->BlockMultiplierBits, mh->FormatFlags,
-				mh->OsakVersion, mh->PercentUsed);
-		}
-#endif
+		pr_debug("INFTL: Media Header ->\n"
+			 "    bootRecordID          = %s\n"
+			 "    NoOfBootImageBlocks   = %d\n"
+			 "    NoOfBinaryPartitions  = %d\n"
+			 "    NoOfBDTLPartitions    = %d\n"
+			 "    BlockMultiplerBits    = %d\n"
+			 "    FormatFlgs            = %d\n"
+			 "    OsakVersion           = 0x%x\n"
+			 "    PercentUsed           = %d\n",
+			 mh->bootRecordID, mh->NoOfBootImageBlocks,
+			 mh->NoOfBinaryPartitions,
+			 mh->NoOfBDTLPartitions,
+			 mh->BlockMultiplierBits, mh->FormatFlags,
+			 mh->OsakVersion, mh->PercentUsed);
 
 		if (mh->NoOfBDTLPartitions == 0) {
 			printk(KERN_WARNING "INFTL: Media Header sanity check "
@@ -200,19 +196,15 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			ip->spareUnits = le32_to_cpu(ip->spareUnits);
 			ip->Reserved0 = le32_to_cpu(ip->Reserved0);
 
-#ifdef CONFIG_MTD_DEBUG_VERBOSE
-			if (CONFIG_MTD_DEBUG_VERBOSE >= 2) {
-				printk("    PARTITION[%d] ->\n"
-					"        virtualUnits    = %d\n"
-					"        firstUnit       = %d\n"
-					"        lastUnit        = %d\n"
-					"        flags           = 0x%x\n"
-					"        spareUnits      = %d\n",
-					i, ip->virtualUnits, ip->firstUnit,
-					ip->lastUnit, ip->flags,
-					ip->spareUnits);
-			}
-#endif
+			pr_debug("    PARTITION[%d] ->\n"
+				 "        virtualUnits    = %d\n"
+				 "        firstUnit       = %d\n"
+				 "        lastUnit        = %d\n"
+				 "        flags           = 0x%x\n"
+				 "        spareUnits      = %d\n",
+				 i, ip->virtualUnits, ip->firstUnit,
+				 ip->lastUnit, ip->flags,
+				 ip->spareUnits);
 
 			if (ip->Reserved0 != ip->firstUnit) {
 				struct erase_info *instr = &inftl->instr;
@@ -475,30 +467,30 @@ void INFTL_dumptables(struct INFTLrecord *s)
 {
 	int i;
 
-	printk("-------------------------------------------"
+	pr_debug("-------------------------------------------"
 		"----------------------------------\n");
 
-	printk("VUtable[%d] ->", s->nb_blocks);
+	pr_debug("VUtable[%d] ->", s->nb_blocks);
 	for (i = 0; i < s->nb_blocks; i++) {
 		if ((i % 8) == 0)
-			printk("\n%04x: ", i);
-		printk("%04x ", s->VUtable[i]);
+			pr_debug("\n%04x: ", i);
+		pr_debug("%04x ", s->VUtable[i]);
 	}
 
-	printk("\n-------------------------------------------"
+	pr_debug("\n-------------------------------------------"
 		"----------------------------------\n");
 
-	printk("PUtable[%d-%d=%d] ->", s->firstEUN, s->lastEUN, s->nb_blocks);
+	pr_debug("PUtable[%d-%d=%d] ->", s->firstEUN, s->lastEUN, s->nb_blocks);
 	for (i = 0; i <= s->lastEUN; i++) {
 		if ((i % 8) == 0)
-			printk("\n%04x: ", i);
-		printk("%04x ", s->PUtable[i]);
+			pr_debug("\n%04x: ", i);
+		pr_debug("%04x ", s->PUtable[i]);
 	}
 
-	printk("\n-------------------------------------------"
+	pr_debug("\n-------------------------------------------"
 		"----------------------------------\n");
 
-	printk("INFTL ->\n"
+	pr_debug("INFTL ->\n"
 		"  EraseSize       = %d\n"
 		"  h/s/c           = %d/%d/%d\n"
 		"  numvunits       = %d\n"
@@ -512,7 +504,7 @@ void INFTL_dumptables(struct INFTLrecord *s)
 		s->numvunits, s->firstEUN, s->lastEUN, s->numfreeEUNs,
 		s->LastFreeEUN, s->nb_blocks, s->nb_boot_blocks);
 
-	printk("\n-------------------------------------------"
+	pr_debug("\n-------------------------------------------"
 		"----------------------------------\n");
 }
 
@@ -520,25 +512,25 @@ void INFTL_dumpVUchains(struct INFTLrecord *s)
 {
 	int logical, block, i;
 
-	printk("-------------------------------------------"
+	pr_debug("-------------------------------------------"
 		"----------------------------------\n");
 
-	printk("INFTL Virtual Unit Chains:\n");
+	pr_debug("INFTL Virtual Unit Chains:\n");
 	for (logical = 0; logical < s->nb_blocks; logical++) {
 		block = s->VUtable[logical];
 		if (block > s->nb_blocks)
 			continue;
-		printk("  LOGICAL %d --> %d ", logical, block);
+		pr_debug("  LOGICAL %d --> %d ", logical, block);
 		for (i = 0; i < s->nb_blocks; i++) {
 			if (s->PUtable[block] == BLOCK_NIL)
 				break;
 			block = s->PUtable[block];
-			printk("%d ", block);
+			pr_debug("%d ", block);
 		}
-		printk("\n");
+		pr_debug("\n");
 	}
 
-	printk("-------------------------------------------"
+	pr_debug("-------------------------------------------"
 		"----------------------------------\n");
 }
 
@@ -716,10 +708,7 @@ int INFTL_mount(struct INFTLrecord *s)
 		logical_block = BLOCK_NIL;
 	}
 
-#ifdef CONFIG_MTD_DEBUG_VERBOSE
-	if (CONFIG_MTD_DEBUG_VERBOSE >= 2)
-		INFTL_dumptables(s);
-#endif
+	INFTL_dumptables(s);
 
 	/*
 	 * Second pass, check for infinite loops in chains. These are
@@ -771,12 +760,8 @@ int INFTL_mount(struct INFTLrecord *s)
 		}
 	}
 
-#ifdef CONFIG_MTD_DEBUG_VERBOSE
-	if (CONFIG_MTD_DEBUG_VERBOSE >= 2)
-		INFTL_dumptables(s);
-	if (CONFIG_MTD_DEBUG_VERBOSE >= 2)
-		INFTL_dumpVUchains(s);
-#endif
+	INFTL_dumptables(s);
+	INFTL_dumpVUchains(s);
 
 	/*
 	 * Third pass, format unreferenced blocks and init free block count.
diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index afa9bd8..e8e9fec 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -321,7 +321,6 @@ static void pcmciamtd_release(struct pcmcia_device *link)
 }
 
 
-#ifdef CONFIG_MTD_DEBUG
 static int pcmciamtd_cistpl_format(struct pcmcia_device *p_dev,
 				tuple_t *tuple,
 				void *priv_data)
@@ -352,7 +351,6 @@ static int pcmciamtd_cistpl_jedec(struct pcmcia_device *p_dev,
 	}
 	return -ENOSPC;
 }
-#endif
 
 static int pcmciamtd_cistpl_device(struct pcmcia_device *p_dev,
 				tuple_t *tuple,
@@ -419,10 +417,8 @@ static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *p_dev
 		pr_debug("Found name: %s\n", dev->mtd_name);
 	}
 
-#ifdef CONFIG_MTD_DEBUG
 	pcmcia_loop_tuple(p_dev, CISTPL_FORMAT, pcmciamtd_cistpl_format, NULL);
 	pcmcia_loop_tuple(p_dev, CISTPL_JEDEC_C, pcmciamtd_cistpl_jedec, NULL);
-#endif
 	pcmcia_loop_tuple(p_dev, CISTPL_DEVICE, pcmciamtd_cistpl_device, dev);
 	pcmcia_loop_tuple(p_dev, CISTPL_DEVICE_GEO, pcmciamtd_cistpl_geo, dev);
 
-- 
1.7.0.4
