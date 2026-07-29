Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D81C53219
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ch+5CKohtzcAZtwMk3+Kj4liHZtQWD5L+BnEO/FHiig=; b=LrB8QCFIYfS15x
	b8HsqYwvgizzHCOuoYcGpH98+X9FfSEQ0so3w1UrwUBiIGdTqWEKC1jWW42+HxF8O10NGsX+71Pos
	C1IPLApQQWdQVB7XMji98zRxzbMuq+WM9UWqYbnrBqLzF5NZF5Wyr//8DeRn01d2MK5NI9DgHNc5I
	kvCO3qynaq+Ij0jcI2vDT6OvMDs7YEFxVJJT9MlfOiHu6afxk2FCuzOh1UXKFyoC1nNTtW/H7DHaE
	g8n0wXfEPOrAdcsRe5VTnQz8EkFCUHl7oOTdc0UfuN+K2+dNwiQx6eQl7VqrQpqSdUFUSf+prb1zD
	obW1FbuoTjvT4P5tiHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xW-00000008gFQ-1q8N;
	Wed, 29 Jul 2026 17:20:46 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xV-00000008gDs-2CVa;
	Wed, 29 Jul 2026 17:20:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] ubifs: ubifs.h: clean up kernel-doc comments
Date: Wed, 29 Jul 2026 10:20:44 -0700
Message-ID: <20260729172044.1793865-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729172044.1793865-1-rdunlap@infradead.org>
References: <20260729172044.1793865-1-rdunlap@infradead.org>
MIME-Version: 1.0
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

- use the struct keyword when describing a struct in kernel-doc format.
- add or correct missing struct members @leaf, @eof, and
  @superblock_need_write.
- add Returns: clauses for 4 function descriptions.

to prevent kernel-doc warnings:

Warning: fs/ubifs/ubifs.h:755 struct member 'leaf' not described in 'ubifs_zbranch'
Warning: fs/ubifs/ubifs.h:814 struct member 'eof' not described in 'bu_info'
Warning: fs/ubifs/ubifs.h:814 Excess struct member 'oef' description in 'bu_info'
Warning: fs/ubifs/ubifs.h:992 cannot understand function prototype: 'struct ubifs_stats_info'
Warning: fs/ubifs/ubifs.h:1513 struct member 'superblock_need_write' not described in 'ubifs_info'
Warning: fs/ubifs/ubifs.h:1597 No description found for return value of 'ubifs_check_hash'
Warning: fs/ubifs/ubifs.h:1612 No description found for return value of 'ubifs_check_hmac'
Warning: fs/ubifs/ubifs.h:1653 No description found for return value of 'ubifs_branch_hash'
Warning: fs/ubifs/ubifs.h:1703 No description found for return value of 'ubifs_auth_node_sz'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org

 fs/ubifs/ubifs.h |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

--- linux-next-20260729.orig/fs/ubifs/ubifs.h
+++ linux-next-20260729/fs/ubifs/ubifs.h
@@ -738,6 +738,7 @@ struct ubifs_jhead {
  * struct ubifs_zbranch - key/coordinate/length branch stored in znodes.
  * @key: key
  * @znode: znode address in memory
+ * @leaf: leaf node
  * @lnum: LEB number of the target node (indexing node or data node)
  * @offs: target node offset within @lnum
  * @len: target node length
@@ -801,7 +802,7 @@ struct ubifs_znode {
  * @gc_seq: GC sequence number to detect races with GC
  * @cnt: number of data nodes for bulk read
  * @blk_cnt: number of data blocks including holes
- * @oef: end of file reached
+ * @eof: end of file reached
  */
 struct bu_info {
 	union ubifs_key key;
@@ -985,7 +986,7 @@ struct ubifs_budg_info {
 };
 
 /**
- * ubifs_stats_info - per-FS statistics information.
+ * struct ubifs_stats_info - per-FS statistics information.
  * @magic_errors: number of bad magic numbers (will be reset with a new mount).
  * @node_errors: number of bad nodes (will be reset with a new mount).
  * @crc_errors: number of bad crcs (will be reset with a new mount).
@@ -1051,6 +1052,7 @@ struct ubifs_debug_info;
  * @rw_incompat: the media is not R/W compatible
  * @assert_action: action to take when a ubifs_assert() fails
  * @authenticated: flag indigating the FS is mounted in authenticated mode
+ * @superblock_need_write: superblock node needs to be written
  *
  * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
  *             @calc_idx_sz
@@ -1588,8 +1590,9 @@ int ubifs_prepare_auth_node(struct ubifs
  * @expected: first hash
  * @got: second hash
  *
- * Compare two hashes @expected and @got. Returns 0 when they are equal, a
- * negative error code otherwise.
+ * Compare two hashes @expected and @got.
+ *
+ * Returns: 0 when they are equal, a negative error code otherwise.
  */
 static inline int ubifs_check_hash(const struct ubifs_info *c,
 				   const u8 *expected, const u8 *got)
@@ -1603,8 +1606,9 @@ static inline int ubifs_check_hash(const
  * @expected: first HMAC
  * @got: second HMAC
  *
- * Compare two hashes @expected and @got. Returns 0 when they are equal, a
- * negative error code otherwise.
+ * Compare two hashes @expected and @got.
+ *
+ * Returns: 0 when they are equal, a negative error code otherwise.
  */
 static inline int ubifs_check_hmac(const struct ubifs_info *c,
 				   const u8 *expected, const u8 *got)
@@ -1644,7 +1648,7 @@ static inline void ubifs_exit_authentica
  * @c: UBIFS file-system description object
  * @br: branch to get the hash from
  *
- * This returns a pointer to the hash of a branch. Since the key already is a
+ * Returns: a pointer to the hash of a branch. Since the key already is a
  * dynamically sized object we cannot use a struct member here.
  */
 static inline u8 *ubifs_branch_hash(struct ubifs_info *c,
@@ -1694,7 +1698,7 @@ static inline int ubifs_node_verify_hmac
  * ubifs_auth_node_sz - returns the size of an authentication node
  * @c: UBIFS file-system description object
  *
- * This function returns the size of an authentication node which can
+ * Returns: the size of an authentication node which can
  * be 0 for unauthenticated filesystems or the real size of an auth node
  * authentication is enabled.
  */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
