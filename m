Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B847C83F12
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6dooi0uHLhLJlUlrHIH713HelsOuPdcE6aZ0PNJoa8=; b=WJ5jJF6kKT1S/0
	OyXaW3UUm/4cpMM9Sdh9P/1zLg5604bLzBGir68dzKXvkXR0kz6zNwcpjUJFVszliKUycFAoe60Jd
	U/Z4tnwaZK2vXK8e17GB/CEK1pJ3ivw9EaQEosvc5gx0wAl9zrhDtFgnnzlytddwpFdV8p2QvUMMI
	xBY6hboXLgYKVdkz+AdiMiRStd9EZ9sTW+AJWWkVEa1iclwAeswbyuxEuGR5cDLhaEyywtrskQkdp
	2rNOw5upqwPLm1g5YVmxkFim88az4GjIbpPqhLJpb8jeaUKBt9KzHQxWas1jaAZZsXiUFGHp24Hzr
	1rz8ldxd1KZtJlws7edg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVyV-008ySP-1v;
	Mon, 28 Aug 2023 06:43:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy6-008yCS-1m;
	Mon, 28 Aug 2023 06:43:25 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RZ1Dm1wn6zrSX5;
	Mon, 28 Aug 2023 14:41:44 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:19 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
Subject: [PATCH v2 12/12] ubi: fastmap: Add control in 'UBI_IOCATT' ioctl to reserve PEBs for filling pools
Date: Mon, 28 Aug 2023 14:38:45 +0800
Message-ID: <20230828063845.3142561-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234322_923760_C8C49C41 
X-CRM114-Status: GOOD (  12.93  )
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
