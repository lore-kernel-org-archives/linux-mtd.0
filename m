Return-Path: <SRS0=2ZLh=B3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112AAC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 14:30:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0C1820729
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 14:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rCh0QmMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0C1820729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hYmAyuzSI+GmBWlTNJeJlh+puZK1wOl4QdIQOqqHc2g=; b=rCh0QmMk54k2jxE5aJ8Plc6vhP
	95ox8ZH+V84LSf76pB5xwHyYRjYXgXgpUafEhIDACu3Annf5OS5E0SM2DdabA06kOKyVqFLw/2JIq
	RTIAWIRT//KKze7T/DsfX6knNAvSDexcYexr255c2v0RZu5OImYcvwQLbck90H91T3kooAj3pS0Mx
	vaSwu2dbzL/spjchnWAlfaS+IUxR/1MHI/xnZV35iUpNgwlsHcs4n13v2CxfYMyE1tgp7EICtwNZr
	PSBdUfNn5d9WzefIVB9DgiOXV71QJ9PLg5Pgur/ZxYhU8BHLB4AlB8CIkD3IIVv4zWvGsQqButVNX
	07DdI8VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7g8r-0006Vf-1t; Mon, 17 Aug 2020 14:29:41 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7g8o-0006TR-4s
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2020 14:29:39 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5D1E6EE9A0B1D631E51B;
 Mon, 17 Aug 2020 22:29:26 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 17 Aug 2020
 22:29:17 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard.weinberger@gmail.com>, <yi.zhang@huawei.com>
Subject: [PATCH] ubifs: ubifs_jnl_change_xattr: Remove assertion 'nlink > 0'
 for host inode
Date: Mon, 17 Aug 2020 22:29:09 +0800
Message-ID: <20200817142909.1972897-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_102938_450334_3F2FBB36 
X-CRM114-Status: UNSURE (   7.64  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Changing xattr of a temp file will trigger following assertion failed
and make ubifs turn into readonly filesystem:
  ubifs_assert_failed [ubifs]: UBIFS assert failed: host->i_nlink > 0,
  in fs/ubifs/journal.c:1801

Reproducer:
  1. fd = open(__O_TMPFILE)
  2. fsetxattr(fd, key, value2, XATTR_CREATE)
  3. fsetxattr(fd, key, value2, XATTR_REPLACE)

Fix this by removing assertion 'nlink > 0' for host inode.

Reported-by: Chengsong Ke <kechengsong@huawei.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/journal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4a5b06f8d812..0b9f686d1d42 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1798,7 +1798,6 @@ int ubifs_jnl_change_xattr(struct ubifs_info *c, const struct inode *inode,
 	u8 hash[UBIFS_HASH_ARR_SZ];
 
 	dbg_jnl("ino %lu, ino %lu", host->i_ino, inode->i_ino);
-	ubifs_assert(c, host->i_nlink > 0);
 	ubifs_assert(c, inode->i_nlink > 0);
 	ubifs_assert(c, mutex_is_locked(&host_ui->ui_mutex));
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
