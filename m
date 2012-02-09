Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvYWf-0005Lb-IX
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 18:15:22 +0000
Received: by dakp5 with SMTP id p5so1979490dak.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 10:15:20 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/3] mtdinfo: correct grammar on error message
Date: Thu,  9 Feb 2012 10:13:31 -0800
Message-Id: <1328811211-13653-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
References: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index d25595a..a9dc675 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -356,7 +356,7 @@ static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
 		if (err == -1) {
 			if (errno == ENODEV)
 				continue;
-			return sys_errmsg("libmtd failed get MTD device %d "
+			return sys_errmsg("libmtd failed to get MTD device %d "
 					  "information", i);
 		}
 
-- 
1.7.5.4
