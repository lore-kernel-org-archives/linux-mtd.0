Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f07lP-0003oH-PI
 for linux-mtd@lists.infradead.org; Sun, 25 Mar 2018 15:40:56 +0000
Received: by mail-pf0-x244.google.com with SMTP id l27so6560334pfk.12
 for <linux-mtd@lists.infradead.org>; Sun, 25 Mar 2018 08:40:43 -0700 (PDT)
Date: Sun, 25 Mar 2018 21:07:43 +0530
From: Arushi Singhal <arushisinghal19971997@gmail.com>
To: dwmw2@infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Use DIV_ROUND_UP()
Message-ID: <20180325153743.GA16063@seema-Inspiron-15-3567>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel.h macro DIV_ROUND_UP performs the computation
(((n) + (d) - 1) / (d)) but is perhaps more readable.

Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
---
 drivers/mtd/ftl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index a048429..61d5cf8 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -425,8 +425,8 @@ static int prepare_xfer(partition_t *part, int i)
     }
 
     /* Write the BAM stub */
-    nbam = (part->BlocksPerUnit * sizeof(uint32_t) +
-	    le32_to_cpu(part->header.BAMOffset) + SECTOR_SIZE - 1) / SECTOR_SIZE;
+    nbam = DIV_ROUND_UP(part->BlocksPerUnit * sizeof(uint32_t) +
+			le32_to_cpu(part->header.BAMOffset), SECTOR_SIZE);
 
     offset = xfer->Offset + le32_to_cpu(part->header.BAMOffset);
     ctl = cpu_to_le32(BLOCK_CONTROL);
-- 
2.7.4
