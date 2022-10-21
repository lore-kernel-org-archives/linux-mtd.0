Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA80C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVabqiTsmnGd7xVSc8frqxPycb72iWBc2+S4uJfKbCo=; b=KLsKQJp7CiyaKg
	QpQXf6AVgiIS9JL1ZrFnpxS0fqLXr+pJQF7YtusNxbpF2ghsxy+Zeav2M/3FSH1dfpsx/KCwrQQyJ
	q9UcK6bWZRIm+v32Wl+oKMDGihyM0S3PwYMFuQ58Q3VPND4vx6sAZo1MkT5Ub41A/e6m8gyEa98fM
	KYovJsM2px2Y8UmhOooM8FRfr7S49rPYazBDfF1olzk/N9NbyLCWlr0eFRbM+jq38zfEsNM9c756s
	2GTtemirEPibOAyv3UUoxF5BFKKgxScxawoBfEUf+Dr8LNk1ZgZ5ay/Yp5LGlemw03ykmjoMTFU/2
	hGOGbNKz1P/l7J9WpaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloBf-006kGH-Kd; Fri, 21 Oct 2022 09:19:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloBc-006kCF-02
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 09:19:29 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtzS45g4yzHtwg;
	Fri, 21 Oct 2022 17:19:16 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 17:19:24 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<dedekind@linutronix.de>, <haver@vnet.ibm.com>, <bbrezillon@kernel.org>
CC: <lizetao1@huawei.com>, <boris.brezillon@free-electrons.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()
Date: Fri, 21 Oct 2022 18:21:57 +0800
Message-ID: <20221021102157.1341807-3-lizetao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221021102157.1341807-1-lizetao1@huawei.com>
References: <20221021102157.1341807-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_021928_278064_C6F7327F 
X-CRM114-Status: UNSURE (   8.82  )
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

There is a memory leaks problem reported by kmemleak:

unreferenced object 0xffff888102007a00 (size 128):
  comm "ubirsvol", pid 32090, jiffies 4298464136 (age 2361.231s)
  hex dump (first 32 bytes):
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
  backtrace:
[<ffffffff8176cecd>] __kmalloc+0x4d/0x150
[<ffffffffa02a9a36>] ubi_eba_create_table+0x76/0x170 [ubi]
[<ffffffffa029764e>] ubi_resize_volume+0x1be/0xbc0 [ubi]
[<ffffffffa02a3321>] ubi_cdev_ioctl+0x701/0x1850 [ubi]
[<ffffffff81975d2d>] __x64_sys_ioctl+0x11d/0x170
[<ffffffff83c142a5>] do_syscall_64+0x35/0x80
[<ffffffff83e0006a>] entry_SYSCALL_64_after_hwframe+0x46/0xb0

This is due to a mismatch between create and destroy interfaces, and
in detail that "new_eba_tbl" created by ubi_eba_create_table() but
destroyed by kfree(), while will causing "new_eba_tbl->entries" not
freed.

Fix it by replacing kfree(new_eba_tbl) with
ubi_eba_destroy_table(new_eba_tbl)

Fixes: 799dca34ac54 ("UBI: hide EBA internals")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/ubi/vmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 74637575346e..9fbc64b997ce 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -515,7 +515,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 	return err;
 
 out_free:
-	kfree(new_eba_tbl);
+	ubi_eba_destroy_table(new_eba_tbl);
 	return err;
 }
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
