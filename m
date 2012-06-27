Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjudE-0008TW-0S
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 15:58:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/16] UBI: Fastmap: Address jet another TOOD
Date: Wed, 27 Jun 2012 17:57:47 +0200
Message-Id: <1340812676-14460-8-git-send-email-richard@nod.at>
In-Reply-To: <1340812676-14460-1-git-send-email-richard@nod.at>
References: <1340812676-14460-1-git-send-email-richard@nod.at>
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

Writing the fastmap upon attach time if ai->is_empty=1
does not make sense. At this stage the erase worker is busy
with erasing all PEBs and fastmap won't get a free anchor PEB.
While detaching we write anyway a fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 021c7d3..068f11a 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1301,14 +1301,6 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	}
 
 	destroy_ai(ubi, ai);
-
-	/* TODO: UBI auto formats the flash if it is empty (see ubi->is_empty).
-	 * It is currently done so that every sub-system writes initializes its
-	 * own stuff. Well, now it is only the vtbl sub-system - it creates
-	 * empty volume table. And this is why we have "early" function for
-	 * getting free PEBs. Fastmap should do the same - so I guess it is
-	 * good to do it somewhere here. Also, we need to re-create the fastmap
-	 * on-flash data-structures if they were corrupted. */
 	return 0;
 
 out_wl:
-- 
1.7.6.5
