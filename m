Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpGn-0001kI-Ix
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:50:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/15] UBI: Fastmap: Remove unused variable Signed-off-by:
 Richard Weinberger <richard@nod.at>
Date: Thu, 21 Jun 2012 23:50:03 +0200
Message-Id: <1340315408-27375-11-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/attach.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 7f65166..7cf4711 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1214,7 +1214,7 @@ out_ai:
  */
 int ubi_attach(struct ubi_device *ubi, int force_scan)
 {
-	int err, i;
+	int err;
 	struct ubi_attach_info *ai;
 
 	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
-- 
1.7.6.5
