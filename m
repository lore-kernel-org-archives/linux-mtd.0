Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3664C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QcjI4+Lk7UFWB7ncjM4tn9/7pRz53SECPkI0wBk6hSA=; b=P+lXgxNrtiFQY+
	Sgv+f0yQ1GEFWCvF6k45AGIpls4JL4ZMDPgwFVSMGA2+8HtraPuqO3trqeF3yULHq1tadfMsUN75a
	1R+znphGYwtSMr8oY4FsV7WFw568YDe4vwW+os7zBnUN1YT3Lj6I4aFNM5OjMBzm/avfBXRJbv70t
	hEBjKfxubYPR986W5quQ2jQj11rE5Va1czx+SJtskybblBamlEKdRLpRe84at3dclmKtI5Se6VOQe
	HwWedKmvk9/9Y50DRrjQjVwHKAZkvzjxePjr8QnSt9fAHJ6DUDoFSC47PhpzIdNlZXfyqu/HdotW2
	HrhgQ232tzqhsv5gQBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBVaZ-00EzWR-0I;
	Fri, 08 Dec 2023 07:47:59 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBVaV-00EzVx-1v
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 07:47:57 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Smjsj6HCSz4f3lVv
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 15:47:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id A7F8E1A0354
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 15:47:42 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDn6xEcynJl8bRBDA--.44654S4;
	Fri, 08 Dec 2023 15:47:42 +0800 (CST)
From: linan666@huaweicloud.com
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linan122@huawei.com,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	houtao1@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH v2] ubi: block: fix memleak in ubiblock_create()
Date: Fri,  8 Dec 2023 15:46:29 +0800
Message-Id: <20231208074629.1656356-1-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDn6xEcynJl8bRBDA--.44654S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1kCw4ktr1ktr18Gr1DAwb_yoWDGFcE9w
	4Yqrn3XrWIkrn3C34jyrWfua1jyr1UKrWkuF1fKws8ZFW7WFn7GF9xWr15Wan8ZFW7Cay5
	A3WIgr12yF40qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67
	AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
	Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU1kpnJUUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_234755_820297_B09E95C1 
X-CRM114-Status: UNSURE (   8.42  )
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

If idr_alloc() fails, dev->gd will be put after goto out_cleanup_disk in
ubiblock_create(), but dev->gd has not been assigned yet at this time, and
'gd' will not be put anymore. Fix it by putting 'gd' directly.

Signed-off-by: Li Nan <linan122@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes in v2:
 - modify the description of the problem in log

 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 309a42aeaa4c..654bd7372cd8 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -434,7 +434,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	list_del(&dev->list);
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
 out_cleanup_disk:
-	put_disk(dev->gd);
+	put_disk(gd);
 out_free_tags:
 	blk_mq_free_tag_set(&dev->tag_set);
 out_free_dev:
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
