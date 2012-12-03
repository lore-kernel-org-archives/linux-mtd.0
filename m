Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfc9O-0007qZ-Ib
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 19:58:00 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/2] ubi: Remove PEB from free tree in get_peb_for_wl()
Date: Mon,  3 Dec 2012 20:57:46 +0100
Message-Id: <1354564667-9549-2-git-send-email-richard@nod.at>
In-Reply-To: <1354564667-9549-1-git-send-email-richard@nod.at>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 zsadecki@itwatchdogs.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If UBI is built without fastmap, get_peb_for_wl() has to
remove the PEB manially from the free tree.
Otherwise the requested PEB lives in two trees.

Reported-by: Zach Sadecki <zsadecki@itwatchdogs.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index da7b449..1f9f5f7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -679,7 +679,13 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 #else
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 {
-	return find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+	struct ubi_wl_entry *e;
+
+	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+	self_check_in_wl_tree(ubi, e, &ubi->free);
+	rb_erase(&e->u.rb, &ubi->free);
+
+	return e;
 }
 
 int ubi_wl_get_peb(struct ubi_device *ubi)
-- 
1.8.0
