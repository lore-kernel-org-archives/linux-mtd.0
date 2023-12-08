Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BB1C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TuPnexnkr2JC9awomUuP5S8YvNKN+dDi0lWmKPk5FWM=; b=YKmJsNTL5kAmG9
	Qrz3eto6IB+C4qP26F9muZCE20Tj4eieveGlDEp4VWb+Gy613+of27KnFm7cKPezuWohiYaXnfgeR
	BGVwpRykdx5YjKlPeVaQd3cc9r5z8w9iSUUjTUdcgK+aFxrV63bUfX2ldImTbsmrsuAcBxaVfOlXx
	QNGhPOOCHMhbFm5LJskQ1asFjQ4ucNrUU1daPsn7TaMI3QuFR96bFjjC7HQULt5Hb4xlURH+gZJ3/
	2XDmDEsl6JNk6bMnRlFo/XoiPxbYNBCbCtId9s8z0YgaEN1bcU5evr/0AuZ3Xf/YYCUbcr//B3cmR
	N+dSLZXkcE+X+qWWMiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBV4T-00EvvU-1o;
	Fri, 08 Dec 2023 07:14:49 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBV4O-00EvuU-1v
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 07:14:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Smj7Q4NV8z4f3lD7
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 15:14:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 6649D1A0186
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 15:14:31 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDn6hBVwnJltY8_DA--.36836S4;
	Fri, 08 Dec 2023 15:14:31 +0800 (CST)
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
Subject: [PATCH] ubi: block: fix null-pointer-dereference in ubiblock_create()
Date: Fri,  8 Dec 2023 15:13:17 +0800
Message-Id: <20231208071317.1268465-1-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDn6hBVwnJltY8_DA--.36836S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1kCw4ktr1ktr4xXry8uFg_yoWfArbE9w
	4aqrn3WrWxCrn3C34Yyr1fuFWYyr1jgr48uF1xKwsxZFW7XFn7Gr98WF15Wa1DAFW2ka4r
	Ca10gr1ayr40vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67
	AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1vJmUUUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_231444_822392_6B356AF6 
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
accessing it will trigger a null-pointer-dereference issue. Fix it by put
gd directly.

Signed-off-by: Li Nan <linan122@huawei.com>
---
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
