Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skcu9-0006Qu-Ct
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/11] UBI: Fastmap: Fix mem leak in error path
Date: Fri, 29 Jun 2012 17:14:19 +0200
Message-Id: <1340982869-77042-2-git-send-email-richard@nod.at>
In-Reply-To: <1340982869-77042-1-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
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
 drivers/mtd/ubi/attach.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 3d9be42..bd3a8f5 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1325,12 +1325,12 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 
 		scan_ai = alloc_ai();
 		if (!scan_ai)
-			goto out_ai;
+			goto out_wl;
 
 		err = scan_all(ubi, scan_ai);
 		if (err) {
 			kfree(scan_ai);
-			goto out_ai;
+			goto out_wl;
 		}
 
 		self_check_eba(ubi, ai, scan_ai);
-- 
1.7.6.5
