Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7155CC04A94
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYQT4kAKZiCz1ruejwmHI9pN4aUj2gIh6VpK8w9voA8=; b=ZY+0j94WslkrNj
	w4g2dHj8lL6ETVW2qD4UyuN7XMasjNzrgfQ/u08PhN8eYc6iBBFMbmW4Nh30a2THEiPY9Z24pf6Ki
	PP6z34XCdyn72DICWXrp9oXHrS1rKdsRXBuanovIbzA6bK4jNiUhcMJ0qI1KjEJ8Rv+dGFriWhaHx
	B+IVWlADfxiH1rolrVe9HvUgRJWepyy49qXLBL51OlzVi1TovOnMEuP4cFGpWUHKVySj2/c91l6En
	Yszmr30eg7ZAhQ/w6yD2OHjUOkra2wbjiaHTV2B8XdW+zNx0fNiBGyylEkS9aYtgIncxCKK5ZYBVz
	KbkJqchwe0YFatE/5ZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbF-00CtrF-2h;
	Sat, 12 Aug 2023 08:03:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb5-00Ctlf-1N
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:47 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RNCmQ3p1wzTkqW;
	Sat, 12 Aug 2023 16:01:42 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/12] ubi: fastmap: Add module parameter to control reserving filling pool PEBs
Date: Sat, 12 Aug 2023 16:00:04 +0800
Message-ID: <20230812080005.3162125-12-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010343_809646_9DF7DCB2 
X-CRM114-Status: GOOD (  18.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding 6th module parameter in 'mtd=xxx' to control whether or not
reserving PEBs for filling pool/wl_pool.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c | 26 ++++++++++++++++++++++----
 drivers/mtd/ubi/cdev.c  |  3 ++-
 drivers/mtd/ubi/ubi.h   |  2 +-
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 66d7b6a16aad..7d4ff1193db6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -35,7 +35,7 @@
 #define MTD_PARAM_LEN_MAX 64
 
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
-#define MTD_PARAM_MAX_COUNT 5
+#define MTD_PARAM_MAX_COUNT 6
 
 /* Maximum value for the number of bad PEBs per 1024 PEBs */
 #define MAX_MTD_UBI_BEB_LIMIT 768
@@ -54,6 +54,7 @@
  * @vid_hdr_offs: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEBs per 1024 PEBs
  * @enable_fm: enable fastmap when value is non-zero
+ * @need_resv_pool: reserve pool->max_size pebs when value is none-zero
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
@@ -61,6 +62,7 @@ struct mtd_dev_param {
 	int vid_hdr_offs;
 	int max_beb_per1024;
 	int enable_fm;
+	int need_resv_pool;
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
@@ -825,6 +827,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @vid_hdr_offset: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @disable_fm: whether disable fastmap
+ * @need_resv_pool: whether reserve pebs to fill fm_pool
  *
  * This function attaches MTD device @mtd_dev to UBI and assign @ubi_num number
  * to the newly created UBI device, unless @ubi_num is %UBI_DEV_NUM_AUTO, in
@@ -840,7 +843,8 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @ubi_devices_mutex.
  */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
-		       int vid_hdr_offset, int max_beb_per1024, bool disable_fm)
+		       int vid_hdr_offset, int max_beb_per1024, bool disable_fm,
+		       bool need_resv_pool)
 {
 	struct ubi_device *ubi;
 	int i, err;
@@ -951,7 +955,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		UBI_FM_MIN_POOL_SIZE);
 
 	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
-	ubi->fm_pool_rsv_cnt = ubi->fm_pool.max_size;
+	ubi->fm_pool_rsv_cnt = need_resv_pool ? ubi->fm_pool.max_size : 0;
 	ubi->fm_disabled = (!fm_autoconvert || disable_fm) ? 1 : 0;
 	if (fm_debug)
 		ubi_enable_dbg_chk_fastmap(ubi);
@@ -1274,7 +1278,8 @@ static int __init ubi_init(void)
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
 					 p->vid_hdr_offs, p->max_beb_per1024,
-					 p->enable_fm == 0);
+					 p->enable_fm == 0,
+					 p->need_resv_pool != 0);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			pr_err("UBI error: cannot attach mtd%d\n",
@@ -1483,6 +1488,18 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 	} else
 		p->enable_fm = 0;
 
+	token = tokens[5];
+	if (token) {
+		int err = kstrtoint(token, 10, &p->need_resv_pool);
+
+		if (err) {
+			pr_err("UBI error: bad value for need_resv_pool parameter: %s\n",
+				token);
+			return -EINVAL;
+		}
+	} else
+		p->need_resv_pool = 0;
+
 	mtd_devs += 1;
 	return 0;
 }
@@ -1496,6 +1513,7 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 		      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0)\n"
 		      "Optional \"ubi_num\" parameter specifies UBI device number which have to be assigned to the newly created UBI device (assigned automatically by default)\n"
 		      "Optional \"enable_fm\" parameter determines whether to enable fastmap during attach. If the value is non-zero, fastmap is enabled. Default value is 0.\n"
+		      "Optional \"need_resv_pool\" parameter determines whether to reserve pool->max_size pebs during attach. If the value is non-zero, peb reservation is enabled. Default value is 0.\n"
 		      "\n"
 		      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
 		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f43430b9c1e6..98aa00344b29 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1041,7 +1041,8 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		 */
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
-					 req.max_beb_per1024, !!req.disable_fm);
+					 req.max_beb_per1024, !!req.disable_fm,
+					 false);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 6e20a0fee72f..a5ec566df0d7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -944,7 +944,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 /* build.c */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		       int vid_hdr_offset, int max_beb_per1024,
-		       bool disable_fm);
+		       bool disable_fm, bool need_resv_pool);
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
