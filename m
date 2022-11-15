Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536DAC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Nov 2022 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jAXc//QjKAhNsi+MXpeJZd7ssjYh4ot1Thq81AxDi2E=; b=PJXLRKxaUZyazp
	mpNSrxTZ0A0o12vLSpQEsIBEMMkEoA3+tT0T6rFsVhIopBW6MZu9bBR8uf4iW3O1NjFaWCz0DQDkP
	zmdLOhgnR1lgiirwrJYLC2zyiGU5Ys2eU07q8nDLDM4/fBG6LWnWDuzq97+RvQ5TvlDTDE7ANW4zD
	Rd9y05EkhJBRkbM1hW2fGmzGUMZmmkWAxENazReEwEZydeDzCcHoxD3t+AVArSpGfKkVNuNgpzvfV
	jbQ+aeIRPDjYK42S4WSg2aTcQ7HegK7hzyU3OCUFdcDjGc1Bw2zUFxC4XGi3jMCKfAcIJrQ4nHfdS
	Ae7dHiMOciVtvyLi3CAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouqwF-008rXy-Hc; Tue, 15 Nov 2022 08:04:59 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouqwA-008rVT-Mb
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2022 08:04:56 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBJXG4fSJzqSS7;
	Tue, 15 Nov 2022 16:01:02 +0800 (CST)
Received: from huawei.com (10.67.174.191) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 15 Nov
 2022 16:04:46 +0800
From: Li Hua <hucool.lihua@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>, <hucool.lihua@huawei.com>
Subject: [PATCH] ubifs: Fix build errors as symbol undefined
Date: Tue, 15 Nov 2022 16:33:35 +0800
Message-ID: <20221115083335.21211-1-hucool.lihua@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.191]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_000454_950639_6EEBA450 
X-CRM114-Status: UNSURE (   8.44  )
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

When CONFIG_UBIFS_FS is enable but CONFIG_UBIFS_FS_AUTHENTICATION is not set:
    ERROR: modpost: "ubifs_bad_hash" [fs/ubifs/ubifs.ko] undefined!

Fixes: 16a26b20d2af ("ubifs: authentication: Add hashes to index nodes")
Signed-off-by: Li Hua <hucool.lihua@huawei.com>
---
 fs/ubifs/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 45d3d207fb99..93bda1057fdc 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -13,6 +13,7 @@ config UBIFS_FS
 	select CRYPTO_HASH_INFO
 	select UBIFS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
+	select UBIFS_FS_AUTHENTICATION
 	depends on MTD_UBI
 	help
 	  UBIFS is a file system for flash devices which works on top of UBI.
@@ -91,6 +92,7 @@ config UBIFS_FS_AUTHENTICATION
 	select KEYS
 	select CRYPTO_HMAC
 	select SYSTEM_DATA_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
 	help
 	  Enable authentication support for UBIFS. This feature offers protection
 	  against offline changes for both data and metadata of the filesystem.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
