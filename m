Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC77C27C6E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prDrJU0vkne6BlL76q5sV27ue9KcqciOwJR8Dc0OU3k=; b=n2ugfBTlWyKhUS
	JoMb5kFTiWBR/PQ5WjRaKFUw+xxivpNrirbi1aBUG9GL/v2ypsmSmQd1FXqDX+EEoC518rnZon6V3
	wEm1SckYMsSl8sdxSmh0sm0RAUU2ums12gF22F5rEhsKrgIWw9KWpRbPaRMwmjkO0ORcTWApRc60Y
	QPtFF/k6W9kFhmXyVFnUF40+KGM6FbpodUcYD+8wcEYREvEe2i/q/PiSUVhkiNrPxDvRqP6+3vJc9
	qMSbk7tqngC/bvRXreJ7+injafWzbGhuDAiKIL6J/45LjGNLRpMSxBj3aS17OX8uMOEFR+K7tbeT1
	Z9hy30+1S0m8go2sdSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBx-0000000CGLx-0jVm;
	Fri, 07 Jun 2024 04:27:05 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBj-0000000CG94-3gYI
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:26:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSjR4D24z1SB5B;
	Fri,  7 Jun 2024 12:22:51 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 543FA14038F;
	Fri,  7 Jun 2024 12:26:50 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 011/110] mkfs.ubifs: Fix missed closing out_fd
Date: Fri, 7 Jun 2024 12:24:36 +0800
Message-ID: <20240607042615.2069840-12-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212652_168878_53AE0151 
X-CRM114-Status: UNSURE (   9.16  )
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

Closing 'out_fd' is missed in handling paths in open_target(), fix it
by adding closing operations before returning.

Fixes: a48340c335dab ("mkfs.ubifs: use libubi to format UBI volume")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 6a4a4588..949187ea 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2860,12 +2860,16 @@ static int open_target(void)
 		if (out_fd == -1)
 			return sys_errmsg("cannot open the UBI volume '%s'",
 					   output);
-		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1))
+		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1)) {
+			close(out_fd);
 			return sys_errmsg("ubi_set_property(set direct_write) failed");
+		}
 
 		if (!yes && check_volume_empty()) {
-			if (!prompt("UBI volume is not empty.  Format anyways?", false))
+			if (!prompt("UBI volume is not empty.  Format anyways?", false)) {
+				close(out_fd);
 				return errmsg("UBI volume is not empty");
+			}
 		}
 	} else {
 		out_fd = open(output, O_CREAT | O_RDWR | O_TRUNC,
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
