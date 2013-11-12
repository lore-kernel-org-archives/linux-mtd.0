Received: from jacques.telenet-ops.be ([195.130.132.50])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgJJk-00083z-Rk
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 19:08:05 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] mtd: ms02-nv: Remove superfluous name cast
Date: Tue, 12 Nov 2013 20:07:23 +0100
Message-Id: <1384283245-9419-11-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
References: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_info.name is "const char *"

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/ms02-nv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 182849d39c61..5c8b322ba904 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -205,7 +205,7 @@ static int __init ms02nv_init_one(ulong addr)
 	mtd->type = MTD_RAM;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->size = fixsize;
-	mtd->name = (char *)ms02nv_name;
+	mtd->name = ms02nv_name;
 	mtd->owner = THIS_MODULE;
 	mtd->_read = ms02nv_read;
 	mtd->_write = ms02nv_write;
-- 
1.7.9.5
