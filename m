Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHlqt-00067h-GG
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 00:56:04 +0000
Received: by obhx4 with SMTP id x4so650004obh.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2012 17:56:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Subject: [PATCH 04/11] lpddr: replace open-coded ARRAY_SIZE with macro
Date: Tue, 10 Apr 2012 18:55:56 -0600
Message-Id: <1334105756-9161-1-git-send-email-jim.cromie@gmail.com>
Cc: Jim Cromie <jim.cromie@gmail.com>, trivial@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/mtd/lpddr/qinfo_probe.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/lpddr/qinfo_probe.c b/drivers/mtd/lpddr/qinfo_probe.c
index dbfe17b..45abed6 100644
--- a/drivers/mtd/lpddr/qinfo_probe.c
+++ b/drivers/mtd/lpddr/qinfo_probe.c
@@ -57,7 +57,7 @@ static struct qinfo_query_info qinfo_array[] = {
 
 static long lpddr_get_qinforec_pos(struct map_info *map, char *id_str)
 {
-	int qinfo_lines = sizeof(qinfo_array)/sizeof(struct qinfo_query_info);
+	int qinfo_lines = ARRAY_SIZE(qinfo_array);
 	int i;
 	int bankwidth = map_bankwidth(map) * 8;
 	int major, minor;
-- 
1.7.8.1
