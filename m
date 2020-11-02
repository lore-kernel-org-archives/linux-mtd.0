Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCA4C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 08:28:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1EF22275
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 08:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ka8cI+cE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1EF22275
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpCivtgThZ2iR8uvvzJ2IfFpXnlHYouRdx37ikq+aVg=; b=Ka8cI+cEeTtUpC/AJqnfL4qO1T
	5as2DLFc4OjrmOSEC7WvgrRqOK55p+4eyev+NViKhfhcBRvXed2wv0odcn2VCUq/EbN41IY9R//5g
	D20/D8HGjW3QezXrFVVmgyQfMeoPzwARtML0Ux684BpoQGcFeRgeyiwxfMbD2/FcfzM2lPGF1jxjU
	IPTV01uxG8HOiySTsAsRLLAA2uXxUUFRAhu0j8uErFW1CTbYnsT2wVcJXtsjPjqItc/MuPTICTU9M
	VIIAr/N3/xYJ6jKwozN7TxSAEp4xlWDZ2EM4cgXMSRiRebKyvBjnWRWBXojDUAH5RzGgLRPov3hfg
	YNcxcLPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZVC7-0005yF-Dv; Mon, 02 Nov 2020 08:28:03 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZVC3-0005xT-0p
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 08:28:02 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPmJ82Ymrzhf1C;
 Mon,  2 Nov 2020 16:27:52 +0800 (CST)
Received: from DESKTOP-2DH7KI2.china.huawei.com (10.67.101.108) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 16:27:43 +0800
From: Chengsong Ke <kechengsong@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH] ubifs: Remove the redundant return in
 dbg_check_nondata_nodes_order
Date: Mon, 2 Nov 2020 16:27:43 +0800
Message-ID: <20201102082743.34172-1-kechengsong@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_032759_335528_959E7695 
X-CRM114-Status: UNSURE (   8.59  )
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

There is a redundant return in dbg_check_nondata_nodes_order,
which will be never reached. In addition, error code should be
returned instead of zero in this branch.

Signed-off-by: Chengsong Ke <kechengsong@huawei.com>
---
 fs/ubifs/debug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index ebff43f8009c..b2db518056cb 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2442,7 +2442,6 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 	ubifs_msg(c, "dumping second node");
 	ubifs_dump_node(c, sb->node);
 	return -EINVAL;
-	return 0;
 }
 
 static inline int chance(unsigned int n, unsigned int out_of)
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
