Return-Path: <SRS0=xIOg=BP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93CAC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2020 02:50:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0302075D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2020 02:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yg/w3Q5L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h+xgPPMg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E0302075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xiWOo+fM/o4XCd75PUD1DKkDqmjSM9OBiKjUmLsL99E=; b=yg/w3Q5LvmHRI50ZgjcbRC5H5u
	pC3AMGiHAcVNN1vWtuXVi+78lgHkJ8eq+YqOlM/9jfGf28XCzD2fNToqu27zDf4AAEAO6b2fumMQq
	utOKulFDLgN9Qs5ZEys7ajby+2Cy5+scZOXTIqj0+EOdPbEzpr4Nq20+wxOsiw6Q4N9Cnmoz3iaMg
	Aeb9ipvOd7g/q9NEkzFEGd4fHN4/vHjGg8yjrzTp5fgfpI/pevLiWicBp3sCYaJVYHTiZxT4AaBVV
	QfT1n+OUkJUy3v2FBw40ku/MpmvXOY7+XpJmT8p7MBVMJrmmq/Qq7Kmtn3xxZ07RMr2vS+fXQfIL7
	35g8skkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k39Ut-0003aP-6h; Wed, 05 Aug 2020 02:49:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k39Ur-0003Zy-9E; Wed, 05 Aug 2020 02:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=kmnpOvEulIhRHkhNjjhjDke+7apG/W2Df0BhaWKBT2E=; b=h+xgPPMg5IfjguEazeNX5OBzPn
 5PZENVRNcHx1oqj48O6RkNRsKR4apVuegEjrp2jIedke51o5b9RzVFS2hps/WRmomeZT1McEvQ3Oa
 c28xWtsXnwV/zHP08Pm3pXibifgICHwVL1MPL0K5rsFc9qQ7yu0NmoJwSlMNd2lPz5GAmckH4k8Q/
 iYtYeVL+7bwUuOs2R4zKdp+gAHds81jzZnlSN7f639SNBWgW1Q4ZwAUF/FZL5JFHX99ZTCV7Vv/A8
 gfGX0jvO+VaBKcl6xtk53A0MSOSaadQt2wKxjdrs+Vq4kVbIT6iDTxYxIcaMVQiAW9/wgDDB4so3B
 snkXGKGg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k39Uo-0007WK-OL; Wed, 05 Aug 2020 02:49:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] ubifs: delete duplicated words + other fixes
Date: Tue,  4 Aug 2020 19:49:35 -0700
Message-Id: <20200805024935.12331-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Delete repeated words in fs/ubifs/.
{negative, is, of, and, one, it}
where "it it" was changed to "if it".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/debug.c    |    2 +-
 fs/ubifs/dir.c      |    2 +-
 fs/ubifs/file.c     |    2 +-
 fs/ubifs/io.c       |    2 +-
 fs/ubifs/replay.c   |    2 +-
 fs/ubifs/tnc.c      |    2 +-
 fs/ubifs/tnc_misc.c |    3 +--
 7 files changed, 7 insertions(+), 8 deletions(-)

--- linux-next-20200804.orig/fs/ubifs/debug.c
+++ linux-next-20200804/fs/ubifs/debug.c
@@ -1012,7 +1012,7 @@ void dbg_save_space_info(struct ubifs_in
  *
  * This function compares current flash space information with the information
  * which was saved when the 'dbg_save_space_info()' function was called.
- * Returns zero if the information has not changed, and %-EINVAL it it has
+ * Returns zero if the information has not changed, and %-EINVAL if it has
  * changed.
  */
 int dbg_check_space_info(struct ubifs_info *c)
--- linux-next-20200804.orig/fs/ubifs/dir.c
+++ linux-next-20200804/fs/ubifs/dir.c
@@ -840,7 +840,7 @@ out_fname:
  *
  * This function checks if directory @dir is empty. Returns zero if the
  * directory is empty, %-ENOTEMPTY if it is not, and other negative error codes
- * in case of of errors.
+ * in case of errors.
  */
 int ubifs_check_dir_empty(struct inode *dir)
 {
--- linux-next-20200804.orig/fs/ubifs/file.c
+++ linux-next-20200804/fs/ubifs/file.c
@@ -205,7 +205,7 @@ static void release_new_page_budget(stru
  * @c: UBIFS file-system description object
  *
  * This is a helper function which releases budget corresponding to the budget
- * of changing one one page of data which already exists on the flash media.
+ * of changing one page of data which already exists on the flash media.
  */
 static void release_existing_page_budget(struct ubifs_info *c)
 {
--- linux-next-20200804.orig/fs/ubifs/io.c
+++ linux-next-20200804/fs/ubifs/io.c
@@ -1046,7 +1046,7 @@ out:
  * @lnum: logical eraseblock number
  * @offs: offset within the logical eraseblock
  *
- * This function reads a node of known type and and length, checks it and
+ * This function reads a node of known type and length, checks it and
  * stores in @buf. Returns zero in case of success, %-EUCLEAN if CRC mismatched
  * and a negative error code in case of failure.
  */
--- linux-next-20200804.orig/fs/ubifs/replay.c
+++ linux-next-20200804/fs/ubifs/replay.c
@@ -574,7 +574,7 @@ static int authenticate_sleb_hash(struct
  * @c: UBIFS file-system description object
  * @sleb: the scan LEB to authenticate
  * @log_hash:
- * @is_last: if true, this is is the last LEB
+ * @is_last: if true, this is the last LEB
  *
  * This function iterates over the buds of a single LEB authenticating all buds
  * with the authentication nodes on this LEB. Authentication nodes are written
--- linux-next-20200804.orig/fs/ubifs/tnc.c
+++ linux-next-20200804/fs/ubifs/tnc.c
@@ -378,7 +378,7 @@ static void lnc_free(struct ubifs_zbranc
  *
  * This function reads a "hashed" node defined by @zbr from the leaf node cache
  * (in it is there) or from the hash media, in which case the node is also
- * added to LNC. Returns zero in case of success or a negative negative error
+ * added to LNC. Returns zero in case of success or a negative error
  * code in case of failure.
  */
 static int tnc_read_hashed_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
--- linux-next-20200804.orig/fs/ubifs/tnc_misc.c
+++ linux-next-20200804/fs/ubifs/tnc_misc.c
@@ -455,8 +455,7 @@ out:
  * @node: node is returned here
  *
  * This function reads a node defined by @zbr from the flash media. Returns
- * zero in case of success or a negative negative error code in case of
- * failure.
+ * zero in case of success or a negative error code in case of failure.
  */
 int ubifs_tnc_read_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 			void *node)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
