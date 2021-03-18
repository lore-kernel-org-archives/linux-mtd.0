Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B2EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 03:09:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7849864E89
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 03:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7849864E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q+5zBsbP4VIU3lNnzORx+W0qbFekk46J/1gflNyIt/8=; b=DL8A/pmfgJccLSeKOFqFmHcHSZ
	LqC9m60VqieVUBaUKmJ4HABNqenZXiXJrsc6vMjbkvJaf1sqtGXCnbLj3/BvfvmuX4gHrvSXIhA58
	nEFzg2kdGxPFee2ov9UtBNoHhep6Trrga7FJTK/BlmJPV/5RhlZ2hlRpA2HzInALkHQxC5z7oQUL0
	G/R/D0pxQVCBNKSSJxKTgq6q3A2rCeyDKAy8Bq4r+TyhSZUblSniTceXJ6w/kv504P1B3fQfS8crI
	uNetkfTlCT/KMoRXeo3RiXXaHTvp0XJZzevGj/ItVSjc/pwQ1J0x4v3113HeBSLbveN3MrMQD0Bra
	xmEsSAPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMj0k-004LJz-FS; Thu, 18 Mar 2021 03:07:46 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMj0L-004LID-BR
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 03:07:44 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1Bj82D5jz17MWh;
 Thu, 18 Mar 2021 11:05:16 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.50) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 11:06:59 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <lizhe67@huawei.com>, <wangfangpeng1@huawei.com>, <xukunkun1@huawei.com>, 
 <zhongjubin@huawei.com>, <chenjie6@huawei.com>
Subject: [PATCH] jffs2: fix kasan slab-out-of-bounds problem
Date: Thu, 18 Mar 2021 11:06:57 +0800
Message-ID: <20210318030657.22840-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.50]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_030742_636196_5C42B60C 
X-CRM114-Status: GOOD (  11.27  )
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

From: lizhe <lizhe67@huawei.com>

KASAN report a slab-out-of-bounds problem. The logs are listed below.
It is because in function jffs2_scan_dirent_node, we alloc "checkedlen+1"
bytes for fd->name and we check crc with length rd->nsize. If checkedlen
is less than rd->nsize, it will cause the slab-out-of-bounds problem.

jffs2: Dirent at *** has zeroes in name. Truncating to %d char
==================================================================
BUG: KASAN: slab-out-of-bounds in crc32_le+0x1ce/0x260 at addr ffff8800842cf2d1
Read of size 1 by task test_JFFS2/915
=============================================================================
BUG kmalloc-64 (Tainted: G    B      O   ): kasan: bad access detected
-----------------------------------------------------------------------------
INFO: Allocated in jffs2_alloc_full_dirent+0x2a/0x40 age=0 cpu=1 pid=915
	___slab_alloc+0x580/0x5f0
	__slab_alloc.isra.24+0x4e/0x64
	__kmalloc+0x170/0x300
	jffs2_alloc_full_dirent+0x2a/0x40
	jffs2_scan_eraseblock+0x1ca4/0x3b64
	jffs2_scan_medium+0x285/0xfe0
	jffs2_do_mount_fs+0x5fb/0x1bbc
	jffs2_do_fill_super+0x245/0x6f0
	jffs2_fill_super+0x287/0x2e0
	mount_mtd_aux.isra.0+0x9a/0x144
	mount_mtd+0x222/0x2f0
	jffs2_mount+0x41/0x60
	mount_fs+0x63/0x230
	vfs_kern_mount.part.6+0x6c/0x1f4
	do_mount+0xae8/0x1940
	SyS_mount+0x105/0x1d0
INFO: Freed in jffs2_free_full_dirent+0x22/0x40 age=27 cpu=1 pid=915
	__slab_free+0x372/0x4e4
	kfree+0x1d4/0x20c
	jffs2_free_full_dirent+0x22/0x40
	jffs2_build_remove_unlinked_inode+0x17a/0x1e4
	jffs2_do_mount_fs+0x1646/0x1bbc
	jffs2_do_fill_super+0x245/0x6f0
	jffs2_fill_super+0x287/0x2e0
	mount_mtd_aux.isra.0+0x9a/0x144
	mount_mtd+0x222/0x2f0
	jffs2_mount+0x41/0x60
	mount_fs+0x63/0x230
	vfs_kern_mount.part.6+0x6c/0x1f4
	do_mount+0xae8/0x1940
	SyS_mount+0x105/0x1d0
	entry_SYSCALL_64_fastpath+0x1e/0x97
