From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <david.oberhollenzer@sigma-star.at>, <boris.brezillon@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 2/3] libmtd_legacy: Fix some function description mismatches
Date: Tue, 10 Apr 2018 15:36:56 +0800
Message-ID: <1523345817-42627-3-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523345817-42627-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523345817-42627-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 lib/libmtd_legacy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index e1ab48e..97fef04 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -54,7 +54,7 @@
  * @name: device name
  * @buf: contents of /proc/mtd
  * @data_size: how much data was read into @buf
- * @pos: next string in @buf to parse
+ * @next: next string in @buf to parse
  */
 struct proc_parse_info
 {
@@ -164,8 +164,8 @@ int legacy_procfs_is_supported(void)
 }
 
 /**
- * legacy_dev_presentl - legacy version of 'mtd_dev_present()'.
- * @info: the MTD device information is returned here
+ * legacy_dev_present - legacy version of 'mtd_dev_present()'.
+ * @mtd_num: MTD device number
  *
  * When the kernel does not provide sysfs files for the MTD subsystem,
  * fall-back to parsing the /proc/mtd file to determine whether an mtd device
@@ -404,7 +404,7 @@ out_close:
 
 /**
  * legacy_get_dev_info1 - legacy version of 'mtd_get_dev_info1()'.
- * @node: name of the MTD device node
+ * @mtd_num: MTD device number
  * @mtd: the MTD device information is returned here
  *
  * This function is similar to 'mtd_get_dev_info1()' and has the same
-- 
1.9.1
