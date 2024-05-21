Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6789BC41513
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gV3A0fc1y10NyLdvxy86f6UtSsDYB3mlb5YBJA/3hiU=; b=cW7VnJhK1UieEp
	9c+2Yt814qNYoNaDOJ/FVI7Q+svwdkiaLOkTo5TPtdIMjZAwKHgKkaZXFDKv9GNhlYZtTtjmAuaO5
	2T/J+eRYfkhqvXBjsP5CmW6Di/DBHHIBk/dZDLt71K41KQSlByMFOsjSPZF+stuPnqKO3JnaT6g5G
	1f7sH4CTzerySffiQY+o2ndZEROKKF7z06v0VkwsN9nx/quWS4xuBj69nALcapGNXjSntlXGfvli+
	dIeVTq55Iq3DC+t2L1ckzefCVQfZYtHX8UWd5hX9EB7BIsPXjAzP9wYfVrOICcw8zIAmgHGbPxTIA
	kE1IL2Uh+JMRZPgLgIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NXx-0000000HGTk-3vgY;
	Tue, 21 May 2024 11:20:45 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NXs-0000000HGNs-2DBV
	for linux-mtd@lists.infradead.org;
	Tue, 21 May 2024 11:20:42 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4VkBmz5h0sz4f3jHy
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2024 19:20:19 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B041A1A017F
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2024 19:20:28 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgBXKBF6g0xmG_0XNQ--.40701S5;
	Tue, 21 May 2024 19:20:28 +0800 (CST)
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
Subject: [PATCH v2 1/2] ubi: block: fix null-pointer-dereference in ubiblock_create()
Date: Wed, 22 May 2024 03:13:46 +0800
Message-Id: <20240521191347.413578-2-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521191347.413578-1-linan666@huaweicloud.com>
References: <20240521191347.413578-1-linan666@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBXKBF6g0xmG_0XNQ--.40701S5
X-Coremail-Antispam: 1UD129KBjvdXoW7XrW7KFy3XF48trW3CrWruFg_yoWDuFcE9w
	nYqr92grW8Cr1fC34YkayxZrWYkw4Fqr48CF13t39xWFWjgF97GrWDXr1DuFsrZa1jya45
	Ja4UWr42yw4IqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbLAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kI
	II0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7
	xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2
	z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4
	CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lw4CE
	c2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRK
	mi_tUUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_042041_305935_6896B5CC 
X-CRM114-Status: UNSURE (   9.23  )
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

Similar to commit adbf4c4954e3 ("ubi: block: fix memleak in
ubiblock_create()"), 'dev->gd' is not assigned but dereferenced if
blk_mq_alloc_tag_set() fails, and leading to a null-pointer-dereference.
Thus pass the variable 'gd' to dev_err() directly.

Fixes: 77567b25ab9f ("ubi: use blk_mq_alloc_disk and blk_cleanup_disk")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Li Nan <linan122@huawei.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index f82e3423acb9..3b61196d387b 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -390,7 +390,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
-		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
+		dev_err(disk_to_dev(gd), "blk_mq_alloc_tag_set failed");
 		goto out_free_dev;
 	}
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
