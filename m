Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmUg6-0008OR-Km
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 15:06:13 +0000
Date: Wed, 25 Mar 2009 16:05:51 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH 1/2] NAND: Add support for oob size 128
Message-ID: <20090325150551.GA4414@Chamillionaire.breakpoint.cc>
References: <20090325104836.325599143@denx.de>
	<20090325105020.607040279@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20090325105020.607040279@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, Ilya Yanok <yanok@emcraft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Wolfgang Grandegger | 2009-03-25 11:48:37 [+0100]:

>Signed-off-by: Ilya Yanok <yanok@emcraft.com>
>Acked-by: Wolfgang Grandegger <wg@grandegger.com>

You seem to forgot a few bits (subpage_sft & max page size). I had this
patch in my tree like for ever and forgot post it here. I did however
merge the mtd-utils bits allready :)

From: Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 12 Dec 2007 17:27:03 +0100
Subject: [PATCH] [MTD] Add support for 4k pages.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_base.c |   18 ++++++++++++++++++
 include/linux/mtd/nand.h     |    4 ++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0a9c9cd..c3266fd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -82,6 +82,20 @@ static struct nand_ecclayout nand_oob_64 = {
 		 .length = 38}}
 };
 
+static struct nand_ecclayout nand_oob_128 = {
+	.eccbytes = 48,
+	.eccpos = {
+		   80, 81, 82, 83, 84, 85, 86, 87,
+		   88, 89, 90, 91, 92, 93, 94, 95,
+		   96, 97, 98, 99, 100, 101, 102, 103,
+		   104, 105, 106, 107, 108, 109, 110, 111,
+		   112, 113, 114, 115, 116, 117, 118, 119,
+		   120, 121, 122, 123, 124, 125, 126, 127},
+	.oobfree = {
+		{.offset = 2,
+		 .length = 78}}
+};
+
 static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 			   int new_state);
 
@@ -2550,6 +2564,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		case 64:
 			chip->ecc.layout = &nand_oob_64;
 			break;
+		case 128:
+			chip->ecc.layout = &nand_oob_128;
+			break;
 		default:
 			printk(KERN_WARNING "No oob scheme defined for "
 			       "oobsize %d\n", mtd->oobsize);
@@ -2671,6 +2688,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			break;
 		case 4:
 		case 8:
+		case 16:
 			mtd->subpage_sft = 2;
 			break;
 		}
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 733d3f3..b90e683 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -43,8 +43,8 @@ extern void nand_wait_ready(struct mtd_info *mtd);
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	64
-#define NAND_MAX_PAGESIZE	2048
+#define NAND_MAX_OOBSIZE	128
+#define NAND_MAX_PAGESIZE	4096
 
 /*
  * Constants for hardware specific CLE/ALE/NCE function
-- 
1.6.0.6
