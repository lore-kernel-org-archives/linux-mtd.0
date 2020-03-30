Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0391AC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 16:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB4DF2073B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 16:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIMkL0Kv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/wdnXby"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB4DF2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qGenFQ2CBnwdzx5a0cMENz4TzqX/MVVJ3OhGJ4oF7X8=; b=bIMkL0KvRG8UL4
	eR32vregtvKCHjOI3dLE7HsdNRP2C54tqEONL6y2kZMEpzTrccuImz2tCV/Y2R19AgoR4LCrw7KR6
	ORD7kv2k7yo2pBATK/wn6SKqnKRN2IEySQ31Fzy4R9mjwBXTfR31WGY78g1KW+SNj6E0kUh2wQ9nV
	vHa7Us4ra4sdfz/lX/etz2BLDepxY4GyKpIVr7isJdSCq1wJZKLl7rO7Pf7G5rIcIyJxDZxi6ANHQ
	HHPsxdAdZsWhCr2/JbcN+iLXYVLPmSnk+rj5e1wQRR5DZfonVlLeUEEGvk8kFININhJR0OcI6plXF
	XTsuq030V9OqZcYMthxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIxfo-00034i-T0; Mon, 30 Mar 2020 16:54:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIxfl-00034J-R6
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 16:54:03 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BEF82072E;
 Mon, 30 Mar 2020 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585587240;
 bh=j/ppsQG0leh5vH+RTE+F7A3zvmhx3HDCWWopSVH2uDQ=;
 h=Date:From:To:Cc:Subject:From;
 b=M/wdnXbyHUTJv5ngtkxL30OP3/Kuj4H/2XLXZMGrhRmQHk4kBf8kUv4xIehJ2WNAi
 RYGO4xyaxQ0k6rkp1d/w6AkdnbU3iITZGeIBWDU4aBLtglq2LUaNtRCnK+4ktYJsaH
 Et7KNGgLmKcCwRBMlzckx0KzqoHRi1/YU5977jgo=
Date: Mon, 30 Mar 2020 09:53:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt updates for 5.7
Message-ID: <20200330165359.GA1895@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_095401_899373_0DB8EE22 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b:

  Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 861261f2a9cc488c845fc214d9035f7a11094591:

  ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE (2020-03-19 21:57:06 -0700)

----------------------------------------------------------------

Add an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves a file's
encryption nonce.  This makes it easier to write automated tests which
verify that fscrypt is doing the encryption correctly.

----------------------------------------------------------------
Eric Biggers (4):
      fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE ioctl
      ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
      f2fs: wire up FS_IOC_GET_ENCRYPTION_NONCE
      ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE

 Documentation/filesystems/fscrypt.rst | 11 +++++++++++
 fs/crypto/fscrypt_private.h           | 20 ++++++++++++++++++++
 fs/crypto/keysetup.c                  | 16 ++--------------
 fs/crypto/policy.c                    | 21 ++++++++++++++++++++-
 fs/ext4/ioctl.c                       |  6 ++++++
 fs/f2fs/file.c                        | 11 +++++++++++
 fs/ubifs/ioctl.c                      |  4 ++++
 include/linux/fscrypt.h               |  6 ++++++
 include/uapi/linux/fscrypt.h          |  1 +
 9 files changed, 81 insertions(+), 15 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
