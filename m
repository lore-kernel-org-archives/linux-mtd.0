Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB12C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tI3DRDzmPr84matkqRjLuiFVuEFVzmRnjKKehxnivA8=; b=aeuzPX3sjB+qyJ
	5SapbzUN83PNZOeuVze8XcZ+7vAX6C97Hx2whOBX3vN0iYY87BxGWTy0tCqFdCut4V6dIp7l0FSeu
	KE/rWV6Cful8Zi/WmnRDRm74FxFUs/q6mYXpOldl1fTOXeZIpOztklegJhwd4GTboN4lD9kIXO7s5
	PQqm1zrsBz6jHRHP/JgdptoJ32eTdj/cQY3v3Mwj0M5pvBkyjsGp/JQlYr3znE690/KmkHTVwwvz3
	uajrdnpFhXA/mgE05fjRMhecbtKdbsypv9ENL0ROmskoRx24D0KKIjoQAcBezYqe7IDblXduoP5Li
	Jw0o81r/weR82K9uDV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFv4e-0081BO-9A; Mon, 25 Jul 2022 10:12:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFv4Y-0080xF-6O
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 10:12:25 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Lrwj95tkhzWf6c;
	Mon, 25 Jul 2022 18:08:13 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 18:12:04 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Jul
 2022 18:12:03 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH] ubi: fastmap: Add fastmap control support for 'UBI_IOCATT' ioctl
Date: Mon, 25 Jul 2022 18:24:10 +0800
Message-ID: <20220725102410.2251403-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_031223_056021_5E211D5A 
X-CRM114-Status: GOOD (  19.54  )
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

[1] suggests that fastmap is suitable for large flash devices. Module
parameter 'fm_autoconvert' is a coarse grained switch to enable all
ubi devices to generate fastmap, which may turn on fastmap even for
small flash devices.

This patch imports a new field 'disable_fm' in struct 'ubi_attach_req'
to support following situations by ioctl 'UBI_IOCATT'.
 [old functions]
 A. Disable 'fm_autoconvert': Disbable fastmap for all ubi devices
 B. Enable 'fm_autoconvert': Enable fastmap for all ubi devices
 [new function]
 C. Enable 'fm_autoconvert', set 'disable_fm' for given device: Don't
    create new fastmap and do full scan (existed fastmap will be
    destroyed) for the given ubi device.

A simple test case in [2].

[1] http://www.linux-mtd.infradead.org/doc/ubi.html#L_fastmap
[2] https://bugzilla.kernel.org/show_bug.cgi?id=216278

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c     | 14 ++++++++++----
 drivers/mtd/ubi/cdev.c      |  3 ++-
 drivers/mtd/ubi/ubi.h       |  3 ++-
 include/uapi/mtd/ubi-user.h |  8 +++++++-
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a32050fecabf..881a20207e74 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -807,6 +807,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @ubi_num: number to assign to the new UBI device
  * @vid_hdr_offset: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
+ * @disable_fm: whether disable fastmap
  *
  * This function attaches MTD device @mtd_dev to UBI and assign @ubi_num number
  * to the newly created UBI device, unless @ubi_num is %UBI_DEV_NUM_AUTO, in
@@ -814,11 +815,15 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * automatically. Returns the new UBI device number in case of success and a
  * negative error code in case of failure.
  *
+ * If @disable_fm is true, ubi doesn't create new fastmap even the module param
+ * 'fm_autoconvert' is set, and existed old fastmap will be destroyed after
+ * doing full scanning.
+ *
  * Note, the invocations of this function has to be serialized by the
  * @ubi_devices_mutex.
  */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
-		       int vid_hdr_offset, int max_beb_per1024)
+		       int vid_hdr_offset, int max_beb_per1024, bool disable_fm)
 {
 	struct ubi_device *ubi;
 	int i, err;
@@ -921,7 +926,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		UBI_FM_MIN_POOL_SIZE);
 
 	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
-	ubi->fm_disabled = !fm_autoconvert;
+	ubi->fm_disabled = !fm_autoconvert || disable_fm;
 	if (fm_debug)
 		ubi_enable_dbg_chk_fastmap(ubi);
 
@@ -962,7 +967,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (!ubi->fm_buf)
 		goto out_free;
 #endif
-	err = ubi_attach(ubi, 0);
+	err = ubi_attach(ubi, !!disable_fm);
 	if (err) {
 		ubi_err(ubi, "failed to attach mtd%d, error %d",
 			mtd->index, err);
@@ -1242,7 +1247,8 @@ static int __init ubi_init(void)
 
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
-					 p->vid_hdr_offs, p->max_beb_per1024);
+					 p->vid_hdr_offs, p->max_beb_per1024,
+					 false);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			pr_err("UBI error: cannot attach mtd%d\n",
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index cc9a28cf9d82..490a0606a8e9 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1041,7 +1041,8 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		 */
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
-					 req.max_beb_per1024);
+					 req.max_beb_per1024,
+					 req.disable_fm == 0 ? false : true);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 078112e23dfd..947d17e1e434 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -937,7 +937,8 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 
 /* build.c */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
-		       int vid_hdr_offset, int max_beb_per1024);
+		       int vid_hdr_offset, int max_beb_per1024,
+		       bool disable_fm);
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index b69e9ba6742b..dcb179de4358 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -247,6 +247,7 @@ enum {
  * @vid_hdr_offset: VID header offset (use defaults if %0)
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @padding: reserved for future, not used, has to be zeroed
+ * @disable_fm: whether disable fastmap
  *
  * This data structure is used to specify MTD device UBI has to attach and the
  * parameters it has to use. The number which should be assigned to the new UBI
@@ -281,13 +282,18 @@ enum {
  * eraseblocks for new bad eraseblocks, but attempts to use available
  * eraseblocks (if any). The accepted range is 0-768. If 0 is given, the
  * default kernel value of %CONFIG_MTD_UBI_BEB_LIMIT will be used.
+ *
+ * If @disable_fm is not zero, ubi doesn't create new fastmap even the module
+ * param 'fm_autoconvert' is set, and existed old fastmap will be destroyed
+ * after doing full scanning.
  */
 struct ubi_attach_req {
 	__s32 ubi_num;
 	__s32 mtd_num;
 	__s32 vid_hdr_offset;
 	__s16 max_beb_per1024;
-	__s8 padding[10];
+	__s8 disable_fm;
+	__s8 padding[9];
 };
 
 /*
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
