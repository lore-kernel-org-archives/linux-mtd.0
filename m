Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD02ACA9ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjOqS3r78Gk/rm99LXCGkxYyuWMxxYIHXqsYbKRZih0=; b=hR4YB1HupTmHQi
	umOVVAiLK746qQ0kfOavcdTsQQzU4kGgQo3fj6J1YBIjxopDaP1rVilnifAIQgBNK+WtbqfEa8Usp
	1iDl0nQMvdpZwtmLzrkwFLhT2aHSh9UsWGLbOkj+t03Zm3wIph75GC3QBr/oUIXO2fgXOTwsg42jn
	75zhd/QCA9Ud4CragE1Swr187KvYCftiCbMZzcjdm4vzYQ0k+59hdRBWBheZJnFTXN3FQVumYvg2F
	JVYWk393Rp+Aoy8HWluPRq3r/VwfzLokXbzt4CyEavFUVDm6DdoxD3ZYSH2QU6worTSo/ieREwF4C
	7H4FdHrqX3zGpX9/C8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAvc-00000009sbd-2QDS;
	Mon, 12 Oct 2026 07:58:36 +0000
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAvZ-00000009saT-1Fus
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 07:58:35 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69C7wBEf032117;
	Mon, 12 Oct 2026 15:58:11 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id 7098A2284EA2;
	Mon, 12 Oct 2026 16:01:00 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Mon, 12 Oct 2026 15:58:10 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <lin.nan@h3c.com>, <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: [PATCH] ubifs: fix host inode TNC offset when deleting an xattr
Date: Mon, 12 Oct 2026 15:50:46 +0800
Message-ID: <20261012075046.1268480-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [10.142.164.48]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 69C7wBEf032117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_005833_645117_09B63C02 
X-CRM114-Status: GOOD (  12.17  )
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

When ubifs_jnl_delete_xattr() deletes an extended attribute, it writes
a group of three nodes to the base head: the xent node, the xattr
inode node and the host inode node. The host inode node is actually
packed at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but the
position registered into TNC is computed backwards as
xent_offs + len - hlen. The two differ by the group tail padding,
ALIGN(hlen, 8) - hlen.

Whenever the host inode's data_len is not a multiple of 8, the offset
registered in TNC points 1 to 7 bytes past the real node header. The
wrong offset gets committed into the on-flash index, and on the next
mount read_znode() fails the offs & 7 alignment check, returns -EINVAL
and switches the filesystem to read-only mode, reporting
"bad indexing node ... error 2".

Which inodes are affected depends on data_len:
 - block/character devices always carry data_len = 4 and are always
   affected;
 - symlinks carry data_len = strlen(target) and are affected unless
   the target length happens to be a multiple of 8;
 - regular files, FIFOs and sockets carry data_len = 0 and are
   unaffected.

The bug reproduces by setting an xattr on a symlink with attr -Rs and
removing it with attr -Rr: after unmount and remount, readlink()
fails, the index node is rejected with error 2 (bad branch offset) and
the filesystem turns read-only.

Fix the offset computation by accumulating the group layout forward
instead of subtracting from the total length: register the host inode
at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, which matches the
packed position exactly. The host node length hlen is already correct
and stays unchanged.

Signed-off-by: Nan Lin <lin.nan@h3c.com>
---
 fs/ubifs/journal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 40a95a2fad50..1a32d641e658 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1943,7 +1943,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 
 	/* And update TNC with the new host inode position */
 	ino_key_init(c, &key1, host->i_ino);
-	err = ubifs_tnc_add(c, &key1, lnum, xent_offs + len - hlen, hlen, hash);
+	err = ubifs_tnc_add(c, &key1, lnum,
+				xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ,
+				hlen, hash);
 	if (err)
 		goto out_ro;
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
