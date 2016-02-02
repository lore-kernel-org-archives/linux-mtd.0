Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm5-0002Yd-Qo
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:04 +0000
Received: by mail-pf0-x242.google.com with SMTP id 66so7810578pfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:45 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 12/17] drivers:mtd:ubi:add disable bakvol while ubi detach
Date: Tue,  2 Feb 2016 02:30:47 +0000
Message-Id: <1454380252-16170-13-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

When ubi device is detached, bakvol should be disable and free pre-allocation
memory.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 22fd19c..4f7a466 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1118,6 +1118,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	 */
 	get_device(&ubi->dev);
 
+	clear_bakvol(ubi);
+
 	ubi_debugfs_exit_dev(ubi);
 	uif_close(ubi);
 
-- 
1.9.1
