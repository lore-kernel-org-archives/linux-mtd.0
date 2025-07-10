Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB14C83F20
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=roeFFPwYL+4Imale5QWa3HJIViT6ZtEVQX3gK5O0xhM=; b=h1JsXcUpT4xIi9
	liO8L6qFPRLJKnHDbY1L2SzdNEGTbNvGmhEY+ijLljn6yIlaHllWpOi32mOeQkuN4TJVQGpsaVWKa
	oceET+uvRsL+gPSA3D4Pt5nt/EhRc57aoSWALxpG1xZ4zpMIpRZQF6FKttJt4fx9/tHVpIIws0ROt
	l+R1lbd9Z+FBmWzqN26e4pIfmmPE82PuW1RpklJduEKdlBSYCmMt5ucCxr/+ZKgZBRy5t72O3+qBl
	/bjYP/BYjeP0EttPEON8igKtlGzL57dzs0OjVhkF1QFwmLBnXrIhZlhPBU74e8tC/P6i7s4O1jzPP
	TY2TrCAW8uP3Hrl08yZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlV0-0000000AyJQ-3cMN;
	Thu, 10 Jul 2025 07:15:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkTt-0000000AojZ-00Po
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 06:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32451465D1;
	Thu, 10 Jul 2025 06:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A90C4CEE3;
	Thu, 10 Jul 2025 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752127804;
	bh=A3irvs3v7PeKCQdQ382HRWJhQhk42uJw8OaFzTK/jwY=;
	h=From:To:Cc:Subject:Date:From;
	b=s9Zov/HUucOp8tvLbXEgwce5AL6ve4tknQy4CUaMJSs32zOki/FDKYJ+T4ISkPv4f
	 5OnIcVmzIBJsAguAGhqYWArSGIfvUG9cGL1pF4TPDA2vTb9dqivxAb1t6fxOsOljIW
	 tC9CbGFllXrNC5+7hZ9ZnIaWCNHIc0iwBsbQhncDdFG0kmc5k5Hx/6Eh7iAy8eBv0V
	 LeaVm9fr03M8tjFggiVDqe4/dUj8QIlekG7LjnG96rctZ/+qFDLvnNNH93t0L2lXcY
	 gX+70CUs9eri1BkneIBwFfnCuixDGPWsWKJTrioINVNN82f24Yo/BpUaKYGhfItrQW
	 rjxOGfkQ1MgFA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>,
	linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 0/6] fscrypt: Switch to sync_skcipher and on-stack requests
Date: Wed,  9 Jul 2025 23:07:47 -0700
Message-ID: <20250710060754.637098-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231005_057786_F9D168DB 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

Simplify the code and eliminate per-encryption-op dynamic memory
allocations by switching from crypto_skcipher to crypto_sync_skcipher,
and from dynamic request allocation to SYNC_SKCIPHER_REQUEST_ON_STACK.

Previously, this change would have made the x86 accelerated AES code no
longer be used, which would have been very bad.  However, I fixed that
in 6.16.  So we can make this simplification now.

This patchset applies to fscrypt/for-next.  The base-commit (listed
below) can be found in next-20250708

Changed in v2:
- Added patches that remove the gfp_t argument from functions that no
  longer need it.
- Eliminated the goto in derive_key_aes().
- Improved commit messages.

Eric Biggers (6):
  fscrypt: Don't use asynchronous CryptoAPI algorithms
  fscrypt: Drop FORBID_WEAK_KEYS flag for AES-ECB
  fscrypt: Switch to sync_skcipher and on-stack requests
  fscrypt: Remove gfp_t argument from fscrypt_crypt_data_unit()
  fscrypt: Remove gfp_t argument from fscrypt_encrypt_block_inplace()
  ceph: Remove gfp_t argument from ceph_fscrypt_encrypt_*()

 fs/ceph/crypto.c            | 13 +++-----
 fs/ceph/crypto.h            | 10 +++---
 fs/ceph/file.c              |  3 +-
 fs/ceph/inode.c             |  3 +-
 fs/crypto/bio.c             |  3 +-
 fs/crypto/crypto.c          | 44 +++++++++-----------------
 fs/crypto/fname.c           | 63 +++++++++++++------------------------
 fs/crypto/fscrypt_private.h | 10 +++---
 fs/crypto/keysetup.c        | 23 +++++++-------
 fs/crypto/keysetup_v1.c     | 56 ++++++++++++++-------------------
 fs/ubifs/crypto.c           |  2 +-
 include/linux/fscrypt.h     |  5 ++-
 12 files changed, 91 insertions(+), 144 deletions(-)


base-commit: b41c1d8d07906786c60893980d52688f31d114a6
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
