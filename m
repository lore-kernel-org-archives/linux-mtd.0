Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgefv-0000eU-5G
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/22] UBI: Fastmap: Fix PEB count assert
Date: Mon, 18 Jun 2012 18:18:52 +0200
Message-Id: <1340036345-96726-10-git-send-email-richard@nod.at>
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

Use also the bad PEB count value, otherwise the assert will fail
if the FLASH has bad blocks.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 4d9384b..58d74e4 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1728,9 +1728,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	dbg_wl("found %i PEBs", found_pebs);
 
 	if (ubi->fm)
-		ubi_assert(ubi->peb_count == found_pebs + ubi->fm->used_blocks);
+		ubi_assert(ubi->peb_count - ubi->bad_peb_count == \
+			   found_pebs + ubi->fm->used_blocks);
 	else
-		ubi_assert(ubi->peb_count == found_pebs);
+		ubi_assert(ubi->peb_count - ubi->bad_peb_count == found_pebs);
 
 	if (ubi->avail_pebs < WL_RESERVED_PEBS) {
 		ubi_err("no enough physical eraseblocks (%d, need %d)",
-- 
1.7.6.5
