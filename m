Date: Wed, 29 Jan 2014 16:17:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Richard Weinberger <richard@nod.at>
Subject: [patch] UBI: fix some use after free bugs
Message-ID: <20140129131756.GC10678@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the kmem_cache_free() calls down a couple lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ead861307b3c..c5dad652614d 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -463,8 +463,8 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				}
 			}
 			if (found_orphan) {
-				kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 				list_del(&tmp_aeb->u.list);
+				kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 			}
 
 			new_aeb = kmem_cache_alloc(ai->aeb_slab_cache,
@@ -846,16 +846,16 @@ fail_bad:
 	ret = UBI_BAD_FASTMAP;
 fail:
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
-		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 		list_del(&tmp_aeb->u.list);
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
-		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 		list_del(&tmp_aeb->u.list);
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
-		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 		list_del(&tmp_aeb->u.list);
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
 
 	return ret;
