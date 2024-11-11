Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7EFD5E140
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtCknkdWEYW7VLncM9Rn3pnML0DOGHyFFJBLkjHFHco=; b=FUYg6b3MuxSiWe
	PSrkahjMBZ00XhEJLj2zou+7+vxSYGsrVvn3gug/9+01jEfNu2+hrndhBHSUUNyvxwHNUoBezinwg
	UVQ2yIxfv29Lmo7RZ4eALFtxQKUPfM3t8VJjbbvRDkvIXHLKEKxNCuO2hBrN8qBfaM7ktLGn74VQp
	3ULdOHRgW51qHNfnF90TiqEQkuRJdwghaWPO1iMLWhkLEOYGxcaIqLfhF3umKFFSC+hzEBjkDPknd
	jogZDyRL2XsMP9MwRVH2H01UDxkRCAoE/4dztFYSRk2umZO2zKvGI0Icl3Edy2jE/Vmt6vgcVGuLD
	p4zbcXbJtdTgayhYY5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaj-0000000Gmdz-2sU1;
	Mon, 11 Nov 2024 08:16:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUW-0000000GZNh-2156
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pASLghQGBa96AVoh8txrr6AS6D4qy8HgXaVJDHZZC+k=; b=Ep+J2MrwrlrcFnAjsCfqHhV938
	COXf1JXWUWvjq9+M0UQ1RTATYVlQVmuTsZVSyg7EYTgNYGkYdVRAJz1DKC4okQ4fHW+XfvU5CiBzx
	JpJc5DP3NF7GjlUxtB+VgrynMrSMLcwqCEg1iZFottnsPM5c479hpwyiYz2kIvoikQQxeaLvUDDdU
	Af229SjAF56kenYFU+Ou26w2K6xj3ooB7Wjg1KpMAcy/KopwU23XfGHVfktVNF91hwmohnEA7NfzK
	BdksHtYnJFml90rNPL9B/409k7H9Kd/VFws4ofrTx5j/hUpQqOsQ0zvlYFJoJXW9dbw6N1l88JuEm
	XD7c7AvQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUS-0000000CmFK-3nJV
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn0r82G4Kz10V9v;
	Mon, 11 Nov 2024 15:03:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FAAF14035F;
	Mon, 11 Nov 2024 15:05:12 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:11 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 022/102] libubi: Add new interface ubi_leb_map()
Date: Mon, 11 Nov 2024 15:02:25 +0800
Message-ID: <20241111070346.1314122-23-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070537_640377_73B51833 
X-CRM114-Status: UNSURE (   9.30  )
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
