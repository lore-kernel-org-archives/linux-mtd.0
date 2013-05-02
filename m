Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXh8G-0006TN-1S
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 00:12:21 +0000
Received: by mail-pb0-f41.google.com with SMTP id mc17so29821pbc.0
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 17:11:57 -0700 (PDT)
From: Brian Pomerantz <bapper@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: fastmap break out of used PEB search
Date: Wed,  1 May 2013 17:10:44 -0700
Message-Id: <1367453444-12988-1-git-send-email-bapper@gmail.com>
In-Reply-To: <y>
References: <y>
Cc: Brian Pomerantz <bapper@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While searching for PEB matches for each volume in the used PEB list,
the search fails to stop when the PEB is found.  This patch adds
a break in the inner loop to stop the search when it is matched.

Signed-off-by: Brian Pomerantz <bapper@gmail.com>
---
 drivers/mtd/ubi/fastmap.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0648c69..1542751 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -727,8 +727,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 			aeb = NULL;
 			list_for_each_entry(tmp_aeb, &used, u.list) {
-				if (tmp_aeb->pnum == pnum)
+				if (tmp_aeb->pnum == pnum) {
 					aeb = tmp_aeb;
+					break;
+				}
 			}
 
 			/* This can happen if a PEB is already in an EBA known
-- 
1.7.0.1
