Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96F0C41535
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pfIgca5qIEEF/gQfYsdWB1Pa+kuAyGJuS+SjOaVQOb0=; b=a9Zd2RKqAi0mfX
	ypmWj9FzyjQUho8uwJyBXxasx9KO+gQmNuyOexzABXpGoVyWV6kgPd7Bt+KJKifl6vWoYCP16dSn4
	Z9VO8Rje6c2BwQw5Jzvp2+qVQqEZv9ACn2CLXerMoEGn6CjZs9hQqrHKJWUIULfsbJBbBF0mVr46k
	XlJfXGQDJG5qVH1M6LSjj3uH7y/5fz8KpaWrXc5JA+Qtlr5frhh1jY17Vu1B+NlbZKYYkQ5V+YsMJ
	J+auLOpHImCtT2yzY/qcaBXQUCcG4hg0445ewuv9AZlue8FT8d70WQSDrzZANmBBzai6shNVU3xvM
	5Hupe7EDwTSEA4V/ohMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbFs-005MNb-1Y;
	Fri, 22 Dec 2023 08:51:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbFo-005MN1-0w
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 08:51:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SxLcV0jXWzWkBS;
	Fri, 22 Dec 2023 16:51:06 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AAD5140336;
	Fri, 22 Dec 2023 16:51:28 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Dec
 2023 16:51:27 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <terrelln@fb.com>, <ebiggers@google.com>
CC: <linux-fscrypt@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/2] ubifs: Fix two kmemleaks in error path
Date: Fri, 22 Dec 2023 16:54:44 +0800
Message-ID: <20231222085446.781838-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_005136_498111_8A6D0406 
X-CRM114-Status: UNSURE (   5.52  )
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
  ubifs_symlink: Call fscrypt_free_inode() directly in error handling
  path.
  Add 'Cc: stable@vger.kernel.org' and 'Suggested-by' tags in patch 2.

Zhihao Cheng (2):
  ubifs: dbg_check_idx_size: Fix kmemleak if loading znode failed
  ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path

 fs/ubifs/dir.c   | 2 ++
 fs/ubifs/super.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
