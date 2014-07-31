Received: from mx02.posteo.de ([89.146.194.165] helo=posteo.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCrPl-0006vq-OH
 for linux-mtd@lists.infradead.org; Thu, 31 Jul 2014 14:33:06 +0000
From: Martin Kepplinger <martink@posteo.de>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: use NULL instead of 0 for an address
Date: Thu, 31 Jul 2014 16:31:16 +0200
Message-Id: <1406817076-1072-1-git-send-email-martink@posteo.de>
Cc: Martin Kepplinger <martink@posteo.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use NULL instead of 0 when returning an address. This fixes a
sparse warning.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
Sorry if this is only noise, I stumbled upon it and why not send it.
applies to next-20140731

 drivers/mtd/maps/pcmciamtd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index a3cfad3..af747af 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -89,7 +89,7 @@ static caddr_t remap_window(struct map_info *map, unsigned long to)
 
 	if (!pcmcia_dev_present(dev->p_dev)) {
 		pr_debug("device removed\n");
-		return 0;
+		return NULL;
 	}
 
 	offset = to & ~(dev->win_size-1);
-- 
1.7.10.4
