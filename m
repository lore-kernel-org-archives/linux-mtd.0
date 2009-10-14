Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1My466-0006fT-Md
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 13:41:03 +0000
Date: Wed, 14 Oct 2009 15:40:49 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v6 1/5]: mtdoops: avoid erasing already empty areas
Message-ID: <20091014154049.7ee27f14@marrow.netinsight.se>
In-Reply-To: <20091014153458.05e31db6@marrow.netinsight.se>
References: <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091014153458.05e31db6@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	Ingo Molnar <mingo@elte.hu>, David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After having scanned the entire mtdoops area, mtdoops will erase it if
there are no mtdoops headers in it. However, empty and already erased
areas (i.e., without mtdoops headers) will therefore also be erased at
each startup.

This patch counts the number of unclean pages (neither empty nor with
the mtdoops header) and only erases if no headers are found and the area
is still unclean.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/mtdoops.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 18c6c96..c785e1a 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -225,7 +225,7 @@ static void mtdoops_workfunc_write(struct work_struct *work)
 static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
-	int ret, page, maxpos = 0;
+	int ret, page, maxpos = 0, unclean_pages = 0;
 	u32 count[2], maxcount = 0xffffffff;
 	size_t retlen;
 
@@ -237,10 +237,13 @@ static void find_next_position(struct mtdoops_context *cxt)
 			continue;
 		}
 
-		if (count[1] != MTDOOPS_KERNMSG_MAGIC)
-			continue;
 		if (count[0] == 0xffffffff)
 			continue;
+		if (count[1] != MTDOOPS_KERNMSG_MAGIC) {
+			/* Page is neither clean nor empty */
+			unclean_pages++;
+			continue;
+		}
 		if (maxcount == 0xffffffff) {
 			maxcount = count[0];
 			maxpos = page;
@@ -259,7 +262,14 @@ static void find_next_position(struct mtdoops_context *cxt)
 	if (maxcount == 0xffffffff) {
 		cxt->nextpage = 0;
 		cxt->nextcount = 1;
-		schedule_work(&cxt->work_erase);
+		if (unclean_pages != 0) {
+			printk(KERN_INFO "mtdoops: cleaning area\n");
+			schedule_work(&cxt->work_erase);
+		} else {
+			printk(KERN_DEBUG "mtdoops: ready %d, %d (clean)\n",
+			       cxt->nextpage, cxt->nextcount);
+			cxt->ready = 1;
+		}
 		return;
 	}
 
-- 
1.6.0.4
