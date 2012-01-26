Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqJnv-0005yC-JT
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 07:31:32 +0000
Received: by pbdx9 with SMTP id x9so595101pbd.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2012 23:31:30 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] ubinfo: fix `--all' for non-consecutive device numbers
Date: Wed, 25 Jan 2012 23:31:50 -0800
Message-Id: <1327563110-23966-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1327563110-23966-1-git-send-email-computersforpeace@gmail.com>
References: <1327563110-23966-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we have assigned non-consecutive device numbers to our UBI devices,
then we run `ubinfo --all', we get errors once ubinfo tries to process the
devices in the "hole". For instance, suppose there are two UBI devices,
/dev/ubi0 and /dev/ubi10; then, ubinfo will fail trying to open /dev/ubi1
with:

  ubinfo: error!: cannot get information about UBI device 1
         error 2 (No such file or directory)

This patch adds a check to first see if device is present, then continue
to the next ID if it doesn't exist.

Reported-by: Brian Foster <brian.foster@maxim-ic.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/ubinfo.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
index 7aa4aa4..cb88f53 100644
--- a/ubi-utils/ubinfo.c
+++ b/ubi-utils/ubinfo.c
@@ -362,6 +362,8 @@ static int print_general_info(libubi_t libubi, int all)
 
 	for (i = ubi_info.lowest_dev_num;
 	     i <= ubi_info.highest_dev_num; i++) {
+		if (!ubi_dev_present(libubi, i))
+			continue;
 		if(!first)
 			printf("\n===================================\n\n");
 		first = 0;
-- 
1.7.5.4
