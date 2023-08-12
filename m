Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9708BC0015E
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6dooi0uHLhLJlUlrHIH713HelsOuPdcE6aZ0PNJoa8=; b=3vSqV7O4yKYEJV
	m4wFbBp4mQvtYNB7OmrAI/gq+9eLkPKhOYbNyxN9JyIXuK7LuU+JPaPSgoVfOw4FSpOR8c5OUURTJ
	DVO/ZOfLcxtou8mrC5s+Br9yQ7Fb34OetGx6dzJJ3hCeFzg6hZy8YMEGL1aWvwElFf2rWLWya1ilR
	Q8JVm7R5cydxFZjNvbUmdfwzZ8zJx8ciyxDiCO0oN7ipQ+y7q4ppAIg+Glr22BO2IHRiKmApxKHRc
	zft9EEAFJOy5vKEsaku/9IhQl1pw8j7txD35R1bx7IRLXlubKQJQqDMwE/u2pdzs9Ek0f3YqBFhQD
	MJFp087WV/Fv1PbuDiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbG-00Ctra-1e;
	Sat, 12 Aug 2023 08:03:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb6-00CtmW-03
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:48 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RNCnG5NnhzrS7b;
	Sat, 12 Aug 2023 16:02:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/12] ubi: fastmap: Add control in 'UBI_IOCATT' ioctl to reserve PEBs for filling pools
Date: Sat, 12 Aug 2023 16:00:05 +0800
Message-ID: <20230812080005.3162125-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010344_234580_AE54FB3D 
X-CRM114-Status: GOOD (  13.03  )
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

This patch imports a new field 'need_resv_pool' in struct 'ubi_attach_req'
to control whether or not reserving free PEBs for filling pool/wl_pool.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/cdev.c      | 2 +-
 include/uapi/mtd/ubi-user.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 98aa00344b29..0d8f04cf03c5 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1042,7 +1042,7 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
 					 req.max_beb_per1024, !!req.disable_fm,
-					 false);
+					 !!req.need_resv_pool);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index dcb179de4358..e1571603175e 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -248,6 +248,7 @@ enum {
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @padding: reserved for future, not used, has to be zeroed
  * @disable_fm: whether disable fastmap
+ * @need_resv_pool: whether reserve free pebs for filling pool/wl_pool
  *
  * This data structure is used to specify MTD device UBI has to attach and the
  * parameters it has to use. The number which should be assigned to the new UBI
@@ -293,7 +294,8 @@ struct ubi_attach_req {
 	__s32 vid_hdr_offset;
 	__s16 max_beb_per1024;
 	__s8 disable_fm;
-	__s8 padding[9];
+	__s8 need_resv_pool;
+	__s8 padding[8];
 };
 
 /*
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
