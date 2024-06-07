Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A8C41513
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvMYG4tpAdPObah33vwSHmE7hVs8q2F9R3UPemMVIB4=; b=WZqc4saGCpl8zp
	qvEc9NjbMkTa133YPirJ/MDW0+S8hn0irAUSB1+pR5rJ5vRWlR81bUimGBy6mkv4ZbwhDBpupBovv
	RlJ8M4KgtEjZl2QemDBSE5HRvaQfUfyVSlezNgQR5H4nNBde+9Hz1gxG+AItqjxWDqBks6FqTlHpW
	BGUhxsbCPu73aWQ8Ykld4nQrD1g7ALnhHoX7z0FX4lA4lJDTNXwixA0ufxf/9UymQ36xQsh4Jc+mU
	LJVr6WTG9a0eycUNzukRMMDlxrXcAPcJY695JtNgKe1jH237SNzvGjg/J66raUMOfatwqI/CTCIG3
	h3sKhwNR3JBE49+8w/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSD2-0000000CUUo-2vLU;
	Fri, 07 Jun 2024 05:32:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBk-0000000CG98-0CY0
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:26:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShk3xfrzmXhG;
	Fri,  7 Jun 2024 12:22:14 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 6211D1400D5;
	Fri,  7 Jun 2024 12:26:50 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 012/110] mkfs.ubifs: Fix memleak for 'output' in error paths
Date: Fri, 7 Jun 2024 12:24:37 +0800
Message-ID: <20240607042615.2069840-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212652_381961_2072702A 
X-CRM114-Status: UNSURE (   8.80  )
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

The 'output' is allocated in get_options(), don't forget to free it
in error paths, move 'output' freeing out of close_target(), which
simplifies the logic of close_target().

Fixes: 36ec51948e0ec ("Add mkfs.ubifs")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 949187ea..f66c6a46 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2898,8 +2898,6 @@ static int close_target(void)
 		if (close(out_fd) == -1)
 			return sys_errmsg("cannot close the target '%s'", output);
 	}
-	if (output)
-		free(output);
 	return 0;
 }
 
@@ -3096,6 +3094,7 @@ int main(int argc, char *argv[])
 		printf("Success!\n");
 
 out:
+	free(output);
 	close_ubi();
 	crypto_cleanup();
 	return err;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
