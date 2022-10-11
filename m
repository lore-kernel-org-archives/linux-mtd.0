Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4C5C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Oct 2022 03:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJga5GOxL8TsOLlfbEZQA+lxpo9io4DgaRt56RXFykE=; b=A+5tVkycyBiVFy
	U+02dUU9sXzUZhYiw0bw3K+mYAx4qgsucViu+Org+3g9QG4EJJJyQrEWRiDOj8FhbUChDEG9xPZ/4
	AQKeV7r8zh6OD1/kNzUkiVDJXS6Voo2WxKKUaYLWjFh4iE6NHqKHlC8flRB/qwG7Lg862dB/34rNW
	APTWD7JeZ1pDgPp7FbMPwyZyLi40z0zyxmrQRbNHmqblAlnfE9sKqp/lhamYWPsu0EoTT3WajQNk/
	IR4eKjsyrMDOL+oUgkhadFBXgs2+AaAgv+N+WdsSn6RQGOZCc7wkC7IWTcswTxH5uOay3NISis9Jw
	6qx6oIf/Yx9zDRjzya4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5tr-0037vg-0L; Tue, 11 Oct 2022 03:25:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5tl-0037sa-9M
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2022 03:25:43 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mmh1014H6zpVTK;
	Tue, 11 Oct 2022 11:22:28 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 11:25:23 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 11:25:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 1/6] ubifs: Rectify space budget for ubifs_symlink() if symlink is encrypted
Date: Tue, 11 Oct 2022 11:47:27 +0800
Message-ID: <20221011034732.45605-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221011034732.45605-1-chengzhihao1@huawei.com>
References: <20221011034732.45605-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_202541_545091_43AAAE7F 
X-CRM114-Status: GOOD (  10.49  )
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

Fix bad space budget when symlink file is encrypted. Bad space budget
may let make_reservation() return with -ENOSPC, which could turn ubifs
to read-only mode in do_writepage() process.

Fetch a reproducer in [Link].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216490
Fixes: ca7f85be8d6cf9 ("ubifs: Add support for encrypted symlinks")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index bc11276301fd..4705d9a77357 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1150,7 +1150,6 @@ static int ubifs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	int err, sz_change, len = strlen(symname);
 	struct fscrypt_str disk_link;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
-					.new_ino_d = ALIGN(len, 8),
 					.dirtied_ino = 1 };
 	struct fscrypt_name nm;
 
@@ -1166,6 +1165,7 @@ static int ubifs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	 * Budget request settings: new inode, new direntry and changing parent
 	 * directory inode.
 	 */
+	req.new_ino_d = ALIGN(disk_link.len - 1, 8);
 	err = ubifs_budget_space(c, &req);
 	if (err)
 		return err;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
