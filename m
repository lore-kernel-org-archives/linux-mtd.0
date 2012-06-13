Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel27-00078L-9p
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:40 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/21] UBI: Fastmap: Remove useless code
Date: Wed, 13 Jun 2012 12:42:00 +0200
Message-Id: <1339584138-69914-4-git-send-email-richard@nod.at>
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

This case can not happen. No need to check for it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index ea0ab86..52548e7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1630,8 +1630,6 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			e->pnum = aeb->pnum;
 			e->ec = aeb->ec;
 			ubi->lookuptbl[e->pnum] = e;
-			if (ubi_is_fm_block(ubi, aeb->pnum))
-				continue;
 
 			if (!aeb->scrub) {
 				dbg_wl("add PEB %d EC %d to the used tree",
-- 
1.7.6.5
