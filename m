Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F91C48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 14:10:36 +0000 (UTC)
X-Greylist: delayed 1760 seconds by postgrey-1.34 at mail.kernel.org; Tue, 15 Jun 2021 14:10:36 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82ECB61446
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82ECB61446
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TLh146DCbCztu6q7mYAK9U9RBocelnjyFqvsl3RVfKo=; b=0oy+0nH1L1NYel
	/wb5+G+gCx8dWiNBOUHY5dM0eWJaSbcNVhG514rQKm7Y8tzdULJThCxlSNPNi3mmukunKUFs4s0hb
	BeP/dq30Kh34OjcH3fJk+4FZU3PIGipXXRgaSCVBYeRkJe1AhebOrfIvQ8w+Z0oI/TR9cqt2Qf205
	Yc+2wXflw0A1vwlLq53IYcUL9WHZTFDFzfmbToQHy++epgFpZH808Zjr1GVkLI2Ue9yXNY3vV3OCC
	Wjl8H4scbpp840l5tWJrc49PFpUp3yuCo13x1U3hjgB7cYy4dvkqtVkTed0asg0zreFvykf6EdcR0
	RKH1jeXL/RhVBXtV4C/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9jL-000SaE-VA; Tue, 15 Jun 2021 14:07:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Hw-000E8e-Vm
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=r5EPxRx8XUpVNzjWFhMtqC/QVMGUFhagKin48CSAnyo=; b=S/zMGdsqKAK9LY5QO6oIPSWrf6
 W5u7skcY9ljU5u7s8Duj8h/7QTsufitfGvZlAPtyFzBNq/HwcL322yQq/XpHRG0/EH7utcgzPdSNd
 14mo/wrLhGjTAlF64fnlI6qln0XVZ6JGl2VtKVUYP4vlmKQFBZ/aSX6sPgBMATXzSKqkyt+tbSdHQ
 2AK9ZedwUUEjfJthEjaLdPjU6Nq+OAMUkCvpkNVvT1qrO5gzrMWojAKTxAsRLBFJj00Y5Tjzj9uf5
 h68G6UUYV0Q8mzkxpSfzH2Jycks70uXHUpbc2gv2SmOLxxu+w0Pf5ArU2J/u/7TY8xgYUtG3UwtMK
 xpaeD7sA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt5Ob-007dxN-RF
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 09:30:18 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G42yq3M9tzZhSq;
 Tue, 15 Jun 2021 17:27:15 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 17:30:06 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 17:30:06 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2] mtd: mtd_blkdevs: Initialize rq.limits.discard_granularity
Date: Tue, 15 Jun 2021 17:39:05 +0800
Message-ID: <20210615093905.3473709-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103017_016520_C65CB0B2 
X-CRM114-Status: UNSURE (   6.45  )
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

Since commit b35fd7422c2f8("block: check queue's limits.discard_granularity
in __blkdev_issue_discard()") checks rq.limits.discard_granularity in
__blkdev_issue_discard(), we may get following warnings on formatted ftl:

  WARNING: CPU: 2 PID: 7313 at block/blk-lib.c:51
  __blkdev_issue_discard+0x2a7/0x390

Reproducer:
  1. ftl_format /dev/mtd0
  2. modprobe ftl
  3. mkfs.vfat /dev/ftla
  4. mount -odiscard /dev/ftla temp
  5. dd if=/dev/zero of=temp/tst bs=1M count=10 oflag=direct
  6. dd if=/dev/zero of=temp/tst bs=1M count=10 oflag=direct

Fix it by initializing rq.limits.discard_granularity if device supports
discard operation.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 01bf234e7f3a..6eac1c9c164d 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -413,6 +413,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (tr->discard) {
 		blk_queue_flag_set(QUEUE_FLAG_DISCARD, new->rq);
 		blk_queue_max_discard_sectors(new->rq, UINT_MAX);
+		new->rq->limits.discard_granularity = tr->blksize;
 	}
 
 	gd->queue = new->rq;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
