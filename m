Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0696CC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:45:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895E920708
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iy9wsL3/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895E920708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WGCEXbU7faXtrhqfRtBoTAv/PX1cyUzq1VbtkaEHNYM=; b=iy9wsL3/il94Rn85ZVzu6AeBE
	YjOJDPTg2TZ04PrsSOKabfYpqGlGJ55w8hGNB1p5kf15RM5GIrkJSRSg9gF4mP22U/CwRQERuYTnj
	7bSeWXOPJdv4rA5vdc8fnXwA+g1zAhRabuRfJO3OHqzhQFEAPi1AxwvbtzTMUq7skzQm2k1ZUH1FJ
	PpM+nffgwYZn0ed7cSiS1PDIM1mo4rwra3zVH88jYxcx4nkVAseb1r5hORzLBRbAvPFlJ9oL1t5t+
	RcZPWYn6SZxOVdsijRXMXNkxeWj2BDlNsGy0fb1QZVUwScUuRCb2mAn4va3u8WOFmwCmR/+sU3Wu2
	Cr0siopvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNF0D-0007vC-Ec; Tue, 29 Sep 2020 12:45:05 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNF07-0007nr-TI
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 12:45:01 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 12B1BA077F780E8966CE;
 Tue, 29 Sep 2020 20:44:44 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 20:44:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH 2/3] ubifs: Don't parse authentication mount options in
 remount process
Date: Tue, 29 Sep 2020 20:45:30 +0800
Message-ID: <20200929124531.941873-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200929124531.941873-1-chengzhihao1@huawei.com>
References: <20200929124531.941873-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_084500_260316_85B593D2 
X-CRM114-Status: GOOD (  10.04  )
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
 yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no need to dump authentication options while remounting,
because authentication initialization can only be doing once in
the first mount process. Dumping authentication mount options in
remount process may cause memory leak if UBIFS has already been
mounted with old authentication mount options.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <stable@vger.kernel.org>  # 4.20+
Fixes: d8a22773a12c6d7 ("ubifs: Enable authentication support")
---
 fs/ubifs/super.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 6f85cd618766..9796f5df2f7f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1110,14 +1110,20 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			break;
 		}
 		case Opt_auth_key:
-			c->auth_key_name = kstrdup(args[0].from, GFP_KERNEL);
-			if (!c->auth_key_name)
-				return -ENOMEM;
+			if (!is_remount) {
+				c->auth_key_name = kstrdup(args[0].from,
+								GFP_KERNEL);
+				if (!c->auth_key_name)
+					return -ENOMEM;
+			}
 			break;
 		case Opt_auth_hash_name:
-			c->auth_hash_name = kstrdup(args[0].from, GFP_KERNEL);
-			if (!c->auth_hash_name)
-				return -ENOMEM;
+			if (!is_remount) {
+				c->auth_hash_name = kstrdup(args[0].from,
+								GFP_KERNEL);
+				if (!c->auth_hash_name)
+					return -ENOMEM;
+			}
 			break;
 		case Opt_ignore:
 			break;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
