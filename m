Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD4AC388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 22:10:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5336A20731
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 22:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nADxNOmb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8mMgEQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5336A20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8C/IDyNc+Ua/hU1gCf2bzHcKVevTKeVechtdd8EiCxA=; b=nADxNOmbmi0ZNBRKCbPw7j308n
	cnm00U8vbH6ljm75bX7exAZSV6aXV5P3xjn+zjN5HfJdHdzV+/6sBn7skvzjUt0Rmw5tddeK9GF2h
	Y0cG8Tme3XPhFz8mzJ2V47YKeohEaNXN0+fJnmCU+8X2Fs9Qy2hWQwccWp4XiEr33XiRjpTPEAe4+
	9YH/0YuhvdQ1Nz8NEkFmq4Eowim1rNTKNLlLHnlB3KwId1Ihhb4MrIaKhZlluOdfVWH64ORhOSDUO
	EkfD+6qYJdsnn2ka05SAfsC0EGZCvD0ufYg5x83917FggpKAqT1EYtOVfp1n5LCWi9iolAn8IK0Ph
	6KGbSbKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYz4Q-0007MV-AQ; Sat, 31 Oct 2020 22:09:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYz4M-0007KX-Hg
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 22:09:55 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96A282072C;
 Sat, 31 Oct 2020 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604182192;
 bh=S03k1YGXaJQvf3NAsk0rAuPNkYHGojNJSpqWlOKkY6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=a8mMgEQtpZ3jNyytBfAA07mZtl+9vbm6YLLv+FzNDnWsLRWKesdnQyD8DGDQ9NlKo
 NBZjY049c5RkEWrHQHTQiUYaXvEuh5HHjNvlFxn20MOKcGS2hg5wFkYa2cWehnnO0k
 uwKX3GPe/Eyo28ZG698zXqwWlaIL66HoIPdZkgxU=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 0/5] backport some more fscrypt fixes to 4.19
Date: Sat, 31 Oct 2020 15:05:48 -0700
Message-Id: <20201031220553.1085782-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_180954_692930_03D85D6C 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Backport some fscrypt fixes from upstream 5.2 to 4.19-stable.

This is needed to get 'kvm-xfstests -c ext4,f2fs,ubifs -g encrypt' to
fully pass on 4.19-stable.  Before, generic/397 and generic/429 failed
on UBIFS due to missing "fscrypt: fix race where ->lookup() marks
plaintext dentry as ciphertext".

This also fixes some bugs that aren't yet covered by the xfstests.
E.g., "fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing
directory" fixes a bug that caused real-world problems on Chrome OS.

Some relatively straightforward adjustments were needed to the patches,
mainly due to the refactoring of fscrypt.h that was done in 5.1.

Eric Biggers (5):
  fscrypt: clean up and improve dentry revalidation
  fscrypt: fix race allowing rename() and link() of ciphertext dentries
  fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing directory
  fscrypt: only set dentry_operations on ciphertext dentries
  fscrypt: fix race where ->lookup() marks plaintext dentry as
    ciphertext

 fs/crypto/crypto.c              | 58 +++++++++++++------------
 fs/crypto/fname.c               |  1 +
 fs/crypto/hooks.c               | 28 ++++++++----
 fs/dcache.c                     | 15 +++++++
 fs/ext4/ext4.h                  | 62 ++++++++++++++++++++-------
 fs/ext4/namei.c                 | 76 ++++++++++++++++++++++-----------
 fs/f2fs/namei.c                 | 17 +++++---
 fs/ubifs/dir.c                  |  8 ++--
 include/linux/dcache.h          |  2 +-
 include/linux/fscrypt.h         | 30 +++++++------
 include/linux/fscrypt_notsupp.h |  9 ++--
 include/linux/fscrypt_supp.h    |  6 ++-
 12 files changed, 205 insertions(+), 107 deletions(-)

-- 
2.29.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
