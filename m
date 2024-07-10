Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4005C41513
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 02:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DgSp2/gotJE1Bzd8i6nTvOzTgANiHc74cOwzm0KpiKg=; b=GTwLPAd9aPQNky
	nwhqugCxNzXrMWsPZHjyZPM4RWQPfRbzqNE2N80UD8+0k63DEiRnu7wL+8/klswhYHg8vWQ5MMtvF
	9vTAQY1gxI48PZBIfllnGQ+x/pLlt/n6kQIY4eFQbKjxISLx2eG4f991bvJ18aMU35/XOha2NT/IW
	kkCPCQESAwlNMfo/HywGSkMK+ubXwO7WDHpE/EFqFiVfCCKfyLpSVSV4AvYR2LeIO3rPA/6YMR6wT
	GFzr9OxCXeM4RfZzVs9rgKyWgJjtb38KMbn9txdRUHkJIti/KQeDBMFFsZGiaKldE8ckwBPS/6z6p
	9BUbhTn2DoqMWjjeDwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRN4u-00000009Bm6-1xk3;
	Wed, 10 Jul 2024 02:29:08 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRN4q-00000009Bkt-2h9c
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 02:29:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WJhWH5ZDbzwWjG;
	Wed, 10 Jul 2024 10:24:11 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 02EA914041B;
	Wed, 10 Jul 2024 10:28:54 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 10 Jul
 2024 10:28:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] ubifs: Fix deadlock between inode reclaiming and host inode writing
Date: Wed, 10 Jul 2024 10:26:26 +0800
Message-ID: <20240710022628.1227996-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_192904_869379_90FF4691 
X-CRM114-Status: UNSURE (   4.60  )
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

Patch 1 optimizes logic process in function ubifs_jnl_write_inode().
Patch 2 fixes an ABBA deadlock problem based on the process by applying
patch 1.

Zhihao Cheng (2):
  ubifs: ubifs_jnl_write_inode: Only check once for the limitation of
    xattr count
  ubifs: Fix ABBA deadlock between inode reclaiming and deleted inode
    writing

 fs/ubifs/journal.c | 106 ++++++++++++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 40 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
