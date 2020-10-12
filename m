Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5D2C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 16:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCE820838
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 16:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0l36uee1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3CNKfqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCE820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yII5Tw0/JERnc6U9qXmq2/AbWr3c8T8p5mKAxFNNSnY=; b=0l36uee1w+a3HEZsoR0oKussm6
	UONoiFTLnYvj0vgzfTlGcoSmnRaCZrwozBDGP9F1UK5sPkh5aeVQluk/FMqZgImH13ve5M6N+2PcA
	PMIhZp9DqkZcIVFzEPZ6fnG+0XKgMtMZQvXBF4OGYPV8ssCOJvlm3xzBvmHvAwfYXPR0CfAGN5nCM
	S2I/huuvdoklkznThILh8QYBgm9opEhpBHML6FESk3xcAao95v6XjQPSuBLm0+5+xHWFd0SNxc/7J
	+RtWjqkgX0/IkXyYmFtv9VuoY+xYPqGdINwncphjL75/7osU3q/JfFimWsNpZiMTLhD10c9/PE0E6
	tuJlW0Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS0nd-0004PL-4Q; Mon, 12 Oct 2020 16:35:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS0na-0004Nz-2y
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 16:35:47 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A743C2087E;
 Mon, 12 Oct 2020 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602520545;
 bh=YcQkpt6LAikAkB8QxaNKH7LeylYY9QtLEPxQqeO6Opc=;
 h=Date:From:To:Cc:Subject:From;
 b=h3CNKfqwIHPV7BZ9hlGFurPVOoV3tPc0rsL8zhSQ3bYNeva/1gL1LMR6EgvNgZ1ky
 Iue96vWauoxpSjbJ0nTKmHeG1rslzfbYWaB/Mq5x5OWvhn/dOTTQ8G9m+BlO9Y3Tp0
 Y7SUutsnxm/64ZLRdP9PVhAzUFjaKyM+162FzfvU=
Date: Mon, 12 Oct 2020 09:35:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt updates for 5.10
Message-ID: <20201012163543.GB858@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_123546_270149_B174D71A 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 5b2a828b98ec1872799b1b4d82113c76a12d594f:

  fscrypt: export fscrypt_d_revalidate() (2020-09-28 14:44:51 -0700)

----------------------------------------------------------------

This release, we rework the implementation of creating new encrypted
files in order to fix some deadlocks and prepare for adding fscrypt
support to CephFS, which Jeff Layton is working on.

We also export a symbol in preparation for the above-mentioned CephFS
support and also for ext4/f2fs encrypt+casefold support.

Finally, there are a few other small cleanups.

As usual, all these patches have been in linux-next with no reported
issues, and I've tested them with xfstests.

----------------------------------------------------------------
Eric Biggers (18):
      fscrypt: restrict IV_INO_LBLK_32 to ino_bits <= 32
      fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
      ext4: factor out ext4_xattr_credits_for_new_inode()
      ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
      f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
      ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
      fscrypt: adjust logging for in-creation inodes
      fscrypt: remove fscrypt_inherit_context()
      fscrypt: require that fscrypt_encrypt_symlink() already has key
      fscrypt: stop pretending that key setup is nofs-safe
      fscrypt: make "#define fscrypt_policy" user-only
      fscrypt: move fscrypt_prepare_symlink() out-of-line
      fscrypt: handle test_dummy_encryption in more logical way
      fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char *'
      fscrypt: use sha256() instead of open coding
      fscrypt: don't call no-key names "ciphertext names"
      fscrypt: rename DCACHE_ENCRYPTED_NAME to DCACHE_NOKEY_NAME
      fscrypt: export fscrypt_d_revalidate()

Jeff Layton (1):
      fscrypt: drop unused inode argument from fscrypt_fname_alloc_buffer

 fs/crypto/crypto.c           |   4 +-
 fs/crypto/fname.c            |  60 ++++++-------
 fs/crypto/fscrypt_private.h  |  10 ++-
 fs/crypto/hooks.c            |  80 +++++++++++------
 fs/crypto/inline_crypt.c     |   7 +-
 fs/crypto/keyring.c          |   9 +-
 fs/crypto/keysetup.c         | 182 +++++++++++++++++++++++++++----------
 fs/crypto/keysetup_v1.c      |   8 +-
 fs/crypto/policy.c           | 209 ++++++++++++++++++++++++-------------------
 fs/ext4/dir.c                |   2 +-
 fs/ext4/ext4.h               |   6 +-
 fs/ext4/ialloc.c             | 119 ++++++++++++------------
 fs/ext4/namei.c              |   7 +-
 fs/ext4/super.c              |  16 ++--
 fs/f2fs/dir.c                |   6 +-
 fs/f2fs/f2fs.h               |  25 +-----
 fs/f2fs/namei.c              |   7 +-
 fs/f2fs/super.c              |  15 ++--
 fs/ubifs/dir.c               |  40 ++++-----
 include/linux/dcache.h       |   2 +-
 include/linux/fscrypt.h      | 159 +++++++++++++-------------------
 include/uapi/linux/fscrypt.h |   6 +-
 22 files changed, 535 insertions(+), 444 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
