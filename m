Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Opglg-0004mE-TO
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 12:13:50 +0000
Received: by ywi4 with SMTP id 4so1909364ywi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 05:13:47 -0700 (PDT)
Subject: [PATCH 1/2] UBI: eliminate update of list_for_each_entry loop cursor
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <1283083932.2131.36.camel@brekeke>
References: <1283083932.2131.36.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 15:13:42 +0300
Message-ID: <1283084022.2131.37.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

list_for_each_entry uses its first argument to move from one element to the
next, so modifying it can break the iteration.  The variable re1 is already
used within the loop as a temporary variable, and is not live here.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
iterator name list_for_each_entry;
expression x,E;
position p1,p2;
@@

list_for_each_entry@p1(x,...) { <... x =@p2 E ...> }

@@
expression x,E;
position r.p1,r.p2;
statement S;
@@

*x =@p2 E
...
list_for_each_entry@p1(x,...) S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 4dfa6b9..3d2d1a6 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -798,18 +798,18 @@ static int rename_volumes(struct ubi_device *ubi,
 			goto out_free;
 		}
 
-		re = kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
-		if (!re) {
+		re1 = kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
+		if (!re1) {
 			err = -ENOMEM;
 			ubi_close_volume(desc);
 			goto out_free;
 		}
 
-		re->remove = 1;
-		re->desc = desc;
-		list_add(&re->list, &rename_list);
+		re1->remove = 1;
+		re1->desc = desc;
+		list_add(&re1->list, &rename_list);
 		dbg_msg("will remove volume %d, name \"%s\"",
-			re->desc->vol->vol_id, re->desc->vol->name);
+			re1->desc->vol->vol_id, re1->desc->vol->name);
 	}
 
 	mutex_lock(&ubi->device_mutex);
-- 
1.7.2.2
