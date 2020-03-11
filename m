Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8A5C2BAEE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 19:48:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB7E20737
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 19:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYQFv9aq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v/jab1Mt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB7E20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Vfm20592C99y8Wjqyu+0ECKOrZTkRI/kkKmdd0vbUg=; b=BYQFv9aqrvaQKs
	1lVSiweEwhe205+dNVINcb0H+omKwS2ZjMVInTfjqm632hoUOF78zxOA51r1rPhCKhiyMOcGCWqkN
	zX8hO6uudT29Lrj8XgtJ6r1IgDdSK3HVDD9EuaJn9WVE6RUPbzTmZ/rh0dF1vhhqRC6w7Z86NyH+F
	92BO8hLjRQ0IypeHLyyCpS0vR8CpSIifGpZujXc/BLI5GRNpzaBSDcC9ntsPZogMxXlFHJMJAEyR7
	tSwCOcq4ZCVRAvvjYVXxwLK1G3Y9m1SHTrEhZ2FGP4AvNR2ThTlbOkiBwNrRRCsmFlc76UBpDji/Y
	Ngba0oLMyJ2hNwClplpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC7LR-0004uF-Tv; Wed, 11 Mar 2020 19:48:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC7LP-0004tb-4K
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 19:48:44 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F6A020691;
 Wed, 11 Mar 2020 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583956122;
 bh=NTCCQBA/qngUM9vruihaGQpLvV8cowQXBnlryjh7duc=;
 h=Date:From:To:Cc:Subject:From;
 b=v/jab1Mtz7GdBG9uHSDV6k2H9A5ugStqAz7qXsT5oSvLW0R8a6a71HOmgfCea5clU
 G66Us11UI+4tNO3Dj0FH7tIcAgD6G5vzcw6dOTDobm5SYL6M1oFXxg7KIYICRZtMGR
 9CaWX6LC7nIdux3wMMCMyiTs0f5kOJR5zRFuyh0M=
Date: Wed, 11 Mar 2020 12:48:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] fscrypt fix for v5.6-rc6
Message-ID: <20200311194839.GB41227@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_124843_191843_005100AB 
X-CRM114-Status: UNSURE (   9.73  )
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

for you to fetch changes up to 2b4eae95c7361e0a147b838715c8baa1380a428f:

  fscrypt: don't evict dirty inodes after removing key (2020-03-07 18:43:07 -0800)

----------------------------------------------------------------

Fix a bug where if userspace is writing to encrypted files while the
FS_IOC_REMOVE_ENCRYPTION_KEY ioctl (introduced in v5.4) is running,
dirty inodes could be evicted, causing writes could be lost or the
filesystem to hang due to a use-after-free.  This was encountered during
real-world use, not just theoretical.

Tested with the existing fscrypt xfstests, and with a new xfstest I
wrote to reproduce this bug.  This fix does expose an existing bug with
'-o lazytime' that Ted is working on fixing, but this fscrypt fix is
more critical and is needed anyway regardless of the lazytime fix.

----------------------------------------------------------------
Eric Biggers (1):
      fscrypt: don't evict dirty inodes after removing key

 fs/crypto/keysetup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
