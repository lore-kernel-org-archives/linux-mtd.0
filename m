Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB6FC43217
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Oct 2022 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S15zKhDmFZ8MnB43zX/iLCKzgh0XULB91F3sf7wwY0M=; b=uAIPaRzo4UQmtR
	uA65/sCeHq0dE4wqv/4t0FLrgk1aL3K/IemdcdESCcPA4cr7Ec5ZtYMoH6n3wjpjk+fNNse/l1nEi
	4Q9MbA5gBpueq6Y+4GNWIJ57nxI/Sji3QraHWY2LevREjoDEKKK31Q9WCkZ7tjv3WsMgUGsxbDPCQ
	23+5fBa0WltiXFm4OcOX1zw/DxM/o7k3pFsHIzOix75GnSjVl/Y456hYll752xYkxTfAbfimkcB1o
	xdqlzqtPamK0hiru5Z+9+F/HVy5uPit8RusG1dXyy9zS9XQ7SQlYy8fY9FqheiqULdsdPAwLGVTRM
	rEoGLoKl2mQx7KN2SQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5tk-0037t4-Pn; Tue, 11 Oct 2022 03:25:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5tg-0037qf-7r
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2022 03:25:37 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mmgyp0N98zHtwD;
	Tue, 11 Oct 2022 11:20:34 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 11:25:22 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 11:25:21 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 0/6] ubifs: Fix wrong space calculation while doing budget
Date: Tue, 11 Oct 2022 11:47:26 +0800
Message-ID: <20221011034732.45605-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_202536_472673_CCC5C2D4 
X-CRM114-Status: UNSURE (   4.81  )
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

This series of patches fix ubifs wrong budget space calculations,
which could make make_reservation() failed with ENOSPC error code
and let ubifs become read-only.

Zhihao Cheng (6):
  ubifs: Rectify space budget for ubifs_symlink() if symlink is
    encrypted
  ubifs: Rectify space budget for ubifs_xrename()
  ubifs: Add comments and debug info for ubifs_xrename()
  ubifs: Fix wrong dirty space budget for dirty inode
  ubifs: do_rename: Fix wrong space budget when target inode's nlink > 1
  ubifs: Reserve one leb for each journal head while doing budget

 fs/ubifs/budget.c |  9 ++++-----
 fs/ubifs/dir.c    | 18 +++++++++++++++++-
 2 files changed, 21 insertions(+), 6 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
