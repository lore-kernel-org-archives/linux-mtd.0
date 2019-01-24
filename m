Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53712C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 09:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A03720854
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 09:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+b2Q5Ve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A03720854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AEBs8eE1zLLcJpdGgSDQEZeaBHUev/tr7ybZ1634WyM=; b=s+b2Q5Ved0XWvB
	uNyX/Un1742DWRWqw0xsyBrzr/l6ukc8F+3m9VHOBSFjkt4AigX9esrbm3lXEEKUBKbQ4hYh9d4GX
	3TeG1BK+icbUO0pGiX6MeaG5doXginNt9aGYWF/kmW/lNkNvs6lkbhfQuQN4x+TpXYV9TbcfAcm4Z
	pS1ThgATyXtQWTSpowQtH69giqXpzxKZ09UK4a+2ra6xFtMkxPWu2CUtLoiGlzBqqwtWF0cRHdwlZ
	Bd75Y7mZsqcC79fY3jGHl7WXxaEU5hZhnN0gpl0mXEkNdtHxkk0amYAFcFHK2BIQmnGv6Omk0BV+S
	FuC6zO5qUWb6TVSbcMUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmaue-0003mb-H1; Thu, 24 Jan 2019 09:03:04 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmaub-0003lp-R4
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 09:03:03 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 72E6839EC467CC4B3C94;
 Thu, 24 Jan 2019 17:02:52 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Thu, 24 Jan 2019
 17:02:47 +0800
From: Yufen Yu <yuyufen@huawei.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
 <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mtd-utils: fixes double free in mkfs.ubifs
Date: Thu, 24 Jan 2019 17:06:29 +0800
Message-ID: <20190124090629.134985-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_010302_047144_C8133F3A 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

In inode_add_xattr(), it malloc a buffer for name, and then passes
the bufffer ptr to add_xattr(). The ptr will be used to create a new
idx_entry in add_to_index().

However, inode_add_xattr() will free the buffer before return.
which can cause double free in write_index(): free(idx_ptr[i]->name)

*** Error in `./mkfs.ubifs': double free or corruption (fasttop): 0x0000000000aae220 ***
======= Backtrace: =========
/lib64/libc.so.6(+0x7cbac)[0x7f4881ff5bac]
/lib64/libc.so.6(+0x87a59)[0x7f4882000a59]
/lib64/libc.so.6(cfree+0x16e)[0x7f48820063be]
./mkfs.ubifs[0x402fbf]
/lib64/libc.so.6(__libc_start_main+0xea)[0x7f4881f9988a]
./mkfs.ubifs[0x40356a]

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 6e11ec8..e0c42f3 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1163,8 +1163,9 @@ static int add_xattr(struct ubifs_ino_node *host_ino, struct stat *st,
 	union ubifs_key xkey, nkey;
 	int len, ret;
 
-	nm.name = name;
 	nm.len = strlen(name);
+	nm.name = xmalloc(nm.len + 1);
+	memcpy(nm.name, name, nm.len + 1);
 
 	host_ino->xattr_cnt++;
 	host_ino->xattr_size += CALC_DENT_SIZE(nm.len);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
