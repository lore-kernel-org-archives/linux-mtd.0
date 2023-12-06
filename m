Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A75C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ci8UIFFD5LU86zc6q9iUxlrz8xAVip875+JX5QEL4rc=; b=NQmju3W7CsR+Xy
	yBaCuaz9jQfdVKUxlDkpptwre1Ac9rHHFvwsj+tmTGTLfGKfrlrVoSJuhQRDGwy1GUsS+syqVsHgW
	VuxB9pexCUiB1UoEBrSKxL5u6dhR8dlJSHiy65qvESxswei6IgfozdJhDeD6Xy5QhQgschiRxXKfH
	G7OyfmJUTHs+8MxEzTbSDtH5wbDFbRKezcNPOYNtsDBwZimR9DXgSIAKISN0YUjuZLngI4sLsMsWi
	cUwNwetJU0p3FE9g2UPIf0GtggHxh2yoQY0f7ASy8ODbR+qVE5vpLsdKhYaDnfOkxTopP+llHJ87Y
	FTbbrg4axwKaplHvlUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhy1-008ufg-0e;
	Wed, 06 Dec 2023 02:48:53 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhxy-008uek-1y;
	Wed, 06 Dec 2023 02:48:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: fix kernel-doc warnings
Date: Tue,  5 Dec 2023 18:48:50 -0800
Message-ID: <20231206024850.31425-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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

Fix kernel-doc warnings found when using "W=1".

file.c:1385: warning: Excess function parameter 'time' description in 'ubifs_update_time'
and 9 warnings like this one:
file.c:326: warning: No description found for return value of 'allocate_budget'

auth.c:30: warning: expecting prototype for ubifs_node_calc_hash(). Prototype was for __ubifs_node_calc_hash() instead
and 11 warnings like this one:
auth.c:30: warning: No description found for return value of '__ubifs_node_calc_hash'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202312030417.66c5PwHj-lkp@intel.com/
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
---
This does not Close: the report kernel robot report since there is
also a missing-prototype warning in it.

 fs/ubifs/auth.c |   28 ++++++++++++++++------------
 fs/ubifs/file.c |   30 +++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 21 deletions(-)

diff -- a/fs/ubifs/auth.c b/fs/ubifs/auth.c
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -18,12 +18,12 @@
 #include "ubifs.h"
 
 /**
- * ubifs_node_calc_hash - calculate the hash of a UBIFS node
+ * __ubifs_node_calc_hash - calculate the hash of a UBIFS node
  * @c: UBIFS file-system description object
  * @node: the node to calculate a hash for
  * @hash: the returned hash
  *
- * Returns 0 for success or a negative error code otherwise.
+ * Returns: %0 for success or a negative error code otherwise.
  */
 int __ubifs_node_calc_hash(const struct ubifs_info *c, const void *node,
 			    u8 *hash)
