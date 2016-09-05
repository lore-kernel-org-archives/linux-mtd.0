Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvT7-0008D9-2E
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:58 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 06/17] UBI: factorize destroy_av() and ubi_remove_av() code
Date: Mon,  5 Sep 2016 17:04:57 +0200
Message-Id: <1473087908-27862-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Those functions are pretty much doing the same thing, except
ubi_remove_av() is putting the aeb elements attached to the volume into
the ai->erase list and the destroy_av() is freeing them.

Rework destroy_av() to handle both cases.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 6d34cd7b0263..5692b4ce0d9c 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -722,6 +722,9 @@ struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 			      &created);
 }
 
+static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av,
+		       struct list_head *list);
+
 /**
  * ubi_remove_av - delete attaching information about a volume.
  * @ai: attaching information
@@ -729,19 +732,10 @@ struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
  */
 void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 {
-	struct rb_node *rb;
-	struct ubi_ainf_peb *aeb;
-
 	dbg_bld("remove attaching information about volume %d", av->vol_id);
 
-	while ((rb = rb_first(&av->root))) {
-		aeb = rb_entry(rb, struct ubi_ainf_peb, u.rb);
-		rb_erase(&aeb->u.rb, &av->root);
-		list_add_tail(&aeb->u.list, &ai->erase);
-	}
-
 	rb_erase(&av->rb, &ai->volumes);
-	kfree(av);
+	destroy_av(ai, av, &ai->erase);
 	ai->vols_found -= 1;
 }
 
@@ -1256,10 +1250,12 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
  * destroy_av - free volume attaching information.
  * @av: volume attaching information
  * @ai: attaching information
+ * @list: put the aeb elements in there if !NULL, otherwise free them
  *
  * This function destroys the volume attaching information.
  */
-static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
+static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av,
+		       struct list_head *list)
 {
 	struct ubi_ainf_peb *aeb;
 	struct rb_node *this = av->root.rb_node;
@@ -1279,7 +1275,10 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 					this->rb_right = NULL;
 			}
 
-			kmem_cache_free(ai->aeb_slab_cache, aeb);
+			if (list)
+				list_add_tail(&aeb->u.list, list);
+			else
+				kmem_cache_free(ai->aeb_slab_cache, aeb);
 		}
 	}
 	kfree(av);
@@ -1334,7 +1333,7 @@ static void destroy_ai(struct ubi_attach_info *ai)
 					rb->rb_right = NULL;
 			}
 
-			destroy_av(ai, av);
+			destroy_av(ai, av, NULL);
 		}
 	}
 
-- 
2.7.4
