Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292A5C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 07:06:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF2C206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 07:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6CHC3EF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zJFv3N8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF2C206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b0pNrq7nxyHruRdj/9wBSAoKP/9kjsMNeQpYsVWsAiw=; b=M6CHC3EFWZqlDQdat5Pms7ShNR
	m/uaPw4Q2MFa+ARtHUTBaP3Jyv/GPJesqrHS5bwkLF1NOsaNHAIMXxLloFZ4RgIekP008n0QzT1tN
	3ILZm2m/0wjWZ5U0n9vjAsJ5nkrlBEDf+LEVCYMlyBoc6MC9oc1uh2r982FrNmIyzfkUeEqLFh+Bj
	8qOld17j5+rW+0w8V+z2dmj8XAIhrfKYp/aa/rnDTGT1MjQb9u4VkXCOqzwlNSsu8h3tnSpICJo83
	M59DGBHmqC2Jbh2ep/+xvWrWw8YtXTqxFnYjRCwJqR6me23pSXMQYCD+p8CeTb2LQHacr9tjdItNJ
	UJZTehVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2UXh-0006Rn-SV; Mon, 03 Aug 2020 07:05:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2UXf-0006R0-9P
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 07:05:52 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB12A206D7;
 Mon,  3 Aug 2020 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596438349;
 bh=1/YYBhx6gDgPn0W0PUaqgcbPBPyOY+oUseS5B1Y5aXs=;
 h=Date:From:To:Cc:Subject:From;
 b=zJFv3N8oSMbXQHLMge43sKxec8eqkF9HVvyR6GngT5yMahB7DlBsWaPzNqQKzte4+
 eCG0tD+mZ/WqVT7u/0+LsUeWT4cMeGecpf21MhCCWB13nNqebGh/SD7R5k87vU+IcZ
 41DHrflgqWuzyzYSdovDJh7xRxY5DiXqAVMLyU6w=
Date: Mon, 3 Aug 2020 00:05:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt updates for 5.9
Message-ID: <20200803070547.GA24480@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_030551_451987_3037F4BC 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 55e32c54bbd5741cad462c9ee00c453c72fa74b9:

  fscrypt: don't load ->i_crypt_info before it's known to be valid (2020-07-30 14:21:50 -0700)

----------------------------------------------------------------

This release, we add support for inline encryption via the blk-crypto
framework which was added in 5.8.  Now when an ext4 or f2fs filesystem
is mounted with '-o inlinecrypt', the contents of encrypted files will
be encrypted/decrypted via blk-crypto, instead of directly using the
crypto API.  This model allows taking advantage of the inline encryption
hardware that is integrated into the UFS or eMMC host controllers on
most mobile SoCs.  Note that this is just an alternate implementation;
the ciphertext written to disk stays the same.

(This pull request does *not* include support for direct I/O on
encrypted files, which blk-crypto makes possible, since that part is
still being discussed.)

Besides the above feature update, there are also a few fixes and
cleanups, e.g. strengthening some memory barriers that may be too weak.

All these patches have been in linux-next with no reported issues.  I've
also tested them with the fscrypt xfstests, as usual.  It's also been
tested that the inline encryption support works with the support for
Qualcomm and Mediatek inline encryption hardware that will be in the
scsi pull request for 5.9.  Also, several SoC vendors are already using
a previous, functionally equivalent version of these patches.

----------------------------------------------------------------
Eric Biggers (9):
      ext4: add inline encryption support
      fscrypt: add comments that describe the HKDF info strings
      fscrypt: rename FS_KEY_DERIVATION_NONCE_SIZE
      fscrypt: restrict IV_INO_LBLK_* to AES-256-XTS
      fscrypt: switch fscrypt_do_sha256() to use the SHA-256 library
      fscrypt: use smp_load_acquire() for fscrypt_prepared_key
      fscrypt: use smp_load_acquire() for ->s_master_keys
      fscrypt: use smp_load_acquire() for ->i_crypt_info
      fscrypt: don't load ->i_crypt_info before it's known to be valid

Satya Tangirala (4):
      fs: introduce SB_INLINECRYPT
      fscrypt: add inline encryption support
      f2fs: add inline encryption support
      fscrypt: document inline encryption support

 Documentation/admin-guide/ext4.rst    |   7 +
 Documentation/filesystems/f2fs.rst    |   7 +
 Documentation/filesystems/fscrypt.rst |  25 ++-
 fs/buffer.c                           |   7 +-
 fs/crypto/Kconfig                     |   8 +-
 fs/crypto/Makefile                    |   1 +
 fs/crypto/bio.c                       |  51 +++++
 fs/crypto/crypto.c                    |   4 +-
 fs/crypto/fname.c                     |  45 ++---
 fs/crypto/fscrypt_private.h           | 144 ++++++++++---
 fs/crypto/inline_crypt.c              | 367 ++++++++++++++++++++++++++++++++++
 fs/crypto/keyring.c                   |  21 +-
 fs/crypto/keysetup.c                  |  91 ++++++---
 fs/crypto/keysetup_v1.c               |  20 +-
 fs/crypto/policy.c                    |  20 +-
 fs/ext4/inode.c                       |   4 +-
 fs/ext4/page-io.c                     |   6 +-
 fs/ext4/readpage.c                    |  11 +-
 fs/ext4/super.c                       |  12 ++
 fs/f2fs/compress.c                    |   2 +-
 fs/f2fs/data.c                        |  79 ++++++--
 fs/f2fs/super.c                       |  35 ++++
 include/linux/fs.h                    |   1 +
 include/linux/fscrypt.h               | 111 +++++++++-
 24 files changed, 940 insertions(+), 139 deletions(-)
 create mode 100644 fs/crypto/inline_crypt.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
