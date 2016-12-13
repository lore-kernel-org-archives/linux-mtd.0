Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGwyt-0001rd-A5
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 23:59:36 +0000
Received: by mail-vk0-x22a.google.com with SMTP id w194so4553782vkw.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 15:59:14 -0800 (PST)
MIME-Version: 1.0
From: Jon Fether <jonf@mds.com>
Date: Tue, 13 Dec 2016 15:59:12 -0800
Message-ID: <CAGKNqbE+bWgfe60nh5LpjWcu8t5J66Fx7tpjw7FYrCqw_3Wu_Q@mail.gmail.com>
Subject: [PATCH] mtd: mtd-utils: Correct casting for final status report in
 flashcp
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
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
diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 6594a45..af3c88d 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -386,8 +386,8 @@ int main (int argc,char *argv[])
  if (flags & FLAG_VERBOSE)
  log_printf (LOG_NORMAL,
  "\rVerifying data: %lluk/%lluk (100%%)\n",
- KB (filestat.st_size),
- KB (filestat.st_size));
+ KB ((unsigned long long)filestat.st_size),
+ KB ((unsigned long long)filestat.st_size));
  DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long
long)filestat.st_size);

  exit (EXIT_SUCCESS);
--
2.8.1
