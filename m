Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB7BC3DA4D
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fg4I3OJodZUcFE22OPwNykBoyAj5zOdIYiG7GJ8czjc=; b=p5JjtYMieFG4j9
	JrDbpLv+6xeXQbNckPv5DTwGl0XgIfoUlpcac1vocDOXTLEnQzluS2+6c1sEd9JzKzwUdJjFxyZKq
	2NAwjHHZvEBRy9GXxvgZ6Bj3lvSjS3K27c/dfTHs02NCkCUUx+1YR8WjEpQaC1fLHALXvdDkqu+wt
	TlBearCsx6qEBxA9aaZ2kQhAHXWleMeP3QD1ZWqPENpwmEURm1qjDNNOtFVQy5Q3t3zydopyUxydZ
	NMgIYsaIy/waTE9XcvDLvlw7VTXbVQNcpurEdsao6hhbyXv9m7Nl8MiwnuxqO9tG/vKMPjU4U7eoC
	nDK+lcupA3r9LOmPM7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9vp-0000000GeGH-0CBS;
	Fri, 12 Jul 2024 06:39:01 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9vk-0000000GeET-10L9
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 06:38:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WL2246w6Fzdgdn;
	Fri, 12 Jul 2024 14:37:00 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 31D6F18009E;
	Fri, 12 Jul 2024 14:38:42 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Jul
 2024 14:38:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] ubifs: Two cleanups for xattr handling in host inode evicting process
Date: Fri, 12 Jul 2024 14:36:23 +0800
Message-ID: <20240712063625.3363974-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_233856_602531_DE3AFE93 
X-CRM114-Status: UNSURE (   4.68  )
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

Zhihao Cheng (2):
  ubifs: ubifs_jnl_write_inode: Only check once for the limitation of
    xattr count
  ubifs: Remove ineffective function ubifs_evict_xattr_inode()

 fs/ubifs/journal.c | 12 ++++++------
 fs/ubifs/tnc.c     |  2 --
 fs/ubifs/ubifs.h   |  3 ---
 fs/ubifs/xattr.c   | 22 ----------------------
 4 files changed, 6 insertions(+), 33 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
