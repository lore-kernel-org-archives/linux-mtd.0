Date: Tue, 21 Oct 2014 11:08:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: off by one in INFTL_dumpVUchains()
Message-ID: <20141021080637.GA28426@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ->PUtable[] array has "->nb_blocks" number of elemetns so this
comparison should be ">=" instead of ">".  Otherwise it could result in
a minor read beyond the end of an array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.  Not tested.

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 487e64f..1388c8d 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -518,7 +518,7 @@ void INFTL_dumpVUchains(struct INFTLrecord *s)
 	pr_debug("INFTL Virtual Unit Chains:\n");
 	for (logical = 0; logical < s->nb_blocks; logical++) {
 		block = s->VUtable[logical];
-		if (block > s->nb_blocks)
+		if (block >= s->nb_blocks)
 			continue;
 		pr_debug("  LOGICAL %d --> %d ", logical, block);
 		for (i = 0; i < s->nb_blocks; i++) {
