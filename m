Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkcuE-0006Sb-82
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/11] ubi: fastmap: Do not free 'ai' in 'scan_all()'
Date: Fri, 29 Jun 2012 17:14:27 +0200
Message-Id: <1340982869-77042-10-git-send-email-richard@nod.at>
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

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Do not call 'destroy_ai(ai)' at error handling of 'scan_all', since:
- 'ai' is allocated in 'ubi_attach' (the caller of scan_all) and
  provided as an argument. It's not scan_all's responsibility to free it
- It is not consistent with scan_all's sister function
  'ubi_attach_fastmap()' which does not free the given 'ai'
- It will cause a double free as 'ubi_attach' (the caller of scan_all)
  already destroys 'ai' in case of an error

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c30a0f6..a343a41 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1237,7 +1237,7 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai, int star
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
-		goto out_ai;
+		return err;
 
 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vidh)
@@ -1298,8 +1298,6 @@ out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
 out_ech:
 	kfree(ech);
-out_ai:
-	destroy_ai(ai);
 	return err;
 }
 
-- 
1.7.6.5
