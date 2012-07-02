Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SljPa-0003hy-5n
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 16:23:45 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] UBI: Fastmap: Document return codes.
Date: Mon,  2 Jul 2012 18:23:17 +0200
Message-Id: <1341246199-7198-2-git-send-email-richard@nod.at>
In-Reply-To: <1341246199-7198-1-git-send-email-richard@nod.at>
References: <1341246199-7198-1-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/attach.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index a343a41..106aa01 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1305,6 +1305,11 @@ out_ech:
  * scan_fastmap - try to find a fastmap and attach from it.
  * @ubi: UBI device description object
  * @ai: attach info object
+ *
+ * Returns 0 on success, negative return values indicate an internal
+ * error.
+ * UBI_NO_FASTMAP denotes that no fastmap was found.
+ * UBI_BAD_FASTMAP denotes that the found fastmap was invalid.
  */
 static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
-- 
1.7.6.5
