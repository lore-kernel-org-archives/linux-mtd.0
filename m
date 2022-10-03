Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k90PI5PYxUedWvqfH7+BQe4v9xM+f/j9qw+F+N35GnY=; b=ef/CdNfIvyHel7
	63b7G5Q656MwtmP6Z4erwteMRB26pRGjAMJnFWEQIwp9iFS0TaNg6gW/sL5Kx49ImPyAog4Spi/y/
	x9tbgzblf+F6r+jwHfXYssQy6OKZG5aBHPEN6Hzb5C6Nz7Mrwgi63zMXL6JMQeyIcV89giqK+N6TS
	aMdjvEHzwiyIgMrE1g9xDIt3fTj1g/JLk/UyX5mvy/3VdforOImTYQvscpquPnUFXNb3g4jZUVJaq
	RwK5irf5ti14/URVxtBoKTX91NtRH/9k9NvgWKcFLbz3TBiEPboCHdMfio7Na0EzV+AdCzJDIJbL8
	2Vj8Sr1GVLRlZJS5HzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBh2-003a7h-Ar; Mon, 03 Oct 2022 03:00:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBgx-003a3G-Fj
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 03:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 01C22CE0A4C;
	Mon,  3 Oct 2022 03:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D313FC433C1;
	Mon,  3 Oct 2022 03:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664766005;
	bh=JYBkVcaOXXe8vI72bVILJ80jmdMXI/PWcJhDdaOi1eo=;
	h=Date:From:To:Cc:Subject:From;
	b=Jf7WrTz0W2FFkAao26q5gpx54IiqqroOtfgzWpihbzU7Sq4Ta6O1quMFAwmrRyIJj
	 7cjy6UwRwYaU/s4xNs06a8Bgoy0YgBC7oRpvR57AtYAhifsSmOisRXC/WDND8ahLCD
	 DgF/CImCdGe0u7BATfHZ44SZOzj6V/J+Ot165m1K9dLdeIvWC2++wm8Vx+KkmP67UH
	 Pchqhs/MIGYE6Uxe8C0KWfeXi5O/rQ7KUVYW4G5/kdo0ZI/SkDKNQVEoGdHb5D7eYt
	 krVNBQc5Q5o6BNX9gOvyQzJUrQpps65LW/A1kUXqnk+Fo4wtwPN0u+aJFkjDXv2B2j
	 Ccx4+R6MJsswA==
Date: Sun, 2 Oct 2022 20:00:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [GIT PULL] fscrypt updates for 6.1
Message-ID: <YzpQMx1FiZp/PsM3@quark>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_200027_752082_C5EFFAA4 
X-CRM114-Status: GOOD (  11.00  )
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

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 0e91fc1e0f5c70ce575451103ec66c2ec21f1a6e:

  fscrypt: work on block_devices instead of request_queues (2022-09-21 20:33:06 -0700)

----------------------------------------------------------------

This release contains some implementation changes, but no new features:

- Rework the implementation of the fscrypt filesystem-level keyring to
  not be as tightly coupled to the keyrings subsystem.  This resolves
  several issues.

- Eliminate most direct uses of struct request_queue from fs/crypto/,
  since struct request_queue is considered to be a block layer
  implementation detail.

- Stop using the PG_error flag to track decryption failures.  This is a
  prerequisite for freeing up PG_error for other uses.

----------------------------------------------------------------
Christoph Hellwig (1):
      fscrypt: work on block_devices instead of request_queues

Eric Biggers (4):
      fscrypt: remove fscrypt_set_test_dummy_encryption()
      fscrypt: stop using PG_error to track error status
      fscrypt: stop using keyrings subsystem for fscrypt_master_key
      fscrypt: stop holding extra request_queue references

 fs/crypto/bio.c             |  16 +-
 fs/crypto/fscrypt_private.h |  82 +++++---
 fs/crypto/hooks.c           |  10 +-
 fs/crypto/inline_crypt.c    | 147 +++++++------
 fs/crypto/keyring.c         | 495 ++++++++++++++++++++++++--------------------
 fs/crypto/keysetup.c        |  89 ++++----
 fs/crypto/keysetup_v1.c     |   4 +-
 fs/crypto/policy.c          |  21 +-
 fs/ext4/readpage.c          |  10 +-
 fs/f2fs/data.c              |  18 +-
 fs/f2fs/super.c             |  24 +--
 fs/super.c                  |   2 +-
 include/linux/fs.h          |   2 +-
 include/linux/fscrypt.h     |  32 ++-
 14 files changed, 495 insertions(+), 457 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
