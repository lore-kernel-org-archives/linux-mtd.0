Return-Path: <SRS0=A63j=ZT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B5BC432C3
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 15:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4FC2053B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 15:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LEAff5RX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SWvDp+Ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4FC2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qriEY2j1dHwpxXu69mjb56pmuyIcfCzmzbpC4nWBxvc=; b=LEAff5RX2ePYDX
	cOg/hsEXMezTCEm4bFDZAj1zDxDNiM71Vv9hU8FEX3d/hAH6nQZ6nHnTJIBTtJWhVnB19IsRVsN/u
	rDoLa2QldvCMWSyg+1B8ZLWA16XRMA7+mO3U17s7ku5JCUw9IguilcHmeFlpZChpQoqLogaATxrxD
	DtE7rXiBjCQ875Rlf3PZRVeVIr/4tdfr2GV3W3JHEVNKi9y0MDsUZxG8MRdfITrMOlrdCrzpSmeuQ
	V72bxZcDmIs49rJt2Y3DAQsYk171IaJG+WuZqTQ0/zvN3b38G3ncoadizU4LSE7Jl4JeWDIkrP1h7
	N3qUatM+aR6R7bn8Qw/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZz7u-0005If-Vg; Wed, 27 Nov 2019 15:21:10 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZz7p-0005Hz-FD
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2019 15:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574868062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MKRMqYZcMSPOI1ZGGK/kSwrsQZTCaWDdryNtYrwk8A4=;
 b=SWvDp+DshM9q8wUzzY+FRvtVT4FJqpyv4jkmV0zobO6mro9Skduw5mCk97jTkAY5uSPBZv
 3nQ7cDe8cjGWCOe8nKUh1UYCIfTzdBlyf4ghcdtK1Qd7FMtibU1WUd7lh60Du8j1kplMNP
 ddWrp13leozQycK90BYrbxeV1kZioso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-GM3JGt2IPoeXL76p6qeU6w-1; Wed, 27 Nov 2019 10:18:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8C11007271;
 Wed, 27 Nov 2019 15:18:22 +0000 (UTC)
Received: from max.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 477BF1001DE1;
 Wed, 27 Nov 2019 15:18:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] fs: Fix page_mkwrite off-by-one errors
Date: Wed, 27 Nov 2019 16:18:11 +0100
Message-Id: <20191127151811.9229-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: GM3JGt2IPoeXL76p6qeU6w-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_072105_852768_07DD9600 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix a check in block_page_mkwrite meant to determine whether an offset
is within the inode size.  This error has spread to several filesystems
and to iomap_page_mkwrite, so fix those instances as well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

---

This patch has a trivial conflict with commit "iomap: Fix overflow in
iomap_page_mkwrite" in Darrick's iomap pull request for 5.5:

  https://lore.kernel.org/lkml/20191125190907.GN6219@magnolia/
---
 fs/buffer.c            | 2 +-
 fs/ceph/addr.c         | 2 +-
 fs/ext4/inode.c        | 2 +-
 fs/f2fs/file.c         | 2 +-
 fs/iomap/buffered-io.c | 2 +-
 fs/ubifs/file.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 86a38b979323..152d391858d4 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2465,7 +2465,7 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
 	lock_page(page);
 	size = i_size_read(inode);
 	if ((page->mapping != inode->i_mapping) ||
-	    (page_offset(page) > size)) {
+	    (page_offset(page) >= size)) {
 		/* We overload EFAULT to mean page got truncated */
 		ret = -EFAULT;
 		goto out_unlock;
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 7ab616601141..9fa0729ece41 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
 	do {
 		lock_page(page);
 
-		if ((off > size) || (page->mapping != inode->i_mapping)) {
+		if ((off >= size) || (page->mapping != inode->i_mapping)) {
 			unlock_page(page);
 			ret = VM_FAULT_NOPAGE;
 			break;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 516faa280ced..6dd4efe2fb63 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6224,7 +6224,7 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	lock_page(page);
 	size = i_size_read(inode);
 	/* Page got truncated from under us? */
-	if (page->mapping != mapping || page_offset(page) > size) {
+	if (page->mapping != mapping || page_offset(page) >= size) {
 		unlock_page(page);
 		ret = VM_FAULT_NOPAGE;
 		goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759..3436be01af45 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -71,7 +71,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	down_read(&F2FS_I(inode)->i_mmap_sem);
 	lock_page(page);
 	if (unlikely(page->mapping != inode->i_mapping ||
-			page_offset(page) > i_size_read(inode) ||
+			page_offset(page) >= i_size_read(inode) ||
 			!PageUptodate(page))) {
 		unlock_page(page);
 		err = -EFAULT;
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e25901ae3ff4..d454dbab5133 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1041,7 +1041,7 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
 	lock_page(page);
 	size = i_size_read(inode);
 	if ((page->mapping != inode->i_mapping) ||
-	    (page_offset(page) > size)) {
+	    (page_offset(page) >= size)) {
 		/* We overload EFAULT to mean page got truncated */
 		ret = -EFAULT;
 		goto out_unlock;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cd52585c8f4f..ca0148ec77e6 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1564,7 +1564,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	lock_page(page);
 	if (unlikely(page->mapping != inode->i_mapping ||
-		     page_offset(page) > i_size_read(inode))) {
+		     page_offset(page) >= i_size_read(inode))) {
 		/* Page got truncated out from underneath us */
 		goto sigbus;
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
