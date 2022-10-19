Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8D2C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kt3IqCW25wZOolZ5gFP62a7FWf9Cs63Wa7wykE2vWaM=; b=bEtJisYXBLm2Nc
	1A0TV+634lOamO3GiiScQfVwXQ5oa9zaYifS836O9lPLpQzuY8FJtk0kvf6yZLwapaZzOfgbwwJk6
	EGRiUxEnZz5MAf7adklgUqWPkl+2uvkHE8VZ/3j1Okphg3FIU9hvsd6HdXPboPXGJTDs58GGRV09E
	OAHB7gj/dAvvh6Uqgpzaia88l6BIH21Le8yCw8oUBCfBJAay5wXYwbojjY/EREf79k/Dqrb0Lh7d+
	yF0gpJpanFQ5uaie8X9wqOUYbE3UeCdVaN7pOLJrg+UOmd1QZGaRQBX/y29mVcWFfftddEJHcZgH2
	GPN6gvNXYmYWfYIamnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol2wa-00FrET-Vd; Wed, 19 Oct 2022 06:52:49 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol2wC-00FqH7-HC
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 06:52:26 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MshDF1WqMzJn1m;
	Wed, 19 Oct 2022 14:49:33 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 14:51:37 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <lizetao1@huawei.com>, <miquel.raynal@bootlin.com>, <kernel@kempniu.pl>,
	<tglx@cruncher.tec.linutronix.de>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] jffs2: fix lock not released on error handling path in jffs2_flash_writev()
Date: Wed, 19 Oct 2022 15:54:58 +0800
Message-ID: <20221019075458.2072174-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_235224_775545_0E95A409 
X-CRM114-Status: UNSURE (   8.83  )
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

When jffs2_sum_add_kvec() returns an error in jffs2_flash_writev(), the
write lock will not be released, resulting in a deadlock.

Fix it by releasing the write lock on error handling path.

Fixes: dcb0932884b8 ("[JFFS2] Simplify writebuffer handling")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/jffs2/wbuf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 4061e0ba7010..ba3e9f4ba1d8 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -903,9 +903,9 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,
 	*retlen = donelen;
 
 	if (jffs2_sum_active()) {
-		int res = jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
-		if (res)
-			return res;
+		ret = jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
+		if (ret)
+			goto outsum;
 	}
 
 	if (c->wbuf_len && ino)
@@ -930,6 +930,8 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,
 
 outerr:
 	*retlen = 0;
+
+outsum:
 	up_write(&c->wbuf_sem);
 	return ret;
 }
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
