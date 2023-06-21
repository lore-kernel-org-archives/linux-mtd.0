Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF297EB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jun 2023 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2NQBBgyoy3Zo8Ql/EF2DgN2zcLx9OjtFQ5VF5AMxhE4=; b=CmWhrCqEfLLW8w
	NljBdOFrwuuVBgiY+jAvfmh4idlDZVrL11D8Sq++TOs2A7Io0y+EAgfDdCSII+mJLcfO0s7RpiPao
	e0m9rMsfkEXr5O4+2MkqV/h+9SDHNIrHRdtwjRwz3nSGjpilnEqFvocC3tcRW82AXnURySYCwoP3s
	zCigrENbSudD97bE+8BLZxYUBmTY9+LMvyZTmJRNge8dpdCxiFcMlKthIaDay9pRZHyVcCi5R7Bs7
	JTKDFSuTmTsqRvocpolBlqY97ROb/JPtnrxiEUxuuinra9sJbGcAhZFqvHWuv+XRcgIc/C0z6VJE0
	KRem0axB6PRAu90MJbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBnCI-00Ctfe-31;
	Wed, 21 Jun 2023 02:03:50 +0000
Received: from ssh247.corpemail.net ([210.51.61.247])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBnCF-00CteR-1g
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jun 2023 02:03:49 +0000
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id QYY00037;
        Wed, 21 Jun 2023 10:03:37 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2507.23; Wed, 21 Jun 2023 10:03:34 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH] mtd: sm_ftl: Fix typos in comments
Date: Tue, 20 Jun 2023 22:03:31 -0400
Message-ID: <20230621020331.1508-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.200.104.82]
tUid: 2023621100338e7b17d446fcc507dc9532ed0c123fa0d
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_190347_876170_EA0A5BF6 
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
