Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgefy-0000fM-DL
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:41 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/22] UBI: Fastmap: Fix EC values
Date: Mon, 18 Jun 2012 18:18:56 +0200
Message-Id: <1340036345-96726-14-git-send-email-richard@nod.at>
In-Reply-To: <1340036345-96726-1-git-send-email-richard@nod.at>
References: <1340036345-96726-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, shmulik.ladkani@gmail.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return the correct EC values back to the WL sub-system.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    2 ++
 drivers/mtd/ubi/wl.c      |    4 +++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 33a14cf..b4f7fce 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -721,6 +721,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
 			if (aeb->pnum == tmp_aeb->pnum) {
 				aeb->scrub = tmp_aeb->scrub;
+				aeb->ec = tmp_aeb->ec;
 				list_del(&tmp_aeb->u.list);
 				kfree(tmp_aeb);
 				continue;
@@ -1345,6 +1346,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			ec = be64_to_cpu(ec_hdr->ec);
 			ec += ret;
+			old_fm->e[0]->ec = ec;
 			if (ec > UBI_MAX_ERASECOUNTER) {
 				ubi_err("erase counter overflow!");
 				kfree(ec_hdr);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 25d2e0b..eec3940 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -839,8 +839,10 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *fm_e,
 		e = fm_e;
 		ubi_assert(e->ec);
 		ubi->lookuptbl[pnum] = e;
-	} else
+	} else {
+		e->ec = fm_e->ec;
 		kfree(fm_e);
+	}
 
 	spin_unlock(&ubi->wl_lock);
 
-- 
1.7.6.5
