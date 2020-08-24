Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C695C433F2
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D6722D02
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+7CEPPE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f893nZOH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D6722D02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QCTjl2e3yUMVNbrKIeXcKvpOA3S4qXXlP9wlj1rsRD8=; b=m+7CEPPEkigA5Phpa7hVk9GFjK
	1Gp0cKORVzMaWkcn4M5TpVhTkJ8RIdG8f7bB4HfOsINXa0cdCk4hAKmkkCSrUN2k+Po+ATvoz7W5t
	tzP/f3PGkUBJPfwUz2BULum3j10qrvxFNTo/leCgnL8GfJAmoHhdlcf2GX0I9TbBuUhVtdhbwum4U
	23ryjj7gj5e7YMkNlRjbgILgyo75zw5SOS6QELKPzWTd4/+RiSPRWsh0gQbKgq8MhTVIiWxbeS+0q
	30InrODVw7WbFjBRXnmDD0bc3eERsa1Q19Ui4h7n8DkO0cBjY4XtXi5IS1CTGO5jQt/9iM3fDqyQT
	FPWQeqLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA5oP-0003lm-KX; Mon, 24 Aug 2020 06:18:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA5oC-0003he-Q0
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 06:18:24 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD6CF206B5;
 Mon, 24 Aug 2020 06:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249898;
 bh=5Cg/F/P1MsSIqNAEKm5EcA85tMzmQDFgxtq+BwsOiXY=;
 h=From:To:Cc:Subject:Date:From;
 b=f893nZOHOk74YywNd+s2c7KM7U+ApkFK+G5wAxPqs247sQ2FcptH0qP9EtwzvEYBf
 LROjPrF6b7H17wnj5KGsZaPkgvTF6yctFlLpC0zde7Uvt1Qfhq8ilvE8jBprCzObNr
 jbaGalIhOAIFifcUwA2qyoWoyI0iCcGdq4CofU6w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH 0/8] fscrypt: avoid GFP_NOFS-unsafe key setup during
 transaction
Date: Sun, 23 Aug 2020 23:17:04 -0700
Message-Id: <20200824061712.195654-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_021821_238014_AF1C76B3 
X-CRM114-Status: GOOD (  13.29  )
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

This series fixes some deadlocks which are theoretically possible due to
fscrypt_get_encryption_info() being GFP_NOFS-unsafe, and thus not safe
to be called from within an ext4 transaction or under f2fs_lock_op().

The problem is solved by new helper functions which allow setting up the
key for new inodes earlier.  Patch 1 adds these helper functions.  Also
see that patch for a more detailed description of this problem.

Patches 2-6 then convert ext4, f2fs, and ubifs to use these new helpers.

Patch 7-8 then clean up a few things afterwards.

Coincidentally, this also solves some of the ordering problems that
ceph fscrypt support will have.  For more details about this, see the
discussion on Jeff Layton's RFC patchset for ceph fscrypt support
(https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u)
However, fscrypt_prepare_new_inode() still requires that the new
'struct inode' exist already, so it might not be enough for ceph yet.

This patchset applies to v5.9-rc2.

Eric Biggers (8):
  fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
  ext4: factor out ext4_xattr_credits_for_new_inode()
  ext4: remove some #ifdefs in ext4_xattr_credits_for_new_inode()
  ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  fscrypt: remove fscrypt_inherit_context()
  fscrypt: stop pretending that key setup is nofs-safe

 fs/crypto/fscrypt_private.h |   3 +
 fs/crypto/hooks.c           |  10 +-
 fs/crypto/inline_crypt.c    |   7 +-
 fs/crypto/keysetup.c        | 190 ++++++++++++++++++++++++++++--------
 fs/crypto/keysetup_v1.c     |   8 +-
 fs/crypto/policy.c          |  64 +++++++-----
 fs/ext4/ialloc.c            | 118 +++++++++++-----------
 fs/f2fs/dir.c               |   2 +-
 fs/f2fs/f2fs.h              |  16 ---
 fs/f2fs/namei.c             |   7 +-
 fs/ubifs/dir.c              |  26 ++---
 include/linux/fscrypt.h     |  18 +++-
 12 files changed, 293 insertions(+), 176 deletions(-)

-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
