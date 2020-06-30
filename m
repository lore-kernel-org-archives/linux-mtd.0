Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CE5C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:59:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643FC2085B
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:59:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmUZvRbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643FC2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nw1/kwMNV2TVIdw70Thwsqo7LlWdUJ8r3WawkQyNjv8=; b=rmUZvRbehTXwoWrKS4VQ7KAfG
	HKbufMUDaoMifCpe2GtXhpl7OlLIyUD1wJYlFy5Fr4Yc33CXFH/5hpkFvCa86jkDrcHwIKs3gVMWo
	fWi+/dMiRJfBxHOPsTaMmH39qpYWeNaRzOPOwAWZ5q+NPEYF3u5Zl4sbyT9qIP4HB+1/xPXhuK1xN
	JcyJlrBHWad6ZhEwoUC1AO+L9HwBBpmTWJ/aJZYkeLRlWwYLP3hgeHY2cMFt0CwbLMDJUeAfxbbIl
	fPbjtspHuMmoAVs9v4s8A+hm2vvBcp1O280eDhDolJDfZj8RrK95mv4sGyehnp+S0ap9R+b40mI5Z
	Uxg+H0w6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqFpp-0008Ab-PL; Tue, 30 Jun 2020 12:58:01 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqFpj-000885-5l
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 12:57:56 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EA381AB42D7CF840EEC5;
 Tue, 30 Jun 2020 20:57:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 20:57:36 +0800
From: Hou Tao <houtao1@huawei.com>
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] ubifs: protect assertion of xattr value size by ui_mutex
 during xattr get
Date: Tue, 30 Jun 2020 21:04:37 +0800
Message-ID: <20200630130438.141649-3-houtao1@huawei.com>
X-Mailer: git-send-email 2.25.0.4.g0ad7144999
In-Reply-To: <20200630130438.141649-1-houtao1@huawei.com>
References: <20200630130438.141649-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ubifs_xattr_get() may race with change_xattr() which will
update inode->i_size and ui->data_len accordingly, and
it will fail the assertion: inode->i_size == ui->data_len,
so protect the assertion by ui_mutex.

For assertion: host_ui->xattr_size > ui->data_len, it can not been
ensured even both host_ui->ui_mutex and ui->ui_mutex are acquired,
because the xattr value may has been removed by remove_xattr() and
xattr_size has already been decreased, so just remove it.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/ubifs/xattr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 5591b9fa1d86..82be2c2d2db5 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -356,10 +356,9 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	}
 
 	ui = ubifs_inode(inode);
-	ubifs_assert(c, inode->i_size == ui->data_len);
-	ubifs_assert(c, ubifs_inode(host)->xattr_size > ui->data_len);
 
 	mutex_lock(&ui->ui_mutex);
+	ubifs_assert(c, inode->i_size == ui->data_len);
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
-- 
2.25.0.4.g0ad7144999


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
