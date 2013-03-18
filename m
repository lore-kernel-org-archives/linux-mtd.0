Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsE-0002jN-LA
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:51 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/7] Documentation: mtd: amend the sysfs docs after mtdchar
 merge
Date: Mon, 18 Mar 2013 08:50:20 +0200
Message-Id: <1363589422-1378-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The mtdchar module was merged with the mtdcore module, which means that the
MTD_CHAR Kconfig symbol does not exist any more.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-mtd |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 938ef71..3105644 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -14,8 +14,7 @@ Description:
 		The /sys/class/mtd/mtd{0,1,2,3,...} directories correspond
 		to each /dev/mtdX character device.  These may represent
 		physical/simulated flash devices, partitions on a flash
-		device, or concatenated flash devices.  They exist regardless
-		of whether CONFIG_MTD_CHAR is actually enabled.
+		device, or concatenated flash devices.
 
 What:		/sys/class/mtd/mtdXro/
 Date:		April 2009
@@ -23,8 +22,7 @@ KernelVersion:	2.6.29
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		These directories provide the corresponding read-only device
-		nodes for /sys/class/mtd/mtdX/ .  They are only created
-		(for the benefit of udev) if CONFIG_MTD_CHAR is enabled.
+		nodes for /sys/class/mtd/mtdX/ .
 
 What:		/sys/class/mtd/mtdX/dev
 Date:		April 2009
-- 
1.7.10.4
