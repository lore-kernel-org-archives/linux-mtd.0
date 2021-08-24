Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E276C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 10:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050BC6127B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 10:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 050BC6127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jXrAbSkBfNvuAX57Al8M9LnR+Mphb/b3hX8RDQSC8bc=; b=JOY9bMQ4/Qqkhw
	XpZsJVzD8mcmAW0WLoXfl9ifwG9fp8HUWMr40QeRjGF884jMrrQzguFPbDqlo8p5wlSNBFeEsYTsz
	eNB1U7BrJcOJ1VZrrVq7kAEd6bQgM6JmTjyTooi6RVvPC4f2aOV7a9Pn9OzE5YZAFWlvIJyNF6s7t
	Zdirz3xXYv7TDe8FMvEW1DlS0DfRpo65wafrhc3NRBoIOzcW8WfLZx9gZrtQwEZmcz8ITTbErFpRU
	gsB0NYwYfocggGsntDOBE0tJDzEusOb2h2tDd6aF8uEDVb4P3w/xOMPinad2QsWKf2tT+TQSFTwQE
	34sBJjgRAQpmJKV30SuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mITbi-002W1J-77; Tue, 24 Aug 2021 10:24:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mITbe-002Vzv-OZ
 for linux-mtd@lists.infradead.org; Tue, 24 Aug 2021 10:24:36 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gv4r85DFZzbhXS;
 Tue, 24 Aug 2021 18:20:40 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 18:24:29 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 24 Aug
 2021 18:24:29 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH -next] mtd: fix possible deadlock when loading and opening mtd
 device
Date: Tue, 24 Aug 2021 18:30:05 +0800
Message-ID: <20210824103005.1895457-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_032435_191496_D344A46E 
X-CRM114-Status: UNSURE (   8.32  )
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

I got the possible circular locking dependency detected report:

[   52.472106][  T483] ======================================================
[   52.473212][  T483] WARNING: possible circular locking dependency detected
[   52.474322][  T483] 5.14.0-rc6-next-20210820+ #438 Not tainted
[   52.475272][  T483] ------------------------------------------------------
[   52.476385][  T483] systemd-udevd/483 is trying to acquire lock:
[   52.477356][  T483] ffffffff8c5d45a8 (mtd_table_mutex){+.+.}-{3:3}, at: blktrans_open.cold.18+0x44/0x4b1
[   52.480510][  T483]
[   52.480510][  T483] but task is already holding lock:
[   52.481664][  T483] ffff88810eff8918 (&disk->open_mutex){+.+.}-{3:3}, at: blkdev_get_by_dev+0x428/0x910
[   52.483164][  T483]
[   52.483164][  T483] which lock already depends on the new lock.
[   52.483164][  T483]
[   52.484578][  T483]
[   52.484578][  T483] the existing dependency chain (in reverse order) is:
[   52.485803][  T483]
[   52.485803][  T483] -> #1 (&disk->open_mutex){+.+.}-{3:3}:
[   52.486888][  T483]        __mutex_lock+0x140/0x15d0
[   52.487599][  T483]        bd_register_pending_holders+0xb9/0x302
[   52.488463][  T483]        device_add_disk+0x375/0xcf0
[   52.489198][  T483]        add_mtd_blktrans_dev+0x11a4/0x16f0
[   52.490019][  T483]        mtdblock_add_mtd+0x21a/0x2b0
[   52.490771][  T483]        blktrans_notify_add+0xae/0xdb
[   52.491531][  T483]        add_mtd_device.cold.26+0xa98/0xc98
[   52.492348][  T483]        mtd_device_parse_register+0x516/0x870
[   52.493201][  T483]        mtdram_init_device+0x294/0x350
[   52.493966][  T483]        init_mtdram+0xde/0x16e
[   52.494644][  T483]        do_one_initcall+0x105/0x650
[   52.495381][  T483]        kernel_init_freeable+0x6aa/0x732
[   52.496171][  T483]        kernel_init+0x1c/0x1c0
[   52.496847][  T483]        ret_from_fork+0x1f/0x30
[   52.497530][  T483]
[   52.497530][  T483] -> #0 (mtd_table_mutex){+.+.}-{3:3}:
[   52.498591][  T483]        __lock_acquire+0x2cfa/0x5990
[   52.499343][  T483]        lock_acquire+0x1a0/0x500
[   52.500041][  T483]        __mutex_lock+0x140/0x15d0
[   52.500749][  T483]        blktrans_open.cold.18+0x44/0x4b1
[   52.501545][  T483]        blkdev_get_whole+0x9f/0x280
[   52.502282][  T483]        blkdev_get_by_dev+0x593/0x910
[   52.503041][  T483]        blkdev_open+0x154/0x2a0
[   52.503726][  T483]        do_dentry_open+0x6a9/0x1260
[   52.504461][  T483]        path_openat+0xe06/0x2850
[   52.505160][  T483]        do_filp_open+0x1b0/0x280
[   52.505857][  T483]        do_sys_openat2+0x60e/0x9a0
[   52.506576][  T483]        do_sys_open+0xca/0x140
[   52.507251][  T483]        do_syscall_64+0x38/0xb0
[   52.507936][  T483]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[   52.508822][  T483]
[   52.508822][  T483] other info that might help us debug this:
[   52.508822][  T483]
[   52.510218][  T483]  Possible unsafe locking scenario:
[   52.510218][  T483]
[   52.511240][  T483]        CPU0                    CPU1
[   52.511975][  T483]        ----                    ----
[   52.512708][  T483]   lock(&disk->open_mutex);
[   52.513342][  T483]                                lock(mtd_table_mutex);
[   52.514295][  T483]                                lock(&disk->open_mutex);
[   52.515276][  T483]   lock(mtd_table_mutex);
[   52.515884][  T483]
[   52.515884][  T483]  *** DEADLOCK ***

load module path:              open device path:
init_mtdram()
add_mtd_device()
mutex_lock(&mtd_table_mutex)
blktrans_notifier()
add_mtd()
                                blkdev_get_by_dev()
                                mutex_lock(&disk->open_mutex)
                                blktrans_open()
                                mutex_lock(&mtd_table_mutex);
bd_register_pending_holders()
mutex_lock(&disk->open_mutex)

add_mtd() is called under mtd_table_mutex, before it acquires open_mutex,
open_mutex may be acquired by another cpu when opening the device, and it
will wait for mtd_table_mutex which is already acquired, then the 'ABBA'
deadlock scenario is happend, reduce the mtd_table_mutex to avoid this.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/mtd/mtd_blkdevs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 44bea3f65060..476933ab561d 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -358,6 +358,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	list_add_tail(&new->list, &tr->devs);
  added:
 	mutex_unlock(&blktrans_ref_mutex);
+	mutex_unlock(&mtd_table_mutex);
 
 	mutex_init(&new->lock);
 	kref_init(&new->ref);
@@ -434,6 +435,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 					new->disk_attributes);
 		WARN_ON(ret);
 	}
+	mutex_lock(&mtd_table_mutex);
 	return 0;
 
 out_free_tag_set:
@@ -441,6 +443,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 out_kfree_tag_set:
 	kfree(new->tag_set);
 out_list_del:
+	mutex_lock(&mtd_table_mutex);
 	list_del(&new->list);
 	return ret;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
