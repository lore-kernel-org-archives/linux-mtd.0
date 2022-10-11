Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72227C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Oct 2022 03:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtafE3mk+9eoSmeDkMcPiDE1rfcMUji6cO0jgHk6dB8=; b=f/6yzhFwEwpPaj
	bTj1vaBIaD6KsZbumQxgSCLYYceQMCGfigYBHKZ7KEnNDWRnfin/YrDSdxorIA9dGzxmkYtyLJ+Am
	iUX6c0MZT/elPvdG65hX//oveVrKrxkdCQu1QPDT7bFfwfXZzRB5eapbIYNfYkOMCaa9KQfO/urBW
	W0hDBHw+0R48FGREUURGihyBs/6+s6Br6WIuK5skIAvQbRDq4Lt66MJCnFGTpjilKrLfkD3lwiiL7
	J/h3EtAmOU+iJOx70bCJxD7YtuyOrmt8u7hWAbNYg6pHIPO98ILrHtJGyoaQDDwaEEm0ilc9c4Xre
	ysh21SbjLr3pKMJNezgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5tm-0037tt-P4; Tue, 11 Oct 2022 03:25:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5tg-0037qg-7q
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2022 03:25:37 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mmgyp22GwzHtrZ;
	Tue, 11 Oct 2022 11:20:34 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 11:25:24 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 11:25:23 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 3/6] ubifs: Add comments and debug info for ubifs_xrename()
Date: Tue, 11 Oct 2022 11:47:29 +0800
Message-ID: <20221011034732.45605-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221011034732.45605-1-chengzhihao1@huawei.com>
References: <20221011034732.45605-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_202536_484646_72B834DD 
X-CRM114-Status: UNSURE (   7.65  )
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

Just like other operations (eg. ubifs_create, do_rename), add comments
and debug information for ubifs_xrename().

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index eeda471f05ee..53c5442f48b7 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1565,6 +1565,15 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 
 	ubifs_assert(c, fst_inode && snd_inode);
 
+	/*
+	 * Budget request settings: changing two direntries, changing the two
+	 * parent directory inodes.
+	 */
+
+	dbg_gen("dent '%pd' ino %lu in dir ino %lu exchange dent '%pd' ino %lu in dir ino %lu",
+		old_dentry, fst_inode->i_ino, old_dir->i_ino,
+		new_dentry, snd_inode->i_ino, new_dir->i_ino);
+
 	err = fscrypt_setup_filename(old_dir, &old_dentry->d_name, 0, &fst_nm);
 	if (err)
 		return err;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
