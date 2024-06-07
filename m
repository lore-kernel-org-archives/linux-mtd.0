Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF746C41513
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWpcfYjkzJiZJpUbtVluUyUYhuH3RKUY7YJdEOlEw5c=; b=vrDNQ4FYIJXkEp
	Z5REUq3EPiDkdcybhtLbbw3jMQR0c9LH2W/xf3fAGlUbYukZTgrYMiRlcUV9XIsGWdfKdfJhC8BBI
	B/TNSB0Y5sUdcN78Yt7ZFHcZMDU+/ThqvusQQDrgRgYcBKMUArnEomDmj+ov8VC7jJ9Lde4t7O5f2
	4DfgRpIp/dtLcPK/aX7Cc5U/dTQbTMmODI61B/m2c+EcKaCzE55mvbfd1TgZwyeW8Ke1aPGF39a3a
	mKxHByI6pcwSM9lRCF5s+cQRevWAnLawYlrgeHXkWiJ3ud9wWBedYW3A76nI1wwMV9xebLPHE5BHw
	ewMeIJ7+P6xaD4VgO6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBi-0000000CG92-3j19;
	Fri, 07 Jun 2024 04:26:50 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBc-0000000CG3u-0mgG
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:26:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSj0733yzwSCp;
	Fri,  7 Jun 2024 12:22:28 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id DE32418007B;
	Fri,  7 Jun 2024 12:26:27 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:27 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 001/110] mkfs.ubifs: Clear direct_write property when closing target
Date: Fri, 7 Jun 2024 12:24:26 +0800
Message-ID: <20240607042615.2069840-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212644_531987_D069DBF0 
X-CRM114-Status: GOOD (  11.76  )
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

Direct writing is not allowd on an UBI volume, unless the volume is set
with direct_write property. The open_target sets direct_write property,
don't forget to clear direct_write property for UBI volume when closing
target.

Fixes: a48340c335dab ("mkfs.ubifs: use libubi to format UBI volume")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 42a47f83..5ca01512 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2832,7 +2832,7 @@ static int open_target(void)
 			return sys_err_msg("cannot open the UBI volume '%s'",
 					   output);
 		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1))
-			return sys_err_msg("ubi_set_property failed");
+			return sys_err_msg("ubi_set_property(set direct_write) failed");
 
 		if (!yes && check_volume_empty()) {
 			if (!prompt("UBI volume is not empty.  Format anyways?", false))
@@ -2859,10 +2859,14 @@ static int open_target(void)
  */
 static int close_target(void)
 {
+	if (out_fd >= 0) {
+		if (ubi && ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 0))
+			return sys_err_msg("ubi_set_property(clear direct_write) failed");
+		if (close(out_fd) == -1)
+			return sys_err_msg("cannot close the target '%s'", output);
+	}
 	if (ubi)
 		libubi_close(ubi);
-	if (out_fd >= 0 && close(out_fd) == -1)
-		return sys_err_msg("cannot close the target '%s'", output);
 	if (output)
 		free(output);
 	return 0;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
