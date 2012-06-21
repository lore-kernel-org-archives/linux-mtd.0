Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpGr-0001kw-MU
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:50:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/15] UBI: Fastmap: Improve invalidate_fastmap()
Date: Thu, 21 Jun 2012 23:50:07 +0200
Message-Id: <1340315408-27375-15-git-send-email-richard@nod.at>
In-Reply-To: <1340315408-27375-1-git-send-email-richard@nod.at>
References: <UBI fastmap updates>
 <1340315408-27375-1-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 68be3d5..582f5ee 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1332,8 +1332,21 @@ static int invalidate_fastmap(struct ubi_device *ubi,
 			      struct ubi_fastmap_layout *fm)
 {
 	int ret, i;
+	struct ubi_vid_hdr *vh;
 
 	ret = erase_block(ubi, fm->e[0]->pnum);
+	if (ret < 0)
+		return ret;
+
+	vh = new_fm_vhdr(ubi, UBI_FM_SB_VOLUME_ID);
+	if (!vh)
+		return -ENOMEM;
+
+	/* deleting the current fastmap SB is not enough, an old SB may exist,
+	 * so create a (corrupted) SB such that fastmap will find it and fall
+	 * back to scanning mode in any case */
+	vh->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
+	ret = ubi_io_write_vid_hdr(ubi, fm->e[0]->pnum, vh);
 
 	for (i = 0; i < fm->used_blocks; i++)
 		ubi_wl_put_fm_peb(ubi, fm->e[i], fm->to_be_tortured[i]);
-- 
1.7.6.5
