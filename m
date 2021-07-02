Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C13BC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 06:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E18B61413
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 06:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E18B61413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JhNqSVzWumdtFWXbcJgTUcBO1Z53dfbOX4G+UwzMCe8=; b=hZpQp9J8jjIHJv
	cjYn7mbrCuWgvwJZ3s+aqUmWbRdgHlSJ1AYTtDe8EdiXCvKeBjc2KZ3TW85Y95pVu6a9pKVlGq/dE
	OS9VBhcD5p4n+lCWIc0B0/luVk/tU7NbIMIhE+lxMCdT7bX+umn0gGoZIBszc4TM/E+c5gNX2MCTx
	lYM4nxoU44fI61l6HHzud0+Py4EfxQWknFpliFUr34N2KPnQl+XIlqy8/mLjuFR4a/txFjhbD96qm
	w4B7CCIeC5jCX5x/Hd0qSmD1k5AyPNs3E+jML7myd1y85AQyMo1FUrdvLiomvn+v28JXHyBUl1Dca
	44M676ouNaQ1bkzJetEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzD4k-002Iw8-0K; Fri, 02 Jul 2021 06:54:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzD4e-002Irb-02
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 06:54:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2A7A613F0;
 Fri,  2 Jul 2021 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208890;
 bh=2YEFNbCIRo9WHTdZ5XW0VKfk2fnVjJ1mVF7axmh20i4=;
 h=From:To:Cc:Subject:Date:From;
 b=hb2Z+thtoOA3Ut1D51UPw7NUY4/SDw+9ssqTVt7RSJrQ+PeUpckBpHqKThBKweN5k
 lbd26NukQBtGrzVQZR0VApGV+hAOe4pbrKCoHqnOFYlvvNHWI6lLZN1slkg9znK7QA
 PBWSIug3OcJx+ZYgHrfHDhJdMgqiEO97WuKXOGiLuCN5iUglvtfoBmTj4ieI5MLW3G
 tp1fPywkkq9ZrOOj+xHVwcAFrOPXsgTGtWc0z7yMxtSeDXSWq4rpTGKc1p0Bg2NawI
 OZWUn6F3LZrJuKBLEGWrDr3IwEyl6nIznqGrYnLPez8t9ykzve/FQxDyZEnZaiODQk
 aT+b5KyTtBu6Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH 0/5] fscrypt: report correct st_size for encrypted symlinks
Date: Thu,  1 Jul 2021 23:53:45 -0700
Message-Id: <20210702065350.209646-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_235452_090516_0D32D521 
X-CRM114-Status: UNSURE (   7.51  )
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

This series makes the stat() family of syscalls start reporting the
correct size for encrypted symlinks.

See patch 1 for a detailed explanation of the problem and solution.

Patch 1 adds a helper function that computes the correct size for an
encrypted symlink.  Patches 2-4 make the filesystems with fscrypt
support use it, and patch 5 updates the documentation.

This series applies to mainline commit 3dbdb38e2869.

Eric Biggers (5):
  fscrypt: add fscrypt_symlink_getattr() for computing st_size
  ext4: report correct st_size for encrypted symlinks
  f2fs: report correct st_size for encrypted symlinks
  ubifs: report correct st_size for encrypted symlinks
  fscrypt: remove mention of symlink st_size quirk from documentation

 Documentation/filesystems/fscrypt.rst |  5 ---
 fs/crypto/hooks.c                     | 44 +++++++++++++++++++++++++++
 fs/ext4/symlink.c                     | 12 +++++++-
 fs/f2fs/namei.c                       | 12 +++++++-
 fs/ubifs/file.c                       | 13 +++++++-
 include/linux/fscrypt.h               |  7 +++++
 6 files changed, 85 insertions(+), 8 deletions(-)


base-commit: 3dbdb38e286903ec220aaf1fb29a8d94297da246
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
