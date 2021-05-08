Return-Path: <SRS0=zn6r=KD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427A1C433B4
	for <linux-mtd@archiver.kernel.org>; Sat,  8 May 2021 03:35:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587B261432
	for <linux-mtd@archiver.kernel.org>; Sat,  8 May 2021 03:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587B261432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P8aoJ7u2syLm/QPHCnFFH26sKBu3XS01YPuqX/gBVGE=; b=mVoBkRZ2mQBuSfbjddgvulRLqe
	0o+gFixhH/yzskUn+fY6NmHLtu4e0zqed2ahUgS0zIHMFeP2Ny02iP8ECTWqA4BnEXS6MkR3HuduP
	jD5jbr3X45P3IIgGL0FcHERFudHNU+EkoEm4tdOvoC8+e4Wxmj9Fp60cXMwE7hTf1b7qlCoaSSfrN
	mSryfWoA/v4THlryIQt+5M1Q1a54DW9F/O7bhL77r0Xnp7DyF13xueaBAtT2+sU6f2tSFlKA7NewL
	KlLJKUr3If/v/vXkCwiLJ9/eK0B0MzaYooum7LvTvzsMunq5pnCsWQpQKthKxcee6fu8IUW+gmCZI
	R8ztnzRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfDj3-008fi9-7n; Sat, 08 May 2021 03:33:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfDir-008fgA-6Z
 for linux-mtd@desiato.infradead.org; Sat, 08 May 2021 03:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=guUrlkaLxv+KyAnmc4sYIzpeiRks9WIaKBaFXCqTcdg=; b=3x9otDoCBmfMPt90GBq6ZXQ6Fy
 bVRZp1JbXTFl9qhH8eJ422uxpkUyw02H3L6mGQXJYXJU4Ye7Pl40AtEmveTGqwhjwkS8xu8UvYTEO
 MrTrB902qyKD/PF3GsRVxFNSUJctIjjL5ipUNcQpMNmHODuJuCOzb+ONuLQ38rc9x3Qt2iEK+PhQj
 PANDcuQHZdXINFxj9N56pnj4tY3CYYkqA91gORZRA6S2Z1tor9nRmNJ1duzYWsA9NJOh4M7cybyi8
 Ys3LlnWXzPBqSGsqBbKeRGlz79rvdRZFtjCT0dnYnUHSL2q2NbaPVj+76KkEuCtkfLqDVJNaLCuOF
 bsUTmDlg==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfDio-007LVT-9M
 for linux-mtd@lists.infradead.org; Sat, 08 May 2021 03:33:43 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FcXsr4sLTzlbyJ;
 Sat,  8 May 2021 11:31:28 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 11:33:26 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] ubifs: journal: Fix error return code in
 ubifs_jnl_write_inode()
Date: Sat, 8 May 2021 11:33:13 +0800
Message-ID: <20210508033313.2227-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_203342_510557_843DA6C1 
X-CRM114-Status: UNSURE (   7.72  )
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

Fix to return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Fixes: 9ca2d7326444 ("ubifs: Limit number of xattrs per inode")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 fs/ubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 2857e64d673d..230717384a38 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -882,6 +882,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		struct ubifs_dent_node *xent, *pxent = NULL;
 
 		if (ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
+			err = -EPERM;
 			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
 			goto out_release;
 		}
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
