Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1461C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 08:55:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3572420756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 08:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9+02ZF+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3572420756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rRCpztsfUkSg7GIUcLwMu/lwADtkYNbLkM866Qq+Ty4=; b=p9+02ZF+Ne3nOHzRDUQ5uHNREm
	AyND7Ql1n6bMZVZs2xtlMgY9mCDTM9kJq5BXAWh+yKb+vfIliAODDeHjwAXnHHtZnoOIsrfcGQAuY
	4Cw13vgtAqSYNE6NnQkj6wGaJG/u9dJuWZpRUJvEHAksVRMYMs9LpJwxEnhgKPYbxDkLeB4y+RBjH
	xc9tQfeHOaOiQNE0x9sxoapptL72hX5jvSiff59nG7mrAwugoK6A1meByLnIgQTB/cDOKqsjCT902
	vFu/ZrTv74ksEsJfviEFxGcdFiiEC7wDZsL7TWVP5STztei3fejdtH4yFjTgmGdOsoygW6NECa/3X
	cdpil7IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmem-0002UG-MP; Sat, 31 Oct 2020 08:54:40 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmek-0002Ts-4p
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 08:54:39 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CNXzn32bXzhcmS;
 Sat, 31 Oct 2020 16:54:29 +0800 (CST)
Received: from DESKTOP-2DH7KI2.china.huawei.com (10.67.101.108) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 16:54:20 +0800
From: Chengsong Ke <kechengsong@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH v2] ubifs: Fix the printing type of c->big_lpt
Date: Sat, 31 Oct 2020 16:54:20 +0800
Message-ID: <20201031085420.1316-1-kechengsong@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_045438_461132_35DF9E58 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangfangpeng1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ubifs uses %d to print c->big_lpt, but c->big_lpt is a variable
of type unsigned int and should be printed with %u.

Signed-off-by: Chengsong Ke <kechengsong@huawei.com>
---
 fs/ubifs/debug.c | 2 +-
 fs/ubifs/lpt.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index ebff43f8009c..ef1a02ee076f 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -764,7 +764,7 @@ void ubifs_dump_lpt_info(struct ubifs_info *c)
 	pr_err("\tnnode_sz:      %d\n", c->nnode_sz);
 	pr_err("\tltab_sz:       %d\n", c->ltab_sz);
 	pr_err("\tlsave_sz:      %d\n", c->lsave_sz);
-	pr_err("\tbig_lpt:       %d\n", c->big_lpt);
+	pr_err("\tbig_lpt:       %u\n", c->big_lpt);
 	pr_err("\tlpt_hght:      %d\n", c->lpt_hght);
 	pr_err("\tpnode_cnt:     %d\n", c->pnode_cnt);
 	pr_err("\tnnode_cnt:     %d\n", c->nnode_cnt);
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 6e0a153b7194..778a22bf9a92 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -851,7 +851,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	dbg_lp("lsave_sz %d", c->lsave_sz);
 	dbg_lp("lsave_cnt %d", c->lsave_cnt);
 	dbg_lp("lpt_hght %d", c->lpt_hght);
-	dbg_lp("big_lpt %d", c->big_lpt);
+	dbg_lp("big_lpt %u", c->big_lpt);
 	dbg_lp("LPT root is at %d:%d", c->lpt_lnum, c->lpt_offs);
 	dbg_lp("LPT head is at %d:%d", c->nhead_lnum, c->nhead_offs);
 	dbg_lp("LPT ltab is at %d:%d", c->ltab_lnum, c->ltab_offs);
@@ -1824,7 +1824,7 @@ static int lpt_init_rd(struct ubifs_info *c)
 	dbg_lp("lsave_sz %d", c->lsave_sz);
 	dbg_lp("lsave_cnt %d", c->lsave_cnt);
 	dbg_lp("lpt_hght %d", c->lpt_hght);
-	dbg_lp("big_lpt %d", c->big_lpt);
+	dbg_lp("big_lpt %u", c->big_lpt);
 	dbg_lp("LPT root is at %d:%d", c->lpt_lnum, c->lpt_offs);
 	dbg_lp("LPT head is at %d:%d", c->nhead_lnum, c->nhead_offs);
 	dbg_lp("LPT ltab is at %d:%d", c->ltab_lnum, c->ltab_offs);
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
