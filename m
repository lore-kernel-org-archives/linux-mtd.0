Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB787C6FD1F
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DR3T2P13hRSGNEfy1ZV2OnPIdjmyqdgGX9xnPbnchoE=; b=OpG7bZM4VB+OER
	uPGFFBjtmU3ETq7fa09lhpyG3T9QmPmy4FOCQ0etW/GdMQGwYhAi26zppMswv6oykYFBs2X8gA5sV
	4Yp/6HTMMrK5W6gMtF+AgNHl7w1o3ALetn2CDx60iXq4HnYNc3yQqI51pEALl0mNDbyma9pPYhMoa
	rR2zwISTtN9q+scyuH8M+bX5NGhgeG+zwP/xLY+FFTk87rFXzReCtqq/cQlXPhPWpE/I39MP/t93X
	fgD4V8pvPMaJuBd8G0Qu/r0Ab24yFH5LAS2BcXv92iMH3/XNBhOjyQ4eWB7beLyXxrShPJlXnVGTJ
	0Z/Z8n348M/ELZkDKqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9H-0000000DKHz-4BrK;
	Tue, 19 Mar 2024 16:17:12 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9C-0000000DKE3-2oZW
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 16:17:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TzcHM57mDz1R7QS;
	Wed, 20 Mar 2024 00:14:23 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id C42E71400CA;
	Wed, 20 Mar 2024 00:16:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Wed, 20 Mar
 2024 00:16:56 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <lizetao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 5/5] ubifs: Add ACLs config option
Date: Wed, 20 Mar 2024 00:16:46 +0800
Message-ID: <20240319161646.2153867-6-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319161646.2153867-1-lizetao1@huawei.com>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_091706_996712_49710E85 
X-CRM114-Status: UNSURE (   9.35  )
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

Add CONFIG_UBIFS_FS_POSIX_ACL to select ACL for UBIFS, but it should
be noted that this config option depends on UBIFS_FS_XATTR.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/ubifs/Kconfig  | 14 ++++++++++++++
 fs/ubifs/Makefile |  1 +
 2 files changed, 15 insertions(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 45d3d207fb99..9ac5ddd5ded3 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -98,4 +98,18 @@ config UBIFS_FS_AUTHENTICATION
 	  sha256, these are not selected automatically since there are many
 	  different options.
 
+config UBIFS_FS_POSIX_ACL
+	bool "UBIFS POSIX Access Control Lists"
+	depends on UBIFS_FS_XATTR
+	select FS_POSIX_ACL
+	default y
+	help
+	  Posix Access Control Lists (ACLs) support permissions for users and
+	  groups beyond the owner/group/world scheme.
+
+	  To learn more about Access Control Lists, visit the Posix ACLs for
+	  Linux website <http://acl.bestbits.at/>.
+
+	  If you don't know what Access Control Lists are, say N
+
 endif # UBIFS_FS
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 314c80b24a76..1e0733a647d5 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -9,3 +9,4 @@ ubifs-y += misc.o sysfs.o
 ubifs-$(CONFIG_FS_ENCRYPTION) += crypto.o
 ubifs-$(CONFIG_UBIFS_FS_XATTR) += xattr.o
 ubifs-$(CONFIG_UBIFS_FS_AUTHENTICATION) += auth.o
+ubifs-$(CONFIG_UBIFS_FS_POSIX_ACL) += acl.o
\ No newline at end of file
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
