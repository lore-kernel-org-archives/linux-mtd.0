Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel26-000781-Qg
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:40 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/21] UBI: Fastmap: Prevent PEB leak
Date: Wed, 13 Jun 2012 12:42:04 +0200
Message-Id: <1339584138-69914-8-git-send-email-richard@nod.at>
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

Before writing the new fastmap we have to ensure that no
PEBs are in flight.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index c2a1c18..82a011d 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1366,6 +1366,14 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		kfree(old_fm);
 	}
 
+	/* Ensure that the PEBs of the old fastmap got erased and added to the
+	 * free list before we write the fastmap. Otherwise fastmp does not
+	 * see these PEBs and we leak them.
+	 * FIXME: Rewrite ubi_wl_flush() such that we can flush only the
+	 * erase work instead of all work.
+	 */
+	ubi_wl_flush(ubi);
+
 	ret = ubi_write_fastmap(ubi, new_fm);
 out_unlock:
 	mutex_unlock(&ubi->fm_mutex);
-- 
1.7.6.5
