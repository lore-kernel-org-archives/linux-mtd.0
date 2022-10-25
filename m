Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCAC38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m4Zxbuygb5EOtc7G9+icmwVeZ7IpZbGoNoQOmPeyRPI=; b=jSOG8cWtSqgGRU
	OOrpHY1eFxBplrf2TRHVUd0kFTFs/d9aA+Y7shGQ7M8IJ/xExDtojfaK31jZixOhX43MWwin+su0h
	c5r7tISXNIL2/S5h5AJL2IvnHW+2pZVwd273Z63buL/ptthSMr5IT9ws0+4QiFD/Gpuhm7s98uZpX
	AYOfw7i+qRZGXk2UoJcTxielGfOZ5Eoo3ZxYchoGTEcR6bxKHPyMxbY4wKw1MtQdJnfOoRUzkdfwK
	BvOZAeWNMgR6S1Svd08siPyYOm3uOWnLama4WIfyrrXSOD3dXASkzEwlG6JhzDmYRMeFzcVtZssZ5
	C0czJ18d/4XNWi3yPKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onFL8-004L26-8u; Tue, 25 Oct 2022 08:31:14 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onFL4-004KyO-CB
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 08:31:13 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MxQ6Y2WT5zpVtM;
	Tue, 25 Oct 2022 16:27:33 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 16:30:57 +0800
Received: from huawei.com (10.175.127.227) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 16:30:57 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<patchwork@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<miaoxie@huawei.com>, <guohanjun@huawei.com>, <huawei.libin@huawei.com>,
	<yuehaibing@huawei.com>, <johnny.chenyi@huawei.com>, <weiyongjun1@huawei.com>
Subject: [PATCH -next] ubi: fastmap: Add fastmap control support for module parameter
Date: Tue, 25 Oct 2022 16:52:49 +0800
Message-ID: <20221025085249.256285-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_013110_805531_D78CAB9C 
X-CRM114-Status: GOOD (  21.61  )
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

The UBI driver can use the IOCTL to disable the fastmap after the
mainline 669d204469c4 ("ubi: fastmap: Add fastmap control support
for 'UBI_IOCATT' ioctl"). To destroy the fastmap on a old image,
we need to reattach the device in user space.

However, if the UBI driver build in kernel and the UBI volume is
the root partition, the UBI device cannot be reattached in user
space. To disable fastmap in this case, the UBI must provide the
kernel cmdline parameters to disable fastmap during attach.

This patch add 'enable_fm' as 5th module init parameter of mtd=xx to
control fastmap enable or not. When the value is 0, fastmap will not
create and existed fastmap will destroyed for the given ubi device.
Default value is 0.

To enable or disable fastmap during module loading, fm_autoconvert
must be set to non-zero.

+-----------------+---------------+---------------------------+
|        \        |  enable_fm=0  |  enable_fm=1              |
+-----------------+---------------+---------------------------+
|fm_autoconvert=Y |  disable fm   |  enable fm                |
+---------------------------------+---------------------------+
|fm_autoconvert=N |  disable fm   | Enable fastmap if fastmap |
|                 |               | exists on the old image   |
+-------------------------------------------------------------+

Example:
  # - Attach mtd1 to ubi1, disable fastmap, mtd2 to ubi2, enable
      fastmap.
  # modprobe ubi mtd=1,0,0,1,0 mtd=2,0,0,2,1 fm_autoconvert=1

  # - If 5th parameter is not specified, the value is 0, fastmap is
      disable
  # modprobe ubi mtd=1 fm_autoconvert=1

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216623
Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/build.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a901f8edfa41..0393cb794a9a 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -35,7 +35,7 @@
 #define MTD_PARAM_LEN_MAX 64
 
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
-#define MTD_PARAM_MAX_COUNT 4
+#define MTD_PARAM_MAX_COUNT 5
 
 /* Maximum value for the number of bad PEBs per 1024 PEBs */
 #define MAX_MTD_UBI_BEB_LIMIT 768
@@ -53,12 +53,14 @@
  * @ubi_num: UBI number
  * @vid_hdr_offs: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEBs per 1024 PEBs
+ * @enable_fm: enable fastmap when value is non-zero
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
 	int ubi_num;
 	int vid_hdr_offs;
 	int max_beb_per1024;
+	int enable_fm;
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
@@ -1248,7 +1250,7 @@ static int __init ubi_init(void)
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
 					 p->vid_hdr_offs, p->max_beb_per1024,
-					 false);
+					 p->enable_fm == 0 ? true : false);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			pr_err("UBI error: cannot attach mtd%d\n",
@@ -1427,7 +1429,7 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 		int err = kstrtoint(token, 10, &p->max_beb_per1024);
 
 		if (err) {
-			pr_err("UBI error: bad value for max_beb_per1024 parameter: %s",
+			pr_err("UBI error: bad value for max_beb_per1024 parameter: %s\n",
 			       token);
 			return -EINVAL;
 		}
@@ -1438,13 +1440,25 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 		int err = kstrtoint(token, 10, &p->ubi_num);
 
 		if (err) {
-			pr_err("UBI error: bad value for ubi_num parameter: %s",
+			pr_err("UBI error: bad value for ubi_num parameter: %s\n",
 			       token);
 			return -EINVAL;
 		}
 	} else
 		p->ubi_num = UBI_DEV_NUM_AUTO;
 
+	token = tokens[4];
+	if (token) {
+		int err = kstrtoint(token, 10, &p->enable_fm);
+
+		if (err) {
+			pr_err("UBI error: bad value for enable_fm parameter: %s\n",
+				token);
+			return -EINVAL;
+		}
+	} else
+		p->enable_fm = 0;
+
 	mtd_devs += 1;
 	return 0;
 }
@@ -1457,11 +1471,13 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 		      "Optional \"max_beb_per1024\" parameter specifies the maximum expected bad eraseblock per 1024 eraseblocks. (default value ("
 		      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0)\n"
 		      "Optional \"ubi_num\" parameter specifies UBI device number which have to be assigned to the newly created UBI device (assigned automatically by default)\n"
+		      "Optional \"enable_fm\" parameter determines whether to enable fastmap during attach. If the value is non-zero, fastmap is enabled. Default value is 0.\n"
 		      "\n"
 		      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
 		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
 		      "Example 3: mtd=/dev/mtd1,0,25 - attach MTD device /dev/mtd1 using default VID header offset and reserve 25*nand_size_in_blocks/1024 erase blocks for bad block handling.\n"
 		      "Example 4: mtd=/dev/mtd1,0,0,5 - attach MTD device /dev/mtd1 to UBI 5 and using default values for the other fields.\n"
+		      "example 5: mtd=1,0,0,5 mtd=2,0,0,6,1 - attach MTD device /dev/mtd1 to UBI 5 and disable fastmap; attach MTD device /dev/mtd2 to UBI 6 and enable fastmap.(only works when fastmap is enabled and fm_autoconvert=Y).\n"
 		      "\t(e.g. if the NAND *chipset* has 4096 PEB, 100 will be reserved for this UBI device).");
 #ifdef CONFIG_MTD_UBI_FASTMAP
 module_param(fm_autoconvert, bool, 0644);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
