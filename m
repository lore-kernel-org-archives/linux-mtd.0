Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F93C25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2024 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r09Tz3QBL4C+cwlMm8JBvrRyIy4lYadgZ4/x7pDwcZI=; b=bqI6g8dCNwgheM
	HE72uozUSN8RAStkD2p3TDZIo+eQB0ZEOEKvHfk1U2PNTL7foAdKalunrBmcqIt6ICStvFuYafFo4
	eHBQqiiiwMpJccm6M/34h9V/99ktV5weDKeNZphPJ4RZu2uJTMPflLr9bv5uz16hWT+f22PBpzkkN
	AtnoiyZkwksepRpXqfPDvMzXmkgMWzqIyLrPn0qipkVsztD84o/RJbBPZI6/QF5iTEuzicOGidP96
	KYQabZ11C+RBSKRlvUB4UpBnqb01moxGcl5/j7xIWwxcPIE2dgLvQoExFQ0COrySdfrBSYj78i83R
	rs4p/HlqCntukJMZN91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9i6J-00000002TbH-0ymt;
	Wed, 22 May 2024 09:17:35 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9i6F-00000002Tah-3KIw
	for linux-mtd@lists.infradead.org;
	Wed, 22 May 2024 09:17:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Vkm0R1CHPz4f3jMr
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2024 17:17:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 1F7221A0A22
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2024 17:17:20 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDHlxAeuE1mwmtsNQ--.57500S4;
	Wed, 22 May 2024 17:17:19 +0800 (CST)
From: linan666@huaweicloud.com
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	chaitanya.kulkarni@wdc.com,
	axboe@kernel.dk
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	linan666@huaweicloud.com,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	houtao1@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH v3] ubi: block: fix null-pointer-dereference in ubiblock_create()
Date: Thu, 23 May 2024 01:10:35 +0800
Message-Id: <20240522171035.3776026-1-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDHlxAeuE1mwmtsNQ--.57500S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr18uw48Gr4kWrW7Kr18uFg_yoW8ZFW3pa
	yvg3yYy3ykGFyqgF4DXa1kCFy5Xw18W34rGF47uw4SvryrJryIkrs0qry5JF4IyF97JanI
	qFn5GFW8C3WxC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK62vIxIIY0VWUZVW8XwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr
	0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0E
	wIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lw4CEc2
	x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7s
	REiiSDUUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_021732_210928_95235DAB 
X-CRM114-Status: GOOD (  10.03  )
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

From: Li Nan <linan122@huawei.com>

Similar to commit adbf4c4954e3 ("ubi: block: fix memleak in
ubiblock_create()"), 'dev->gd' is not assigned but dereferenced if
blk_mq_alloc_tag_set() fails, and leading to a null-pointer-dereference.
Fix it by using pr_err() and variable 'dev' to print error log.

Additionally, the log in the error handle path of idr_alloc() has
been improved by using pr_err(), too. Before initializing device
name, using dev_err() will print error log with 'null' instead of
the actual device name, like this:
  block (null): ...
        ~~~~~~
It is unclear. Using pr_err() can print more details of the device.
The improved log is:
  ubiblock0_0: ...

Fixes: 77567b25ab9f ("ubi: use blk_mq_alloc_disk and blk_cleanup_disk")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Li Nan <linan122@huawei.com>
---
v3: spliting this patch into two in v2 is not a good idea. This version
is consistent with v1, but only optimizes the commit message.

 drivers/mtd/ubi/block.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index f82e3423acb9..bf7308e8ec2f 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -390,7 +390,8 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
-		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
+		pr_err("ubiblock%d_%d: blk_mq_alloc_tag_set failed\n",
+			dev->ubi_num, dev->vol_id);
 		goto out_free_dev;
 	}
 
@@ -407,8 +408,8 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	gd->minors = 1;
 	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
 	if (gd->first_minor < 0) {
-		dev_err(disk_to_dev(gd),
-			"block: dynamic minor allocation failed");
+		pr_err("ubiblock%d_%d: block: dynamic minor allocation failed\n",
+			dev->ubi_num, dev->vol_id);
 		ret = -ENODEV;
 		goto out_cleanup_disk;
 	}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
