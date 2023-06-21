Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BDBEB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jun 2023 01:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2NQBBgyoy3Zo8Ql/EF2DgN2zcLx9OjtFQ5VF5AMxhE4=; b=gTi8dN/UZFEWBV
	Z9cWdaAYW5vVWU99bPpFAn1G4VXtEc+F9m4BGpUhV4W9YTirtUIqH9eAQZfeIxtvmLw6kZULBOW0q
	YUQUCTOwsONjIX1Hua8Zctjj/5ovlYtiAM272ZiDChr1nnzabY1lVxkdA5+msHzqpAr6d/X89UZ8L
	AA0JG5ExQi7OXo2kuCcUluTkbUeoLKQq9igEoHkTsik9eUVnjilOe5a/6ulWigcMYW6deLkJd7Zr+
	WmrkXsIsx8OGCyzeZ05OsCLonQ+UOgkffC9puOWU5hP+Ms/VfYsdevoExB1Ru2XUJv+oXDNBPUfjJ
	WtB4rKT0/AGNgyAZKYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBn1n-00CsdD-05;
	Wed, 21 Jun 2023 01:52:59 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBn1h-00Csam-2A
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jun 2023 01:52:56 +0000
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id QXV00025;
        Wed, 21 Jun 2023 09:52:25 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2507.23; Wed, 21 Jun 2023 09:52:23 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH] mtd: sm_ftl: Fix typos in comments
Date: Tue, 20 Jun 2023 21:52:22 -0400
Message-ID: <20230621015222.1601-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.200.104.82]
tUid: 2023621095225baff5bacef925e274ee1b79a505c991a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_185253_994255_3C48B741 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Bo Liu <liubo03@inspur.com>

Fix typo in the description of the 'succesfull'.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/mtd/sm_ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4cfec3b7b446..b5b3c4c44a94 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -981,7 +981,7 @@ static int sm_cache_flush(struct sm_ftl *ftl)
 	/* Update the FTL table */
 	zone->lba_to_phys_table[ftl->cache_block] = write_sector;
 
-	/* Write succesfull, so erase and free the old block */
+	/* Write successful, so erase and free the old block */
 	if (block_num > 0)
 		sm_erase_block(ftl, zone_num, block_num, 1);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
