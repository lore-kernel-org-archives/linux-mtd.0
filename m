Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8116CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=piDxp7JtGXll7rAdGUD54rIay3Y5DxPNqazdpDsGQM8=; b=JfLveXcd11wqsp
	shLPHl6fBSA27VKKbvrv/9J7tPx4IT0U4/yF8rSN8Sblpnb6ff0yUD1zsrR+9MsKASX/c0GjRdcU1
	QkQnB/ivkC2YWl8i1ocadN9TiRDLG0BUWyRvsqFdjUtGlORJnjsO0BXYSTacocLH+zKa/0lN65n4m
	CsFm4836o4O3BEhSardOq1Xx3fwuP9ACj6EPZ7SuJDr5dXF6yOGicg+OXqsPx0LLn7bdZ1bKbSL3k
	VGHrVRkTkn+uEfKM1RK35T/rFQ6H7jctpt1MuvpNvhOPLg/cZxHavdEb4DOdlbqtw292SlXespxGH
	io4eszm+IjD9FJ03vf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJHT-0000000H2AK-0U2U;
	Fri, 07 Nov 2025 10:01:19 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJHL-0000000H295-10Zl;
	Fri, 07 Nov 2025 10:01:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7kX1Xy2V1MN3IMg82+bocMlGGOsUiexNBkEAtBouJgU=;
	b=NzQFRO5Gm300s7UctdcQgLIGYzyHgX6kdO8MUmXHveqhUE/YrMrn0ZyOV/E4bg2iWkPI2EHD/
	ltJWoV/VSBpfpe6X4Y165XAbaJ1wMvnUBuDMgR6pE1iZS92N+siBr0sgk9keQvnL33vQCw3mZK8
	4CphrojZy9QXAtvf+u6uYII=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4d2vfk0xVGz1prlB;
	Fri,  7 Nov 2025 17:59:26 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 344CB1402FC;
	Fri,  7 Nov 2025 18:01:03 +0800 (CST)
