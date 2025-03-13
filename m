Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC9C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jBuhWAP3N6S7DjcfDwueNPQHGMBmACzXek0LRfbz5ag=; b=RaGhj2r5m7d+cU
	XzDEszxhH1txYwCzCI8U+hLkQXZW4IJOwiVoIeSBBEgSsaEEg8KO3c9cM4L6gloL2JHOjgxgOw0tw
	iiHF826/Zj5/Cl6gic7Gjl0Jn/3jYwZugmOa/7vgHfxwFfZeUU00THnRglkMnKDsvoSMO84Aej5Mj
	ZKjqNCG4Xhcz6soyNx5VpX9u0smQbY27ydcmi5ol8aB9Dd2m/xdOD3hRFvjkF/rCWAfb0Im33HxF6
	5hoMFv8uNOKX8llpnSZeNkm+RQSdGZyHckL2XfIajftPbHKHryRk3muxUKspvccb5IqWr3bXDTUVS
	hdllPvaibtLSnRUJRBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseiR-0000000AhyA-3cUA;
	Thu, 13 Mar 2025 09:18:59 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseg5-0000000AhTJ-24hc
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 09:16:35 +0000
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowADn7aFaotJn6LGLFA--.36390S2;
	Thu, 13 Mar 2025 17:16:17 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	logang@deltatee.com,
	gregkh@linuxfoundation.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: fix error handling in uif_init()
Date: Thu, 13 Mar 2025 17:16:09 +0800
Message-Id: <20250313091609.308724-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7aFaotJn6LGLFA--.36390S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF13GrWUGF4kurWDCF4fAFb_yoWfWwcE9F
	navwsxWr4rW3Z3Ka1Syw1F9FyI9F4qgFsa9F1Iqws5ta1UZFnrWrsrJrnIyFWUCw47AF1r
	Aa4Ykw48Jr43WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_021633_917346_2A64A117 
X-CRM114-Status: UNSURE (   5.91  )
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

Once cdev_device_add() failed, we should call put_device() to decrement
reference count for cleanup. Or it could cause memory leak.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 493cfaeaa0c9 ("mtd: utilize new cdev_device_add helper function")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef6a22f372f9..ca4c54cf9fd4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -486,6 +486,7 @@ static int uif_init(struct ubi_device *ubi)
 	kill_volumes(ubi);
 	cdev_device_del(&ubi->cdev, &ubi->dev);
 out_unreg:
+	put_device(&ubi->dev);
 	unregister_chrdev_region(ubi->cdev.dev, ubi->vtbl_slots + 1);
 	ubi_err(ubi, "cannot initialize UBI %s, error %d",
 		ubi->ubi_name, err);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
