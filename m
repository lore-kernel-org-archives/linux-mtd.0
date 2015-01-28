Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGQnp-0005UJ-HK
 for linux-mtd@lists.infradead.org; Wed, 28 Jan 2015 11:28:58 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] Add myself as UBI co-maintainer
Date: Wed, 28 Jan 2015 12:28:24 +0100
Message-Id: <1422444504-17217-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...and set the state to "Supported" as UBI is part
of my day job.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ebb056..6417fed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9891,20 +9891,15 @@ F:	drivers/scsi/ufs/
 
 UNSORTED BLOCK IMAGES (UBI)
 M:	Artem Bityutskiy <dedekind1@gmail.com>
+M:	Richard Weinberger <richard@nod.at>
 W:	http://www.linux-mtd.infradead.org/
 L:	linux-mtd@lists.infradead.org
 T:	git git://git.infradead.org/ubifs-2.6.git
-S:	Maintained
+S:	Supported
 F:	drivers/mtd/ubi/
 F:	include/linux/mtd/ubi.h
 F:	include/uapi/mtd/ubi-user.h
 
-UNSORTED BLOCK IMAGES (UBI) Fastmap
-M:	Richard Weinberger <richard@nod.at>
-L:	linux-mtd@lists.infradead.org
-S:	Maintained
-F:	drivers/mtd/ubi/fastmap.c
-
 USB ACM DRIVER
 M:	Oliver Neukum <oliver@neukum.org>
 L:	linux-usb@vger.kernel.org
-- 
2.2.2
