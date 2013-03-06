Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD9WU-0004Sh-RD
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 08:16:28 +0000
Message-ID: <1362557825.21850.11.camel@sauron>
Subject: Re: [PATCH 02/11] mtd: decommission the NAND museum
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 06 Mar 2013 10:17:05 +0200
In-Reply-To: <5136F0FA.5080905@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
 <1362489444-27762-3-git-send-email-dedekind1@gmail.com>
 <5136F0FA.5080905@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 4 Mar 2013 13:44:21 +0200
Subject: [PATCH 02/15] mtd: decommission the NAND museum

The MTD subsystem has its own small museum of ancient NANDs in a form of the
CONFIG_MTD_NAND_MUSEUM_IDS configuration option. The museum contains stone age
NANDs with 256 bytes pages, as well as iron age NANDs with 512 bytes per page
and up to 8MiB page size.

It is with great sorrow that I inform you that the museum is being
decommissioned. The MTD subsystem is out of budget for Kconfig options and
already has too many of them, and there is a general kernel trend to simplify
the configuration menu.

We remove the stone age exhibits along with closing the museum, but some of the
iron age ones are transferred to the regular NAND depot. Namely, only those
which have unique device IDs are transferred, and the ones which have
conflicting device IDs are removed.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---

This is version 2 of the patch where I also kill the conflicting old devices.

 drivers/mtd/nand/Kconfig    |    8 --------
 drivers/mtd/nand/nand_ids.c |   23 +++++------------------
 2 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 81bf5e5..0f443ef 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -41,14 +41,6 @@ config MTD_SM_COMMON
 	tristate
 	default n
 
-config MTD_NAND_MUSEUM_IDS
-	bool "Enable chip ids for obsolete ancient NAND devices"
-	default n
-	help
-	  Enable this option only when your board has first generation
-	  NAND chips (page size 256 byte, erase size 4-8KiB). The IDs
-	  of these chips were reused by later, larger chips.
-
 config MTD_NAND_DENALI
         tristate "Support Denali NAND controller"
         help
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index f1a799c..93af7ae 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -22,24 +22,11 @@
  * extended chip ID.
  */
 struct nand_flash_dev nand_flash_ids[] = {
-
-#ifdef CONFIG_MTD_NAND_MUSEUM_IDS
-	{"NAND 1MiB 5V 8-bit",		0x6e, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 5V 8-bit",		0x64, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 5V 8-bit",		0x6b, 512, 4, 0x2000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xe8, 256, 1, 0x1000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xec, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 3,3V 8-bit",	0xea, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xd5, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe3, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe5, 512, 4, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xd6, 512, 8, 0x2000, 0},
-
-	{"NAND 8MiB 1,8V 8-bit",	0x39, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xe6, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 1,8V 16-bit",	0x49, 512, 8, 0x2000, NAND_BUSWIDTH_16},
-	{"NAND 8MiB 3,3V 16-bit",	0x59, 512, 8, 0x2000, NAND_BUSWIDTH_16},
-#endif
+	{"NAND 4MiB 5V 8-bit",          0x6B, 512, 4, 0x2000, 0},
+	{"NAND 4MiB 3,3V 8-bit",        0xE3, 512, 4, 0x2000, 0},
+	{"NAND 4MiB 3,3V 8-bit",        0xE5, 512, 4, 0x2000, 0},
+	{"NAND 8MiB 3,3V 8-bit",        0xD6, 512, 8, 0x2000, 0},
+	{"NAND 8MiB 3,3V 8-bit",        0xE6, 512, 8, 0x2000, 0},
 
 	{"NAND 16MiB 1,8V 8-bit",	0x33, 512, 16, 0x4000, 0},
 	{"NAND 16MiB 3,3V 8-bit",	0x73, 512, 16, 0x4000, 0},
-- 
1.7.10.4
