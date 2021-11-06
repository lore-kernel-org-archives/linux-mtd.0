Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EFFC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFC761165
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAFC761165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgBTih89FPgMECrmctB38d2krsblV4Xd6cAd7YGNqHw=; b=uDzrekRRkGJB93
	fza94ttqM427hMUYfAT8asitl/sJkcX7T88cNDfdbBWk4fQSWWlsSgYQV2pf/T8vB7EA8KUrbh9ie
	R3rJNIlciVafeVHBDqkfUDVHZ6s/4JFCf/WjUqKrWHQ8UIxCGgMvdbQ6HWPXRWjfAdLgQF5J6N7Hq
	CVqOCKJdsK2m8P2787XmGod/f4qhSIY96720njKK7yLkA5LtpysipaUf9+4NAykFxGdwy+vl4vi/o
	kZGrQpf4yZL6P9Jd+rWDX5FPidreA9PEUxULCoMWodhglNmsFOdl2qrmgYV3O6hA4rBFNJQCbOETk
	e6pYMMX8aLF2lKMdPRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOle-00D71b-Nm; Sat, 06 Nov 2021 16:42:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKcF-00Cymn-2y
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=na1mk0VsU43sbQ4py0U/YYf38A6yvsfOMRuSo1Ztz0w=; b=jWbdra4vP/Etkt3ez2ziVm60kR
 MoqwUD3ek4ulHbls2REgkAZ9MH9NjtrcfmaelsizMC+S5J41zy1uDLoFgMM3CC5Ju/H+WnHUYvfwB
 lr/wv5BU77vsbx8q4w3RlN27004szMUPadIX5rJwr4vOL/XI1bPKK9Uwh6bEJNO+LueNyjamlTWpR
 9ZX5l8Aj6tkTBw53LGqQOjYI4OFeIh1GNko5Iemuwbp2ZR0lPiBnGMWvieEJPkrPj1aklDu+h9TVM
 LTf9Q8CIcfvTT29747YZRtWgjOCnCfpL9WUA/G1k471HnTTUhgh3rnPrUOPPCUgvgEzpVE0wnEZno
 ims2jScQ==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKaV-007Cwe-KN
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:15:11 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hmbjm5Bk8zbhZD;
 Sat,  6 Nov 2021 20:07:56 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:43 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 04/12] ubifs: Add missing iput if do_tmpfile() failed in
 rename whiteout
Date: Sat, 6 Nov 2021 20:25:09 +0800
Message-ID: <20211106122517.3304628-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106122517.3304628-1-chengzhihao1@huawei.com>
References: <20211106122517.3304628-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121459_251854_AFE993C6 
X-CRM114-Status: UNSURE (   7.37  )
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

whiteout inode should be put when do_tmpfile() failed if inode has been
initialized. Otherwise we will get following warning during umount:
  UBIFS error (ubi0:0 pid 1494): ubifs_assert_failed [ubifs]: UBIFS
  assert failed: c->bi.dd_growth == 0, in fs/ubifs/super.c:1930
  VFS: Busy inodes after unmount of ubifs. Self-destruct in 5 seconds.

Fixes: 9e0a1fff8db56ea ("ubifs: Implement RENAME_WHITEOUT")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 2735ad1affed..6503e6857f6e 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1334,6 +1334,8 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 		err = do_tmpfile(old_dir, old_dentry, S_IFCHR | WHITEOUT_MODE, &whiteout);
 		if (err) {
+			if (whiteout)
+				iput(whiteout);
 			kfree(dev);
 			goto out_release;
 		}
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
