Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SljPZ-0003i3-MY
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 16:23:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBI: Fastmap: Export fm_auto to sysfs
Date: Mon,  2 Jul 2012 18:23:18 +0200
Message-Id: <1341246199-7198-3-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/build.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 50b7590..0ffa2c9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1394,7 +1394,7 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
 		      "with name \"content\" using VID header offset 1984, and "
 		      "MTD device number 4 with default VID header offset.");
 
-module_param(fm_auto, bool, 000);
+module_param(fm_auto, bool, 0644);
 MODULE_PARM_DESC(fm_auto, "Set this parameter to enable fastmap automatically "
 			  "on images without a fastmap.");
 
-- 
1.7.6.5
