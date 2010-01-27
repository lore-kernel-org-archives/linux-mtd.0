Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Na9gZ-0004AV-Es
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 15:20:08 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0RFJovn004074
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 17:19:58 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] UBI: mark few variables as __initdata
Date: Wed, 27 Jan 2010 17:18:56 +0200
Message-Id: <1264605540-13144-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
References: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
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

The @mtd_devs and @mtd_dev_param variables are used only during the
initialization, and all functions that use the variables have
the __init prefix. This means we can safely mark the variables
as __initdata, which is a tiny optimization.

Impact: tiny RAM consumption optimization when UBI is used as a kernel
        module.

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
1.6.6
