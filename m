Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAB9C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4066E20815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmrGnVxF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1Vz3x+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4066E20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SddFrt2X86YkubkH8jV9IoM90BXyJ5HEmvCLIXehDNA=; b=VmrGnVxFYSFRWH
	uQqKtCYQ/u5XTdaDUt6phTCuLJgLt0s9ukTOqXO8wZGVv8kZw+vgNtShvk/ywDLWx7GMJbcUB+VJ9
	gSN1LxlEMotTy9Jd3Cu3DE1sUaO3d/f00P5IDoVV0eZPq4MNC3tuc7IseNdkEoYjVN2UQYUK8vY0j
	qM4OhKSsau5Fufz5JVBwM1e1t9OkEmK5lDvzK1RASuBRSBUkHUspVvEHsmnc7D8AsDScOIr7250ZK
	TYZpIpLPc1rUI+drvVv6oP8iY/UUo/aASVPniuNQbgoyHCGl8I0l7LnWHgKszlO0Re72R8DyC1zsI
	g26KHl5nReLTbxINOwyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlDz-00072a-Uf; Mon, 20 May 2019 16:33:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlBC-00038W-0y
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 16:30:32 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75FAB217D8;
 Mon, 20 May 2019 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369825;
 bh=nukFlueEKdgNJgzso/AFsN3Mr+EdXgyUtrGGf/8u+g8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L1Vz3x+6nxyFBaE2h8BSCuzL5qFe0UHFxvGgBIrdA8tW7WyZbF/6R2LpBd+1TkCzr
 pB4VpfNErXPtOKrXOnjcA6qsOyyIUIO3CgBChitVl3yi1JSURZCiGD6g6S4l1QcvOE
 4ZUU82xl6pdJqBCczP5WFk45xzIteoWph7h/RoPM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 14/14] ext4: encrypt only up to last block in
 ext4_bio_write_page()
Date: Mon, 20 May 2019 09:29:52 -0700
Message-Id: <20190520162952.156212-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_093026_421808_F4F98CB3 
X-CRM114-Status: GOOD (  13.60  )
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

From: Eric Biggers <ebiggers@google.com>

As an optimization, don't encrypt blocks fully beyond i_size, since
those definitely won't need to be written out.  Also add a comment.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

This is based on work by Chandan Rajendra.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/page-io.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 40ee33df57649..a18a47a2a1d1a 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -467,11 +467,19 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 
 	bh = head = page_buffers(page);
 
+	/*
+	 * If any blocks are being written to an encrypted file, encrypt them
+	 * into a bounce page.  For simplicity, just encrypt until the last
+	 * block which might be needed.  This may cause some unneeded blocks
+	 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
+	 * can't happen in the common case of blocksize == PAGE_SIZE.
+	 */
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) && nr_to_submit) {
 		gfp_t gfp_flags = GFP_NOFS;
+		unsigned int enc_bytes = round_up(len, i_blocksize(inode));
 
 	retry_encrypt:
-		bounce_page = fscrypt_encrypt_pagecache_blocks(page, PAGE_SIZE,
+		bounce_page = fscrypt_encrypt_pagecache_blocks(page, enc_bytes,
 							       0, gfp_flags);
 		if (IS_ERR(bounce_page)) {
 			ret = PTR_ERR(bounce_page);
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
