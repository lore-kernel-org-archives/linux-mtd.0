Received: from mailrelay110.isp.belgacom.be ([195.238.20.137])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2iv1-0001yO-Ei
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 16:32:01 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1 linux-next] mtd/ftl: use swap() in copy_erase_unit()
Date: Wed, 10 Jun 2015 18:31:06 +0200
Message-Id: <1433953867-23429-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use kernel.h macro definition.

Thanks to Julia Lawall for Coccinelle scripting support.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/ftl.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index dabf084..9fb3b0d 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -571,12 +571,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 
 
     /* Update the maps and usage stats*/
-    i = xfer->EraseCount;
-    xfer->EraseCount = eun->EraseCount;
-    eun->EraseCount = i;
-    i = xfer->Offset;
-    xfer->Offset = eun->Offset;
-    eun->Offset = i;
+    swap(xfer->EraseCount, eun->EraseCount);
+    swap(xfer->Offset, eun->Offset);
     part->FreeTotal -= eun->Free;
     part->FreeTotal += free;
     eun->Free = free;
-- 
2.4.2
