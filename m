Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3Wq-0008OU-4J
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:23:05 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/4] Add drivers/mtd/ubi/fastmap-wl.c to MAINTAINERS file
Date: Sun, 30 Nov 2014 13:22:35 +0100
Message-Id: <1417350157-9373-3-git-send-email-richard@nod.at>
In-Reply-To: <1417350157-9373-1-git-send-email-richard@nod.at>
References: <1417350157-9373-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea4d005..87d4d36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9631,6 +9631,7 @@ M:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 F:	drivers/mtd/ubi/fastmap.c
+F:	drivers/mtd/ubi/fastmap-wl.c
 
 USB ACM DRIVER
 M:	Oliver Neukum <oliver@neukum.org>
-- 
1.8.4.5
