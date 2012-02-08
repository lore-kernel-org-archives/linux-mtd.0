Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvF4H-0000LS-2I
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 21:28:45 +0000
Received: by dakp5 with SMTP id p5so1010948dak.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 13:28:44 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] libmtd_legacy: don't open device in R/W
Date: Wed,  8 Feb 2012 13:26:21 -0800
Message-Id: <1328736382-5798-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
References: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On legacy kernels with ROM devices, we can get mtdinfo errors like:

libmtd: error!: cannot open "/dev/mtd4"
        error 13 (Permission denied)
mtdinfo: error!: libmtd failed get MTD device 4 information
         error 13 (Permission denied)

We don't need O_RDRW access for informational ioctls(), so make this
O_RDONLY.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd_legacy.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index d3f1672..1ae9946 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -262,7 +262,7 @@ int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
 
 	mtd->mtd_num = mtd->minor / 2;
 
-	fd = open(node, O_RDWR);
+	fd = open(node, O_RDONLY);
 	if (fd == -1)
 		return sys_errmsg("cannot open \"%s\"", node);
 
-- 
1.7.5.4
