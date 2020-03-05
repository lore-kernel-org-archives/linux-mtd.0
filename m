Return-Path: <SRS0=05/s=4W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7CEC3F2D1
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 08:43:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0962146E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 08:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evXQ+jzh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R37w+oJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E0962146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FJrvNnZmX1cYNPvq4hBZLoKT7treNCwnZG/fYdXPVSA=; b=evXQ+jzhiLBaAr
	24msJvmXPgbBZ96ucqeVbPeEsFQCtle0KCLj2pBqiWbDg8sB0StxmPMuns6hzDio8TcSdR4kbTVVu
	hnHtTNi6dVG+3YMHHTegvp82I68Vr5h+Ie5iFpIP0TZmgDru2wH4fG2f++cWbKb6SyfM1e+rw982N
	hcgcIvu7u2urnSybqdp0HTv/6NpAzT6HfrJZlqur9ZFaqhixGpyOH9nXUwaLQdanX+RvdPUH54t+D
	f5rGjztWrcG26vyy4pFM7lfd/vNHhFo0CZFetpMskHpVmWXKDByXMtLqzU7FaZdPoB7dPpYiMlnMD
	ROZJxiQhvnkCQV1aoh7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9m5l-0005hO-1i; Thu, 05 Mar 2020 08:42:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9m5P-0005Tu-Fw
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2020 08:42:34 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BF482146E;
 Thu,  5 Mar 2020 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583397749;
 bh=K/56YT+etKnoKYjtDmkQrf9U3Pw0mVZKDfdV/kmF4ks=;
 h=From:To:Cc:Subject:Date:From;
 b=R37w+oJeIdHqMiqGjA3IcdEQaYStFgKRJ90nIWmmQIJ+tqio/I6Sjxb5GOyK6x59/
 bZgSoVH/ljq8omzN71BE5Q/8QiGQwxl2qkU0Tx6SPVUHGClNHtsepqWO9Q5SHBFqwQ
 JlrZ/avFlhIJeUfAFnny/KFFFrNFQf04GaSRuMFY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH] fscrypt: don't evict dirty inodes after removing key
Date: Thu,  5 Mar 2020 00:41:38 -0800
Message-Id: <20200305084138.653498-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_004231_623213_C3D807BE 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

After FS_IOC_REMOVE_ENCRYPTION_KEY removes a key, it syncs the
filesystem and tries to get and put all inodes that were unlocked by the
key so that unused inodes get evicted via fscrypt_drop_inode().
Normally, the inodes are all clean due to the sync.

However, after the filesystem is sync'ed, userspace can modify and close
one of the files.  (Userspace is *supposed* to close the files before
removing the key.  But it doesn't always happen, and the kernel can't
assume it.)  This causes the inode to be dirtied and have i_count == 0.
Then, fscrypt_drop_inode() failed to consider this case and indicated
that the inode can be dropped, causing the write to be lost.

On f2fs, other problems such as a filesystem freeze could occur due to
the inode being freed while still on f2fs's dirty inode list.

Fix this bug by making fscrypt_drop_inode() only drop clean inodes.

I've written an xfstest which detects this bug on ext4, f2fs, and ubifs.

Fixes: b1c0ec3599f4 ("fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keysetup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 65cb09fa6ead..08c9f216a54d 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -538,6 +538,15 @@ int fscrypt_drop_inode(struct inode *inode)
 		return 0;
 	mk = ci->ci_master_key->payload.data[0];
 
+	/*
+	 * With proper, non-racy use of FS_IOC_REMOVE_ENCRYPTION_KEY, all inodes
+	 * protected by the key were cleaned by sync_filesystem().  But if
+	 * userspace is still using the files, inodes can be dirtied between
+	 * then and now.  We mustn't lose any writes, so skip dirty inodes here.
+	 */
+	if (inode->i_state & I_DIRTY_ALL)
+		return 0;
+
 	/*
 	 * Note: since we aren't holding ->mk_secret_sem, the result here can
 	 * immediately become outdated.  But there's no correctness problem with
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
