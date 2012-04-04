Received: from mtaout03-winn.ispmail.ntl.com ([81.103.221.49])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SFXjV-0003oC-II
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 21:27:14 +0000
Received: from aamtaout02-winn.ispmail.ntl.com ([81.103.221.35])
 by mtaout03-winn.ispmail.ntl.com
 (InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
 <20120404212710.KMUQ18388.mtaout03-winn.ispmail.ntl.com@aamtaout02-winn.ispmail.ntl.com>
 for <linux-mtd@lists.infradead.org>; Wed, 4 Apr 2012 22:27:10 +0100
Received: from zog.reactivated.net ([86.14.215.141])
 by aamtaout02-winn.ispmail.ntl.com
 (InterMail vG.3.00.04.00 201-2196-133-20080908) with ESMTP id
 <20120404212710.GHQP3795.aamtaout02-winn.ispmail.ntl.com@zog.reactivated.net>
 for <linux-mtd@lists.infradead.org>; Wed, 4 Apr 2012 22:27:10 +0100
From: Daniel Drake <dsd@laptop.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-www] UBI FAQ: suggest omission of vol_size option
Message-Id: <20120404212706.970C69D401E@zog.reactivated.net>
Date: Wed,  4 Apr 2012 22:27:06 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OLPC set vol_size based on the size of the target NAND and found out
that it resulted in some systems being unbootable, where such systems
had a lot of bad blocks on their flash.

For distributors such as OLPC wishing to maximize robustness in the
face of varying bad block counts, it makes a lot of sense to avoid
the vol_size option and let it be calculated automatically.
Document this.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 faq/ubi.xml |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 7133867..c9f1c57 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -299,6 +299,20 @@ actually has to be at least 225MiB in size. Of course it may be larger,
 in which case the "rootfs" volume will be re-sized and take the rest of the
 flash space (because of the auto-resize flag).</p>
 
+<p>
+The implications of the above paragraph are important. The
+<code>vol_size</code> option effectively represents the minimum size of the
+flash where the volume will be installed. If you are working with multiple
+devices (i.e. you are producing an image to be flashed on various devices,
+even when 'identical'), the amount of usable flash <em>will</em> vary because
+some devices have more bad blocks than others. Excluding the
+<code>vol_size</code> option will cause vol_size to be automatically
+calculated based on the size of the input image, and this will produce
+maximum robustness in the face of varying numbers of bad blocks on target
+devices. You can combine this with the autoresize functionality so that the
+maximum amount of free space is made available upon first mount.
+</p>
+
 <p>Also, the <code>config_data.img</code> and <code>rootfs.img</code> input
 files do not have to be 512KiB and 220MiB respectively, but may be smaller if
 they contain less data. In this case the resulting <code>ubi.img</code> file
-- 
1.7.7.6
