Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TSN9p-0001JB-O1
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2012 07:19:43 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so1746305daj.36
 for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2012 00:19:40 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH 4/9] mtd: nandsim: use random32_get_bytes
Date: Sun, 28 Oct 2012 16:19:01 +0900
Message-Id: <1351408746-8623-4-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This also removes unnecessary memset call which is immediately overwritten
with random bytes.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index a932c48..d074b4c 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1397,10 +1397,7 @@ int do_read_error(struct nandsim *ns, int num)
 	unsigned int page_no = ns->regs.row;
 
 	if (read_error(page_no)) {
-		int i;
-		memset(ns->buf.byte, 0xFF, num);
-		for (i = 0; i < num; ++i)
-			ns->buf.byte[i] = random32();
+		random32_get_bytes(ns->buf.byte, num);
 		NS_WARN("simulating read error in page %u\n", page_no);
 		return 1;
 	}
-- 
1.7.11.7
