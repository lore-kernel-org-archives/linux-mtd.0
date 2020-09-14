Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD51C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:01:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5344208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CWUKYODK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5344208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sL6ZL7DUT3DQubSQNPT/SWQMJFVKRVhxDyXrWn14t4s=; b=CWUKYODKUqUGfJ3kHiFIhbzNN
	BP7SLkfKavwkyACgZ6mTG9U0/jg4fjwk6p4EaRK85kBrnevUv6tL6FzpfN5gkjZhcw/+rTt2Rdy28
	tbK3UY+v5j4NfuhoKr0JkCK0XJ8ZdYnHrJys02P//IULOdpQajKE2oIszQLgyfc6KZBfqHQ7nSPZA
	EN1cHZtUtczKxetvdDOLsiGQCPt7kzhsz347LMixPkdmBRiJsFP5pOAND7yeEde08XR/GSG7GsoBy
	+JDuqP1sAd66O4Cfw4fXCo3bqQ3/iPORO2F72EdzS7R18NDlV8FMR3615speob6yIxKGeU8ovLTo3
	fbYWvtlMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp1c-000399-Vs; Mon, 14 Sep 2020 14:00:09 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp1X-00035W-EI
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 14:00:04 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 88B5FB3D0255DF42B515;
 Mon, 14 Sep 2020 21:59:48 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 21:59:45 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <richard@nod.at>
Subject: [PATCH -next 4/4] ubifs: Fix some kernel-doc warnings in tnc.c
Date: Mon, 14 Sep 2020 21:56:54 +0800
Message-ID: <20200914135654.55120-5-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914135654.55120-1-wanghai38@huawei.com>
References: <20200914135654.55120-1-wanghai38@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_100003_810234_03759B01 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

fs/ubifs/tnc.c:3479: warning: Excess function parameter 'inum' description in 'dbg_check_inode_size'
fs/ubifs/tnc.c:366: warning: Excess function parameter 'node' description in 'lnc_free'

@inum in 'dbg_check_inode_size' should be @inode, fix it.
@node in 'lnc_free' is not in use, Remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 fs/ubifs/tnc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index f609f6cdde70..de21625804a9 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -360,7 +360,6 @@ static int lnc_add_directly(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 /**
  * lnc_free - remove a leaf node from the leaf node cache.
  * @zbr: zbranch of leaf node
- * @node: leaf node
  */
 static void lnc_free(struct ubifs_zbranch *zbr)
 {
@@ -3466,7 +3465,7 @@ int ubifs_dirty_idx_node(struct ubifs_info *c, union ubifs_key *key, int level,
 /**
  * dbg_check_inode_size - check if inode size is correct.
  * @c: UBIFS file-system description object
- * @inum: inode number
+ * @inode: inode to check
  * @size: inode size
  *
  * This function makes sure that the inode size (@size) is correct and it does
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
