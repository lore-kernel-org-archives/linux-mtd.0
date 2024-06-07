Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9E4C27C6E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndF0N/zQfrOAWd2QUjWqVdSEHzpwUycb8E7ofgBzfU4=; b=kMQmYKpZBiK9C1
	vsnSFCo/ZTif5zxMTifdgl6wrqiDLkNmyU9fRXdwuNjly+XnqqlGPd66Cc+YSAeJK7vKjKWf7M8zm
	Q24pVcypaFa49s4eCTL2vAZITofG9uvsKTR3vTlMAMBIV9ssA/q9/C8lVI822pCFE0ISdMQCwOozn
	DaSZ+PgULjQaqI3Dd75IU43A58HSxqhw956D3nwmYGBJfHxK88yoNcN9HiPN/kKk+Hj3DbX4AN8nf
	iL5Cj7gbEm+A7QmVbc9FnvC2QsGBL9H6f03Fbwdbr/h+/5UDtlBGVcHMtsb+0pdcvAxuA2HNJ8q78
	WjHuv/sotCutaNZn628g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDL-0000000CHYS-0Fxy;
	Fri, 07 Jun 2024 04:28:31 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRC4-0000000CGRz-16DB
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSjq4B38z1S94s;
	Fri,  7 Jun 2024 12:23:11 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 50EE818007E;
	Fri,  7 Jun 2024 12:27:10 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:49 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 031/110] libubi: Add new interface ubi_leb_map()
Date: Fri, 7 Jun 2024 12:24:56 +0800
Message-ID: <20240607042615.2069840-32-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212712_953733_F0A98CF5 
X-CRM114-Status: UNSURE (   8.76  )
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
index e1e234e1..213948d5 100644
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
