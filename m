Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54889C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1E660EB8
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D1E660EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gikW1s+wzp1Sg7oqaaVvfLpchXurlhfgimdZrHfR+FQ=; b=e5GWknpMYI48ut
	8Gq5ef3oODn5NRD0iR9yAleSgiACoiAUin0WBsU8Lk5ylS0AqB14P8uS6E0QBpTeYjz0NCF/irUV5
	BOgoPab9jtBEamEF9+rkCGCsHwMnjysEaGq7Yg+JUaua3C38+pxkbPh7iycM/wGUknjt5ijWk3rIl
	gf67oGfT/Ch5YL4UA9LYX+J3pGNHRd10T8y4rPGFyb600ufOLHbLzfz+di0GM+AUJDQxOwVQ9Dmzt
	M+xS/6JZPHA+i4lbMEQQStKI9M9oNMad4s0ekQeDQrieg6FzbxrkySp9XF6MrhSbbH7tYET9XJo/P
	DAF0ZpJcFDNYjdD7jJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPvl-00DREY-BJ; Sat, 06 Nov 2021 17:56:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKcH-00Cymz-ND
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=NWhfHadqNWgSFCH7HoiIA/RdGeTAxYGHngMkYQiNN8A=; b=UacycNmhlLJNTukJkEIZlsyJvf
 L74CyFancDRTxdF7x52pPOOS59NP8SMf+MY8Kc8udAZXi03pscJ7PZ29BREVR2BS+4PMrE4nOi1vV
 fdK+JoWjceo+bjZvh0zSLVVhG0ku3gn69dsM+pqUMorC+jQqv5A6DFYJ+sg3rdcWf9HxyYYKND8kQ
 qU2ERCyRHd7zObvm2dGgw2SisJ574YCMKhLVGEyHfRmIzZGNNp7xV8q5eKuEKpQZEItWV1H0NqDDA
 WMP+RC01BV89MGAgi9wvnwd3bkDCrlefgQMg+ri1gE9n4ztkCSjwP3NvT6MstDB+UDR5amXdBOqJ5
 +iAq9gUQ==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKa7-007Cwb-Pf
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:15:12 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hmbq30gRZz8skm;
 Sat,  6 Nov 2021 20:12:31 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:42 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 03/12] ubifs: Fix wrong number of inodes locked by ui_mutex
 in ubifs_inode comment
Date: Sat, 6 Nov 2021 20:25:08 +0800
Message-ID: <20211106122517.3304628-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106122517.3304628-1-chengzhihao1@huawei.com>
References: <20211106122517.3304628-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121443_408922_60262477 
X-CRM114-Status: UNSURE (   9.41  )
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

Since 9ec64962afb1702f75b("ubifs: Implement RENAME_EXCHANGE") and
9e0a1fff8db56eaaebb("ubifs: Implement RENAME_WHITEOUT") are applied,
ubifs_rename locks and changes 4 ubifs inodes, correct the comment
for ui_mutex in ubifs_inode.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/ubifs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c38066ce9ab0..972e41daff01 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -372,7 +372,7 @@ struct ubifs_gced_idx_leb {
  * @ui_mutex exists for two main reasons. At first it prevents inodes from
  * being written back while UBIFS changing them, being in the middle of an VFS
  * operation. This way UBIFS makes sure the inode fields are consistent. For
- * example, in 'ubifs_rename()' we change 3 inodes simultaneously, and
+ * example, in 'ubifs_rename()' we change 4 inodes simultaneously, and
  * write-back must not write any of them before we have finished.
  *
  * The second reason is budgeting - UBIFS has to budget all operations. If an
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
