Received: from mail-oi0-x262.google.com ([2607:f8b0:4003:c06::262])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGyt0-000893-N4
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 02:01:39 +0000
Received: by mail-oi0-x262.google.com with SMTP id a145so438540oii.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 18:01:17 -0800 (PST)
From: Jonathan Fether <jonf@mds.com>
To: linux-mtd@lists.infradead.org
Cc: Jonathan Fether <jonf@mds.com>
Subject: [PATCH] mtd-utils: Correct casting for final status report in flashcp
Date: Tue, 13 Dec 2016 18:00:28 -0800
Message-Id: <1481680828-10452-1-git-send-email-jonf@mds.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add correct casting for filestat.st_size in flashcp.c. While the
interim status updates had correct casting from commit 08b243, the
final update was not.

Signed-off-by: Jonathan Fether <jonf@mds.com>
---
 misc-utils/flashcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 6594a45..af3c88d 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -386,8 +386,8 @@ int main (int argc,char *argv[])
 	if (flags & FLAG_VERBOSE)
 		log_printf (LOG_NORMAL,
 				"\rVerifying data: %lluk/%lluk (100%%)\n",
-				KB (filestat.st_size),
-				KB (filestat.st_size));
+				KB ((unsigned long long)filestat.st_size),
+				KB ((unsigned long long)filestat.st_size));
 	DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
 
 	exit (EXIT_SUCCESS);
-- 
2.8.1.windows.1
