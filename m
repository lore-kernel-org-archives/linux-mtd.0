Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgeft-0000e4-Kd
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/22] UBI: Fastmap: Fix build (a left over from the ai->fm
 removal)
Date: Mon, 18 Jun 2012 18:18:50 +0200
Message-Id: <1340036345-96726-8-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/wl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 369e07f..4d9384b 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1727,8 +1727,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 	dbg_wl("found %i PEBs", found_pebs);
 
-	if (ai->fm)
-		ubi_assert(ubi->peb_count == found_pebs + ai->fm->used_blocks);
+	if (ubi->fm)
+		ubi_assert(ubi->peb_count == found_pebs + ubi->fm->used_blocks);
 	else
 		ubi_assert(ubi->peb_count == found_pebs);
 
-- 
1.7.6.5
