Received: from isilmar-3.linta.de ([188.40.101.200] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCVDN-0003rW-By
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 10:00:31 +0000
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: <linux-pcmcia@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] drivers/mtd/maps: Eliminate use after free
Date: Thu, 13 May 2010 11:59:58 +0200
Message-Id: <1273744801-26318-1-git-send-email-linux@dominikbrodowski.net>
In-Reply-To: <20100513095749.GA25909@comet.dominikbrodowski.net>
References: <20100513095749.GA25909@comet.dominikbrodowski.net>
Cc: Julia Lawall <julia@diku.dk>,
	Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

Moved the debugging message before the call to map_destroy, which frees its
argument.  The message is also slightly changed to reflect its new
position.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E,E2;
@@

del_mtd_device(E)
...
(
  E = E2
|
* E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/mtd/maps/pcmciamtd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 689d6a7..81159d7 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -692,8 +692,8 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 
 	if(dev->mtd_info) {
 		del_mtd_device(dev->mtd_info);
+		info("mtd%d: Removing", dev->mtd_info->index);
 		map_destroy(dev->mtd_info);
-		info("mtd%d: Removed", dev->mtd_info->index);
 	}
 
 	pcmciamtd_release(link);
-- 
1.6.3.3
