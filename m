Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D3C7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2jxQH3vR5Zd4PY1uVupgMoM5fY9w3J2PyaB3MW+Qbk=; b=37mYqPWV85CfJE
	g58X9VB8MF6FmtzSKYLORHKNOA6YWOEJ6TAmi+FkHjjN4dX5ylmb3Bpt9EG3TeCWzqzLw8qD15Nr5
	4wZO5rcwPBOMSKtx1GhOQzPbfMObSq2Wf7P3RcWFOs5/PEQ9taO/+RqTqZQrsu6DKlTGFIx9Qsmg1
	njTy4zQ8y/6ei/4/du2n7AbCGyfIaDFr3pKdA1IJINZ/8YKHnTS0fLaPvXXFYGwE+W8daQizJL2UE
	bBcEOLD/ymoW22IPW7xQMNVZxTlXlEQZQEdBWK+/yBQIs+QwfgGkqqWUxCXiw5lj+jsrKHJrF7RpY
	vgEOalmEJ5+Ia7bezOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJog-006bIH-0N;
	Thu, 06 Apr 2023 07:13:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJoa-006bFB-22
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 07:13:51 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PsXlM65T3zKr98;
	Thu,  6 Apr 2023 15:13:03 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Apr
 2023 15:13:41 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 1/2] ubi: fix slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130
Date: Thu, 6 Apr 2023 15:13:30 +0800
Message-ID: <20230406071331.1247429-2-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
References: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_001349_007393_AE85AF83 
X-CRM114-Status: GOOD (  16.24  )
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

From: Guo Xuenan <guoxuenan@huawei.com>

When using ioctl interface to resize ubi volume, ubi_resize_volume will
resize eba table first, but not change vol->reserved_pebs in the same
atomic context which may cause concurrency access eba table.

For example, When user do shrink ubi volume A calling ubi_resize_volume,
while the other thread is writing (volume B) and triggering wear-leveling,
which may calling ubi_write_fastmap, under these circumstances, KASAN may
report: slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130.

The main work of this patch include:
1. fix races in ubi_resize_volume and ubi_update_fastmap, to avoid
   eba_tbl read out of bounds. first, we make eba_tbl and reserved_pebs
   updating under the protect of vol->volumes_lock. second, rollback
   volume in case of resize failure. Also mention that for volume
   shrinking failure, since part of volume has been shrunk and unmapped,
   there is no need to recover {rsvd/avail}_pebs.
2. fix some memleak in error path of ubi_resize_volume when destroy
   new_eba_tbl.

==================================================================
BUG: KASAN: slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130 [ubi]
Read of size 4 at addr ffff88800f43f570 by task kworker/u16:0/7
CPU: 0 PID: 7 Comm: kworker/u16:0 Not tainted 5.16.0-rc7 #3
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
Workqueue: writeback wb_workfn (flush-ubifs_0_0)
Call Trace:
 <TASK>
 dump_stack_lvl+0x4d/0x66
 print_address_description.constprop.0+0x41/0x60
 kasan_report.cold+0x83/0xdf
 ubi_eba_get_ldesc+0xfb/0x130 [ubi]
 ubi_update_fastmap.cold+0x60f/0xc7d [ubi]
 ubi_wl_get_peb+0x25b/0x4f0 [ubi]
 try_write_vid_and_data+0x9a/0x4d0 [ubi]
 ubi_eba_write_leb+0x7e4/0x17d0 [ubi]
 ubi_leb_map+0x1a0/0x2c0 [ubi]
 ubifs_leb_map+0x139/0x270 [ubifs]
 ubifs_add_bud_to_log+0xb40/0xf30 [ubifs]
 make_reservation+0x86e/0xb00 [ubifs]
 ubifs_jnl_write_data+0x430/0x9d0 [ubifs]
 do_writepage+0x1d1/0x550 [ubifs]
 ubifs_writepage+0x37c/0x670 [ubifs]
 __writepage+0x67/0x170
 write_cache_pages+0x259/0xa90
 do_writepages+0x277/0x5d0
 __writeback_single_inode+0xb8/0x850
 writeback_sb_inodes+0x4b3/0xb20
 __writeback_inodes_wb+0xc1/0x220
 wb_writeback+0x59f/0x740
 wb_workfn+0x6d0/0xca0
 process_one_work+0x711/0xfc0
 worker_thread+0x95/0xd00
 kthread+0x3a6/0x490
 ret_from_fork+0x1f/0x30
 </TASK>

Allocated by task 711:
 kasan_save_stack+0x1e/0x50
 __kasan_kmalloc+0x81/0xa0
 ubi_eba_create_table+0x88/0x1a0 [ubi]
 ubi_resize_volume.cold+0x175/0xae7 [ubi]
 ubi_cdev_ioctl+0x57f/0x1a60 [ubi]
 __x64_sys_ioctl+0x13a/0x1c0
 do_syscall_64+0x35/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Last potentially related work creation:
 kasan_save_stack+0x1e/0x50
 __kasan_record_aux_stack+0xb7/0xc0
 call_rcu+0xd6/0x1000
 blk_stat_free_callback+0x28/0x30
 blk_release_queue+0x8a/0x2e0
 kobject_put+0x186/0x4c0
 scsi_device_dev_release_usercontext+0x620/0xbd0
 execute_in_process_context+0x2f/0x120
 device_release+0xa4/0x240
 kobject_put+0x186/0x4c0
 put_device+0x20/0x30
 __scsi_remove_device+0x1c3/0x300
 scsi_probe_and_add_lun+0x2140/0x2eb0
 __scsi_scan_target+0x1f2/0xbb0
 scsi_scan_channel+0x11b/0x1a0
 scsi_scan_host_selected+0x24c/0x310
 do_scsi_scan_host+0x1e0/0x250
 do_scan_async+0x45/0x490
 async_run_entry_fn+0xa2/0x530
 process_one_work+0x711/0xfc0
 worker_thread+0x95/0xd00
 kthread+0x3a6/0x490
 ret_from_fork+0x1f/0x30
