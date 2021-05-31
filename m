Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E53C47080
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 12:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5DC61279
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 12:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5DC61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBHwUqcDvvk4fLeNqfosHX5WPJz2WSUFPRhvmHkYELY=; b=BE8ie8/H5jQFzM
	XbnAHw/jWbeDw7PAeYTmdSpOAUVFySobySqz5Kc7P1MTAiOhRI9dE3c4eB+D8i2LqHHToSpPdSS8d
	ts8RjjKTV6wPwZsEKD1n/XhoJxrv37C02bbHEGXg7f1IlkQBfZIEYpkAwrz7knhWJAp0j3S+4ANj1
	NCHf4EFBCutqhA5ZuyVJKlGH7BExUVw2DGOqdCDmUqG0cp/p5Sjlt1xJENIbeddlYBv9Tr20VSorH
	APazPKwLtOxVnD6UjKVJCI+/ObJANembRKWefG3v9fZOQzRc5svjXOW2nj+GaERMOKPvZqN2z/VtS
	xXiUJuOy9i4fBAyUnNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnhGS-00CCpA-Vu; Mon, 31 May 2021 12:43:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnhG1-00CCkW-RV
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 12:43:03 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FtvxH2S5vz65QG;
 Mon, 31 May 2021 20:39:15 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 20:42:53 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 20:42:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <yangds.fnst@cn.fujitsu.com>, <s.hauer@pengutronix.de>
CC: <yi.zhang@huawei.com>, <houtao1@huawei.com>, <yukuai3@huawei.com>,
 <chengzhihao1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ubifs: Remove ui_mutex in ubifs_xattr_get and change_xattr
Date: Mon, 31 May 2021 20:52:10 +0800
Message-ID: <20210531125210.1173922-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210531125210.1173922-1-chengzhihao1@huawei.com>
References: <20210531125210.1173922-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_054302_076602_0D77DE01 
X-CRM114-Status: UNSURE (   9.39  )
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

Since ubifs_xattr_get and ubifs_xattr_set cannot being executed
parallelly after importing @host_ui->xattr_sem, now we can remove
ui_mutex imported by commit ab92a20bce3b4c2 ("ubifs: make
ubifs_[get|set]xattr atomic").

@xattr_size, @xattr_names and @xattr_cnt can't be out of protection
by @host_ui->mutex yet, they are sill accesed in other places, such as
pack_inode() called by ubifs_write_inode() triggered by page-writeback.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/xattr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 1fce27e9b769..e4f193eae4b2 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -208,13 +208,11 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 		err = -ENOMEM;
 		goto out_free;
 	}
-	mutex_lock(&ui->ui_mutex);
 	kfree(ui->data);
 	ui->data = buf;
 	inode->i_size = ui->ui_size = size;
 	old_size = ui->data_len;
 	ui->data_len = size;
-	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = current_time(host);
@@ -362,7 +360,6 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	ubifs_assert(c, inode->i_size == ui->data_len);
 	ubifs_assert(c, ubifs_inode(host)->xattr_size > ui->data_len);
 
-	mutex_lock(&ui->ui_mutex);
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
@@ -375,7 +372,6 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	err = ui->data_len;
 
 out_iput:
-	mutex_unlock(&ui->ui_mutex);
 	iput(inode);
 out_cleanup:
 	up_read(&ubifs_inode(host)->xattr_sem);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
