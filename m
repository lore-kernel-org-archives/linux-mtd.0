Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D19C47079
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jan 2024 02:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+T/0gb3ztsqKatY44Yi1Irfu/sSjoh7mqGBG+96XMw=; b=k0uNn7EBrm6gLQ
	2OfoEPiyW+LK04d3E2F3Y0VomrEz6ZIVCNNNnFXNbFJGbI54hhpeYpjfT1bMGKD5oOvtan05jtUDU
	Kne8fYr8i/GBoZ8iqxYp+TJgvpuYvgPfDLDgFhrB1E3XY5Zo3lcfqamGEtFm1mWSXzXcQlKOwB1Xh
	8lb6DaV4LXGFov6H0UL8imzXwuBWpUzRn+fRp/rQK7BJP+46g9cf0Jvm4i7Hp0SrrMzNf3UXRwWJI
	aM330eg/O1JdcW5EPrumNZRkuy8avzj5atVufca/nGU7HPojBo72AJZvx5aABc7vT5pQJ7vsB158R
	2hD0pl+YDST5jyu1wX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMfd4-003rY9-02;
	Mon, 08 Jan 2024 02:44:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMfcx-003rWg-2F
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jan 2024 02:44:37 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4T7dg71tzSzZgdt;
	Mon,  8 Jan 2024 10:44:03 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D53161800BE;
	Mon,  8 Jan 2024 10:44:18 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Jan
 2024 10:44:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <ebiggers@google.com>, <terrelln@fb.com>
CC: <linux-fscrypt@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/2] ubifs: Fix two kmemleaks in error path
Date: Mon, 8 Jan 2024 10:41:03 +0800
Message-ID: <20240108024105.194516-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_184435_910698_714809EA 
X-CRM114-Status: UNSURE (   5.55  )
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

First memleak is found by mounting corrupted UBIFS image with chk_index
enabled.
Second memleak is found by powercut testing for encryption scenario.

v1->v2:
 ubifs_symlink: Call fscrypt_free_inode() directly in error handling path.
 Add 'Cc: stable@vger.kernel.org' and 'Suggested-by' tags in patch 2.
v2->v3:
 Handle tnc releasing in error handling path in dbg_check_idx_size().


Zhihao Cheng (2):
  ubifs: dbg_check_idx_size: Fix kmemleak if loading znode failed
  ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path

 fs/ubifs/debug.c    |  9 +++++++--
 fs/ubifs/dir.c      |  2 ++
 fs/ubifs/tnc.c      |  9 +--------
 fs/ubifs/tnc_misc.c | 22 ++++++++++++++++++++++
 fs/ubifs/ubifs.h    |  1 +
 5 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
