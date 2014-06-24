Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzL6x-0002cb-9S
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 07:25:48 +0000
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: fix correct rb_tree node comparison in add_vol
Date: Tue, 24 Jun 2014 09:25:18 +0200
Message-Id: <1403594718-20595-1-git-send-email-hs@denx.de>
Cc: Heiko Schocher <hs@denx.de>, Mike Snitzer <snitzer@redhat.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 604b592e6fd3c98f21435e1181ba7723ffc24715 ("UBI: fix rb_tree node comparison in add_map")

introduced problems with attaching ubi fastmap images,
created with older kernel.

As in ubi_find_av() from attach.c is
[...]
                if (vol_id > av->vol_id)
                        p = p->rb_left;
                else
                        p = p->rb_right;

sync this logic also in add_vol() with this.

With this patch attaching older ubi images works again.

Signed-off-by: Heiko Schocher <hs@denx.de>

---

Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: Wolfgang Denk <wd@denx.de>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index b04e7d0..72f39da 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -125,7 +125,7 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
 		parent = *p;
 		av = rb_entry(parent, struct ubi_ainf_volume, rb);
 
-		if (vol_id < av->vol_id)
+		if (vol_id > av->vol_id)
 			p = &(*p)->rb_left;
 		else
 			p = &(*p)->rb_right;
-- 
1.8.3.1
