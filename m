Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25041C25B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YfaXqK/1S14238eue3UXmCJCDRsHf9NQsuEEo1T6EG8=; b=JH5pkpcqcOvw3c
	R2U3qFRh5eXoadt+mlWu8oG69HWfMicreBQaumsewWHvKy0innsxXGdhbVWqWLKu3eIjtCUucPu8i
	i9eLZl00CrbwBoI0DmHQ+aTLr5mDeiEFXSYfRvmbfhRTGL/5RuiB3K69tzVKkqm73AFv7ms8N1Dkc
	8QWF4vPqjNmjnMnJpN32NdI0HiQQ8axfRPfdbQ7+uijqDCfOrI/qROITelxl3N5NYK68DaQh+CwXZ
	A5YZRMAAFCNPzarazMDRS3yCujAFmHqOFS/L+1OfKEbzSrQaLpT9V2mI5GDwj88msV2qKU+mP49Nl
	ZrCTHFco5Fn9H3GAkYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOyA-00000001Zki-2J5Q;
	Tue, 04 Jun 2024 07:52:34 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOy6-00000001ZkC-42TG
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 07:52:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VtjSt1QCCzclNH;
	Tue,  4 Jun 2024 15:50:54 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id BFC5B18007A;
	Tue,  4 Jun 2024 15:52:17 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Jun
 2024 15:52:17 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>, <willy@infradead.org>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubifs: Fix inconsistent inode size when powercut happens during appendant writing
Date: Tue, 4 Jun 2024 15:52:16 +0800
Message-ID: <20240604075216.4023884-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_005231_242545_8FF552D5 
X-CRM114-Status: GOOD (  13.21  )
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

UBIFS always make sure that the data length won't beyond the inode size
by writing inode before writing page(See ubifs_writepage.). After commit
c35acef383f4a2f2cfc30("ubifs: Convert ubifs_writepage to use a folio"),
the rule is broken in one case: Given a file with size 3, then write 4096
from the offset 0, following process will make inode size be smaller than
file data length after powercut & recovery:
         P1             P2
ubifs_writepage
 len = folio_size(folio) // 4096
 if (folio_pos(folio) + len <= i_size) // condition 1: 0 + 4096 <= 4096
		          //(i_size is updated as 4096 in ubifs_write_end)
   if (folio_pos(folio) >= synced_i_size) // condition 2: 0 >= 3, false
      write_inode // Skipped, because condition 2 is false
   do_writepage(folio, len) // write one page

		do_commit // data node won't be replayed in next mounting
 >> Powercut <<

So, inode size(4096) is not updated into disk, we will get following
error messages in next mounting(chk_fs = 1):
 check_leaf [ubifs]: data node at LEB 14:2048 is not within inode size 3
 dbg_walk_index [ubifs]: leaf checking function returned error -22, for
 leaf at LEB 14:2048

Fix it by modifying condition 2 as original comparison(Compare the page
index of synced_i_size with current page index).

Fixes: c35acef383f4 ("ubifs: Convert ubifs_writepage to use a folio")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218934
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a1f46919934c..b32578783382 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1027,7 +1027,7 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 
 	/* Is the folio fully inside i_size? */
 	if (folio_pos(folio) + len <= i_size) {
-		if (folio_pos(folio) >= synced_i_size) {
+		if (folio->index >= synced_i_size >> PAGE_SHIFT) {
 			err = inode->i_sb->s_op->write_inode(inode, NULL);
 			if (err)
 				goto out_redirty;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
