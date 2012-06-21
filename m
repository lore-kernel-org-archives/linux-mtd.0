Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpGh-0001iT-V9
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:50:27 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/15] UBI: Fastmap: Relax EBA selfcheck
Date: Thu, 21 Jun 2012 23:49:54 +0200
Message-Id: <1340315408-27375-2-git-send-email-richard@nod.at>
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

It is allowed that fastmap knows an EBA table entry
as unmapped while scanning would know this entry as
mapped.
Fastmap knows the current EBA table and scannning
reconstructs it. This case can happen if the fastmap
gets written while the entry is alredy unmapped but the
PEB has not been erased.
If the UBI device gets detached at this moment, scanning
may detect this EBA entry as mapped.
(Of course the upper layer, UBIFS, knows this LEB is no longer
used)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 2bee8be..6698d5e 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1276,7 +1276,8 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 
 		for (j = 0; j < vol->reserved_pebs; j++) {
 			if (scan_eba[i][j] != fm_eba[i][j]) {
-				if (scan_eba[i][j] == UBI_LEB_UNMAPPED)
+				if (scan_eba[i][j] == UBI_LEB_UNMAPPED ||
+					fm_eba[i][j] == UBI_LEB_UNMAPPED)
 					continue;
 
 				ubi_err("LEB:%i is mapped to PEB:%i instead of PEB:%i!", i, fm_eba[i][j], scan_eba[i][j]);
-- 
1.7.6.5
