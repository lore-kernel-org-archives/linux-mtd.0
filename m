Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Th4Cg-0000fq-MK
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2012 20:07:23 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: nand/docg4: add support for writing in reliable mode
Date: Fri,  7 Dec 2012 12:07:21 -0800
Message-Id: <1354910843-5598-2-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The controller on the docg4 has a "reliable" mode, where consecutive 2k pages
are used in parallel.  The initial program loader (IPL) on my Treo 680 expects
the secondary program loader (SPL) to be written in this mode.  This patch adds
support for writing data in reliable mode, by way of a module parameter.
Support for reading in this mode (as the IPL does) is not supported yet, but
alternate (even-numbered) 2k pages written in reliable mode can be read normally
(odd-numbered pages will contain junk and generate ecc errors).

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

u-boot now runs on my Treo at power-up.  Yay!

 drivers/mtd/nand/docg4.c |   39 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 799da5d..54b1e5e 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -46,6 +46,25 @@
 #include <linux/bitrev.h>
 
 /*
+ * In "reliable mode" consecutive 2k pages are used in parallel (in some
+ * fashion) to store the same data.  The data can be read back from the
+ * even-numbered pages in the normal manner; odd-numbered pages will appear to
+ * contain junk.  Systems that boot from the docg4 typically write the secondary
+ * program loader (SPL) code in this mode.  The SPL is loaded by the initial
+ * program loader (IPL, stored in the docg4's 2k NOR-like region that is mapped
+ * to the reset vector address).  This module parameter enables you to use this
+ * driver to write the SPL.  When in this mode, no more than 2k of data can be
+ * written at a time, because the addresses do not increment in the normal
+ * manner, and the starting offset must be within an even-numbered 2k region;
+ * i.e., invalid starting offsets are 0x800, 0xa00, 0xc00, 0xe00, 0x1800,
+ * 0x1a00, ...  Reliable mode is a special case and should not be used unless
+ * you know what you're doing.
+ */
+static bool reliable_mode;
+module_param(reliable_mode, bool, 0);
+MODULE_PARM_DESC(reliable_mode, "pages are programmed in reliable mode");
+
+/*
  * You'll want to ignore badblocks if you're reading a partition that contains
  * data written by the TrueFFS library (i.e., by PalmOS, Windows, etc), since
  * it does not use mtd nand's method for marking bad blocks (using oob area).
@@ -113,6 +132,7 @@ struct docg4_priv {
 #define DOCG4_SEQ_PAGEWRITE		0x16
 #define DOCG4_SEQ_PAGEPROG		0x1e
 #define DOCG4_SEQ_BLOCKERASE		0x24
+#define DOCG4_SEQ_SETMODE		0x45
 
 /* DOC_FLASHCOMMAND register commands */
 #define DOCG4_CMD_PAGE_READ             0x00
@@ -122,6 +142,8 @@ struct docg4_priv {
 #define DOC_CMD_PROG_BLOCK_ADDR		0x60
 #define DOCG4_CMD_PAGEWRITE		0x80
 #define DOC_CMD_PROG_CYCLE2		0x10
+#define DOCG4_CMD_FAST_MODE		0xa3 /* functionality guessed */
+#define DOC_CMD_RELIABLE_MODE		0x22
 #define DOC_CMD_RESET			0xff
 
 /* DOC_POWERMODE register bits */
@@ -611,6 +633,14 @@ static void write_page_prologue(struct mtd_info *mtd, uint32_t docg4_addr)
 	dev_dbg(doc->dev,
 	      "docg4: %s: g4 addr: %x\n", __func__, docg4_addr);
 	sequence_reset(mtd);
+
+	if (unlikely(reliable_mode)) {
+		writew(DOCG4_SEQ_SETMODE, docptr + DOC_FLASHSEQUENCE);
+		writew(DOCG4_CMD_FAST_MODE, docptr + DOC_FLASHCOMMAND);
+		writew(DOC_CMD_RELIABLE_MODE, docptr + DOC_FLASHCOMMAND);
+		write_nop(docptr);
+	}
+
 	writew(DOCG4_SEQ_PAGEWRITE, docptr + DOC_FLASHSEQUENCE);
 	writew(DOCG4_CMD_PAGEWRITE, docptr + DOC_FLASHCOMMAND);
 	write_nop(docptr);
@@ -691,6 +721,15 @@ static void docg4_command(struct mtd_info *mtd, unsigned command, int column,
 		break;
 
 	case NAND_CMD_SEQIN:
+		if (unlikely(reliable_mode)) {
+			uint16_t g4_page = g4_addr >> 16;
+
+			/* writes to odd-numbered 2k pages are invalid */
+			if (g4_page & 0x01)
+				dev_warn(doc->dev,
+					 "invalid reliable mode address\n");
+		}
+
 		write_page_prologue(mtd, g4_addr);
 
 		/* hack for deferred write of oob bytes */
-- 
1.7.8.6
