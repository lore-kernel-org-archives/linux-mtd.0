Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2812C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:32:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F69E60FED
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F69E60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1bsae0CQWPe0Fp+NH4FRwLcVLnImjJYxMwH8aJR+cE=; b=jfVOu3Q5g6pc1V
	NZpR3xyVJJv5zpt3w8m9sWwhYtBN1yn/r3Quxv0MrZsjuOGszKkY8RIYu6Rn+vQejzL8TcMwID/t+
	iY3qcmWl5RxjuadfRNuc4uoRxDrDAXA/PWIpCOM/vRcWQphTGIn8P9JJ7dltiaFNDLDhA4rs9OQe2
	anOt45rxGzlu1THpBLoJQV2cg6QVylCLdXtHAvozklEjQaetIpzuYFAsZw7k0eUSvQ+BSOVut0K75
	8BLSuETBCVp6MhmSJ/gOKX/dqSFBbxyM0GWYBwdPZiW9E5bNn0h9WshZteuwnnq73oVH89TZ/Sfk8
	VHuAfOKt8olAK1Z9Gtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzAR-004fzp-Ji; Mon, 27 Sep 2021 22:32:11 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyhl-004Uu2-Rg; Mon, 27 Sep 2021 22:02:33 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, oberpar@linux.ibm.com,
 tj@kernel.org
Cc: linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 5/6] s390/block/dcssblk: add error handling support for
 add_disk()
Date: Mon, 27 Sep 2021 15:02:31 -0700
Message-Id: <20210927220232.1071926-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220232.1071926-1-mcgrof@kernel.org>
References: <20210927220232.1071926-1-mcgrof@kernel.org>
MIME-Version: 1.0
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

From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 drivers/s390/block/dcssblk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 5be3d1c39a78..0741a9321712 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -696,7 +696,9 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	}
 
 	get_device(&dev_info->dev);
-	device_add_disk(&dev_info->dev, dev_info->gd, NULL);
+	rc = device_add_disk(&dev_info->dev, dev_info->gd, NULL);
+	if (rc)
+		goto out_dax;
 
 	switch (dev_info->segment_type) {
 		case SEG_TYPE_SR:
@@ -712,6 +714,10 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	rc = count;
 	goto out;
 
+out_dax:
+	put_device(&dev_info->dev);
+	kill_dax(dev_info->dax_dev);
+	put_dax(dev_info->dax_dev);
 put_dev:
 	list_del(&dev_info->lh);
 	blk_cleanup_disk(dev_info->gd);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
