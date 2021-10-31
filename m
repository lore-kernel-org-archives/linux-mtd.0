Return-Path: <SRS0=3Cmf=PT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423D0C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Oct 2021 23:16:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F253D60F3A
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Oct 2021 23:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F253D60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k1QUUjRYuQUpazZAl90Rma/Dc3QqJEdCCbcdZco0XBg=; b=vxVIYp6cNg+dPD
	USChzV5y+yBVCfPjvoO39/cjJ89JAPGwdWUh2Rx8F5vDSquNZMecE5rJDe6XrDnr7joqOqM+3bGka
	nO9+2MREEgoNRxDBscaYFiwC2NoRCAcJbGoyz5qKFIixHmouSC/DuHX5mLTxKIrjUMxXljUnbC+VK
	dKisVabQJ7kzTB165piaBvALtz0vwVwjOwvD2EHEC6DKT8d/U4jSBiqjckMuIB7qJN15rQ6dgHfnH
	8wRLpVrE0oqjTAZXN2wPGgv8toZ7NLyPxVk+YBZ5yJ3psLRzOd3gzR802IzjCIVKbDpwK/XQZizdL
	0kLTwcSNy7YvsasA3lNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhK2f-00Etla-IN; Sun, 31 Oct 2021 23:15:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhK2c-00EtkY-0a
 for linux-mtd@lists.infradead.org; Sun, 31 Oct 2021 23:15:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6632F60E98;
 Sun, 31 Oct 2021 23:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635722104;
 bh=suxkNGmue9aghjYNtvFMsxbmCggQU/mTEGgyuyM6yEo=;
 h=Date:From:To:Cc:Subject:From;
 b=fpGO32U+MsTNZbHohxpPwvg1Uq/nPjwDaBlA9NFDdb8JtWAGK6sTrbB+lu3yBYkyF
 C912kGL8/qX6nG76cT0WwM6WPK707JMNhvnTL1WWkGh2M5LK7Tqxpqo/tLnDABJkLt
 KquLGV9Z/3RgrdBlXFR2D/SFGhuDx+DdXnJHPEKL4noPzfIGweLhwzdWt36jzXblFS
 M9bf+mET+ZIt9lAOOjbeyet8ziREuNph58SvdfojegO9FZiaaJKNICUKkzQspjqpEz
 Ig8eS55+3Rs5M0buwjx5/KDMVkSANT3fdnOoTLsW761BJyErEqIFMlRRFT2g6yS1Yk
 gJbeRw++6EQtQ==
Date: Sun, 31 Oct 2021 16:15:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [GIT PULL] fscrypt updates for 5.16
Message-ID: <YX8jdp73zUDwlB5E@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_161506_105863_95BB045C 
X-CRM114-Status: UNSURE (   6.99  )
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

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to b7e072f9b77f4c516df96e0c22ec09f8b2e76ba1:

  fscrypt: improve a few comments (2021-10-25 19:11:50 -0700)

----------------------------------------------------------------

Some cleanups for fs/crypto/:

- Allow 256-bit master keys with AES-256-XTS

- Improve documentation and comments

- Remove unneeded field fscrypt_operations::max_namelen

----------------------------------------------------------------
Eric Biggers (5):
      fscrypt: remove fscrypt_operations::max_namelen
      fscrypt: clean up comments in bio.c
      fscrypt: improve documentation for inline encryption
      fscrypt: allow 256-bit master keys with AES-256-XTS
      fscrypt: improve a few comments

 Documentation/block/inline-encryption.rst |  2 +
 Documentation/filesystems/fscrypt.rst     | 83 +++++++++++++++++++++++--------
 fs/crypto/bio.c                           | 32 ++++++------
 fs/crypto/fname.c                         |  3 +-
 fs/crypto/fscrypt_private.h               | 16 ++++--
 fs/crypto/hkdf.c                          | 11 ++--
 fs/crypto/keysetup.c                      | 62 +++++++++++++++++------
 fs/ext4/super.c                           |  1 -
 fs/f2fs/super.c                           |  1 -
 fs/ubifs/crypto.c                         |  1 -
 include/linux/fscrypt.h                   |  3 --
 11 files changed, 150 insertions(+), 65 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
