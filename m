Return-Path: <SRS0=JW0y=I5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87F2C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 06:29:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DBB619BB
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 06:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DBB619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x5BTKhrlPnciglzbJkpPic180XKbKafv2IHYFt2uoWc=; b=Gs5VaKDvqQ9AcMFgrFnQAn0f78
	/GYIY78AE9dvf3ThYskQPPxgtSVrpOx2drQPZ2LNYS7cF1FjwYtlOlrUmlOuJcCwPqSdUg+nisJgr
	CNYwVA7AjNmqUK+3W1OlDKSFfOptf8OdXLp66JBgPbqwqColREVSNE9OOXiNqzxU50rnRg+riE+d3
	ek4FtG6wJAKAKzl+wheBOx6xwWDOLj7kOMY20wtu2LCdXHc5JYRTMwL0AZKHmScziy0cfPyWUkls3
	f3vArrRrEq5hssCLmRMd1BiaxM/ffLh1x+SfbkLlYpLUPtmoIxQKeUrx3I77xT6KlmJHggvEkQTgi
	EoBIy2WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRUKf-005d2B-PT; Wed, 31 Mar 2021 06:28:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRUKK-005cw0-Hk
 for linux-mtd@lists.infradead.org; Wed, 31 Mar 2021 06:27:45 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9GXY3y3XzlWkW;
 Wed, 31 Mar 2021 14:25:49 +0800 (CST)
Received: from DESKTOP-JU2N2LB.china.huawei.com (10.67.102.42) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 14:27:23 +0800
From: wangfangpeng <wangfangpeng1@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>,
 <Artem.Bityutskiy@nokia.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <nixiaoming@huawei.com>, <zengweilin@huawei.com>, <stable@vger.kernel.org>
Subject: [PATCH] ubifs: fix read fail but return ok
Date: Wed, 31 Mar 2021 14:27:23 +0800
Message-ID: <20210331062723.2090-1-wangfangpeng1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.102.42]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_072741_073858_745DB286 
X-CRM114-Status: UNSURE (   8.38  )
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

do_readpage() may return err, but ubifs_readpage() always return ok.
The vfs will ignore the err happen in ubifs.

Fixes: 1e51764a3c2ac05a2 ("UBIFS: add new flash file system")
Cc: <stable@vger.kernel.org> #v2.6.27
Signed-off-by: wangfangpeng <wangfangpeng1@huawei.com>
---
 fs/ubifs/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 0e4b4be3aa26..001feec1d415 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -892,11 +892,13 @@ static int ubifs_bulk_read(struct page *page)
 
 static int ubifs_readpage(struct file *file, struct page *page)
 {
+	int ret;
+
 	if (ubifs_bulk_read(page))
 		return 0;
-	do_readpage(page);
+	ret = do_readpage(page);
 	unlock_page(page);
-	return 0;
+	return ret;
 }
 
 static int do_writepage(struct page *page, int len)
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
