Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20CC44501
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RR5005nqpbdHSc0wop6Q3Sd7Srod7kd49nkt40MXVdU=; b=PQla4Qx80KMPNp
	AIt4bkaRgXwxTgVdYOs70jwROHp6kXHXqKV6HheFZ33Af0S9U61PwNMhJylrm2wKL2Ox8Y5mhYc62
	RxQTjFrS/XsyaMrKQ6jNNSWjLJLPmNiwMqh47GHUMnMMwrzpWyG995LDCU86xFwXaO46c6q/Af21e
	7Iz7NNBQMkqL78E53uwT8VhbItViIMA0JI6siIsTO3VFOTkzHBkMUzz6lbhPYlNdaRUkPoLIgdknG
	UGXHGovXJvYILziImDULKkPzQnC/E5P6lg8glIpSzHPuvUPSO8UD2F35xtES3qDvayQ3wAW19rQf8
	/EHZPTWQ9Wtx7QQ+ib/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM3T-0000000HNWh-3Nf8;
	Thu, 16 Jul 2026 13:23:11 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM3P-0000000HNUg-1SFQ
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 13:23:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4UzHivmPv4sGDOdOPE7VyO5rahWexPUdRRxBAZUmcC0=;
	b=KdHy22eQ10zKrthqbPhl6DL1SHyYt5WEbE92vv8W0rEGaQw1Ojicnb/0UWk6NSDfIwjmfbnzA
	bHd4wPq01D78rLCT8gf38ZZlC9cqwhCXcQIflDIa7K03F77o4VdpQGu4QHCvNR9t1zrK8BlEg91
	xeM4NjJnBZjgRAkAdOzwRpE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h1D5S66GSzpT0h;
	Thu, 16 Jul 2026 21:14:04 +0800 (CST)
Received: from kwepemg100005.china.huawei.com (unknown [7.202.181.23])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A91C4058C;
	Thu, 16 Jul 2026 21:22:59 +0800 (CST)
Received: from huawei.com (10.50.85.155) by kwepemg100005.china.huawei.com
 (7.202.181.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 16 Jul
 2026 21:22:58 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Artem.Bityutskiy@nokia.com>, <lumag@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] mtd: part: reject MTDPART_OFS_RETAIN in mtd_add_partition()
Date: Thu, 16 Jul 2026 21:14:32 +0800
Message-ID: <20260716131432.2355777-1-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemg100005.china.huawei.com (7.202.181.23)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_062308_021701_D3AEB1FC 
X-CRM114-Status: GOOD (  13.28  )
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

mtd_add_partition() does not reject the special offset value
MTDPART_OFS_RETAIN (-3), which leads to a WARN_ON in
add_mtd_device() when called through the BLKPG ioctl on NAND
devices. The RETAIN value depends on cur_offset being the end of
the previous partition, but in the dynamic partition path
cur_offset equals the offset argument itself, causing undefined
behavior.

Commit 5daa7b21496a ("mtd: prepare partition add and del functions
for ioctl requests") introduced mtd_add_partition() and correctly
rejected MTDPART_OFS_APPEND (-1) and MTDPART_OFS_NXTBLK (-2),
since those special offsets rely on cur_offset tracking the
previous partition's end. However, commit 1a31368bf92e ("mtd: add a flags
for partitions which should just leave smth. after them")
later added MTDPART_OFS_RETAIN (-3) for the static
partition table path without updating mtd_add_partition() to
also reject this value.

With offset=-3 passed via BLKPG, the RETAIN size calculation in
allocate_partition() underflows (parent_size - 0xFFFFFFFFFFFFFFFD
= parent_size + 3). If the underflow result does not appear to
leave enough space, allocate_partition() jumps to out_register via
goto, skipping erasesize initialization. This results in
erasesize=0, which triggers:

WARN_ON((!mtd->erasesize || !master->_erase) &&
		!(mtd->flags & MTD_NO_ERASE))

in add_mtd_device(). If the underflow result appears to leave
enough space, a bogus partition size is calculated, but the
"out of reach" sanity check catches the invalid offset and
creates a disabled empty partition (offset=0, size=0) instead
of returning an error.

Fix this by adding MTDPART_OFS_RETAIN to the rejection list in
mtd_add_partition(), consistent with the existing handling of
APPEND and NXTBLK.

Fixes: 1a31368bf92e ("mtd: add a flags for partitions which should just leave smth. after them")

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 drivers/mtd/mtdpart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 795a94e6b482..11cab777a1ac 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -255,7 +255,8 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 
 	/* the direct offset is expected */
 	if (offset == MTDPART_OFS_APPEND ||
-	    offset == MTDPART_OFS_NXTBLK)
+	    offset == MTDPART_OFS_NXTBLK ||
+	    offset == MTDPART_OFS_RETAIN)
 		return -EINVAL;
 
 	if (length == MTDPART_SIZ_FULL)
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