The buggy address belongs to the object at ffff88800f43f500
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 112 bytes inside of
 128-byte region [ffff88800f43f500, ffff88800f43f580)
The buggy address belongs to the page:
page:ffffea00003d0f00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf43c
head:ffffea00003d0f00 order:2 compound_mapcount:0 compound_pincount:0
flags: 0x1fffff80010200(slab|head|node=0|zone=1|lastcpupid=0x1fffff)
raw: 001fffff80010200 ffffea000046ba08 ffffea0000457208 ffff88810004d1c0
raw: 0000000000000000 0000000000190019 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
Memory state around the buggy address:
 ffff88800f43f400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88800f43f480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88800f43f500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc
                                                             ^
 ffff88800f43f580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88800f43f600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

The following steps can used to reproduce:
Process 1: write and trigger ubi wear-leveling
    ubimkvol /dev/ubi0 -s 5000MiB -N v1
    ubimkvol /dev/ubi0 -s 2000MiB -N v2
    ubimkvol /dev/ubi0 -s 10MiB -N v3
    mount -t ubifs /dev/ubi0_0 /mnt/ubifs
    while true;
    do
        filename=/mnt/ubifs/$((RANDOM))
        dd if=/dev/random of=${filename} bs=1M count=$((RANDOM % 1000))
        rm -rf ${filename}
        sync /mnt/ubifs/
    done

Process 2: do random resize
    struct ubi_rsvol_req req;
    req.vol_id = 1;
    req.bytes = (rand() % 50) * 512KB;
    ioctl(fd, UBI_IOCRSVOL, &req);

Signed-off-by: Guo Xuenan <guoxuenan@huawei.com>
Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/vmt.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 2c867d16f89f..97294def01eb 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -408,6 +408,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 	struct ubi_device *ubi = vol->ubi;
 	struct ubi_vtbl_record vtbl_rec;
 	struct ubi_eba_table *new_eba_tbl = NULL;
+	struct ubi_eba_table *old_eba_tbl = NULL;
 	int vol_id = vol->vol_id;
 
 	if (ubi->ro_mode)
@@ -453,10 +454,13 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 			err = -ENOSPC;
 			goto out_free;
 		}
+
 		ubi->avail_pebs -= pebs;
 		ubi->rsvd_pebs += pebs;
 		ubi_eba_copy_table(vol, new_eba_tbl, vol->reserved_pebs);
-		ubi_eba_replace_table(vol, new_eba_tbl);
+		old_eba_tbl = vol->eba_tbl;
+		vol->eba_tbl = new_eba_tbl;
+		vol->reserved_pebs = reserved_pebs;
 		spin_unlock(&ubi->volumes_lock);
 	}
 
@@ -471,7 +475,9 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 		ubi->avail_pebs -= pebs;
 		ubi_update_reserved(ubi);
 		ubi_eba_copy_table(vol, new_eba_tbl, reserved_pebs);
-		ubi_eba_replace_table(vol, new_eba_tbl);
+		old_eba_tbl = vol->eba_tbl;
+		vol->eba_tbl = new_eba_tbl;
+		vol->reserved_pebs = reserved_pebs;
 		spin_unlock(&ubi->volumes_lock);
 	}
 
@@ -493,7 +499,6 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 	if (err)
 		goto out_acc;
 
-	vol->reserved_pebs = reserved_pebs;
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 		vol->used_ebs = reserved_pebs;
 		vol->last_eb_bytes = vol->usable_leb_size;
@@ -501,19 +506,24 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 			(long long)vol->used_ebs * vol->usable_leb_size;
 	}
 
+	/* destroy old table */
+	ubi_eba_destroy_table(old_eba_tbl);
 	ubi_volume_notify(ubi, vol, UBI_VOLUME_RESIZED);
 	self_check_volumes(ubi);
 	return err;
 
 out_acc:
+	spin_lock(&ubi->volumes_lock);
+	vol->reserved_pebs = reserved_pebs - pebs;
 	if (pebs > 0) {
-		spin_lock(&ubi->volumes_lock);
 		ubi->rsvd_pebs -= pebs;
 		ubi->avail_pebs += pebs;
-		spin_unlock(&ubi->volumes_lock);
+		ubi_eba_copy_table(vol, old_eba_tbl, vol->reserved_pebs);
+	} else {
+		ubi_eba_copy_table(vol, old_eba_tbl, reserved_pebs);
 	}
-	return err;
-
+	vol->eba_tbl = old_eba_tbl;
+	spin_unlock(&ubi->volumes_lock);
 out_free:
 	ubi_eba_destroy_table(new_eba_tbl);
 	return err;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
