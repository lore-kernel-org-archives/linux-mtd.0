Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abTDj-0004kM-Nu
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 13:23:12 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, joe@perches.com, dedekind1@gmail.com,
 adrian.hunter@intel.com, Richard Weinberger <richard@nod.at>
Subject: [PATCH] MAINTAINERS: Update UBIFS entry
Date: Thu,  3 Mar 2016 14:22:14 +0100
Message-Id: <1457011334-20386-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...to represent the status quo.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index da3e4d8..585ba02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11161,12 +11161,13 @@ S:	Maintained
 F:	drivers/scsi/u14-34f.c
 
 UBI FILE SYSTEM (UBIFS)
+M:	Richard Weinberger <richard@nod.at>
 M:	Artem Bityutskiy <dedekind1@gmail.com>
 M:	Adrian Hunter <adrian.hunter@intel.com>
 L:	linux-mtd@lists.infradead.org
 T:	git git://git.infradead.org/ubifs-2.6.git
 W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
-S:	Maintained
+S:	Supported
 F:	Documentation/filesystems/ubifs.txt
 F:	fs/ubifs/
 
-- 
2.5.0
