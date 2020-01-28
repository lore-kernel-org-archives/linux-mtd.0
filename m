Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD88C33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 01:47:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE28214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 01:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbMGFc4P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqYd7QKX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE28214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NMT/WPtxS2THpnH65gv0UB7LECmRyvU3CB6ULJ+nSBg=; b=AbMGFc4P0Gc5gV
	SLP8YZlh9fnTUlcKbC0iSTe0ve0uvRpZ3+ZCNOGVwAo8nNVUjBCVP/4qCkb1qoaB+CEsWtUQvMRhK
	rIxcwxsx8Aa8Nji/jh7ASHNUPj/wlabsfsLztGtZTNo7TnhzbQL4+caPdJ5ani9xh8W0wWJtN/Y7D
	nPYjsZ2ILvWMVDcO9q0bp3dbaKusUA6Oi+UEyAwTgiXJgVwQpI4N3tg9hwZC3cv6RFtLhhWHKoo/j
	EvboixCwLHp4dOqIHJcpQ6+bmUL4D2JmhcYKEnI5IJn9RTbzPtHLCRXg2eqMNehJR7CLaKewYSAtL
	wqz3dfYjT+4LH2ARIzgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwFxz-0000En-Gc; Tue, 28 Jan 2020 01:46:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwFxw-0000EM-1L
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 01:46:58 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6233214AF;
 Tue, 28 Jan 2020 01:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580176015;
 bh=lr1TtkPAw46qDf+d4N/SnYvTgRxlT3N0rKG9IJ6qTbA=;
 h=Date:From:To:Cc:Subject:From;
 b=cqYd7QKXvUceC5PzgPSZ/bE2097stte3DG4D2oPME66YdL+7ulDNPgc2DupoZg8cb
 2xo7bClv8D0TskJO5zx3lNoQTU+xAk0kLYPI/Dn41ItM/+egz25uOG3zMUXG+lS7jX
 c/2mes651GtPNlOmgecueJBMSymiMQY8ZbJAHV1s=
Date: Mon, 27 Jan 2020 17:46:53 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt updates for 5.6
Message-ID: <20200128014653.GA960@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_174656_122392_92AFBA29 
X-CRM114-Status: GOOD (  11.54  )
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to edc440e3d27fb31e6f9663cf413fad97d714c060:

  fscrypt: improve format of no-key names (2020-01-22 14:50:03 -0800)

----------------------------------------------------------------

- Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
  provided via a keyring key.

- Prepare for the new dirhash method (SipHash of plaintext name) that
  will be used by directories that are both encrypted and casefolded.

- Switch to a new format for "no-key names" that prepares for the new
  dirhash method, and also fixes a longstanding bug where multiple
  filenames could map to the same no-key name.

- Allow the crypto algorithms used by fscrypt to be built as loadable
  modules when the fscrypt-capable filesystems are.

- Optimize fscrypt_zeroout_range().

- Various cleanups.

----------------------------------------------------------------
Daniel Rosenberg (3):
      fscrypt: don't allow v1 policies with casefolding
      fscrypt: derive dirhash key for casefolded directories
      fscrypt: improve format of no-key names

Eric Biggers (22):
      fscrypt: support passing a keyring key to FS_IOC_ADD_ENCRYPTION_KEY
      fscrypt: use crypto_skcipher_driver_name()
      fscrypt: verify that the crypto_skcipher has the correct ivsize
      fscrypt: constify struct fscrypt_hkdf parameter to fscrypt_hkdf_expand()
      fscrypt: constify inode parameter to filename encryption functions
      fscrypt: move fscrypt_d_revalidate() to fname.c
      fscrypt: introduce fscrypt_needs_contents_encryption()
      fscrypt: split up fscrypt_supported_policy() by policy version
      fscrypt: check for appropriate use of DIRECT_KEY flag earlier
      fscrypt: move fscrypt_valid_enc_modes() to policy.c
      fscrypt: remove fscrypt_is_direct_key_policy()
      fscrypt: don't check for ENOKEY from fscrypt_get_encryption_info()
      fscrypt: include <linux/ioctl.h> in UAPI header
      fscrypt: remove redundant bi_status check
      fscrypt: optimize fscrypt_zeroout_range()
      fscrypt: document gfp_flags for bounce page allocation
      ubifs: use IS_ENCRYPTED() instead of ubifs_crypt_is_encrypted()
      fscrypt: don't print name of busy file when removing key
      fscrypt: add "fscrypt_" prefix to fname_encrypt()
      fscrypt: clarify what is meant by a per-file key
      ubifs: don't trigger assertion on invalid no-key filename
      ubifs: allow both hash and disk name to be provided in no-key names

Herbert Xu (1):
      fscrypt: Allow modular crypto algorithms

 Documentation/filesystems/fscrypt.rst |  75 ++++++--
 fs/crypto/Kconfig                     |  22 ++-
 fs/crypto/bio.c                       | 114 ++++++++----
 fs/crypto/crypto.c                    |  57 +-----
 fs/crypto/fname.c                     | 316 +++++++++++++++++++++++++++-------
 fs/crypto/fscrypt_private.h           |  58 +++----
 fs/crypto/hkdf.c                      |   2 +-
 fs/crypto/hooks.c                     |  47 ++++-
 fs/crypto/keyring.c                   | 147 +++++++++++++---
 fs/crypto/keysetup.c                  | 102 ++++++-----
 fs/crypto/keysetup_v1.c               |  19 +-
 fs/crypto/policy.c                    | 170 ++++++++++++------
 fs/ext4/Kconfig                       |   1 +
 fs/ext4/dir.c                         |   2 +-
 fs/f2fs/Kconfig                       |   1 +
 fs/f2fs/dir.c                         |   2 +-
 fs/inode.c                            |   3 +-
 fs/ubifs/Kconfig                      |   1 +
 fs/ubifs/dir.c                        |  16 +-
 fs/ubifs/file.c                       |   4 +-
 fs/ubifs/journal.c                    |  10 +-
 fs/ubifs/key.h                        |   1 -
 fs/ubifs/ubifs.h                      |   7 -
 include/linux/fscrypt.h               | 122 +++++--------
 include/uapi/linux/fscrypt.h          |  14 +-
 25 files changed, 864 insertions(+), 449 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
