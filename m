Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02333C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 13:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A3F610A2
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 13:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A3F610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=G8AbSrJSrMtj6z+OQIFzYnGaK+QGfd2EXafCgcIZFWo=; b=AsBGrNmRv0FbHk
	eH7SBStKmA+pfP152JU3wgEyoHk8HlxGpH2OLfkXmh0deCOFKDONVN5FaaCT/FHtvOj79KCQ6T4SG
	1ww3ecolHREEcOOZ4GdnFwjshrpo1EirrSWbVYn/QJFZWQzY7CXgRhj2vdY62BReU/iGifI//fkq1
	3GhCXQMg8E/JNcOg3cpKxZJGmihMkLUO6Y9A2rUn7NFY18VcweZKPZBVAXEOJMaqM3NyyG0cw7/q7
	aGeK0geXmG2xrW54vR0n/keqUU7I4aE/JWSP8zaxcyMc2S4hQe6qT2/GGrkFOk4fVbdk9Fml9mksI
	xy1MZAimcLa2xAkG746Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM9io-00C5FP-CS; Fri, 03 Sep 2021 13:59:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM9iC-00C554-Bn
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 13:58:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C76C61059;
 Fri,  3 Sep 2021 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630677512;
 bh=3JczALKSBTk1hoa+l3wjU/1B6GmvFcHC4FgmTxWCdd4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Z6abzN+SPDPATMoJxEW1NczAOKsVmKNIyfB5wimRULsuo75KwEfHzKLEeFyzm9C2e
 g9eqG3J4iyn7M/ebfWLE6YqOYOmGLhPczmu6JDIvl6RljR+KJG0ylBjBmnP4R6C0np
 kGfT9XBGw8OK2PItPyUnlhhuDoiV6+jhOeNHhngc=
Subject: Patch "ubifs: report correct st_size for encrypted symlinks" has been
 added to the 5.4-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 03 Sep 2021 15:58:16 +0200
In-Reply-To: <20210901164041.176238-5-ebiggers@kernel.org>
Message-ID: <163067749626136@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_065832_505100_D2DFCFE7 
X-CRM114-Status: GOOD (  15.02  )
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


This is a note to let you know that I've just added the patch titled

    ubifs: report correct st_size for encrypted symlinks

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     ubifs-report-correct-st_size-for-encrypted-symlinks.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Sep  3 03:56:23 PM CEST 2021
From: Eric Biggers <ebiggers@kernel.org>
Date: Wed,  1 Sep 2021 09:40:41 -0700
Subject: ubifs: report correct st_size for encrypted symlinks
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20210901164041.176238-5-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 064c734986011390b4d111f1a99372b7f26c3850 upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ubifs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: ca7f85be8d6c ("ubifs: Add support for encrypted symlinks")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ubifs/file.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1629,6 +1629,16 @@ static const char *ubifs_get_link(struct
 	return fscrypt_get_symlink(inode, ui->data, ui->data_len, done);
 }
 
+static int ubifs_symlink_getattr(const struct path *path, struct kstat *stat,
+				 u32 request_mask, unsigned int query_flags)
+{
+	ubifs_getattr(path, stat, request_mask, query_flags);
+
+	if (IS_ENCRYPTED(d_inode(path->dentry)))
+		return fscrypt_symlink_getattr(path, stat);
+	return 0;
+}
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1654,7 +1664,7 @@ const struct inode_operations ubifs_file
 const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
-	.getattr     = ubifs_getattr,
+	.getattr     = ubifs_symlink_getattr,
 #ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
 #endif


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-5.4/ubifs-report-correct-st_size-for-encrypted-symlinks.patch
queue-5.4/ext4-report-correct-st_size-for-encrypted-symlinks.patch
queue-5.4/fscrypt-add-fscrypt_symlink_getattr-for-computing-st_size.patch
queue-5.4/f2fs-report-correct-st_size-for-encrypted-symlinks.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
