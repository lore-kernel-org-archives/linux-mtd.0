Received: from webhosting01.bon.m2soft.com ([195.38.20.32])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9FDU-00060z-Vi
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 10:51:21 +0000
Date: Fri, 22 Oct 2010 12:47:24 +0200
From: Nicolas Kaiser <nikai@nikai.net>
To: Joern Engel <joern@lazybastard.org>
Subject: [PATCH] block2mtd: dubious assignment
Message-ID: <20101022124724.59eba464@absol.kitzblitz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When block2mtd_erase fails, a duplicated assignment instantly
changes instr->state from MTD_ERASE_FAILED to MTD_ERASE_DONE.

It looks to me like this might not be intended, or is it?

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 drivers/mtd/devices/block2mtd.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 9365186..2cf0cc6 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -91,7 +91,6 @@ static int block2mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	} else
 		instr->state = MTD_ERASE_DONE;
 
-	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
 	return err;
 }
-- 
1.7.2.2
