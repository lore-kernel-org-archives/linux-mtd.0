Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15414C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8C820815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oi3JseEi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICE9E/nK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8C820815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YQMKgwVu+R1Cy5A9COixOAKRuSq2kIn9YnFvyoCk0I=; b=Oi3JseEi1pMbX3
	RFlale9lJYy43uoclYljfVnqBRvwFKRVMmPxzQeTqqJy42sp/8CeoVOycaNf1VJMkxMMiTcdrks2H
	h4vmcu76O4BlYGRhRVw2b64tYDddwil774Q6dxediBCy/KQGV5PvRnx9pAvHjzqssnq8m0ClGHeiw
	tVWwhdfSo5O6ieXUM0mSxPvwM28qiQhZQ+84dulClUaEcWSk06WfTIUuDUj+Ltjqpf78CabVhoMm7
	LtP+DFIbdhkJBfbhnMb8fm+FiVOkXgYfDkTGnvOKpFO0smqIctbC9qi4TZGmxyKsPRIYbj8a6h2hm
	s0Cdb8x4txXSdm3cEuRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlDE-00069a-4S; Mon, 20 May 2019 16:32:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlBB-000387-JQ
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 16:30:32 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 253F2217D7;
 Mon, 20 May 2019 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369825;
 bh=bNfXVLtoITf8LG1OztsuiNKS3cmbu3tuokayi1NgBvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ICE9E/nKHvk1KzmTsv7NT0zAmnnMv0GrRE2cFsDrCO79Pr0l3xR0tSZLRKaQVfww+
 F04rJTlzFdv6lvY0pRaVYsuTSOPIoF++p0FCAK1lDPym0h4D0leBHCyOc51fQtejoy
 koS9Idc5jJ0aNk3g4RQTFT+39LtMR4UmJSSj47mg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 13/14] ext4: decrypt only the needed block in
 __ext4_block_zero_page_range()
Date: Mon, 20 May 2019 09:29:51 -0700
Message-Id: <20190520162952.156212-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_093026_030450_83C8498D 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
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
index 8b3ea9c8ac988..77c43c50e4580 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4075,9 +4075,8 @@ static int __ext4_block_zero_page_range(handle_t *handle,
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
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
