Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2C-0007Ay-Cb
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/21] UBI: Fastmap: Fix loglevel
Date: Wed, 13 Jun 2012 12:42:13 +0200
Message-Id: <1339584138-69914-17-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 65cb3f1..4a16570 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -407,7 +407,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS) {
 			unmap_peb(ai, pnum);
-			ubi_msg("Adding PEB to free: %i", pnum);
+			dbg_bld("Adding PEB to free: %i", pnum);
 			if (err == UBI_IO_FF_BITFLIPS)
 				add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 1);
 			else
-- 
1.7.6.5
