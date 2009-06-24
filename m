Received: from liberdade.minaslivre.org ([72.232.18.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJaBc-0002L9-Un
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 21:39:27 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Use 64-bit format when printing a debug message.
Date: Wed, 24 Jun 2009 18:39:09 -0300
Message-Id: <1245879549-10286-1-git-send-email-cascardo@holoscopio.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	ext-adrian.hunter@nokia.com,
	Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit 69423d99fc182a81f3c5db3eb5c140acc6fc64be has changed some
structure values to 64-bit and has not updated this debug message, since
it's not built by default.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---
 drivers/mtd/cmdlinepart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 5011fa7..1479da6 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -194,7 +194,7 @@ static struct mtd_partition * newpart(char *s,
 	parts[this_part].name = extra_mem;
 	extra_mem += name_len + 1;
 
-	dbg(("partition %d: name <%s>, offset %x, size %x, mask flags %x\n",
+	dbg(("partition %d: name <%s>, offset %llx, size %llx, mask flags %x\n",
 	     this_part,
 	     parts[this_part].name,
 	     parts[this_part].offset,
-- 
1.6.3
