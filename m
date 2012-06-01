Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb7-0001ih-9V
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/23] UBI: Fastmap: Use reserved_pebs
Date: Fri,  1 Jun 2012 17:16:36 +0200
Message-Id: <1338563804-85990-16-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The eba_tbl is reserved_pebs sized, not used_ebs.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index e2600cd..dad0251 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -993,10 +993,10 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 			vol->vol_type == UBI_STATIC_VOLUME);
 
 		feba = (struct ubi_fm_eba *)(fm_raw + fm_pos);
-		fm_pos += sizeof(*feba) + (sizeof(__be32) * vol->used_ebs);
+		fm_pos += sizeof(*feba) + (sizeof(__be32) * vol->reserved_pebs);
 		ubi_assert(fm_pos <= new_fm->size);
 
-		for (j = 0; j < vol->used_ebs; j++)
+		for (j = 0; j < vol->reserved_pebs; j++)
 			feba->pnum[j] = cpu_to_be32(vol->eba_tbl[j]);
 
 		feba->reserved_pebs = cpu_to_be32(j);
-- 
1.7.6.5
