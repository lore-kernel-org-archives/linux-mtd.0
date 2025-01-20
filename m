Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E65CC02185
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 04:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XpSe8Dam7ccxcddQpTybHt7sDYwr7Pa8qDGP4zUvq0=; b=awniPJDE5L3xAV
	xMymLEOUhkHUFnFzkDYvgvKDTuruc/mZI5yRi3Vn24pUjK1ComTs19wslIhptpLYs/u7RhDLjCbSR
	mQ1vjE7k82JHw2Pj7d58hkUHw34vnslOZEBXh1Xq8y2I7eAQw+tPAq2RS5nxRnMehfJQoRGZjU7F9
	n7gsbcSBzb91CZMshvpyIxFyOPekKY2jtHS7P/Q1sYncgF4yqPXdHiqHsSlrA6Iy0N6zBuerZE3CG
	PpyXVWlJljN95M8Ak4Xd8sIEVnJajI19ZKU1dHe2j3R7jbt/5t6xO4nL8DsdrJQGKD+gAQeo+Y087
	tqEDD6Ylq4Ty6mnTX6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjdW-00000004iuD-4BlL;
	Mon, 20 Jan 2025 04:43:43 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjdS-00000004isF-34vz
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 04:43:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YbyLh5rWTz1V57y;
	Mon, 20 Jan 2025 12:40:12 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B68681402C7;
	Mon, 20 Jan 2025 12:43:29 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Jan
 2025 12:43:28 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<rickard.andersson@axis.com>, <aou@eecs.berkeley.edu>
CC: <linux-mtd@lists.infradead.org>, <chengzhihao1@huawei.com>,
	<yi.zhang@huawei.com>
Subject: [PATCH -rw-ubifs:next] ubi: ubi_get_ec_info: Fix compiling error 'cast specifies array type'
Date: Mon, 20 Jan 2025 12:38:24 +0800
Message-ID: <20250120043824.128102-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_204339_011926_3018783B 
X-CRM114-Status: UNSURE (   9.71  )
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

On risc V platform, there is a type conversion for the return value
(unsigned long type) of __untagged_addr_remote() in function
untagged_addr(). The compiler will complain when the parameter 'addr'
is an array type:
  arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array type
  (__force  __typeof__(addr))__untagged_addr_remote(current->mm, __addr)

Fix it by converting the input parameter as a pointer.

Fixes: 01099f635a4c ("ubi: Implement ioctl for detailed erase counters")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501191405.WYnmdL0U-lkp@intel.com/
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/cdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 4c3e4edb6853..b700a0efaa93 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -851,7 +851,8 @@ static int ubi_get_ec_info(struct ubi_device *ubi, struct ubi_ecinfo_req __user
 		end_peb = ubi->peb_count;
 
 	/* Check access rights before filling erase_counters array */
-	if (!access_ok(ureq->erase_counters, (end_peb-req.start) * sizeof(int32_t)))
+	if (!access_ok((void __user *)ureq->erase_counters,
+		       (end_peb-req.start) * sizeof(int32_t)))
 		return -EFAULT;
 
 	/* Fill erase counter array */
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
