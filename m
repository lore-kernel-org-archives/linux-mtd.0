Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD607C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 01:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B32961077
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 01:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B32961077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3YbLIuHhiaVfl0KSbxsEvmmDskuomOcTwfPIGVKxME=; b=JxU5c/7ToMQYnz
	UzbFzDMTbzTBpxPM922tiVg0jpM4jo33CNlZ86NHO8k9dbPBbdAP8BzIAXt9oMZPO65xcTmIBC3HV
	vOcv0ceL/8RG34AQaXKWESylpgjAPkCnGMlxY+Se+Nud+r5Vifb5SvN8UU6KugDLopSWDG7hyGYFs
	hHVVGOAkLu7PvTEf3CcezSy6Hy2umqYfZgI5SDC6pERhK8v48NaRF5QL5iUikAa9fNed6Ldz+ycbZ
	rcNo2QoNAXjHrPjaFolhmpRJeJ/tlKfsyl5/dPf+VzrBD7NQuIjQQwcHEC4UywqrnhXp1EGV8IH6p
	Twl/gxePHEsN70fOUGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmQei-00ECcX-Nu; Mon, 15 Nov 2021 01:19:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmQef-00ECbQ-KJ
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 01:19:31 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hsrnb6cp6zcbH3;
 Mon, 15 Nov 2021 09:14:27 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 15 Nov 2021 09:19:21 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 15 Nov
 2021 09:19:20 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>, Hulk Robot
 <hulkci@huawei.com>
Subject: [PATCH -next 1/3] ubifs: fix slab-out-of-bounds in ubifs_change_lp
Date: Mon, 15 Nov 2021 09:31:42 +0800
Message-ID: <20211115013144.2479319-2-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115013144.2479319-1-libaokun1@huawei.com>
References: <20211115013144.2479319-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_171929_884025_3CB05799 
X-CRM114-Status: GOOD (  14.08  )
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

Hulk Robot reported a KASAN report about slab-out-of-bounds:
 ==================================================================
 BUG: KASAN: slab-out-of-bounds in ubifs_change_lp+0x3a9/0x1390 [ubifs]
 Read of size 8 at addr ffff888101c961f8 by task fsstress/1068
 [...]
 Call Trace:
  check_memory_region+0x1c1/0x1e0
  ubifs_change_lp+0x3a9/0x1390 [ubifs]
  ubifs_change_one_lp+0x170/0x220 [ubifs]
  ubifs_garbage_collect+0x7f9/0xda0 [ubifs]
  ubifs_budget_space+0xfe4/0x1bd0 [ubifs]
  ubifs_write_begin+0x528/0x10c0 [ubifs]

 Allocated by task 1068:
  kmemdup+0x25/0x50
  ubifs_lpt_lookup_dirty+0x372/0xb00 [ubifs]
  ubifs_update_one_lp+0x46/0x260 [ubifs]
  ubifs_tnc_end_commit+0x98b/0x1720 [ubifs]
  do_commit+0x6cb/0x1950 [ubifs]
  ubifs_run_commit+0x15a/0x2b0 [ubifs]
  ubifs_budget_space+0x1061/0x1bd0 [ubifs]
  ubifs_write_begin+0x528/0x10c0 [ubifs]
 [...]
 ==================================================================

In ubifs_garbage_collect(), if ubifs_find_dirty_leb returns an error,
lp is an uninitialized variable. But lp.num might be used in the out
branch, which is a random value. If the value is -1 or another value
that can pass the check, soob may occur in the ubifs_change_lp() in
the following procedure.

To solve this problem, we initialize lp.lnum to -1, and then initialize
it correctly in ubifs_find_dirty_leb, which is not equal to -1, and
ubifs_return_leb is executed only when lp.lnum != -1.

if find a retained or indexing LEB and continue to next loop, but break
before find another LEB, the "taken" flag of this LEB will be cleaned
in ubi_return_lebi(). This bug has also been fixed in this patch.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/ubifs/gc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index dc3e26e9ed7b..05e1eeae8457 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -692,6 +692,9 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 	for (i = 0; ; i++) {
 		int space_before, space_after;
 
+		/* Maybe continue after find and break before find */
+		lp.lnum = -1;
+
 		cond_resched();
 
 		/* Give the commit an opportunity to run */
@@ -843,7 +846,8 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 	ubifs_wbuf_sync_nolock(wbuf);
 	ubifs_ro_mode(c, ret);
 	mutex_unlock(&wbuf->io_mutex);
-	ubifs_return_leb(c, lp.lnum);
+	if (lp.lnum != -1)
+		ubifs_return_leb(c, lp.lnum);
 	return ret;
 }
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
