Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9113C38A2D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 06:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RP8K1uOx1nzyXOv4HEyiDEFkK/49zWqpRx56hQQrU74=; b=uRAlv9dd4f0sgC
	gGFJASZ6Ms/zJX/aE9t50jHHl2bJOPj0Adl6tab2WMyaWne0Mnulis7u9KduEoE8xOmBk/PqGaLCa
	DLyKUNSGMkzfxrBX2qGBxrkC7maGwwNepnGSRah0inqs4ZTkuQPn5RtQm8peLZ3YNdpUJl5WvE53C
	gZsj9lDvuaIcdOuVu1LaYkRPhgjjOv6ZFneN3BZwBMcOR5MvIL7RR+mkP3s+It/AaP5A1NUyqRfYq
	us0xnvMk0T9TlVXQOzbdnxoCLHzFfnopK0nxmuRUgr8R1X+au7WWx0AEHNhAgf8xQKSFa7Gxq1f1p
	KAqNAlzBfdfriF4Y3xvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrJ0-00HLgv-HI; Mon, 24 Oct 2022 06:51:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrIv-00HLe5-2X
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 06:51:23 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mwlyf2tpbzJn2H;
	Mon, 24 Oct 2022 14:48:26 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:51:10 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<marek.vasut@gmail.com>, <jim_baxter@mentor.com>,
	<computersforpeace@gmail.com>, <Sandeep_Jain@mentor.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: core: fix possible resource leak in init_mtd()
Date: Mon, 24 Oct 2022 14:51:09 +0800
Message-ID: <20221024065109.2050705-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_235121_320275_48AAF363 
X-CRM114-Status: UNSURE (   8.43  )
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

I got the error report while inject fault in init_mtd():

sysfs: cannot create duplicate filename '/devices/virtual/bdi/mtd-0'
Call Trace:
 <TASK>
 dump_stack_lvl+0x67/0x83
 sysfs_warn_dup+0x60/0x70
 sysfs_create_dir_ns+0x109/0x120
 kobject_add_internal+0xce/0x2f0
 kobject_add+0x98/0x110
 device_add+0x179/0xc00
 device_create_groups_vargs+0xf4/0x100
 device_create+0x7b/0xb0
 bdi_register_va.part.13+0x58/0x2d0
 bdi_register+0x9b/0xb0
 init_mtd+0x62/0x171 [mtd]
 do_one_initcall+0x6c/0x3c0
 do_init_module+0x58/0x222
 load_module+0x268e/0x27d0
 __do_sys_finit_module+0xd5/0x140
 do_syscall_64+0x37/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
 </TASK>
kobject_add_internal failed for mtd-0 with -EEXIST, don't try to register
	things with the same name in the same directory.
Error registering mtd class or bdi: -17

If init_mtdchar() fails in init_mtd(), mtd_bdi will not be unregistered,
as a result, we can't load the mtd module again, to fix this by calling
bdi_unregister(mtd_bdi) after out_procfs label.

Fixes: 445caaa20c4d ("mtd: Allocate bdi objects dynamically")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 20fcedc3021e..d856892cb9b7 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2475,6 +2475,7 @@ static int __init init_mtd(void)
 out_procfs:
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
+	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 err_bdi:
 	class_unregister(&mtd_class);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
