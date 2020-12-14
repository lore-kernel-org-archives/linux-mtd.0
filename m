Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052CEC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 05:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90190229C7
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 05:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90190229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=npmKeNwvZ2txObO/Jx1QevFQXKp6FhHPYamd9pRUiSg=; b=EkSo31g4FQDO/T499SGHG2ECDN
	uPBOR8PNt8IEkHkFEIoNJZbGVa2FEUK5n5dvVtu6CaqjOF9+W68MTWRnKFX5dLlJliSGKGeqa78WL
	2C4J6k69n6kUau/z11q9R3PFNO463YgqfDAyrFj4eNc+DeUCg6iyFZLqjzxqTdCGXtUnSCyAuWixd
	cl3L6i81ozrTjrGmNM7doPfmfc5fsjAUjWPX+bzx9dB8sLtZwepJxagR5zHZjcDAWtV81nVuHAtio
	H7orH3k4K2XrkCrlXwNNMXlWTfmRNxyILd8vLNTIfulRiIJPBoWPsYm1vvFgjoi31/eZPYAXJ+n4s
	pKbG2Ehw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kogkg-0005p5-Vi; Mon, 14 Dec 2020 05:50:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kogke-0005od-5Y
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 05:50:29 +0000
Date: Sun, 13 Dec 2020 21:50:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607925021;
 bh=26wjFmCwOjxbjwCPVnXE7SyqfSynEV7b+ddO/h17k4I=;
 h=From:To:Cc:Subject:From;
 b=n/muPa2CduuxaSl+0TEAyvxRjflWJBxicz+gMGJDNpvNXQogxADu7X/WVccGdAlqi
 xZmuIv3FwteKOr+Qlv5ddaktdmXQSJIeBxTQzP16O7fUFoPzMSDKpKdMu63zQ/rf4L
 nkHx5mxptVdfc2WBUpiRT71HanPgKK5fmug5mHDGtTbGZJ04bJI4hhRlBraAVBb4nv
 2cZYgMGX+sIph52A0SHSdKjUYTKcBWNBX29/dwftRvi2vV6JlukFQMNZnsxn+m7tOy
 ADB2dQgI4vwseN0mcDjFLUWzBh0NPkgsiv/xrwLG41ZNV1WkrtMPXaL3OR1Cb1vFdS
 nTBmup/vMTS6A==
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt updates for 5.11
Message-ID: <X9b9G8p8AiRAzDwV@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_005028_285718_4B2E9FD4 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to a14d0b6764917b21ee6fdfd2a8a4c2920fbefcce:

  fscrypt: allow deleting files with unsupported encryption policy (2020-12-02 18:25:01 -0800)

----------------------------------------------------------------

This release there are some fixes for longstanding problems, as well as
some cleanups:

- Fix a race condition where a duplicate filename could be created in an
  encrypted directory if a syscall that creates a new filename raced
  with the directory's encryption key being added.

- Allow deleting files that use an unsupported encryption policy.

- Simplify the locking for 'struct fscrypt_master_key'.

- Remove kernel-internal constants from the UAPI header.

As usual, all these patches have been in linux-next with no reported
issues, and I've tested them with xfstests.

----------------------------------------------------------------
Eric Biggers (16):
      fscrypt: remove kernel-internal constants from UAPI header
      fscrypt: add fscrypt_is_nokey_name()
      ext4: prevent creating duplicate encrypted filenames
      f2fs: prevent creating duplicate encrypted filenames
      ubifs: prevent creating duplicate encrypted filenames
      fscrypt: remove unnecessary calls to fscrypt_require_key()
      fscrypt: simplify master key locking
      ext4: remove ext4_dir_open()
      f2fs: remove f2fs_dir_open()
      ubifs: remove ubifs_dir_open()
      ext4: don't call fscrypt_get_encryption_info() from dx_show_leaf()
      fscrypt: introduce fscrypt_prepare_readdir()
      fscrypt: move body of fscrypt_prepare_setattr() out-of-line
      fscrypt: move fscrypt_require_key() to fscrypt_private.h
      fscrypt: unexport fscrypt_get_encryption_info()
      fscrypt: allow deleting files with unsupported encryption policy

 fs/crypto/fname.c            |   8 +++-
 fs/crypto/fscrypt_private.h  |  56 +++++++++++++++-------
 fs/crypto/hooks.c            |  55 +++++++++++----------
 fs/crypto/keyring.c          |  10 +---
 fs/crypto/keysetup.c         |  44 +++++++++++------
 fs/crypto/policy.c           |  27 +++++++----
 fs/ext4/dir.c                |  16 ++-----
 fs/ext4/namei.c              |  13 ++---
 fs/f2fs/dir.c                |  10 +---
 fs/f2fs/f2fs.h               |   2 +
 fs/ubifs/dir.c               |  28 +++++------
 include/linux/fscrypt.h      | 112 ++++++++++++++++++++++++++++---------------
 include/uapi/linux/fscrypt.h |   5 +-
 13 files changed, 227 insertions(+), 159 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
