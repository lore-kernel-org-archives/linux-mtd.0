Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A36C48BF8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 02:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0XcZFq5Y1GHXLiw0mpNH1joAhciqSmjzwAuZfGr3ydk=; b=MV/8wlZYtSWZoh
	1xweUEzHqkJFMIKrJBh2DGiIu7DM45kBS3871Q8e02DFay7MBnXdE+eDIdCkQl+3tbxi26twiSv4K
	Hk2owX8d3aTnaTkK7BQs++VyK9Np+Vj3eGR/qyeQkWMjjn+gfw8eqv8Sjsi21gnu0qSDg+vQfgWSZ
	ppd2gbWVthPi/uwX68utWzFfUUqdjndJRPHVJiRVYb2VcK8zEgflwiw5Oy0t9ppRrj7GxPXJcLDPs
	pdI3gkGxmFzHJZc/HzHmBCvjU4dHSpcojbgvPYptD1FE65B4EnAHnBr+5JdLB6ZySLJXRzTcsPSLS
	zk9sHYUqFh3yDWZQruJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGHh-0000000CuhU-11Ag;
	Tue, 20 Feb 2024 02:55:05 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGHd-0000000Cufz-3OQu
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 02:55:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Tf3sY3VPbz4f3nJr
	for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 10:54:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 9066C1A0392
	for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 10:54:48 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgBHGBFlFNRlpZ09Eg--.51696S4;
	Tue, 20 Feb 2024 10:54:48 +0800 (CST)
From: Zhang Yi <yi.zhang@huaweicloud.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	yi.zhang@huawei.com,
	yi.zhang@huaweicloud.com,
	yukuai3@huawei.com
Subject: [PATCH] ubi: correct the calculation of fastmap size
Date: Tue, 20 Feb 2024 10:49:03 +0800
Message-Id: <20240220024903.2477468-1-yi.zhang@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBHGBFlFNRlpZ09Eg--.51696S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtF4fZw17Xr1rtrWrArWDurg_yoWkAFb_Zw
	na9r4fJr4UtF1kKr1rKrsI9FyDKa1293WDXFWxt39rC3yDX34xuws7ZryYgay7Aws7AFWU
	Z3ykXr4fXwnrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbz8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_185502_073963_ED9D24E2 
X-CRM114-Status: UNSURE (   6.38  )
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

From: Zhang Yi <yi.zhang@huawei.com>

Now that the calculation of fastmap size in ubi_calc_fm_size() is
incorrect since it miss each user volume's ubi_fm_eba structure and the
Internal UBI volume info. Let's correct the calculation.

Cc: stable@vger.kernel.org
Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 2a728c31e6b8..9a4940874be5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -85,9 +85,10 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
 		sizeof(struct ubi_fm_scan_pool) +
 		sizeof(struct ubi_fm_scan_pool) +
 		(ubi->peb_count * sizeof(struct ubi_fm_ec)) +
-		(sizeof(struct ubi_fm_eba) +
-		(ubi->peb_count * sizeof(__be32))) +
-		sizeof(struct ubi_fm_volhdr) * UBI_MAX_VOLUMES;
+		((sizeof(struct ubi_fm_eba) +
+		  sizeof(struct ubi_fm_volhdr)) *
+		 (UBI_MAX_VOLUMES + UBI_INT_VOL_COUNT)) +
+		(ubi->peb_count * sizeof(__be32));
 	return roundup(size, ubi->leb_size);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
