Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668BEC43467
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2CF822D01
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FszKScN0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDKODAQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2CF822D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xHZEr0QDat55/YWkbBmjOV9A39fsVQdExYPqOTFdkQ=; b=FszKScN0nOa/0nOkYBQaPGNIm
	gCRFNCStkgGRZGEAsjmwtLLKLgi4cIXJUnBm4NlgP74tO2i2ZaBmrfJpUNnxjqrW7+oa/1pSfVHoN
	Jan664W4Jr6VdQQIai1nB/tJbhqVoxUXqtOrWGNiFseS9W5IIL03T0DzKi0zFQZ7BcN6W29KM7iiZ
	hPGSKJNxviJjcFziqjlooLtZ06zwMfOG4nkMmA1Ds/+IiGnTVwXuy3BJOS08pOTQW+y2KlHr4fmVu
	XlfH8OmlpCrQC4jiExJ6lVU0jUejrL+Su+8M7zSdW8PGd8HxbLtsfX5KRFjtaRCMNXQGrCzUt781o
	gvKcAGY9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA5oI-0003kZ-A9; Mon, 24 Aug 2020 06:18:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA5oC-0003hk-OY
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 06:18:23 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E15422087D;
 Mon, 24 Aug 2020 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249899;
 bh=IH6sTOwkbzPMf4x5Li5gjFgkfm2HNIgk1xMl8TNxDTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDKODAQpPTq5huUKShVPhJTG2Df1AHur6QPxO7Njy/ZJwbOEtmt/3AwrwdxS7/TVN
 ZMC92UTKIOeYa+JwpYJPxIO128wY9hOL8oTYduzs1O3YrW9UDLUMuf7TCoC739bDtJ
 CfMQrNc+4ZGVgY9GdtXke3sxODPPYPwCrcKZmOoM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH 3/8] ext4: remove some #ifdefs in
 ext4_xattr_credits_for_new_inode()
Date: Sun, 23 Aug 2020 23:17:07 -0700
Message-Id: <20200824061712.195654-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824061712.195654-1-ebiggers@kernel.org>
References: <20200824061712.195654-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_021820_940419_FB8D4CAD 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

We don't need #ifdefs for CONFIG_SECURITY and CONFIG_INTEGRITY;
IS_ENABLED() is sufficient.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ialloc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index 0cc576005a923..3e9c50eb857be 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -763,13 +763,12 @@ static int ext4_xattr_credits_for_new_inode(struct inode *dir, mode_t mode,
 	}
 #endif
 
-#ifdef CONFIG_SECURITY
-	{
+	if (IS_ENABLED(CONFIG_SECURITY)) {
 		int num_security_xattrs = 1;
 
-#ifdef CONFIG_INTEGRITY
-		num_security_xattrs++;
-#endif
+		if (IS_ENABLED(CONFIG_INTEGRITY))
+			num_security_xattrs++;
+
 		/*
 		 * We assume that security xattrs are never more than 1k.
 		 * In practice they are under 128 bytes.
@@ -779,7 +778,7 @@ static int ext4_xattr_credits_for_new_inode(struct inode *dir, mode_t mode,
 						 NULL /* block_bh */, 1024,
 						 true /* is_create */);
 	}
-#endif
+
 	if (encrypt)
 		nblocks += __ext4_xattr_set_credits(sb,
 						    NULL /* inode */,
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
