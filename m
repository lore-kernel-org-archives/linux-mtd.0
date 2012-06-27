Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjudD-0008Sx-96
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 15:58:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/16] UBI: Fastmap: Address another TODO
Date: Wed, 27 Jun 2012 17:57:46 +0200
Message-Id: <1340812676-14460-7-git-send-email-richard@nod.at>
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

Fixed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index c2434cd..4d8ef9e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -797,13 +797,6 @@ out:
  * @ubi: UBI device object
  * @ai: UBI attach info to be filled
  *
- * TODO: not urgent, but at some point - check the code with kernel doc and fix
- * its complaints.
- *
- * TODO: not urgent, but for consistency, follow the UBI/UBIFS style and put a
- * dot at the end of the first short description sentence (globally):
- *    ubi_scan_fastmap - scan the fastmap. (<-dot).
- *
  * TODO: not urgent, but it is desireble to document error codes in the header
  * comments and probably describe what the function does, if there is something
  * to say (globally).
-- 
1.7.6.5
