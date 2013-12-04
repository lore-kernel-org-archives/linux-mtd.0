Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoLtA-0004dC-Fn
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 23:29:53 +0000
Received: by mail-ie0-f180.google.com with SMTP id tp5so27470839ieb.39
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 15:29:32 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] MAINTAINERS: mtd: add Brian Norris for MTD maintenance
Date: Wed,  4 Dec 2013 15:28:45 -0800
Message-Id: <1386199726-28074-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1386199726-28074-1-git-send-email-computersforpeace@gmail.com>
References: <1386199726-28074-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While we're at it, change the git URL to remove the version legacy. It's
been a symlink to linux-mtd.git for a while now anyway.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8285ed4676b6..9a7f53bee1cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5546,10 +5546,11 @@ F:	mm/page_cgroup.c
 
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	David Woodhouse <dwmw2@infradead.org>
+M:	Brian Norris <computersforpeace@gmail.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://git.infradead.org/mtd-2.6.git
+T:	git git://git.infradead.org/linux-mtd.git
 S:	Maintained
 F:	drivers/mtd/
 F:	include/linux/mtd/
-- 
1.8.5
