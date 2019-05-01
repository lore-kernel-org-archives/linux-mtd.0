Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D7C43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 22:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1225B2081C
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 22:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FNkLMadM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2I2LJrbf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1225B2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUJq/0faLqsPzd9GdNobv20Jdf86B4+YeA3xLUrTmRE=; b=FNkLMadMbVGe3m
	XHNITDiQ9j2tgYchdjv8oMygNcAT3c58RMT+4Sx9ScTtxT5g18RfPUrFXawuHoidj8cx4fxV+DPQN
	Mr/8bcCPs0e+TmZLZoS9ma1V8AbeQz76LaAa01gSqks/6X9UT6NyOVcVA/dacRzugF1e50TjyWlLU
	2k/BG5ZOHHPWB97SGMuzFpyrjk1oW90oTJn3CQ4tyTuNJ0WDoWRwqEx97iOlEK3X//57vd/rkh0PM
	L1Ncxv8igpeAELAsJjum9J76EuNrqsrBnQOvKGEsRTa1ldzbDhhDX6kyqKCg8jmT83WaqARqpuTPU
	KTb+ex7RqVKTMds7dPlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLy0d-0007tI-Hk; Wed, 01 May 2019 22:47:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLxzN-00068D-7M
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 22:46:13 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79081217D6;
 Wed,  1 May 2019 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556750768;
 bh=zasOEShYERzZdFPiCVFwjBxPKVnej4e6HAp2E2v7iWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2I2LJrbfXh52sDxFMLokfCyxrGL7QigFr/FKy+FHAoXvpvfKHBnUJFcq+1NVvjmaD
 iT+7TKcp6VAQhvHieFKvYmGR4EHOP4fRV2+SKWnVDRfVQiFYa2f4p75MS749H3YpUs
 Rkz+v4y9xTgIaPCTUkOuRjVQsbymuUVRUFrWkYjI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 12/13] ext4: decrypt only the needed block in
 __ext4_block_zero_page_range()
Date: Wed,  1 May 2019 15:45:14 -0700
Message-Id: <20190501224515.43059-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190501224515.43059-1-ebiggers@kernel.org>
References: <20190501224515.43059-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_154609_381942_9B5CBA91 
X-CRM114-Status: GOOD (  12.98  )
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

From: Chandan Rajendra <chandan@linux.ibm.com>

In __ext4_block_zero_page_range(), only decrypt the block that actually
needs to be decrypted, rather than assuming blocksize == PAGE_SIZE and
decrypting the whole page.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
(EB: rebase onto previous changes, improve the commit message, and use
 bh_offset())
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index d24c50e4598f0..58597db621e1e 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4073,9 +4073,8 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
-			BUG_ON(blocksize != PAGE_SIZE);
 			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
-						page, PAGE_SIZE, 0));
+					page, blocksize, bh_offset(bh)));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
-- 
2.21.0.593.g511ec345e18-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
