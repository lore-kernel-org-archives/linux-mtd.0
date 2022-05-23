Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09247C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 07:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dGGN82eSEIEQKqyvtc50DU59gxJiXHLjBFySvPBSp8s=; b=GqiVUqtAsTR4Me
	bJtTZosz/73DaH/JB5IQr9KltmNGlsEI5gzJXBNRU4MwQmskH3ir098f3SZPu4Dl6mGXY3T3jRt4i
	qg//u5DtYOzAEk1Qd7jt9vUSIxrH2BtaoUEsG1/ayndZ9J1kGAn5tAgp+jxzyEYGdqOC+L8ugN25X
	zKRJbDY9NQTMYXXmzTlcGvV758gE+EdhupI/QR95pEqSlpjDsG6QIIb/O4uwHC4X7mD0YckER+pvY
	2WpaoW6HRjr91EDy72wO3ZaJX16X455K64v7fCQCxPlSGPG77Uq0HYhsVjsBGjE0ahIhtm2G6M+02
	RzZ6CO51RLeyPDzw1d0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt2se-002CRO-QZ; Mon, 23 May 2022 07:53:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2nA-002A7b-U3
 for linux-mtd@bombadil.infradead.org; Mon, 23 May 2022 07:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=R+zFfjC0l/X4IkbiXrFS14R2DRtCxcCnKuHqkaW19Xc=; b=IbHi47QjQtuJRx+QLuCqVgc0qf
 5V+RBS7tvArraBQ8gNjddNKtrueR8OFl3mDZqseLKMFVMzhHhHwSkH0jmcf6iX81z/yKbL8eO8xtX
 8wQzsCQy5wZhk3xKxGwBNtt/c6k3e/aZHoGwGQmH4KqAw2SLj2BTRrUwSNnTUac4zdx/zw2Vvsx8l
 +SlVe4RgmDmtdJlQ2LlHFHB6flO0eZNuA2EsZlatrrhQP/5D9Z3Wefw6F//dszLYou6l9pCcSYZTg
 5d/EU8J8bnsm/izi1ROnik5YECQ7mGcOX6NE6fW4jGODRUlRAYnpHPIoH/iY8BAcwP2hu7/MmIaul
 UjXXY3qg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2BW-000vVh-1V
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 07:09:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C161D611BB;
 Mon, 23 May 2022 07:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4775C385A9;
 Mon, 23 May 2022 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653289673;
 bh=hdwEg4ZhM324vxQXS0bV+GABy7LdsT+hi9juPKa4LYM=;
 h=Date:From:To:Cc:Subject:From;
 b=Hv1ZewV5rrt82CTBH3ka/CyAsOJFk2s7vSWR+pYA5dTCAr3bgcPvRT+ysVO4Y3wqm
 sPAznzO3uOWGDrxGeH0y34f2P0RwqZRPfuoriNxhfbmLFAioSzIRBPb9Ug//48eukM
 YgQvVSqHWznxnJONdWqSGk9Pza3YnxcTxOa5DX3ID5Ke2zHQq9Qha3RiFUCAqGoaI1
 w78SHOPmTRb2000Gbqj5LaM6h8oAsc5Drdl+k4+PfYj4vrVTMxJMM36NEmVRgEKuFu
 EpPlgFj+KX+U0lJOBbq/cbS4qPbzfD2PABa1IOY4GZ0Vvxf6k80y7GjEa2YIFj20iw
 wi6Xf9R1rsyrQ==
Date: Mon, 23 May 2022 00:07:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [GIT PULL] fscrypt updates for 5.19
Message-ID: <Yosyx2FYZOIOWs9g@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_080858_595600_46BDD7E4 
X-CRM114-Status: GOOD (  10.17  )
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

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 218d921b581eadf312c8ef0e09113b111f104eeb:

  fscrypt: add new helper functions for test_dummy_encryption (2022-05-09 16:18:54 -0700)

----------------------------------------------------------------

Some cleanups for fs/crypto/:

- Split up the misleadingly-named FS_CRYPTO_BLOCK_SIZE constant.

- Consistently report the encryption implementation that is being used.

- Add helper functions for the test_dummy_encryption mount option that
  work properly with the new mount API.  ext4 and f2fs will use these.

----------------------------------------------------------------
Eric Biggers (4):
      fscrypt: split up FS_CRYPTO_BLOCK_SIZE
      fscrypt: log when starting to use inline encryption
      fscrypt: factor out fscrypt_policy_to_key_spec()
      fscrypt: add new helper functions for test_dummy_encryption

 fs/crypto/crypto.c          |  10 ++--
 fs/crypto/fname.c           |  11 +++-
 fs/crypto/fscrypt_private.h |  10 +++-
 fs/crypto/inline_crypt.c    |  33 ++++++++++-
 fs/crypto/keyring.c         |  64 +++++++++++++++++----
 fs/crypto/keysetup.c        |  22 ++------
 fs/crypto/policy.c          | 132 ++++++++++++++++++++++++++------------------
 fs/ubifs/ubifs.h            |   2 +-
 include/linux/fscrypt.h     |  51 ++++++++++++++++-
 9 files changed, 238 insertions(+), 97 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
