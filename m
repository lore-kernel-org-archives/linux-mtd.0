Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAEEC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:52:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8366620771
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qt4wxQ38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8366620771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r9HiA5DM5m9M8zctP4xQjMtdrBGI365LeemdVrz18b4=; b=qt4wxQ38FgnHyiFgO0G86iD616
	ABWQxtYs6PPGN9q9Vavbwn9Kiz1LorsEidCj1lS/xc5ufGT6LIbFVnhLWCJ8UGbz1MxLzpX9KHFXx
	PpNLNFbZ35HsR6fdn577/EiclkREhG52EAF8gxipbiDaFWnQkjXzoAl6nCw8emCK2bTM0YurqG058
	sDirVKZJW1W04zYt0RX4HT3y19nkGlMxfK6DU06Xa1j2ck7YTlxHviPW0VYHZlteMdQ8BYMX3aSoJ
	tfDFg4ezDlvsuXunJ1Ex3kVpIRTISP3NXHML5FE5STNOUpV9zWlTk4Cu64lrOqdaIw7NrKIXwKqlp
	FkNBXuVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsn43-0005Qe-Nl; Tue, 07 Jul 2020 12:51:11 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsn40-0005PS-Jb
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 12:51:09 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ECE0491359C37657ECA9;
 Tue,  7 Jul 2020 20:51:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Jul 2020
 20:50:53 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ubifs: Fix wrong orphan node deletion in
 ubifs_jnl_update|rename
Date: Tue, 7 Jul 2020 20:51:40 +0800
Message-ID: <20200707125140.267982-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_085108_875518_6CD4A735 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: richard@nod.at, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There a wrong orphan node deleting in error handling path in
ubifs_jnl_update() and ubifs_jnl_rename(), which may cause
following error msg:

  UBIFS error (ubi0:0 pid 1522): ubifs_delete_orphan [ubifs]:
  missing orphan ino 65

Fix this by checking whether the node has been operated for
adding to orphan list before being deleted,

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Fixes: 823838a486888cf484e ("ubifs: Add hashes to the tree node cache")
---
 fs/ubifs/journal.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index e5ec1afe1c66..2cf05f87565c 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -539,7 +539,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 		     const struct fscrypt_name *nm, const struct inode *inode,
 		     int deletion, int xent)
 {
-	int err, dlen, ilen, len, lnum, ino_offs, dent_offs;
+	int err, dlen, ilen, len, lnum, ino_offs, dent_offs, orphan_added = 0;
 	int aligned_dlen, aligned_ilen, sync = IS_DIRSYNC(dir);
 	int last_reference = !!(deletion && inode->i_nlink == 0);
 	struct ubifs_inode *ui = ubifs_inode(inode);
@@ -630,6 +630,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 			goto out_finish;
 		}
 		ui->del_cmtno = c->cmt_no;
+		orphan_added = 1;
 	}
 
 	err = write_head(c, BASEHD, dent, len, &lnum, &dent_offs, sync);
@@ -702,7 +703,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	kfree(dent);
 out_ro:
 	ubifs_ro_mode(c, err);
-	if (last_reference)
+	if (orphan_added)
 		ubifs_delete_orphan(c, inode->i_ino);
 	finish_reservation(c);
 	return err;
@@ -1218,7 +1219,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	void *p;
 	union ubifs_key key;
 	struct ubifs_dent_node *dent, *dent2;
-	int err, dlen1, dlen2, ilen, lnum, offs, len;
+	int err, dlen1, dlen2, ilen, lnum, offs, len, orphan_added = 0;
 	int aligned_dlen1, aligned_dlen2, plen = UBIFS_INO_NODE_SZ;
 	int last_reference = !!(new_inode && new_inode->i_nlink == 0);
 	int move = (old_dir != new_dir);
@@ -1334,6 +1335,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 			goto out_finish;
 		}
 		new_ui->del_cmtno = c->cmt_no;
+		orphan_added = 1;
 	}
 
 	err = write_head(c, BASEHD, dent, len, &lnum, &offs, sync);
@@ -1415,7 +1417,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	release_head(c, BASEHD);
 out_ro:
 	ubifs_ro_mode(c, err);
-	if (last_reference)
+	if (orphan_added)
 		ubifs_delete_orphan(c, new_inode->i_ino);
 out_finish:
 	finish_reservation(c);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
