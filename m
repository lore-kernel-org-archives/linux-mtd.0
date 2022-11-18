Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0074BC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtLDIEEcLGUcbUQQRh8t6VAxOu07Ib9jaqCVm0qK6ek=; b=U8jgZIzGt4kPz0
	JRfEsGnVvPe9obtwsUn1oLBbsOG4E2PG/o9apvOaROlmHp82XmdQN//WRUNWWkahu5YJFtUjWHNOP
	SDaepUveKp79JDIw+TTIQhRqWer0u5mvg8Uz4z2ft0uxpg560pybyNcGGEm6vi3resL51lKqA+wHP
	d2jIwX+BLc3N/ODflcH4gHJERQL5hjaLGnqp3xdNELrXvA9qCNG3aMSBMN/EJDq33qMyvc8atEZBw
	4Wntw7+2RTb72KthYTtLKPaWLXq0GHiD/ooUcRM31F2IpBbSujEQsM4o7ahTHT6mqtvpOlfuTB8NX
	nJOl+rYrt00ODj31G89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwwC-002pJB-D1; Fri, 18 Nov 2022 08:41:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovww8-002pGm-6c
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:41:26 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ND9Gk3y40zHw1N;
	Fri, 18 Nov 2022 16:40:46 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 16:41:18 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 16:41:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 1/2] ubifs: Re-statistic cleaned znode count if commit failed
Date: Fri, 18 Nov 2022 17:02:35 +0800
Message-ID: <20221118090236.664244-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221118090236.664244-1-chengzhihao1@huawei.com>
References: <20221118090236.664244-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_004124_615017_30460533 
X-CRM114-Status: UNSURE (   9.26  )
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

Dirty znodes will be written on flash in committing process with
following states:

	      process A			|  znode state
------------------------------------------------------
do_commit				| DIRTY_ZNODE
  ubifs_tnc_start_commit		| DIRTY_ZNODE
   get_znodes_to_commit			| DIRTY_ZNODE | COW_ZNODE
    layout_commit			| DIRTY_ZNODE | COW_ZNODE
     fill_gap                           | 0
  write master				| 0 or OBSOLETE_ZNODE

	      process B			|  znode state
------------------------------------------------------
do_commit				| DIRTY_ZNODE[1]
  ubifs_tnc_start_commit		| DIRTY_ZNODE
   get_znodes_to_commit			| DIRTY_ZNODE | COW_ZNODE
  ubifs_tnc_end_commit			| DIRTY_ZNODE | COW_ZNODE
   write_index                          | 0
  write master				| 0 or OBSOLETE_ZNODE[2] or
					| DIRTY_ZNODE[3]

[1] znode is dirtied without concurrent committing process
[2] znode is copied up (re-dirtied by other process) before cleaned
    up in committing process
[3] znode is re-dirtied after cleaned up in committing process

Currently, the clean znode count is updated in free_obsolete_znodes(),
which is called only in normal path. If do_commit failed, clean znode
count won't be updated, which triggers a failure ubifs assertion[4] in
ubifs_tnc_close():
 ubifs_assert_failed [ubifs]: UBIFS assert failed: freed == n

[4] Commit 380347e9ca7682 ("UBIFS: Add an assertion for clean_zn_cnt").

Fix it by re-statisticing cleaned znode count in tnc_destroy_cnext().

Fetch a reproducer in [Link].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216704
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 488f3da7a6c6..2df56bbc6865 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -3053,6 +3053,21 @@ static void tnc_destroy_cnext(struct ubifs_info *c)
 		cnext = cnext->cnext;
 		if (ubifs_zn_obsolete(znode))
 			kfree(znode);
+		else if (!ubifs_zn_cow(znode)) {
+			/*
+			 * Don't forget to update clean znode count after
+			 * committing failed, because ubifs will check this
+			 * count while closing tnc. Non-obsolete znode could
+			 * be re-dirtied during committing process, so dirty
+			 * flag is untrustable. The flag 'COW_ZNODE' is set
+			 * for each dirty znode before committing, and it is
+			 * cleared as long as the znode become clean, so we
+			 * can statistic clean znode count according to this
+			 * flag.
+			 */
+			atomic_long_inc(&c->clean_zn_cnt);
+			atomic_long_inc(&ubifs_clean_zn_cnt);
+		}
 	} while (cnext && cnext != c->cnext);
 }
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
