Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROPeO-0000Sy-6w
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 08:06:21 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH v2 04/16] mtd/docg3: fix BCH registers
Date: Thu, 10 Nov 2011 09:05:30 +0100
Message-Id: <1320912342-30147-5-git-send-email-robert.jarzmik@free.fr>
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

BCH registers are contiguous, not on every byte. Fix the
register definitions.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index 0d407be..62af5aa 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -105,7 +105,7 @@
 #define DOC_ECCCONF1			0x1042
 #define DOC_ECCPRESET			0x1044
 #define DOC_HAMMINGPARITY		0x1046
-#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 1))
+#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 0))
 
 #define DOC_PROTECTION			0x1056
 #define DOC_DPS0_ADDRLOW		0x1060
-- 
1.7.5.4
