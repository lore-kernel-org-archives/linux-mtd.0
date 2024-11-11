Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4A6D2E9C7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtCknkdWEYW7VLncM9Rn3pnML0DOGHyFFJBLkjHFHco=; b=ztIVb5/xqwTQUj
	k9Xnm2/9FT4w5w84XrTVS1Uc9JdsVmgkshNLD7p07r1wI8tCtiiNtEUSnnh8aLrq6rbPCwtwYrNS6
	w7qeBhgnnTR2w4mSX7ImOWtSxN1Jcz8vn/V9ygPf04fK3dgVKfo6lsKhar+scehsc0X/tjhoBdl8u
	IIw4uWT+LoczVgGKfcP9NeN0TI7+POCx6T9AxSzFOqDziJfp8Cz/cbFplK0mgULlYzNuHptgC8M5Q
	SosIcwMsFD0zsFyg2UfeUwQZY/43ZusomrVn7qkIlWoWTEvn5P1D4QlkbJ4d4Rm5kJCnncwoiwQYR
	UcDSzFVoyOxi1Xy7eC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQWQ-0000000H3Jn-1DbY;
	Mon, 11 Nov 2024 09:15:46 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSb-0000000GjYC-1E9l
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:07:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn2Gd6VKnz1ypVr;
	Mon, 11 Nov 2024 16:07:53 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C1DA51401F4;
	Mon, 11 Nov 2024 16:07:42 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:07:38 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 022/102] libubi: Add new interface ubi_leb_map()
Date: Mon, 11 Nov 2024 16:05:52 +0800
Message-ID: <20241111080621.1394382-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_000745_813562_C619ECE0 
X-CRM114-Status: UNSURE (   8.98  )
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

Add ubi_leb_map() implementation, it is used in UBIFS linux kernel libs.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 include/libubi.h | 15 +++++++++++++++
 lib/libubi.c     | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/libubi.h b/include/libubi.h
index 9cb5037b..b5b3d8f3 100644
--- a/include/libubi.h
+++ b/include/libubi.h
@@ -487,6 +487,21 @@ int ubi_leb_unmap(int fd, int lnum);
  */
 int ubi_is_mapped(int fd, int lnum);
 
+/**
+ * ubi_leb_map - map logical eraseblock to a physical eraseblock.
+ * @fd: volume character device file descriptor
+ * @lnum: logical eraseblock number
+ *
+ * This function maps an un-mapped logical eraseblock @lnum to a physical
+ * eraseblock. This means, that after a successful invocation of this
+ * function the logical eraseblock @lnum will be empty (contain only %0xFF
+ * bytes) and be mapped to a physical eraseblock, even if an unclean reboot
+ * happens.
+ *
+ * This function returns zero in case of success, %-1 in case of failures.
+ */
+int ubi_leb_map(int fd, int lnum);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/lib/libubi.c b/lib/libubi.c
index 6b57e50d..86736dd5 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -1364,3 +1364,13 @@ int ubi_is_mapped(int fd, int lnum)
 {
 	return ioctl(fd, UBI_IOCEBISMAP, &lnum);
 }
+
+int ubi_leb_map(int fd, int lnum)
+{
+	struct ubi_map_req r;
+
+	memset(&r, 0, sizeof(struct ubi_map_req));
+	r.lnum = lnum;
+
+	return ioctl(fd, UBI_IOCEBMAP, &r);
+}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
