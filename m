Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSXJQ-0005my-Sm
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 14:56:45 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o06EspOT013908
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jan 2010 08:56:39 -0600
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBI: mark few variables as __initdata
Date: Wed,  6 Jan 2010 16:56:25 +0200
Message-Id: <1262789785-32520-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 14cec04..eb8f19f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -59,10 +59,10 @@ struct mtd_dev_param {
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
-static int mtd_devs;
+static int __initdata mtd_devs;
 
 /* MTD devices specification parameters */
-static struct mtd_dev_param mtd_dev_param[UBI_MAX_DEVICES];
+static struct mtd_dev_param __initdata mtd_dev_param[UBI_MAX_DEVICES];
 
 /* Root UBI "class" object (corresponds to '/<sysfs>/class/ubi/') */
 struct class *ubi_class;
-- 
1.6.2.5
