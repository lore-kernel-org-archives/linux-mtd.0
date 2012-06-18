Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgeg1-0000g7-ME
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/22] UBI: Fastmap: Add comments to new functions
Date: Mon, 18 Jun 2012 18:19:00 +0200
Message-Id: <1340036345-96726-18-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 7d36034..65fd7ee 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1266,6 +1266,11 @@ out:
 	return ret;
 }
 
+/**
+ * erase_block - Manually erase a PEB
+ * @ubi: UBI device object
+ * @pnum: PEB to be erased
+ */
 static int erase_block(struct ubi_device *ubi, int pnum)
 {
 	int ret;
@@ -1306,6 +1311,11 @@ out:
 	return ret;
 }
 
+/**
+ * invalidate_fastmap - destroys a fastmap
+ * @ubi: UBI device object
+ * @fm: the fastmap to be destroyed
+ */
 static int invalidate_fastmap(struct ubi_device *ubi,
 			      struct ubi_fastmap_layout *fm)
 {
-- 
1.7.6.5
