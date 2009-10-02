Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mtime-0003jZ-J9
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 14:07:01 +0000
Date: Fri, 2 Oct 2009 16:06:52 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3]: mtdoops: Use panic_write if panic_on_oops is set
Message-ID: <20091002160652.5581c13c@marrow.netinsight.se>
In-Reply-To: <20091002160510.191ef5a4@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdoops will not store the oops if panic_on_oops is set. This patch
makes use of panic_write if panic_on_oops is set. mtdoops_inc_counter is
also not good to call on panics, since the call to mtd->read suspends
the panic (at least with my NAND flash), so defer that. There is also no
point in doing it since we cannot recover from the panic anyway.

panic_on_oops is not exported to modules, so make mtdoops in-kernel only

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/Kconfig   |    2 +-
 drivers/mtd/mtdoops.c |    8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index ecf90f5..6b39a8b 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -305,7 +305,7 @@ config SSFDC
 	  flash. You can mount it with FAT file system.
 
 config MTD_OOPS
-	tristate "Log panic/oops to an MTD buffer"
+	bool "Log panic/oops to an MTD buffer"
 	depends on MTD
 	help
 	  This enables panic and oops messages to be logged to a circular
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 244582c..cc2c187 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -215,7 +215,11 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
 			cxt->nextpage * cxt->page_size, retlen,	cxt->page_size, ret);
 
-	mtdoops_inc_counter(cxt);
+	/* Go to next page, but skip this if we are currently panicking.
+	 * We will not recover from that anyway, and the mtd->read call
+	 * causes the panic to suspend */
+	if (!in_interrupt() && !panic_on_oops)
+		mtdoops_inc_counter(cxt);
 }
 
 
@@ -340,7 +344,7 @@ static void mtdoops_console_sync(void)
 	cxt->ready = 0;
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	if (mtd->panic_write && in_interrupt())
+	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
 		/* Interrupt context, we're going to panic so try and log */
 		mtdoops_write(cxt, 1);
 	else
-- 
1.6.0.4