@@ -40,7 +40,7 @@ int __ubifs_node_calc_hash(const struct
  * @hash: the node to calculate a HMAC for
  * @hmac: the returned HMAC
  *
- * Returns 0 for success or a negative error code otherwise.
+ * Returns: %0 for success or a negative error code otherwise.
  */
 static int ubifs_hash_calc_hmac(const struct ubifs_info *c, const u8 *hash,
 				 u8 *hmac)
@@ -57,7 +57,7 @@ static int ubifs_hash_calc_hmac(const st
  * This function prepares an authentication node for writing onto flash.
  * It creates a HMAC from the given input hash and writes it to the node.
  *
- * Returns 0 for success or a negative error code otherwise.
+ * Returns: %0 for success or a negative error code otherwise.
  */
 int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
 			     struct shash_desc *inhash)
@@ -114,7 +114,7 @@ static struct shash_desc *ubifs_get_desc
  * __ubifs_hash_get_desc - get a descriptor suitable for hashing a node
  * @c: UBIFS file-system description object
  *
- * This function returns a descriptor suitable for hashing a node. Free after use
+ * Returns: a descriptor suitable for hashing a node. Free after use
  * with kfree.
  */
 struct shash_desc *__ubifs_hash_get_desc(const struct ubifs_info *c)
@@ -156,8 +156,8 @@ void ubifs_bad_hash(const struct ubifs_i
  * @expected: the expected hash
  *
  * This function calculates a hash over a node and compares it to the given hash.
- * Returns 0 if both hashes are equal or authentication is disabled, otherwise a
- * negative error code is returned.
+ * Returns: %0 if both hashes are equal or authentication is disabled,
+ * otherwise a negative error code is returned.
  */
 int __ubifs_node_check_hash(const struct ubifs_info *c, const void *node,
 			    const u8 *expected)
@@ -184,7 +184,7 @@ int __ubifs_node_check_hash(const struct
  * PKCS#7 signature. The signature is placed directly behind the superblock
  * node in an ubifs_sig_node.
  *
- * Returns 0 when the signature can be successfully verified or a negative
+ * Returns: %0 when the signature can be successfully verified or a negative
  * error code if not.
  */
 int ubifs_sb_verify_signature(struct ubifs_info *c,
@@ -250,7 +250,7 @@ out_destroy:
  * ubifs_init_authentication - initialize UBIFS authentication support
  * @c: UBIFS file-system description object
  *
- * This function returns 0 for success or a negative error code otherwise.
+ * Returns: %0 for success or a negative error code otherwise.
  */
 int ubifs_init_authentication(struct ubifs_info *c)
 {
@@ -383,6 +383,8 @@ void __ubifs_exit_authentication(struct
  * This function calculates a HMAC of a UBIFS node. The HMAC is expected to be
  * embedded into the node, so this area is not covered by the HMAC. Also not
  * covered is the UBIFS_NODE_MAGIC and the CRC of the node.
+ *
+ * Returns: %0 for success or a negative error code otherwise.
  */
 static int ubifs_node_calc_hmac(const struct ubifs_info *c, const void *node,
 				int len, int ofs_hmac, void *hmac)
@@ -426,7 +428,7 @@ static int ubifs_node_calc_hmac(const st
  * This function inserts a HMAC at offset @ofs_hmac into the node given in
  * @node.
  *
- * This function returns 0 for success or a negative error code otherwise.
+ * Returns: %0 for success or a negative error code otherwise.
  */
 int __ubifs_node_insert_hmac(const struct ubifs_info *c, void *node, int len,
 			    int ofs_hmac)
@@ -442,7 +444,9 @@ int __ubifs_node_insert_hmac(const struc
  * @ofs_hmac: the offset in the node where the HMAC is inserted
  *
  * This function verifies the HMAC at offset @ofs_hmac of the node given in
- * @node. Returns 0 if successful or a negative error code otherwise.
+ * @node.
+ *
+ * Returns: %0 if successful or a negative error code otherwise.
  */
 int __ubifs_node_verify_hmac(const struct ubifs_info *c, const void *node,
 			     int len, int ofs_hmac)
@@ -503,7 +507,7 @@ out:
  * image. This is only a convenience to the user to provide a better
  * error message when the wrong key is provided.
  *
- * This function returns 0 for success or a negative error code otherwise.
+ * Returns: %0 for success or a negative error code otherwise.
  */
 int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
 {
diff -- a/fs/ubifs/file.c b/fs/ubifs/file.c
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -318,8 +318,9 @@ static int write_begin_slow(struct addre
  * This is a helper function for 'ubifs_write_begin()' which allocates budget
  * for the operation. The budget is allocated differently depending on whether
  * this is appending, whether the page is dirty or not, and so on. This
- * function leaves the @ui->ui_mutex locked in case of appending. Returns zero
- * in case of success and %-ENOSPC in case of failure.
+ * function leaves the @ui->ui_mutex locked in case of appending.
+ *
+ * Returns: %0 in case of success and %-ENOSPC in case of failure.
  */
 static int allocate_budget(struct ubifs_info *c, struct page *page,
 			   struct ubifs_inode *ui, int appending)
@@ -600,7 +601,7 @@ out:
  * @bu: bulk-read information
  * @n: next zbranch slot
  *
- * This function returns %0 on success and a negative error code on failure.
+ * Returns: %0 on success and a negative error code on failure.
  */
 static int populate_page(struct ubifs_info *c, struct page *page,
 			 struct bu_info *bu, int *n)
@@ -711,7 +712,7 @@ out_err:
  * @bu: bulk-read information
  * @page1: first page to read
  *
- * This function returns %1 if the bulk-read is done, otherwise %0 is returned.
+ * Returns: %1 if the bulk-read is done, otherwise %0 is returned.
  */
 static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 			      struct page *page1)
@@ -821,7 +822,9 @@ out_bu_off:
  * Some flash media are capable of reading sequentially at faster rates. UBIFS
  * bulk-read facility is designed to take advantage of that, by reading in one
  * go consecutive data nodes that are also located consecutively in the same
- * LEB. This function returns %1 if a bulk-read is done and %0 otherwise.
+ * LEB.
+ *
+ * Returns: %1 if a bulk-read is done and %0 otherwise.
  */
 static int ubifs_bulk_read(struct page *page)
 {
@@ -1109,7 +1112,9 @@ static void do_attr_changes(struct inode
  * @attr: inode attribute changes description
  *
  * This function implements VFS '->setattr()' call when the inode is truncated
- * to a smaller size. Returns zero in case of success and a negative error code
+ * to a smaller size.
+ *
+ * Returns: %0 in case of success and a negative error code
  * in case of failure.
  */
 static int do_truncation(struct ubifs_info *c, struct inode *inode,
@@ -1215,7 +1220,9 @@ out_budg:
  * @attr: inode attribute changes description
  *
  * This function implements VFS '->setattr()' call for all cases except
- * truncations to smaller size. Returns zero in case of success and a negative
+ * truncations to smaller size.
+ *
+ * Returns: %0 in case of success and a negative
  * error code in case of failure.
  */
 static int do_setattr(struct ubifs_info *c, struct inode *inode,
@@ -1360,6 +1367,8 @@ out:
  * This helper function checks if the inode mtime/ctime should be updated or
  * not. If current values of the time-stamps are within the UBIFS inode time
  * granularity, they are not updated. This is an optimization.
+ *
+ * Returns: %1 if time update is needed, %0 if not
  */
 static inline int mctime_update_needed(const struct inode *inode,
 				       const struct timespec64 *now)
@@ -1375,11 +1384,12 @@ static inline int mctime_update_needed(c
 /**
  * ubifs_update_time - update time of inode.
  * @inode: inode to update
- * @time:  timespec structure to hold the current time value
  * @flags: time updating control flag determines updating
  *	    which time fields of @inode
  *
  * This function updates time of the inode.
+ *
+ * Returns: %0 for success or a negative error code otherwise.
  */
 int ubifs_update_time(struct inode *inode, int flags)
 {
@@ -1413,7 +1423,9 @@ int ubifs_update_time(struct inode *inod
  * @inode: inode to update
  *
  * This function updates mtime and ctime of the inode if it is not equivalent to
- * current time. Returns zero in case of success and a negative error code in
+ * current time.
+ *
+ * Returns: %0 in case of success and a negative error code in
  * case of failure.
  */
 static int update_mctime(struct inode *inode)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
