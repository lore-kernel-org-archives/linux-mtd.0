Received: from smtp6-g21.free.fr ([212.27.42.6])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJqbf-0006zQ-1o
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 17:52:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH 03/13] mtd/docg3: fix protection areas reading
Date: Fri, 28 Oct 2011 19:51:22 +0200
Message-Id: <1319824292-11085-4-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
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

The protection areas boundaries were on 16bit registers, not
8bit. This is consistent with block numbers, which can
extend up to 4096 on bigger chips (and is 2048 on the
docg3).

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 8942a75..5834e6e 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -852,13 +852,15 @@ static int dbg_protection_show(struct seq_file *s, void *p)
 {
 	struct docg3 *docg3 = (struct docg3 *)s->private;
 	int pos = 0;
-	int protect = doc_register_readb(docg3, DOC_PROTECTION);
-	int dps0 = doc_register_readb(docg3, DOC_DPS0_STATUS);
-	int dps0_low = doc_register_readb(docg3, DOC_DPS0_ADDRLOW);
-	int dps0_high = doc_register_readb(docg3, DOC_DPS0_ADDRHIGH);
-	int dps1 = doc_register_readb(docg3, DOC_DPS1_STATUS);
-	int dps1_low = doc_register_readb(docg3, DOC_DPS1_ADDRLOW);
-	int dps1_high = doc_register_readb(docg3, DOC_DPS1_ADDRHIGH);
+	int protect, dps0, dps0_low, dps0_high, dps1, dps1_low, dps1_high;
+
+	protect = doc_register_readb(docg3, DOC_PROTECTION);
+	dps0 = doc_register_readb(docg3, DOC_DPS0_STATUS);
+	dps0_low = doc_register_readw(docg3, DOC_DPS0_ADDRLOW);
+	dps0_high = doc_register_readw(docg3, DOC_DPS0_ADDRHIGH);
+	dps1 = doc_register_readb(docg3, DOC_DPS1_STATUS);
+	dps1_low = doc_register_readw(docg3, DOC_DPS1_ADDRLOW);
+	dps1_high = doc_register_readw(docg3, DOC_DPS1_ADDRHIGH);
 
 	pos += seq_printf(s, "Protection = 0x%02x (",
 			 protect);
-- 
1.7.5.4
