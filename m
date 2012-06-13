Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel26-00077m-6Q
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/21] UBI: Fastmap: Ensure that new_fm->e[0]->ec is always set
Date: Wed, 13 Jun 2012 12:42:03 +0200
Message-Id: <1339584138-69914-7-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index a82a604..c2a1c18 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1310,7 +1310,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			}
 
 			new_fm->e[0]->pnum = old_fm->e[0]->pnum;
-			new_fm->e[0]->ec = old_fm->e[0]->ec;
 		} else {
 			/* we've got a new early PEB, return the old one */
 			ubi_wl_put_fm_peb(ubi, old_fm->e[0], 0);
@@ -1326,9 +1325,10 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			goto err;
 		}
-		new_fm->e[0]->ec = get_ec(ubi, new_fm->e[0]->pnum);
 	}
 
+	new_fm->e[0]->ec = get_ec(ubi, new_fm->e[0]->pnum);
+
 	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
 		ubi_err("fastmap too large");
 		ret = -ENOSPC;
-- 
1.7.6.5
