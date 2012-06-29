Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkcuD-0006SJ-Fr
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:46 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/11] ubi: fastmap: Remove 'ubi' parameter of 'destroy_ai()'
Date: Fri, 29 Jun 2012 17:14:26 +0200
Message-Id: <1340982869-77042-9-git-send-email-richard@nod.at>
In-Reply-To: <1340982869-77042-1-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

The 'ubi' argument of 'destroy_ai' was added during fastmap development,
but it is no longer used.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index bc1e4bf..c30a0f6 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1164,10 +1164,9 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 
 /**
  * destroy_ai - destroy attaching information.
- * @ubi: UBI device object
  * @ai: attaching information
  */
-static void destroy_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
+static void destroy_ai(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
 	struct ubi_ainf_volume *av;
@@ -1300,7 +1299,7 @@ out_vidh:
 out_ech:
 	kfree(ech);
 out_ai:
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return err;
 }
 
@@ -1353,7 +1352,7 @@ out_vidh:
 out_ech:
 	kfree(ech);
 out_ai:
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return err;
 }
 static struct ubi_attach_info *alloc_ai(void)
@@ -1403,7 +1402,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		err = scan_fast(ubi, ai);
 		if (err > 0) {
 			if (err != UBI_NO_FASTMAP) {
-				destroy_ai(ubi, ai);
+				destroy_ai(ai);
 				ai = alloc_ai();
 				if (!ai)
 					return -ENOMEM;
@@ -1449,13 +1448,13 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		}
 
 		err = self_check_eba(ubi, ai, scan_ai);
-		destroy_ai(ubi, scan_ai);
+		destroy_ai(scan_ai);
 
 		if (err)
 			goto out_wl;
 	}
 
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return 0;
 
 out_wl:
@@ -1464,7 +1463,7 @@ out_vtbl:
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 out_ai:
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return err;
 }
 
-- 
1.7.6.5
