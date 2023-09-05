Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B42C83F33
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Sep 2023 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZJScuUUo52A2uFCfIFfi+sPqERcceXoNiV5e1gEtuPc=; b=Nd5mtxWZI7PSL5
	VGdsioEbp9ebgBLncdIKzzTp5el6JH2G1cEr9lSmqHIiJLuDdspLWfed/5cRbifQ+NxfAYO9AN9/E
	NuBgq14cUskLdfglqyFUQQ7/3bs7bZrSCefoa7rJYxgPwe+JDky4ElCl9Qev5mtJ4DxqWHGT1by6I
	riMGwRrZbOqKI4U6u5aWJkN/NH2W3IdVyP+sCLBTBXWMw7DTqjREzO5IwC7pukqMxbBC9NsTjFKF6
	4hQkn8D9NKIeDfQ8bffR8785sFRCo7IK3cWQDMzFM5/NMJQ9h7GQ1x+pjb5a9F+/G/tX5mOBdqLs/
	bh+XpwhS8i6v/M5bSPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdT30-005gEe-34;
	Tue, 05 Sep 2023 10:12:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdT2w-005gE6-1i
	for linux-mtd@lists.infradead.org;
	Tue, 05 Sep 2023 10:12:37 +0000
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rg1X40rn0z6K6Kj;
	Tue,  5 Sep 2023 18:12:20 +0800 (CST)
Received: from mscphis00759.huawei.com (10.123.66.134) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 5 Sep 2023 11:12:26 +0100
From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
To: <richard@nod.at>
CC: <chengzhihao1@huawei.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <yusongping@huawei.com>,
	<artem.kuzin@huawei.com>
Subject: [PATCH] ubifs: fix possible dereference after free
Date: Tue, 5 Sep 2023 18:12:22 +0800
Message-ID: <20230905101222.1725230-1-konstantin.meskhidze@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.123.66.134]
X-ClientProxiedBy: mscpeml100002.china.huawei.com (7.188.26.75) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_031236_034976_B246861E 
X-CRM114-Status: UNSURE (   5.99  )
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

'old_idx' could be dereferenced after free via 'rb_link_node' function
call.

Fixes: b5fda08ef213 ("ubifs: Fix memleak when insert_old_idx() failed")
Co-developed-by: Ivanov Mikhail <ivanov.mikhail1@huawei-partners.com>
Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
---
 fs/ubifs/tnc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 6b7d95b65f4b..f4728e65d1bd 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -64,8 +64,9 @@ static void do_insert_old_idx(struct ubifs_info *c,
 			p = &(*p)->rb_right;
 		else {
 			ubifs_err(c, "old idx added twice!");
 			kfree(old_idx);
+			return;
 		}
 	}
 	rb_link_node(&old_idx->rb, parent, p);
 	rb_insert_color(&old_idx->rb, &c->old_idx);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
