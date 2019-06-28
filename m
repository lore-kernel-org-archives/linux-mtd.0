Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECF4C5B57A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 12:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AC42086D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 12:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHrtxHx/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AC42086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WupwUJS1ZVL1JoqdRmdA8taLRltjtMzEbjD4qiVqx/U=; b=XHrtxHx/LBAs7c
	QGAIG6HI6rSONseJt/VIfDRsQikIoC36n8eaiqnSq3PGkP+ifkgSajEw2qHJ7hy0QQVXZpiVALAsb
	56WWaxvcJlkMQTwCISpGis84dff3ulo3uxjV5B5+nHMfwqA8oEbflpMqtxGm1SdHD9eYwIEqIWCUS
	cojhSbMPAESlPAWimMXkrggoTc4vt3/K5pRuNGYwGuG9BOmjv2IsIYI/ABpsk16rBqkZicCdyXCYD
	tGSDsj2VcRcIRyriaEyUp2bwvEJynjt/Npm/Cs3wnPH3fGrLXqKkoL+460Ol/04P/jIKOi7DSWshJ
	nkxIWOWOtS0lz6vvEYNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgpYq-0001WD-SO; Fri, 28 Jun 2019 12:01:00 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgpYl-0001Uo-Uk
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 12:00:57 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E603A6D45061BF9FB631;
 Fri, 28 Jun 2019 20:00:49 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 28 Jun 2019
 20:00:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
 <david@sigma-star.at>, <boris.brezillon@free-electrons.com>,
 <yi.zhang@huawei.com>
Subject: [PATCH RFC v2] mtd: ubi: Add fastmap sysfs attribute
Date: Fri, 28 Jun 2019 20:06:21 +0800
Message-ID: <1561723581-70340-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_050056_228461_C5C4AC51 
X-CRM114-Status: GOOD (  14.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chengzhihao1@huawei.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The UBI device can be attached to a MTD device via fastmap by setting
CONFIG_MTD_UBI_FASTMAP to 'y' (If there already exists a fastmap on the
UBI device). To support some debugging scenarios, attaching process by
fastmap can be confirmed in dmesg. If the UBI device is attached by
fastmap, logs like following will appear in dmesg:

  ubi0: attached by fastmap

If multiple UBI devices are attached to multiple MTD devices at the same
time, how to distinguish which UBI devices are successfully attached by
fastmap? Extracting attaching information for each UBI device one by one
from dmesg is a way. A better method is to record fastmap existence in
sysfs, so it can be obtained by userspace tools.

This patch exposes fastmap on sysfs. Suppose you attach an UBI device to a
MTD device by fastmap: if fastmap equals to '1', that is, the fastmap
generated before last detaching operation is confirmed valid. Else, there
may be some problems with old fastmap. Besides, userspace tool can also
check whether the fastmap updating triggered by other operations (such as
resize volume) is successful by reading this sysfs attribute.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 15 +++++++++++++++
 drivers/mtd/ubi/build.c                  |  9 ++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index a6b3240..1d96cf0 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -116,6 +116,21 @@ Description:
 		device, and "0\n" if it is cleared. UBI devices mark themselves
 		as read-only when they detect an unrecoverable error.
 
+What:		/sys/class/ubi/ubiX/fastmap
+Date:		June 2019
+KernelVersion:	5.2
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Contains ASCII "1\n" if there exists a fastmap on UBI device,
+		and "0\n" if there not exists a fastmap on UBI device. After
+		attaching the UBI device to a MTD device via fastmap, userspace
+		tool can sense that there is a fastmap on UBI device  by
+		checking sysfs attribute 'fastmap', that is, the fastmap
+		generated before last detaching operation is valid. In addition,
+		userspace tool can also check whether the fastmap updating
+		triggered by volume operation is successful by reading this
+		sysfs attribute.
+
 What:		/sys/class/ubi/ubiX/total_eraseblocks
 Date:		July 2006
 KernelVersion:	2.6.22
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d636bbe..0cd6b8e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -140,6 +140,8 @@ static struct device_attribute dev_mtd_num =
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_ro_mode =
 	__ATTR(ro_mode, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_fastmap =
+	__ATTR(fastmap, S_IRUGO, dev_attribute_show, NULL);
 
 /**
  * ubi_volume_notify - send a volume change notification.
@@ -378,7 +380,11 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi->mtd->index);
 	else if (attr == &dev_ro_mode)
 		ret = sprintf(buf, "%d\n", ubi->ro_mode);
-	else
+	else if (attr == &dev_fastmap) {
+		down_write(&ubi->fm_protect);
+		ret = sprintf(buf, "%d\n", ubi->fm ? 1 : 0);
+		up_write(&ubi->fm_protect);
+	} else
 		ret = -EINVAL;
 
 	ubi_put_device(ubi);
@@ -398,6 +404,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_bgt_enabled.attr,
 	&dev_mtd_num.attr,
 	&dev_ro_mode.attr,
+	&dev_fastmap.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(ubi_dev);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
