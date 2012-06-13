Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel24-00076z-Qp
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:38 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/21] UBI: Fastmap: Check for duplicated PEBs in add_aeb()
Date: Wed, 13 Jun 2012 12:42:01 +0200
Message-Id: <1339584138-69914-5-git-send-email-richard@nod.at>
In-Reply-To: <1339584138-69914-1-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index d446fc3..97d694f 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -53,6 +53,10 @@ static int add_aeb(struct ubi_attach_info *ai, struct list_head *list,
 {
 	struct ubi_ainf_peb *aeb;
 
+	list_for_each_entry(aeb, list, u.list)
+		if (aeb->pnum == pnum)
+			return 0;
+
 	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
-- 
1.7.6.5
