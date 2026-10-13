Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5301BCC6B03
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeicx4mrnCUjjTxuBEusHULDClGlE6wRoPWWFlXAc50=; b=1sKib1sBPnUKZ5
	NJ75JZ6Tk7zm2tyVHvObnAE1GmE51jPu6+CnOf6C3gxjSp+WOopa+qFMWtw/gT8CuI7jWbkFfLR4+
	iGDSh/vGD5/LGYQxurq1eKDnqky+wBrXF73CWn5tjKFXODTi/oE9g84BWR742+V0c31Na1VzJD/0Y
	U5/IAU2oRtJRoWiiuicivqwUAwqvcX8WhDztKMhiCBiBFbJj0H+zk0KnIJi6ELwy9aHXNgTfHVDvj
	B5fcLfrrKAOwdP0UjLBjbXQJ3+Gcq5/ozDgOnacYM0eqH1XmC2n5DE7x+TH9Km2I0pvPimDqi8HVz
	QGy2w5hh4NnX3hegJTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVDR-0000000C1gl-1ygS;
	Tue, 13 Oct 2026 05:38:21 +0000
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVDM-0000000C1g1-2lSg
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 05:38:19 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69D5bt1B030486;
	Tue, 13 Oct 2026 13:37:55 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id DA74D2284EA2;
	Tue, 13 Oct 2026 13:40:45 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Tue, 13 Oct 2026 13:37:54 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <richard@nod.at>
CC: <chengzhihao1@huawei.com>, <lin.nan@h3c.com>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] ubifs: fix host inode TNC offset when deleting an xattr
Date: Tue, 13 Oct 2026 13:29:53 +0800
Message-ID: <20261013052953.1401741-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
References: <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
MIME-Version: 1.0
X-Originating-IP: [10.142.164.48]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 69D5bt1B030486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_223817_492377_14DB4157 
X-CRM114-Status: GOOD (  10.70  )
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

ubifs_jnl_delete_xattr() writes a group of three nodes: the xent, the
xattr inode and the host inode. The host inode is packed at
xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but its TNC position is
computed backwards as xent_offs + len - hlen. Since len includes the
group's tail padding, ALIGN(hlen, 8) - hlen, the two differ whenever
the host inode's inline data length is not a multiple of 8. This
affects symlinks and device nodes.

The unaligned offset ends up in the on-flash index and the next mount
rejects the index node, turning the filesystem read-only.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Nan Lin <lin.nan@h3c.com>

Changes since v1:
 - compute the host inode offset into a new host_offs variable instead
   of open-coding the offset (Richard Weinberger);
 - shorten the commit message.

---
 fs/ubifs/journal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 40a95a2fad50..0b2dae57e467 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1858,7 +1858,8 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 			   const struct inode *inode,
 			   const struct fscrypt_name *nm)
 {
-	int err, xlen, hlen, len, lnum, xent_offs, aligned_xlen, write_len;
+	int err, xlen, hlen, len, lnum, xent_offs, host_offs, aligned_xlen,
+		write_len;
 	struct ubifs_dent_node *xent;
 	struct ubifs_ino_node *ino;
 	union ubifs_key xent_key, key1, key2;
@@ -1915,6 +1916,8 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 		ubifs_wbuf_add_ino_nolock(&c->jheads[BASEHD].wbuf, host->i_ino);
 	release_head(c, BASEHD);
 
+	host_offs = xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ;
+
 	ubifs_add_auth_dirt(c, lnum);
 	kfree(xent);
 	if (err)
@@ -1943,7 +1946,7 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 
 	/* And update TNC with the new host inode position */
 	ino_key_init(c, &key1, host->i_ino);
-	err = ubifs_tnc_add(c, &key1, lnum, xent_offs + len - hlen, hlen, hash);
+	err = ubifs_tnc_add(c, &key1, lnum, host_offs, hlen, hash);
 	if (err)
 		goto out_ro;
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
