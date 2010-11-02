Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDF0a-00083w-Pb
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 11:26:33 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: onenand: introduce not "real" commands for cache
	program feature.
Date: Tue,  2 Nov 2010 13:25:29 +0200
Message-Id: <1288697130-12772-3-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce not "real" commands for start/continue and stop the
cache program operation.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 include/linux/mtd/onenand_regs.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index cd6f3b4..ce61e9c 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -143,6 +143,8 @@
 /* NOTE: Those are not *REAL* commands */
 #define ONENAND_CMD_BUFFERRAM		(0x1978)
 #define FLEXONENAND_CMD_READ_PI		(0x1985)
+#define ONENAND_CMD_CACHE_PROG		(0x1986)
+#define ONENAND_CMD_CACHE_PROG_LAST	(0x1987)
 
 /*
  * System Configuration 1 Register F221h (R, R/W)
-- 
1.7.0.4
