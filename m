Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skcu9-0006Qv-Co
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/11] UBI: Fastmap: Amend self_check_eba()
Date: Fri, 29 Jun 2012 17:14:20 +0200
Message-Id: <1340982869-77042-3-git-send-email-richard@nod.at>
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

Don't BUG() on error and document return values.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |    5 ++++-
 drivers/mtd/ubi/eba.c    |    7 ++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index bd3a8f5..f1dfb63 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1333,8 +1333,11 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 			goto out_wl;
 		}
 
-		self_check_eba(ubi, ai, scan_ai);
+		err = self_check_eba(ubi, ai, scan_ai);
 		destroy_ai(ubi, scan_ai);
+
+		if (err)
+			goto out_wl;
 	}
 
 	destroy_ai(ubi, ai);
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 6d6e301..4fb80d0 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1223,7 +1223,9 @@ static void print_rsvd_warning(struct ubi_device *ubi,
  * @ai_fastmap: UBI attach info object created by fastmap
  * @ai_scan: UBI attach info object created by scanning
  *
- * TODO: what we do and what return.
+ * Returns < 0 in case of an internal error, 0 otherwise.
+ * If a bad EBA table entry was found it will be printed out and
+ * ubi_assert() triggers.
  */
 int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 		   struct ubi_attach_info *ai_scan)
@@ -1291,8 +1293,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 
 				ubi_err("LEB:%i:%i is PEB:%i instead of %i!",
 					vol->vol_id, i, fm_eba[i][j], scan_eba[i][j]);
-				/* TODO: no, please, return error instead */
-				BUG();
+				ubi_assert(0);
 			}
 		}
 	}
-- 
1.7.6.5
