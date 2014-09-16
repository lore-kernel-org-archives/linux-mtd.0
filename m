Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTkp9-0003Vs-Ec
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 04:57:08 +0000
Received: by mail-pa0-f50.google.com with SMTP id bj1so7976829pad.9
 for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2014 21:56:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: add l2-mtd.git, 'next' tree for MTD
Date: Mon, 15 Sep 2014 21:56:17 -0700
Message-Id: <1410843377-30159-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've been semi-officially queueing patches here for a while, and it's
in linux-next, so let's advertise it in MAINTAINERS.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 809ecd680d88..55a61f242991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5898,6 +5898,7 @@ L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 T:	git git://git.infradead.org/linux-mtd.git
+T:	git git://git.infradead.org/l2-mtd.git
 S:	Maintained
 F:	drivers/mtd/
 F:	include/linux/mtd/
-- 
1.9.1
