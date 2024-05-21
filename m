Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65574C25B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ng5NOYcEJtCKC2I8yvh9vr/zJ39nSLVTryBN0Kc5a8=; b=rS7zJcQnjryZVi
	+JBi9YrvMFBAauvcYYtF2/bphjQCT6YVi65Udum1QI3KWHl4EcJ5geXTsvrn1UassxxBaX5tpUSeu
	lWCwOomtC1ccay6tgEmXjrZNoE04WRpP+oIEZR3ROH8tsJfAL3C3afcKbByam/mlgUMjYYlmiFTrp
	RM+bBwuGXUNcH8n2YU7bGUzzJas/zzvy5fNxAVPLcwmvD8X43LnO6ib9Creaigfjx+EH3sp9ugQ6k
	NQwM8aj8GdjcAhL+LO/2oakhpieqv2MfW4myjqc5HEO94txlapQaYBUBtvpZHEx8s/+phoJHKntkb
	y/V1GvjH61GYcvZx91Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NXw-0000000HGTH-0r5B;
	Tue, 21 May 2024 11:20:44 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NXp-0000000HGNt-3ppU
	for linux-mtd@lists.infradead.org;
	Tue, 21 May 2024 11:20:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4VkBn026mfz4f3jHb
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2024 19:20:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 359481A0BCE
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2024 19:20:29 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgBXKBF6g0xmG_0XNQ--.40701S6;
	Tue, 21 May 2024 19:20:29 +0800 (CST)
From: linan666@huaweicloud.com
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	axboe@kernel.dk,
	chaitanya.kulkarni@wdc.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	linan666@huaweicloud.com,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	houtao1@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH v2 2/2] ubi: block: improve error log before setting dev_name in ubiblock_create()
Date: Wed, 22 May 2024 03:13:47 +0800
Message-Id: <20240521191347.413578-3-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521191347.413578-1-linan666@huaweicloud.com>
References: <20240521191347.413578-1-linan666@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBXKBF6g0xmG_0XNQ--.40701S6
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyDKw48Ar4xJw4xGFWrGrg_yoW8Ar45pa
	yqgayYv3ykGFyqgan8X3WkCF1rX3W8tw45CFW2yw4FvryfXFySkFs0qrs8Xr4FyF97JanI
	qFnrWrW8AF18J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK62vIxIIY0VWUZVW8XwA2048vs2IY02
	0E87I2jVAFwI0_Jryl82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2
	F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjx
	v20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2
	z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082
	IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv
	7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4
	x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwAKzVCY07xG64k0
	F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRueHDUUUUU
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_042038_348364_76E47C12 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

dev_err() outputs dev_name using 'kobject_name(&dev->kobj)' to notify
users about the device encountering an error. However, before initializing
device name, it will print error message with 'null' instead of the actual
device name, like this:
  block (null): ...
        ~~~~~~

This log is not clear enough to provide the necessary context for
identifying the device. Therefore, in the error handling path of
blk_mq_alloc_tag_set() and idr_alloc(), where device name has not been
init yet, using pr_err() instead of dev_err() to print more details.
The improved error log is:
  ubiblock0_0: ...

Signed-off-by: Li Nan <linan122@huawei.com>
---
 drivers/mtd/ubi/block.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 3b61196d387b..bf7308e8ec2f 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -390,7 +390,8 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
-		dev_err(disk_to_dev(gd), "blk_mq_alloc_tag_set failed");
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
