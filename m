Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dP5Sx-00023N-Fp
 for linux-mtd@lists.infradead.org; Sun, 25 Jun 2017 11:12:33 +0000
Received: by mail-lf0-x242.google.com with SMTP id t72so1079531lff.0
 for <linux-mtd@lists.infradead.org>; Sun, 25 Jun 2017 04:12:10 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] Documentation: ABI: mtd: describe "offset" more precisely
Date: Sun, 25 Jun 2017 13:11:54 +0200
Message-Id: <20170625111154.14022-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

So far Linux supported only two levels of MTD devices so we didn't need
a very precise description for this sysfs file. With commit
97519dc52b44a ("mtd: partitions: add support for subpartitions") there
is support for a tree structure so we should have more precise
description. Using "parent" and "flash device" makes it more accurate.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/ABI/testing/sysfs-class-mtd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 3b5c3bca9186..f34e592301d1 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -229,6 +229,6 @@ KernelVersion:	4.1
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		For a partition, the offset of that partition from the start
-		of the master device in bytes. This attribute is absent on
-		main devices, so it can be used to distinguish between
-		partitions and devices that aren't partitions.
+		of the parent (another partition or a flash device) in bytes.
+		This attribute is absent on flash devices, so it can be used
+		to distinguish them from partitions.
-- 
2.11.0
