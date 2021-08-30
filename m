Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD38C4320E
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 16:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBEF60F5E
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 16:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DBEF60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bw+BAErufXztbLYPFPOq/S/D1m8oxo9Od0ohu/SBc2M=; b=rbLw9Jy7cI7Ry9
	WoR7syRsDjvFDoic9u8xgoKftL1BCl65jMsKVjW2kXY7ANGd6Ec1VIX9Pvod7r9i3F/R8Lz6FSqQt
	SezEBThgOXbfmRFllKJky3exWqieqJxDxz7LI64v6+J0xR6q/D+Fs93xgZb6ld2C1zFqQyLwafk6S
	QbvpYCyT/qbg+GAUmhxLZSVpWkY+t7oSqriVZRfAQVZyhRO8CGQmPK5EugjppKgZBbyozQnSRwNoA
	ZmL1Tbn9Oefp7QWCEXeD0OUuyILXoqJqFz2lp8zCoH1ACKI08L/YMGKStFGYsCVbJMW9sUsvjcezb
	mcP1OyQjAlOOZ5sOXEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkRO-0006RT-VH; Mon, 30 Aug 2021 16:47:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkRL-0006QO-PK
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 16:47:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E01B160F5B;
 Mon, 30 Aug 2021 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630342039;
 bh=/ZbEAxvBW5ig7WPYzIG6ftbGUGoR7j4+CJT1CyKUAgE=;
 h=Date:From:To:Cc:Subject:From;
 b=pPqSREqxmcM2xCHL9kODFPILmxDGalIsKDmDe4jGEPsUozDmh+ruX/O/LmhFODtxt
 VIYvEwC66svykfXl46dTWe79Ys9le0rVp8NZQw7+j4+oAkLtIeqaBDdNerIXmXcYy2
 DL1OPRMOsyyZ2q+lnCE7aOMpGrtF1gToEk+RLJeAnoj92vfbhp0ATxlcesE0t4ukna
 UCMbyhEXzp4HW4Eeddf/2PerQXND5kpqT+osxua6VBfYadx7WWHEOBZqSUV18dXwku
 NgpMAbi14Mi2x+cqbjH7Q8Ol9FNwDAMOZ5wOFyU3Kl+CO6fH5m7N17PykROLOlsM3a
 try7iQyJi19Lg==
Date: Mon, 30 Aug 2021 09:47:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [GIT PULL] fscrypt updates for 5.15
Message-ID: <YS0LlXIhvZc4r5Vt@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_094719_884176_902D6E4D 
X-CRM114-Status: UNSURE (   6.54  )
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

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 38ef66b05cfa3560323344a0b3e09e583f1eb974:

  fscrypt: document struct fscrypt_operations (2021-07-28 21:40:36 -0700)

----------------------------------------------------------------

Some small fixes and cleanups for fs/crypto/:

- Fix ->getattr() for ext4, f2fs, and ubifs to report the correct
  st_size for encrypted symlinks.

- Use base64url instead of a custom Base64 variant.

- Document struct fscrypt_operations.

----------------------------------------------------------------
Eric Biggers (7):
      fscrypt: add fscrypt_symlink_getattr() for computing st_size
      ext4: report correct st_size for encrypted symlinks
      f2fs: report correct st_size for encrypted symlinks
      ubifs: report correct st_size for encrypted symlinks
      fscrypt: remove mention of symlink st_size quirk from documentation
      fscrypt: align Base64 encoding with RFC 4648 base64url
      fscrypt: document struct fscrypt_operations

 Documentation/filesystems/fscrypt.rst |  15 ++---
 fs/crypto/fname.c                     | 106 +++++++++++++++++++------------
 fs/crypto/hooks.c                     |  44 +++++++++++++
 fs/ext4/symlink.c                     |  12 +++-
 fs/f2fs/namei.c                       |  12 +++-
 fs/ubifs/file.c                       |  13 +++-
 include/linux/fscrypt.h               | 116 ++++++++++++++++++++++++++++++++--
 7 files changed, 260 insertions(+), 58 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
