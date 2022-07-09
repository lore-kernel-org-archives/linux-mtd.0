Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0415AC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Jul 2022 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hW5HEvMEGtk+9+TNS65Y5XpTJEyyXxImo9up8ZJCmfY=; b=qDSQlcnW7aBgQw
	l4LPierVRhjjwxX7yKm5OoOiqdZ+iB84UE2JH74ErBFnMPdCQ3gjUC0kxPY23uH8J9Irh8tMp9tKL
	yP58W5o0Si4Z3c501AvAJq/x6hf3T27P4q/EeGW6hs76sPEbM4tA6AE/ABED5xQwWtt33++Zn2yU0
	g33eO66x9tfQhwohwviqNwiXRyRQ/vuflcpHqv8EFcuT6hBhcHxGXKBdBYgbsvs+oVLNO+D619KSx
	N7vtbW7RJo7ov8c3+V0LmdYHYQHK+4PEkBddWm84LO6D1lc1c6hZ5mfv7r+YrNToISylCESIzdKI1
	lfDawaS7XLTPE/FGb0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA5t4-007MF9-4j; Sat, 09 Jul 2022 08:32:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA5sz-007M91-RR
	for linux-mtd@lists.infradead.org; Sat, 09 Jul 2022 08:32:24 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Lg3J16m2XzlVqW;
	Sat,  9 Jul 2022 16:30:41 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 9 Jul 2022 16:32:12 +0800
Received: from huawei.com (10.175.101.6) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 9 Jul
 2022 16:32:11 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yukuai3@huawei.com>,
	<yi.zhang@huawei.com>
Subject: [PATCH] ubifs: Fix the issue that UBIFS be read-only due to truncate in the encrypted directory.
Date: Sat, 9 Jul 2022 16:40:32 +0800
Message-ID: <20220709084032.831262-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_013222_252118_E9BE45E1 
X-CRM114-Status: GOOD (  20.60  )
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

The ubifs_compress() function does not compress the data When the
data length is short than 128 bytes or the compressed data length
is not ideal.It cause that the compressed length of the truncated
data in the truncate_data_node() function may be greater than the
length of the raw data read from the flash.

The above two lengths are transferred to the ubifs_encrypt()
function as parameters. This may lead to assertion fails and then
the file system becomes read-only.

This patch use the actual length of the data in the memory as the
input parameter for assert comparison, which avoids the problem.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216213
Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 fs/ubifs/crypto.c  | 11 +++++++++++
 fs/ubifs/journal.c | 28 +++++++++++++++++-----------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index c57b46a352d8..3125e76376ee 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -24,6 +24,17 @@ static bool ubifs_crypt_empty_dir(struct inode *inode)
 	return ubifs_check_dir_empty(inode) == 0;
 }
 
+/**
+ * ubifs_encrypt - Encrypt data.
+ * @inode: inode which refers to the data node
+ * @dn: data node to encrypt
+ * @in_len: length of data to be compressed
+ * @out_len: allocated memory size for the data area of @dn
+ * @block: logical block number of the block
+ *
+ * This function encrypt a possibly-compressed data in the data node.
+ * The encrypted data length will store in @out_len.
+ */
 int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
 		  unsigned int in_len, unsigned int *out_len, int block)
 {
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 75dab0ae3939..2b1d7c4297bf 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1472,23 +1472,25 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
  * @block: data block number
  * @dn: data node to re-compress
  * @new_len: new length
+ * @dn_size: size of the data node @dn in memory
  *
  * This function is used when an inode is truncated and the last data node of
  * the inode has to be re-compressed/encrypted and re-written.
  */
 static int truncate_data_node(const struct ubifs_info *c, const struct inode *inode,
 			      unsigned int block, struct ubifs_data_node *dn,
-			      int *new_len)
+			      int *new_len, int dn_size)
 {
 	void *buf;
-	int err, dlen, compr_type, out_len, old_dlen;
+	int err, dlen, compr_type, out_len, data_size;
 
 	out_len = le32_to_cpu(dn->size);
 	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
-	dlen = old_dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
+	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
+	data_size = dn_size - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
 
 	if (IS_ENCRYPTED(inode)) {
@@ -1508,11 +1510,11 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	}
 
 	if (IS_ENCRYPTED(inode)) {
-		err = ubifs_encrypt(inode, dn, out_len, &old_dlen, block);
+		err = ubifs_encrypt(inode, dn, out_len, &data_size, block);
 		if (err)
 			goto out;
 
-		out_len = old_dlen;
+		out_len = data_size;
 	} else {
 		dn->compr_size = 0;
 	}
@@ -1550,6 +1552,7 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 	struct ubifs_trun_node *trun;
 	struct ubifs_data_node *dn;
 	int err, dlen, len, lnum, offs, bit, sz, sync = IS_SYNC(inode);
+	int dn_size;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	ino_t inum = inode->i_ino;
 	unsigned int blk;
@@ -1562,10 +1565,13 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 	ubifs_assert(c, S_ISREG(inode->i_mode));
 	ubifs_assert(c, mutex_is_locked(&ui->ui_mutex));
 
-	sz = UBIFS_TRUN_NODE_SZ + UBIFS_INO_NODE_SZ +
-	     UBIFS_MAX_DATA_NODE_SZ * WORST_COMPR_FACTOR;
+	dn_size = COMPRESSED_DATA_NODE_BUF_SZ;
 
-	sz += ubifs_auth_node_sz(c);
+	if (IS_ENCRYPTED(inode))
+		dn_size += UBIFS_CIPHER_BLOCK_SIZE;
+
+	sz =  UBIFS_TRUN_NODE_SZ + UBIFS_INO_NODE_SZ +
+		dn_size + ubifs_auth_node_sz(c);
 
 	ino = kmalloc(sz, GFP_NOFS);
 	if (!ino)
@@ -1596,15 +1602,15 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 			if (dn_len <= 0 || dn_len > UBIFS_BLOCK_SIZE) {
 				ubifs_err(c, "bad data node (block %u, inode %lu)",
 					  blk, inode->i_ino);
-				ubifs_dump_node(c, dn, sz - UBIFS_INO_NODE_SZ -
-						UBIFS_TRUN_NODE_SZ);
+				ubifs_dump_node(c, dn, dn_size);
 				goto out_free;
 			}
 
 			if (dn_len <= dlen)
 				dlen = 0; /* Nothing to do */
 			else {
-				err = truncate_data_node(c, inode, blk, dn, &dlen);
+				err = truncate_data_node(c, inode, blk, dn,
+						&dlen, dn_size);
 				if (err)
 					goto out_free;
 			}
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
