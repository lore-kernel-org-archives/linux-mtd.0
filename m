Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F2CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Apr 2022 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BMsxhLZohTmBMTwt53nIOB3k68W4qmkB3mCskTyRG7M=; b=XoAAQOYjSE6cG6
	XYzOUFOCs3s8/ZNirZDpWZTlYP9crvQCzsqqLUuQrYeJlEm911ot0crRWdbFed8C9LNJdrVoa+Top
	sL6tnXn29zu2tip+q8f0U51liOJfuht3pXV73YlPMn7qLBmSyvmVcMg6O9q4joYIzIOsHhmDYLYc5
	tE156EweMpEghXZ/AGEUPn45B7H5E1mWF7y7iuiYleNUHUf/dZd1UZB5FpzdZ91D8FZF8gPllEBMP
	dOiZMRYhoO/Jr482V5sZf5rD2BQ+1IrOKQ2AQkdq1mGjCWvXD2tQkrtuNGSNRoI3jslBYwLi9u+C9
	60I7V3fiTRTApqyRC4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naBdQ-004mhf-Th; Fri, 01 Apr 2022 07:23:52 +0000
Received: from edge05.meizu.com ([157.122.146.251] helo=mail.meizu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naBdN-004meV-AZ
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2022 07:23:51 +0000
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 1 Apr
 2022 15:23:34 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Apr
 2022 15:23:32 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] fs/jffs2: Fix potential NULL dereference in
 jffs2_add_frag_to_fragtree()
Date: Fri, 1 Apr 2022 15:23:30 +0800
Message-ID: <1648797810-27042-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_002349_582595_69DFF224 
X-CRM114-Status: UNSURE (   9.83  )
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

this could be null, so we need to checking null before dereference

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 fs/jffs2/nodelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index b86c78d178c6..ed3b3b25bfab 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -246,7 +246,7 @@ static int jffs2_add_frag_to_fragtree(struct jffs2_sb_info *c, struct rb_root *r
 		return no_overlapping_node(c, root, newfrag, this, lastend);
 	}
 
-	if (this->node)
+	if (this && this->node)
 		dbg_fragtree2("dealing with frag %u-%u, phys %#08x(%d).\n",
 		this->ofs, this->ofs + this->size,
 		ref_offset(this->node->raw), ref_flags(this->node->raw));
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
