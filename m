Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgefn-0000cj-3t
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:29 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/22] UBI: Fastmap: Fix NULL pointer bug
Date: Mon, 18 Jun 2012 18:18:45 +0200
Message-Id: <1340036345-96726-3-git-send-email-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 8b033e5..5bbf1e3 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1290,11 +1290,14 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				goto err;
 			}
 
-			tmp_e->pnum = old_fm->e[0]->pnum;
-			tmp_e->ec = old_fm->e[0]->ec;
+			new_fm->e[0]->pnum = old_fm->e[0]->pnum;
+			new_fm->e[0]->ec = old_fm->e[0]->ec;
 		} else {
 			/* we've got a new early PEB, return the old one */
 			ubi_wl_put_fm_peb(ubi, old_fm->e[0], 0);
+
+			new_fm->e[0]->pnum = tmp_e->pnum;
+			new_fm->e[0]->ec = tmp_e->ec;
 		}
 
 		/* return all other fastmap block to the wl system */
@@ -1307,10 +1310,10 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			goto err;
 		}
-	}
 
-	new_fm->e[0]->pnum = tmp_e->pnum;
-	new_fm->e[0]->ec = tmp_e->ec;
+		new_fm->e[0]->pnum = tmp_e->pnum;
+		new_fm->e[0]->ec = tmp_e->ec;
+	}
 
 	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
 		ubi_err("fastmap too large");
-- 
1.7.6.5
