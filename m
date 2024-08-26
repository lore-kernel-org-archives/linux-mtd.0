Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB1FC5472E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4eSy4w2ereUKT0evWXdXOBLP0Br917CoA4W8Vo5uRo=; b=deXxN4brFsVsqh
	lpY/h+SUWKEQ7l6aGHuMjcI3s2GEs2BVS1DDXApm3YJnhGGQxSKZJeW0VCAdGm+b8MzEhj6nBMS+h
	ZdHMjIKaMvGCIr7xwV/IaLgbjANMnxCzK9I4WMmDbHqg3QVKmQiOqaeGoK9dPUG+n2PUqDSQ449zO
	WSS5/PtaKEOtl9aP2AH4gdBzzP8CDx3YEblbT5ghdMv7Z4TbkplnBIA/AKmGmD2fXHxFFh3DcMPSp
	3doEiMTmn69Q55fUD2F/5u0RqC3I6mzTP/D0PXz5bmEBa2rN/9rwX7S6coD4cuaoWbnRetaKZSwHC
	x0J4D+FMb+hoXQwQgNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVj2-00000006bpS-2r1A;
	Mon, 26 Aug 2024 09:09:24 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siViy-00000006bns-1krj
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:09:22 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WslGq4ShGz1S8ww;
	Mon, 26 Aug 2024 17:09:07 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id D74DD1A016C;
	Mon, 26 Aug 2024 17:09:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 17:09:16 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next 1/2] ubifs: remove unused ioctl flags GETFLAGS/SETFLAGS
Date: Mon, 26 Aug 2024 17:16:59 +0800
Message-ID: <20240826091700.2812779-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826091700.2812779-1-lihongbo22@huawei.com>
References: <20240826091700.2812779-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_020920_733529_556C6146 
X-CRM114-Status: UNSURE (   7.44  )
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

In the ubifs, ubifs_fileattr_get and ubifs_fileattr_set
have been implemented, GETFLAGS and SETFLAGS ioctl are not
handled in filesystem's own ioctl helper. Additionally,
these flags' cases are not handled in ubifs's ioctl helper,
so we can remove them.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/ubifs/ioctl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index d79cabe193c3..2c99349cf537 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -213,12 +213,6 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
-	case FS_IOC32_GETFLAGS:
-		cmd = FS_IOC_GETFLAGS;
-		break;
-	case FS_IOC32_SETFLAGS:
-		cmd = FS_IOC_SETFLAGS;
-		break;
 	case FS_IOC_SET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
