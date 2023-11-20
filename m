Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B964C5AE5C
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wdWOSSA+yXRDGN6p9VNvFj0zRDsXzefacc3O8lBJ4pY=; b=D0GZc+4z+INtCs
	oJqtLat1vQV0P2wjdq3yARfasPaCvqRrs9kSffvseulummsooTG0zZNORm7K9jLgiZVGz7ZMSxcWC
	GPbPpP3BbQAlRycpskacsK71uucSlcNc+xTVyBTh5zNMW5w8ns8+cM8g2sArdLYAe6kFTgVourpOH
	6vetSSHjj9WGR89ZfK3vHbIkWKgUWhNrwZEKYB1Bg5V+mvgRHlDJ52MaciTYGIRWXafwTsHuLMDA9
	6o4TfKn9GoTxPDTH+WkCCfoO/9iuUamBNQvRJKuRbH4GmJ+IUQ+TecPGu2r2B/hcFsXPw7wqLRc4k
	2uUrV9rARSitB85W+Erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4upR-00B0ra-0v;
	Mon, 20 Nov 2023 03:20:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4upN-00B0ot-2M
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 03:20:04 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SYXmP3cn8zQnVD;
	Mon, 20 Nov 2023 11:19:17 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 Nov
 2023 11:19:46 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <Carson.Li1@unisoc.com>, <s.hauer@pengutronix.de>,
	<houtao1@huawei.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] ubifs: Fixed several low-probability issues.
Date: Mon, 20 Nov 2023 19:13:44 +0800
Message-ID: <20231120111347.2254153-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_192001_955883_C8CFFA68 
X-CRM114-Status: UNSURE (   2.99  )
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

These filesystem problems are found in stress tests from
https://lore.kernel.org/linux-mtd/935504729.4822.1697398448017.JavaMail.zimbra@nod.at/.

Zhihao Cheng (3):
  ubifs: Check @c->dirty_[n|p]n_cnt and @c->nroot state under
    @c->lp_mutex
  ubifs: ubifs_tnc_locate: Drop TNC mutex lockless reading path
  ubifs: Don't stop retrying even if committing times exceeds two

 fs/ubifs/commit.c  | 13 ++++++++++++-
 fs/ubifs/journal.c | 26 ++++++++++----------------
 fs/ubifs/tnc.c     | 31 +++----------------------------
 3 files changed, 25 insertions(+), 45 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
