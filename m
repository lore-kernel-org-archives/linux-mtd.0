Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA29ACD4938
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 02:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iRqxxdPHrpXKzm9s3Y9RdTZ02dJ9zkwir512kp6b1EU=; b=ve4fO3B2tHLrlv
	4eJsNVp3RE/juZL19gCBtdGfa+MZhiqYVWAtxjA+LezjUXcSZp/aMCPpUTf1SHyoZNIJvfAeQVrfr
	CINJ9LKDKHixJyZrexIomvAiq0Ki6uStrEVqV9dra3273nncB6vtJhljw73FWqm4uUzPy7FakgrcA
	43VesTEOLH54W4PgbLCbpEsbYayQ9rJasnsKdLL/NR3Vo1lti2Zyu/ABUxIYkLMjxggAYvFRCPfYb
	0vjsR4PUAV2BBeNkuDRFayP7oQzvnfXzKA6JPxOcIjll8WVo5/xiLKPCmtS1ody7fk5aaPy4Fw487
	KGnFgutsvQQ5btSDfMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj95E-004j5Q-2w;
	Thu, 21 Sep 2023 02:06:24 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj95B-004j2y-1I
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 02:06:23 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RrdvG3dRgzNnk6;
	Thu, 21 Sep 2023 10:02:18 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 21 Sep
 2023 10:06:04 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<chaitanya.kulkarni@wdc.com>, <axboe@kernel.dk>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next] ubi: block: Fix use-after-free in ubiblock_cleanup
Date: Thu, 21 Sep 2023 10:01:42 +0800
Message-ID: <20230921020142.2562687-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_190621_790933_FCEAED57 
X-CRM114-Status: GOOD (  11.08  )
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

The following BUG is reported when a ubiblock is removed:

 ==================================================================
 BUG: KASAN: slab-use-after-free in ubiblock_cleanup+0x88/0xa0 [ubi]
 Read of size 4 at addr ffff88810c8f3804 by task ubiblock/1716

 CPU: 5 PID: 1716 Comm: ubiblock Not tainted 6.6.0-rc2+ #135
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20190727_073836-buildvm-ppc64le-16.ppc.fedoraproject.org-3.fc31 04/01/2014
 Call Trace:
  <TASK>
  dump_stack_lvl+0x37/0x50
  print_report+0xd0/0x620
  kasan_report+0xb6/0xf0
  ubiblock_cleanup+0x88/0xa0 [ubi]
  ubiblock_remove+0x121/0x190 [ubi]
  vol_cdev_ioctl+0x355/0x630 [ubi]
  __x64_sys_ioctl+0xc7/0x100
  do_syscall_64+0x3f/0x90
  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
 RIP: 0033:0x7f08d7445577
 Code: b3 66 90 48 8b 05 11 89 2c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e1 8
 RSP: 002b:00007ffde05a3018 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
 RAX: ffffffffffffffda RBX: 00000000ffffffff RCX: 00007f08d7445577
 RDX: 0000000000000000 RSI: 0000000000004f08 RDI: 0000000000000003
 RBP: 0000000000816010 R08: 00000000008163a7 R09: 0000000000000000
 R10: 0000000000000003 R11: 0000000000000206 R12: 0000000000000003
 R13: 00007ffde05a3130 R14: 0000000000000000 R15: 0000000000000000
  </TASK>

 Allocated by task 1715:
  kasan_save_stack+0x22/0x50
  kasan_set_track+0x25/0x30
  __kasan_kmalloc+0x7f/0x90
  __alloc_disk_node+0x40/0x2b0
  __blk_mq_alloc_disk+0x3e/0xb0
  ubiblock_create+0x2ba/0x620 [ubi]
  vol_cdev_ioctl+0x581/0x630 [ubi]
  __x64_sys_ioctl+0xc7/0x100
  do_syscall_64+0x3f/0x90
  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

 Freed by task 0:
  kasan_save_stack+0x22/0x50
  kasan_set_track+0x25/0x30
  kasan_save_free_info+0x2b/0x50
  __kasan_slab_free+0x10e/0x190
  __kmem_cache_free+0x96/0x220
  bdev_free_inode+0xa4/0xf0
  rcu_core+0x496/0xec0
  __do_softirq+0xeb/0x384

 The buggy address belongs to the object at ffff88810c8f3800
  which belongs to the cache kmalloc-1k of size 1024
 The buggy address is located 4 bytes inside of
  freed 1024-byte region [ffff88810c8f3800, ffff88810c8f3c00)

 The buggy address belongs to the physical page:
 page:00000000d03de848 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10c8f0
 head:00000000d03de848 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
 flags: 0x200000000000840(slab|head|node=0|zone=2)
 page_type: 0xffffffff()
 raw: 0200000000000840 ffff888100042dc0 ffffea0004244400 dead000000000002
 raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
 page dumped because: kasan: bad access detected

 Memory state around the buggy address:
  ffff88810c8f3700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff88810c8f3780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 >ffff88810c8f3800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                    ^
  ffff88810c8f3880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88810c8f3900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ==================================================================

Fix it by using a local variable to record the gendisk ID.

Fixes: 77567b25ab9f ("ubi: use blk_mq_alloc_disk and blk_cleanup_disk")
Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/block.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 437c5b83ffe5..309a42aeaa4c 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -447,13 +447,15 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 static void ubiblock_cleanup(struct ubiblock *dev)
 {
+	int id = dev->gd->first_minor;
+
 	/* Stop new requests to arrive */
 	del_gendisk(dev->gd);
 	/* Finally destroy the blk queue */
 	dev_info(disk_to_dev(dev->gd), "released");
 	put_disk(dev->gd);
 	blk_mq_free_tag_set(&dev->tag_set);
-	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
+	idr_remove(&ubiblock_minor_idr, id);
 }
 
 int ubiblock_remove(struct ubi_volume_info *vi)
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