Received: from kwepemq100008.china.huawei.com (7.202.195.91) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 18:01:03 +0800
Received: from DESKTOP-DKE2JV6.huawei.com (10.67.110.146) by
 kwepemq100008.china.huawei.com (7.202.195.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 18:01:02 +0800
From: Liyuan Pang <pangliyuan1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <markus.elfring@web.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <wanqian10@huawei.com>,
	<young.liuyang@huawei.com>, Liyuan Pang <pangliyuan1@huawei.com>
Subject: [PATCH v2] ubi: fastmap: fix ubi->fm memory leak
Date: Fri, 7 Nov 2025 18:00:57 +0800
Message-ID: <20251107100057.1091153-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100008.china.huawei.com (7.202.195.91)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_020111_917074_903F7D0F 
X-CRM114-Status: GOOD (  17.20  )
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

The problem is that scan_fast() allocate memory for ubi->fm
and ubi->fm->e[x], but if the following attach process fails
in ubi_wl_init or ubi_read_volume_table, the whole attach
process will fail without executing ubi_wl_close to free the
memory under ubi->fm.

Fix this by add a new ubi_free_fastmap function in fastmap.c
to free the memory allocated for fm.

If SLUB_DEBUG and KUNIT are enabled, the following warning messages
will show:
ubi0: detaching mtd0
ubi0: mtd0 is detached
ubi0: default fastmap pool size: 200
ubi0: default fastmap WL pool size: 100
ubi0: attaching mtd0
ubi0: attached by fastmap
ubi0: fastmap pool size: 200
ubi0: fastmap WL pool size: 100
ubi0 error: ubi_wl_init [ubi]: no enough physical eraseblocks (4, need 203)
ubi0 error: ubi_attach_mtd_dev [ubi]: failed to attach mtd0, error -28
UBI error: cannot attach mtd0
=================================================================
BUG ubi_wl_entry_slab (Tainted: G    B      O L   ): Objects remaining in ubi_wl_entry_slab on __kmem_cache_shutdown()
-----------------------------------------------------------------------------

Slab 0xffff2fd23a40cd00 objects=22 used=1 fp=0xffff2fd1d0334fd8 flags=0x883fffc010200(slab|head|section=34|node=0|zone=1|lastcpupid=0x7fff)
CPU: 0 PID: 5884 Comm: insmod Tainted: G    B      O L    5.10.0 #1
Hardware name: LS1043A RDB Board (DT)
Call trace:
 dump_backtrace+0x0/0x198
 show_stack+0x18/0x28
 dump_stack+0xe8/0x15c
 slab_err+0x94/0xc0
 __kmem_cache_shutdown+0x1fc/0x39c
 kmem_cache_destroy+0x48/0x138
 ubi_init+0x1d4/0xf34 [ubi]
 do_one_initcall+0xb4/0x24c
 do_init_module+0x4c/0x1dc
 load_module+0x212c/0x2260
 __se_sys_finit_module+0xb4/0xd8
 __arm64_sys_finit_module+0x18/0x28
 el0_svc_common.constprop.0+0x78/0x1a0
 do_el0_svc+0x78/0x90
 el0_svc+0x20/0x38
 el0_sync_handler+0xf0/0x140
 normal+0x3d8/0x400
Object 0xffff2fd1d0334e68 @offset=3688
Allocated in ubi_scan_fastmap+0xf04/0xf40 [ubi] age=80 cpu=0 pid=5884
	__slab_alloc.isra.21+0x6c/0xb4
	kmem_cache_alloc+0x1e4/0x80c
	ubi_scan_fastmap+0xf04/0xf40 [ubi]
	ubi_attach+0x1f0/0x3a8 [ubi]
	ubi_attach_mtd_dev+0x810/0xbc8 [ubi]
	ubi_init+0x238/0xf34 [ubi]
	do_one_initcall+0xb4/0x24c
	do_init_module+0x4c/0x1dc
	load_module+0x212c/0x2260
	__se_sys_finit_module+0xb4/0xd8
	__arm64_sys_finit_module+0x18/0x28
	el0_svc_common.constprop.0+0x78/0x1a0
	do_el0_svc+0x78/0x90
	el0_svc+0x20/0x38
	el0_sync_handler+0xf0/0x140
	normal+0x3d8/0x400

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220744

Signed-off-by: Liyuan Pang <pangliyuan1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---

Changes in v2:
* reduce the scope of variable "i" to the code block of the if branch
* make ubi_free_fastmap an static inline function
* link to v1:
  https://lore.kernel.org/linux-mtd/20251107093843.1077536-1-pangliyuan1@huawei.com/T/#t
---
 drivers/mtd/ubi/attach.c     |  4 +++-
 drivers/mtd/ubi/fastmap-wl.c |  8 +-------
 drivers/mtd/ubi/ubi.h        | 12 ++++++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index adc47b87b38a..884171871d0e 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1600,7 +1600,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 
 	err = ubi_read_volume_table(ubi, ai);
 	if (err)
-		goto out_ai;
+		goto out_fm;
 
 	err = ubi_wl_init(ubi, ai);
 	if (err)
@@ -1642,6 +1642,8 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 out_vtbl:
 	ubi_free_all_volumes(ubi);
 	vfree(ubi->vtbl);
+out_fm:
+	ubi_free_fastmap(ubi);
 out_ai:
 	destroy_ai(ai);
 	return err;
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 9bdb6525f128..e2bc1122bfd3 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -530,8 +530,6 @@ int ubi_is_erase_work(struct ubi_work *wrk)
 
 static void ubi_fastmap_close(struct ubi_device *ubi)
 {
-	int i;
-
 	return_unused_pool_pebs(ubi, &ubi->fm_pool);
 	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
 
@@ -540,11 +538,7 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 		ubi->fm_anchor = NULL;
 	}
 
-	if (ubi->fm) {
-		for (i = 0; i < ubi->fm->used_blocks; i++)
-			kfree(ubi->fm->e[i]);
-	}
-	kfree(ubi->fm);
+	ubi_free_fastmap(ubi);
 }
 
 /**
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c792b9bcab9b..44803d3329f4 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -969,10 +969,22 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		     struct ubi_attach_info *scan_ai);
 int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count);
 void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol);
+static inline void ubi_free_fastmap(struct ubi_device *ubi)
+{
+	if (ubi->fm) {
+		int i;
+
+		for (i = 0; i < ubi->fm->used_blocks; i++)
+			kmem_cache_free(ubi_wl_entry_slab, ubi->fm->e[i]);
+		kfree(ubi->fm);
+		ubi->fm = NULL;
+	}
+}
 #else
 static inline int ubi_update_fastmap(struct ubi_device *ubi) { return 0; }
 static inline int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count) { return 0; }
 static inline void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol) {}
+static inline void ubi_free_fastmap(struct ubi_device *ubi) { }
 #endif
 
 /* block.c */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
