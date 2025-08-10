Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A43CA0ECF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h2+AI2KLiDfeOpAmPRlTx1/3oUEq5B8mTV3/a95UMWs=; b=v19FPH9+IC8CrO
	D2H4FiQK6eXZJJdY0Xpx8iJWwXPkwT7DVLOHwjbXCgnx8kHUOUzocik6WiHIwo5+levk1A6T7X58N
	WpwK715iBLcUBqdiXyo4aHWNxerwnu3fZVDSlm41Y6W/WgfeIUQvYgI9F96yfGHNZBzcQInfEhp2d
	dWFwy3L/rQK6lPy1J3VCJXaZXgNx4SNmzd+UKniqK7uyY6UQ67KEucptFfDD4tFb/TkJJgkW4t5V6
	qbx7Z32IH5BwJUB6ZLv0D/fvtym953ttyt5xc242ziSN/nPaQmWD4DasEKtJMPiBdCc14J+V4xd6x
	LocOZDPie1DUt0NWp5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yW-00000005QKV-49ax;
	Sun, 10 Aug 2025 08:00:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yQ-00000005QDq-1zlQ
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72453A54F4E;
	Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E84DC4CEEB;
	Sun, 10 Aug 2025 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812807;
	bh=aTHyx1cf8uUcKi9iLPhMiaHNvBZweQxvaRFblGuIkU0=;
	h=From:To:Cc:Subject:Date:From;
	b=WJdGfnTNdEQ6MVf/hGAbh0JwTqoz1Yh+pYp0k313F/a1j/rorDF8R07LPBEZ0sLKf
	 6TxIZXJpfRkfiRSg79aTBLrOKodHRWnOYxIzpGNzqukX7W9ZpAjrTaSykO5VbJXU6M
	 rkyXb6XfNgNUexzXDTYxsxC562eZhrAIUbuI29XD8/0xg59FuqKZjrrfxyllWOp+0H
	 pVx0Qmp2Zi2NnZkdXh0MsxAXjpQMVsGoNDFQBesUFz9qP+u5Wtl/oSyI7pmdRGsa5n
	 +v/4jBd7cw61Mw1MmUKzH2i7rF9Ljz955U2e9s4ryWyazVca4ZmDDM7IWpIX6vR9d2
	 covGiQZeubuTQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct inode
Date: Sun, 10 Aug 2025 00:56:53 -0700
Message-ID: <20250810075706.172910-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010010_659745_7D016DFE 
X-CRM114-Status: GOOD (  13.35  )
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

This is a cleaned-up implementation of moving the i_crypt_info and
i_verity_info pointers out of 'struct inode' and into the fs-specific
part of the inode, as proposed previously by Christian at
https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/

The high-level concept is still the same: fs/crypto/ and fs/verity/
locate the pointer by adding an offset to the address of struct inode.
The offset is retrieved from fscrypt_operations or fsverity_operations.

I've cleaned up a lot of the details, including:
- Grouped changes into patches differently
- Rewrote commit messages and comments to be clearer
- Adjusted code formatting to be consistent with existing code
- Removed unneeded #ifdefs
- Improved choice and location of VFS_WARN_ON_ONCE() statements
- Added missing kerneldoc for ubifs_inode::i_crypt_info
- Moved field initialization to init_once functions when they exist
- Improved ceph offset calculation and removed unneeded static_asserts
- fsverity_get_info() now checks IS_VERITY() instead of v_ops
- fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
  no longer think it's actually correct there.
- verity_data_blocks() now keeps doing a raw dereference
- Dropped fscrypt_set_inode_info() 
- Renamed some functions
- Do offset calculation using int, so we don't rely on unsigned overflow
- And more.

For v4 and earlier, see
https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/

I'd like to take this series through the fscrypt tree for 6.18.
(fsverity normally has a separate tree, but by choosing just one tree
for this, we'll avoid conflicts in some places.)

Eric Biggers (13):
  fscrypt: replace raw loads of info pointer with helper function
  fscrypt: add support for info in fs-specific part of inode
  ext4: move crypt info pointer to fs-specific part of inode
  f2fs: move crypt info pointer to fs-specific part of inode
  ubifs: move crypt info pointer to fs-specific part of inode
  ceph: move crypt info pointer to fs-specific part of inode
  fs: remove inode::i_crypt_info
  fsverity: add support for info in fs-specific part of inode
  ext4: move verity info pointer to fs-specific part of inode
  f2fs: move verity info pointer to fs-specific part of inode
  btrfs: move verity info pointer to fs-specific part of inode
  fs: remove inode::i_verity_info
  fsverity: check IS_VERITY() in fsverity_cleanup_inode()

 fs/btrfs/btrfs_inode.h       |  5 ++++
 fs/btrfs/inode.c             |  3 ++
 fs/btrfs/verity.c            |  2 ++
 fs/ceph/crypto.c             |  2 ++
 fs/ceph/inode.c              |  1 +
 fs/ceph/super.h              |  1 +
 fs/crypto/bio.c              |  2 +-
 fs/crypto/crypto.c           | 14 +++++----
 fs/crypto/fname.c            | 11 +++----
 fs/crypto/fscrypt_private.h  |  4 +--
 fs/crypto/hooks.c            |  2 +-
 fs/crypto/inline_crypt.c     | 12 ++++----
 fs/crypto/keysetup.c         | 43 ++++++++++++++++-----------
 fs/crypto/policy.c           |  7 +++--
 fs/ext4/crypto.c             |  2 ++
 fs/ext4/ext4.h               |  8 +++++
 fs/ext4/super.c              |  6 ++++
 fs/ext4/verity.c             |  2 ++
 fs/f2fs/f2fs.h               |  6 ++++
 fs/f2fs/super.c              | 10 ++++++-
 fs/f2fs/verity.c             |  2 ++
 fs/ubifs/crypto.c            |  2 ++
 fs/ubifs/ubifs.h             |  4 +++
 fs/verity/enable.c           |  6 ++--
 fs/verity/fsverity_private.h |  9 +++---
 fs/verity/open.c             | 23 ++++++++-------
 fs/verity/verify.c           |  2 +-
 include/linux/fs.h           | 10 -------
 include/linux/fscrypt.h      | 40 +++++++++++++++++++++++--
 include/linux/fsverity.h     | 57 +++++++++++++++++++++++++++++-------
 30 files changed, 215 insertions(+), 83 deletions(-)


base-commit: 561c80369df0733ba0574882a1635287b20f9de2
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
