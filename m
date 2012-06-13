Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel29-00079W-Ek
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/21] UBI: Fastmap: Handle unused "used" PEBs better
Date: Wed, 13 Jun 2012 12:42:09 +0200
Message-Id: <1339584138-69914-13-git-send-email-richard@nod.at>
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

If fastmap detects that some PEBs in the used list are no longer
used it has to erase them.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 20b016e..1c2e906 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -712,6 +712,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	if (max_sqnum > ai->max_sqnum)
 		ai->max_sqnum = max_sqnum;
 
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
+		list_del(&tmp_aeb->u.list);
+		dbg_bld("adding PEB from used to erase list: %i", tmp_aeb->pnum);
+		add_aeb(ai, &ai->erase, tmp_aeb->pnum, tmp_aeb->ec, 0);
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+	}
+
 	return 0;
 
 fail_bad:
-- 
1.7.6.5
