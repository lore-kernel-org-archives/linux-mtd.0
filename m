Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZwb-00059D-TC
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:50:23 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 12/12] mtd: nand: free allocated memory
Date: Tue, 30 Aug 2011 18:45:47 -0700
Message-ID: <1314755147-17756-13-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a problem from:

  commit f2f4772692cf3f31eb73d46337c7f10bd031bc26
  mtd: nand: remove NAND_BBT_SCANBYTE1AND6 option

In reverting pieces of another commit, I accidentally removed a line
that shold have stayed. We should free up the memory we allocated upon
releasing our device.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
This should probably just be squashed in with the buggy commit (it
hasn't been brought upstream yet...)

 drivers/mtd/nand/nand_base.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index de2d1c4..c9767b5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3533,6 +3533,11 @@ void nand_release(struct mtd_info *mtd)
 	kfree(chip->bbt);
 	if (!(chip->options & NAND_OWN_BUFFERS))
 		kfree(chip->buffers);
+
+	/* Free bad block descriptor memory */
+	if (chip->badblock_pattern && chip->badblock_pattern->options
+			& NAND_BBT_DYNAMICSTRUCT)
+		kfree(chip->badblock_pattern);
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
-- 
1.7.5.4
