Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0610EC43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 22:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3B8C2075E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 22:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AuXazO+/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w0Gk63yD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3B8C2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xl9R9PHCcPeCYxiwNJqvDXDBjOZwA/ah4VGn2Nl9an0=; b=AuXazO+/8ToV34
	+piZ5AjObZuJb10qjWcCYRnFz80qzIl3pHRMdy+nGYtVmat3OboCqCHNBDSYlHV1Jwxssjaio4M8O
	BbQNCNLc017A84Y+y7hP4fSHeKpch+XRBdwJW+XGcVa7Mn6NS5qsNEaMCiCz9ZwpTNFF/SJgVJbQ4
	Uxx7X3OfH9teJkp8fbUqDD72mERJhSpECIeZJ64gpvsByhFX1CacH1KAYOr6A9+cwM3aCYblywuXA
	W9ESwDobkpOts43juz3jYxtdeknKh6UrSqESwXun5gRq6/+7QeHF19MPpiGGOHrZG2mq/UwVsj+k2
	PWDMRF+zYq02i1/smQ1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLy01-00076O-Gr; Wed, 01 May 2019 22:46:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLxzL-00066a-Mx
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 22:46:09 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0093621734;
 Wed,  1 May 2019 22:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556750767;
 bh=k4J5FpJhlAgJ16Pp5cNsgabyRPAvsfRr0/3EL88VutM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=w0Gk63yDzfh6XsEGODolMNkjblpOM+kEHHCK6/D5gE5zZjNtR/VjmPRiSp+r6Ge2Y
 IxVoeJiYgeiEa65NEmqzIMCBDS2jj9YOg0jCIsiOYg9XlvKqc4gkjVX2cvIk6bLNBB
 oSaCpgvtkJH9IdF1SX5CO1gHkoeeTWi25YpqCaQU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 07/13] fscrypt: handle blocksize < PAGE_SIZE in
 fscrypt_zeroout_range()
Date: Wed,  1 May 2019 15:45:09 -0700
Message-Id: <20190501224515.43059-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190501224515.43059-1-ebiggers@kernel.org>
References: <20190501224515.43059-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_154607_889457_9AF39523 
X-CRM114-Status: GOOD (  12.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Adjust fscrypt_zeroout_range() to encrypt a block at a time rather than
a page at a time, so that it works when blocksize < PAGE_SIZE.

This isn't optimized for performance, but then again this function
already wasn't optimized for performance.  As a future optimization, we
could submit much larger bios here.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

This is based on work by Chandan Rajendra.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index bcab8822217b0..e67e9d4d342b3 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -73,12 +73,12 @@ EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
+	const unsigned int blockbits = inode->i_blkbits;
+	const unsigned int blocksize = 1 << blockbits;
 	struct page *ciphertext_page;
 	struct bio *bio;
 	int ret, err = 0;
 
-	BUG_ON(inode->i_sb->s_blocksize != PAGE_SIZE);
-
 	ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
 	if (!ciphertext_page)
 		return -ENOMEM;
@@ -86,7 +86,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	while (len--) {
 		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
 					  ZERO_PAGE(0), ciphertext_page,
-					  PAGE_SIZE, 0, GFP_NOFS);
+					  blocksize, 0, GFP_NOFS);
 		if (err)
 			goto errout;
 
@@ -96,14 +96,11 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 			goto errout;
 		}
 		bio_set_dev(bio, inode->i_sb->s_bdev);
-		bio->bi_iter.bi_sector =
-			pblk << (inode->i_sb->s_blocksize_bits - 9);
+		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
-		ret = bio_add_page(bio, ciphertext_page,
-					inode->i_sb->s_blocksize, 0);
-		if (ret != inode->i_sb->s_blocksize) {
+		ret = bio_add_page(bio, ciphertext_page, blocksize, 0);
+		if (WARN_ON(ret != blocksize)) {
 			/* should never happen! */
-			WARN_ON(1);
 			bio_put(bio);
 			err = -EIO;
 			goto errout;
-- 
2.21.0.593.g511ec345e18-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
