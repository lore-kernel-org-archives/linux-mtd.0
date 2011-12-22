Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rdl4i-0002QZ-2D
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 16:01:00 +0000
From: Richard Weinberger <rw@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [RFC] ubi: Make vid_hdr non-static
Date: Thu, 22 Dec 2011 16:12:57 +0100
Message-Id: <1324566777-1918-1-git-send-email-rw@linutronix.de>
Cc: tglx@linutronix.de, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <rw@linutronix.de>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no reason to have vid_hdr static.

Signed-off-by: Richard Weinberger <rw@linutronix.de>
---
 drivers/mtd/ubi/vtbl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 9ad18da..890754c 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -306,7 +306,7 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_scan_info *si,
 		       int copy, void *vtbl)
 {
 	int err, tries = 0;
-	static struct ubi_vid_hdr *vid_hdr;
+	struct ubi_vid_hdr *vid_hdr;
 	struct ubi_scan_leb *new_seb;
 
 	ubi_msg("create volume table (copy #%d)", copy + 1);
-- 
1.7.7
