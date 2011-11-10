Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROPeF-0000Rk-OQ
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 08:06:12 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH v2 02/16] mtd/docg3: fix tracing of IO in writeb
Date: Thu, 10 Nov 2011 09:05:28 +0100
Message-Id: <1320912342-30147-3-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Writeb was incorrectly traced as a 16 bits write, instead of
a 8 bits write. Fix it by tracing the correct width.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 6f5233d..8942a75 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -82,7 +82,7 @@ static inline u16 doc_readw(struct docg3 *docg3, u16 reg)
 static inline void doc_writeb(struct docg3 *docg3, u8 val, u16 reg)
 {
 	writeb(val, docg3->base + reg);
-	trace_docg3_io(1, 16, reg, val);
+	trace_docg3_io(1, 8, reg, val);
 }
 
 static inline void doc_writew(struct docg3 *docg3, u16 val, u16 reg)
-- 
1.7.5.4