Call Trace:
 [<ffffffff815befef>] dump_stack+0x59/0x7e
 [<ffffffff812d1d65>] print_trailer+0x125/0x1b0
 [<ffffffff812d82c8>] object_err+0x34/0x40
 [<ffffffff812dadef>] kasan_report.part.1+0x21f/0x534
 [<ffffffff81132401>] ? vprintk+0x2d/0x40
 [<ffffffff815f1ee2>] ? crc32_le+0x1ce/0x260
 [<ffffffff812db41a>] kasan_report+0x26/0x30
 [<ffffffff812d9fc1>] __asan_load1+0x3d/0x50
 [<ffffffff815f1ee2>] crc32_le+0x1ce/0x260
 [<ffffffff814764ae>] ? jffs2_alloc_full_dirent+0x2a/0x40
 [<ffffffff81485cec>] jffs2_scan_eraseblock+0x1d0c/0x3b64
 [<ffffffff81488813>] ? jffs2_scan_medium+0xccf/0xfe0
 [<ffffffff81483fe0>] ? jffs2_scan_make_ino_cache+0x14c/0x14c
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff812d5d90>] ? kmem_cache_alloc_trace+0x10c/0x2cc
 [<ffffffff818169fb>] ? mtd_point+0xf7/0x130
 [<ffffffff81487dc9>] jffs2_scan_medium+0x285/0xfe0
 [<ffffffff81487b44>] ? jffs2_scan_eraseblock+0x3b64/0x3b64
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff812d57df>] ? __kmalloc+0x12b/0x300
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff814a2753>] ? jffs2_sum_init+0x9f/0x240
 [<ffffffff8148b2ff>] jffs2_do_mount_fs+0x5fb/0x1bbc
 [<ffffffff8148ad04>] ? jffs2_del_noinode_dirent+0x640/0x640
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff81127c5b>] ? __init_rwsem+0x97/0xac
 [<ffffffff81492349>] jffs2_do_fill_super+0x245/0x6f0
 [<ffffffff81493c5b>] jffs2_fill_super+0x287/0x2e0
 [<ffffffff814939d4>] ? jffs2_parse_options+0x594/0x594
 [<ffffffff81819bea>] mount_mtd_aux.isra.0+0x9a/0x144
 [<ffffffff81819eb6>] mount_mtd+0x222/0x2f0
 [<ffffffff814939d4>] ? jffs2_parse_options+0x594/0x594
 [<ffffffff81819c94>] ? mount_mtd_aux.isra.0+0x144/0x144
 [<ffffffff81258757>] ? free_pages+0x13/0x1c
 [<ffffffff814fa0ac>] ? selinux_sb_copy_data+0x278/0x2e0
 [<ffffffff81492b35>] jffs2_mount+0x41/0x60
 [<ffffffff81302fb7>] mount_fs+0x63/0x230
 [<ffffffff8133755f>] ? alloc_vfsmnt+0x32f/0x3b0
 [<ffffffff81337f2c>] vfs_kern_mount.part.6+0x6c/0x1f4
 [<ffffffff8133ceec>] do_mount+0xae8/0x1940
 [<ffffffff811b94e0>] ? audit_filter_rules.constprop.6+0x1d10/0x1d10
 [<ffffffff8133c404>] ? copy_mount_string+0x40/0x40
 [<ffffffff812cbf78>] ? alloc_pages_current+0xa4/0x1bc
 [<ffffffff81253a89>] ? __get_free_pages+0x25/0x50
 [<ffffffff81338993>] ? copy_mount_options.part.17+0x183/0x264
 [<ffffffff8133e3a9>] SyS_mount+0x105/0x1d0
 [<ffffffff8133e2a4>] ? copy_mnt_ns+0x560/0x560
 [<ffffffff810e8391>] ? msa_space_switch_handler+0x13d/0x190
 [<ffffffff81be184a>] entry_SYSCALL_64_fastpath+0x1e/0x97
 [<ffffffff810e9274>] ? msa_space_switch+0xb0/0xe0
Memory state around the buggy address:
 ffff8800842cf180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8800842cf200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8800842cf280: fc fc fc fc fc fc 00 00 00 00 01 fc fc fc fc fc
                                                 ^
 ffff8800842cf300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8800842cf380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

Reported-by: Kunkun Xu <xukunkun1@huawei.com>
Signed-off-by: lizhe <lizhe67@huawei.com>
---
 fs/jffs2/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index db72a9d..b676056 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -1079,7 +1079,7 @@ static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblo
 	memcpy(&fd->name, rd->name, checkedlen);
 	fd->name[checkedlen] = 0;
 
-	crc = crc32(0, fd->name, rd->nsize);
+	crc = crc32(0, fd->name, checkedlen);
 	if (crc != je32_to_cpu(rd->name_crc)) {
 		pr_notice("%s(): Name CRC failed on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
 			  __func__, ofs, je32_to_cpu(rd->name_crc), crc);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
