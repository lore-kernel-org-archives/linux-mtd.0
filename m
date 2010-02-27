Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NlPz2-0000dU-FJ
	for linux-mtd@lists.infradead.org; Sat, 27 Feb 2010 16:57:45 +0000
Received: by bwz10 with SMTP id 10so803273bwz.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 27 Feb 2010 08:57:39 -0800 (PST)
Sender: Andrea Gelmini <andrea.gelmini@gmail.com>
From: Andrea Gelmini <andrea.gelmini@gelma.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 56/66] include/linux/mtd/mtdram.h: Checkpatch cleanup
Date: Sat, 27 Feb 2010 17:51:37 +0100
Message-Id: <1267289508-31031-57-git-send-email-andrea.gelmini@gelma.net>
In-Reply-To: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Cc: linux-mtd@lists.infradead.org, Andrea Gelmini <andrea.gelmini@gelma.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

include/linux/mtd/mtdram.h:6: ERROR: code indent should use tabs where possible

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 include/linux/mtd/mtdram.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/mtdram.h b/include/linux/mtd/mtdram.h
index 04fdc07..6889131 100644
--- a/include/linux/mtd/mtdram.h
+++ b/include/linux/mtd/mtdram.h
@@ -3,6 +3,6 @@
 
 #include <linux/mtd/mtd.h>
 int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
-                       unsigned long size, char *name);
+			unsigned long size, char *name);
 
 #endif /* __MTD_MTDRAM_H__ */
-- 
1.7.0.90.g251a4
