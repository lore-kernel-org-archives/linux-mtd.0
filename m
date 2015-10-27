Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqtV7-0004C7-Pa
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 01:56:38 +0000
Received: by pabla5 with SMTP id la5so12270223pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 18:56:17 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH] mtd: ofpart: drop undocumented, nonfunctional 'lock' property
Date: Mon, 26 Oct 2015 18:56:06 -0700
Message-Id: <1445910966-11415-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The 'lock' property of a partition does nothing, because it effectively
only sets the flags for the partition device, not the master device. And
no MTD driver checks for MTD_POWERUP_LOCK in the partition device, only
the master device.

Michal noticed that this flag was undocumented, but rather than document
a non-functioning DT property, let's just kill it, since obviously no
one cared about it.

Note that this logic does not apply to all MTD flags (e.g., the
"read-only" flags above the "lock" one), since certain flags *do* get
checked in the partition, at least in some cases (particularly, when
checking file permissions in mtdchar.c, but notably *not* in the core
APIs like mtd_write()).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/ofpart.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa26c32e1bc2..6bab6b5863e5 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -86,9 +86,6 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		if (of_get_property(pp, "read-only", &len))
 			(*pparts)[i].mask_flags |= MTD_WRITEABLE;
 
-		if (of_get_property(pp, "lock", &len))
-			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
-
 		i++;
 	}
 
-- 
2.6.0.rc2.230.g3dd15c0
