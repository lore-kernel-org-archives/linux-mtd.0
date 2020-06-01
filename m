Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCAC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126252074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pe/vqbIL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVHaz8NK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 126252074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cm7z4XeWDYIs1Apd4Wgop+TegPmJvnTIC/+ysCEO2Hw=; b=pe/vqbIL1femgd
	KQguxb7jrjkUPtGNb6LjIAQSSgU8yC7Xh/9e6xfv+K+IlLe1x+rDDXPhpGDsCrR4/sDh1zIYUK3df
	FqE2vYMtETYHTz0bACV+L0/oSWy9ZDigHj/BBm7GJC+tpq+4NgPDKhDO5v5MtAZSVl5EqzkIMuPjq
	15zWUi0tHT0QVqsx0JFfCNi3xzRepn0EaadkerB9InAMrk7iJHERazrDn2RD6mcAFz2nI77k5L/QL
	UaNJPJWv23yiRiItsD0Z9opTpJVTab9cFYeOpnZbNSpar5uSPG9fCGGfuXZWbRLxY3btfL4No2U5G
	EFJ7EtSaYzfWVt5t/1pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfdwd-0004ji-38; Mon, 01 Jun 2020 06:29:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfdwW-0004jJ-3v
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 06:29:05 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 984C62074B;
 Mon,  1 Jun 2020 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590992942;
 bh=1+HgUI0i7fD04WdwIoS+2wnOjK8xL00OVCgY/EpDx+k=;
 h=Date:From:To:Cc:Subject:From;
 b=MVHaz8NKfknh3A0lNcT3nJFyTOEe5L8m03Pcsrk9fJegee57FJh4GsxGwfBuXsCt7
 EEKaPXfr+/SBUG57z7bDRJTyN066lYEVel0r9o+D6IPFtwiHAcxXa3ETpYnJ1/RY+O
 EAFX2wU0xM9B3cxEdLcx07R/QyByhcXKANim49yM=
Date: Sun, 31 May 2020 23:28:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt updates for 5.8
Message-ID: <20200601062848.GA11054@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_232904_179151_3368B4B3 
X-CRM114-Status: GOOD (  10.92  )
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

The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to e3b1078bedd323df343894a27eb3b3c34944dfd1:

  fscrypt: add support for IV_INO_LBLK_32 policies (2020-05-19 09:34:18 -0700)

----------------------------------------------------------------

- Add the IV_INO_LBLK_32 encryption policy flag which modifies the
  encryption to be optimized for eMMC inline encryption hardware.

- Make the test_dummy_encryption mount option for ext4 and f2fs support
  v2 encryption policies.

- Fix kerneldoc warnings and some coding style inconsistencies.

There will be merge conflicts with the ext4 and f2fs trees due to the
test_dummy_encryption change, but the resolutions are straightforward.

----------------------------------------------------------------
Eric Biggers (8):
      fscrypt: fix all kerneldoc warnings
      fscrypt: name all function parameters
      fscrypt: remove unnecessary extern keywords
      linux/parser.h: add include guards
      fscrypt: add fscrypt_add_test_dummy_key()
      fscrypt: support test_dummy_encryption=v2
      fscrypt: make test_dummy_encryption use v2 by default
      fscrypt: add support for IV_INO_LBLK_32 policies

 Documentation/filesystems/f2fs.rst    |   6 +-
 Documentation/filesystems/fscrypt.rst |  33 +++++-
 fs/crypto/crypto.c                    |  15 ++-
 fs/crypto/fname.c                     |  52 ++++++---
 fs/crypto/fscrypt_private.h           | 111 +++++++++---------
 fs/crypto/hooks.c                     |   4 +-
 fs/crypto/keyring.c                   | 122 ++++++++++++-------
 fs/crypto/keysetup.c                  | 109 ++++++++++++-----
 fs/crypto/policy.c                    | 195 ++++++++++++++++++++++++++++---
 fs/ext4/ext4.h                        |   7 +-
 fs/ext4/super.c                       |  68 ++++++++---
 fs/ext4/sysfs.c                       |   2 +
 fs/f2fs/f2fs.h                        |   4 +-
 fs/f2fs/super.c                       |  85 ++++++++++----
 fs/f2fs/sysfs.c                       |   4 +
 include/linux/fscrypt.h               | 214 ++++++++++++++++++++--------------
 include/linux/parser.h                |   5 +-
 include/uapi/linux/fscrypt.h          |   3 +-
 18 files changed, 737 insertions(+), 302 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
