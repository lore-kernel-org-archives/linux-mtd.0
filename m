Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F9FCD4F4E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 01:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ensElgwt5PNfrO8FS488nn8AEipRB6ZQnHiUSVY6+G8=; b=zI+URlyxMtuqHH
	GNYIu9kK3Uf2AmSZmQ2cVYOPaep95P8R45hbAzBisaJcGanlqF8gKSY/SquRpk6OJcbPw6S/uIdVf
	rU5A2awpVVst3vJRAxfqC9UzBg/xdqg4TL6OAQJmvXPCp9HAbgUxEaizB7vMB+4WHFP72T3c18Y8V
	ifWJ4Im7FWsB1sG2LEt4PqdrnYDQJH1eIuhJdCq8ETtTRvnA6677emjGCAPCpqK9ZSqPRnHv5Yxt+
	hxmI00Uwzfqr1jvoSMfw3e8mG6u/rhP59PCc/b/UkvmlWWBgXgPUzI3gbJtTBeG5hvBBNBBZzjQTz
	TuxCo3GBb5HGaBrqyNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm11a-00000006YUk-1ROC;
	Thu, 05 Sep 2024 01:11:02 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm11W-00000006YT0-3FTU
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 01:11:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wzh4X265vz69Wt;
	Thu,  5 Sep 2024 09:05:48 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 722E5140155;
	Thu,  5 Sep 2024 09:10:46 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 5 Sep
 2024 09:10:45 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubifs: Correct the total block count by deducting journal reservation
Date: Thu, 5 Sep 2024 09:09:09 +0800
Message-ID: <20240905010909.317734-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_181059_072855_E25A6CBD 
X-CRM114-Status: GOOD (  11.46  )
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

Since commit e874dcde1cbf ("ubifs: Reserve one leb for each journal
head while doing budget"), available space is calulated by deducting
reservation for all journal heads. However, the total block count (
which is only used by statfs) is not updated yet, which will cause
the wrong displaying for used space(total - available).
Fix it by deducting reservation for all journal heads from total
block count.

Fixes: e874dcde1cbf ("ubifs: Reserve one leb for each journal head while doing budget")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 291583005dd1..245a10cc1eeb 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -773,10 +773,10 @@ static void init_constants_master(struct ubifs_info *c)
 	 * necessary to report something for the 'statfs()' call.
 	 *
 	 * Subtract the LEB reserved for GC, the LEB which is reserved for
-	 * deletions, minimum LEBs for the index, and assume only one journal
-	 * head is available.
+	 * deletions, minimum LEBs for the index, the LEBs which are reserved
+	 * for each journal head.
 	 */
-	tmp64 = c->main_lebs - 1 - 1 - MIN_INDEX_LEBS - c->jhead_cnt + 1;
+	tmp64 = c->main_lebs - 1 - 1 - MIN_INDEX_LEBS - c->jhead_cnt;
 	tmp64 *= (long long)c->leb_size - c->leb_overhead;
 	tmp64 = ubifs_reported_space(c, tmp64);
 	c->block_cnt = tmp64 >> UBIFS_BLOCK_SHIFT;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
