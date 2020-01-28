Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6B1C3F68F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 23:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402062087F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 23:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJEv4N+/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="GDX/C/OS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402062087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HASUzQ58h86V/KHyzDbvLhUEJBStXKsAzPdVy+5YKLE=; b=iJEv4N+/N6eHFG
	Sw3kY/R38W5hfcrKAjUn82ZwdHaglAmYq1sXl6paRFhd2VGoZiJWhYXpG7rtzWhUgsjHdNdXnkCcy
	9mAFEW5uQCrjo5zYqDTP0HYnOPYDBD+m8w4MXcLYGDxFHIkab4koQ9TjJtzs6DIO3XwAN6gAOX2rj
	vC/UFUBSTG1Bn1NpQNO4RIAyP0ITUkXNkW1gFEjA9b/yCaO218aNYdcGpLDpPDop0vjet29H88RPQ
	RnwJrGFa+oGrm3u3O91zqeHFhZeDp4opcnefL4wVEjdXz4bzk9ZMZN9dNQch8ht/QjA72KWemc1wR
	C6sC5pBaTOPSU8G88TjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwZuH-00030R-Nu; Tue, 28 Jan 2020 23:04:29 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwZuC-0002yf-BM
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 23:04:25 +0000
Received: by mail-pj1-x104a.google.com with SMTP id m61so2521960pjb.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2020 15:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=4wthl79HWP0T/o9zvBpWHIzpNLIBPxOPJx5PymHVG6Q=;
 b=GDX/C/OSuHuMeBJ1ahgPZL1VVGEdTJy/yP3LL9+inyqMwkRHK7dFp/+xG9iD5I3Wye
 R8FtJLFJ0eV70EjeSjg0U5qKk8bSzCa1QbG+lL0sub2v+jXGlXmnUJiDQTieWdmoJRZV
 aEnhZYhnDWVpjcVBM8BKswB2TVHRR/Zw2QhMO3zPPcBHrLgbdTdvsKjAa5dI1XUBjCHL
 spmbAHxV0hBMSAK/CaKKdUNumnezHwIPqNO1a9JQZ9rUo5YhVBh1WYO9WyquZ7bULg08
 P/qSWjuqXIzcKanpjDIRuMerEfswNe+d9wkqs/hJKIaTCfLoyJCRVC1TZ7x8bQnI9TV9
 rJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=4wthl79HWP0T/o9zvBpWHIzpNLIBPxOPJx5PymHVG6Q=;
 b=db6kpY2nKkqreNU1wXcAeCeyqS3GeY9kAWAEpRAT4Th6RyKMWtwL8hY5zwzUp+PW7K
 7qWp6drBm8KAG5pIVVZUz0gXNpyL8ISdnQofVyjhOTgXkYvglzd67UDlYEwbEqQaM4T6
 tQYlbMvHEWSHJWKyU1NTpQeHUAdNkY62oKZLanTn28tS3S7mNpe2Q0gXNuAyiKFAkzTs
 yyB+T8WXdzJJ8g8Jhcax33cDuCwN4rmlKYLYRruruv8+hpKu29Kxu5hJ6i+J/fzMtOtH
 q+ThzBfXISXoDrnokNVWhF2/SatEi0Zb8R5ULe2m4gTfP+J/78Vi37OkYAjaZDdEfyca
 tFmg==
X-Gm-Message-State: APjAAAW4t7AUXACOZ5slaM+C0RpgFuHq6TEKHO8rOPlxzvHg4sU8dHUB
 zUuyoZPKfcoZ8q+W8e7xlgyBVGjCyTE=
X-Google-Smtp-Source: APXvYqw5NZo8NAG4OMkcKqlZwD1DRl7BGD/ZEL4QespRsfp8h2gjJpR5FGRTvo86dDcfrVlQ5mEeoeJD/MY=
X-Received: by 2002:a63:1c1d:: with SMTP id c29mr27636876pgc.14.1580252662083; 
 Tue, 28 Jan 2020 15:04:22 -0800 (PST)
Date: Tue, 28 Jan 2020 15:03:23 -0800
Message-Id: <20200128230328.183524-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v6 0/5] Support fof Casefolding and Encryption
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_150424_419543_2FC90FC6 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These patches are all on top of fscrypt's development branch

Ext4 and F2FS currently both support casefolding and encryption, but not at
the same time. These patches aim to rectify that.

I moved the identical casefolding dcache operations for ext4 and f2fs into
fs/unicode, as all filesystems using casefolded names will want them.

I've also adjust fscrypt to not set it's d_revalidate operation during it's
prepare lookup, instead having the calling filesystem set it up. This is
done to that the filesystem may have it's own dentry_operations.

For Ext4, since the hash for encrypted casefolded directory names cannot be
computed without the key, we need to store the hash on disk. We only do so
for encrypted and casefolded directories to avoid on disk format changes.
Previously encryption and casefolding could not be on the same filesystem,
and we're relaxing that requirement. F2fs is a bit more straightforward
since it already stores hashes on disk.

I've updated the related tools with just enough to enable the feature. I
still need to adjust ext4's fsck's, although without access to the keys,
neither fsck will be able to verify the hashes of casefolded and encrypted
names.

v6 changes:
Went back to using dentry_operations for casefolding. Provided standard
implementations in fs/unicode, avoiding extra allocation in d_hash op.
Moved fscrypt d_ops setting to be filesystem's responsibility to maintain
compatibility with casefolding and overlayfs if casefolding is not used
fixes some f2fs error handling

v4-5: patches submitted on fscrypt

v3 changes:
fscrypt patch only creates hash key if it will be needed.
Rebased on top of fscrypt branch, reconstified match functions in ext4/f2fs

v2 changes:
fscrypt moved to separate thread to rebase on fscrypt dev branch
addressed feedback, plus some minor fixes


Daniel Rosenberg (5):
  unicode: Add standard casefolded d_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/fname.c                            |   7 +-
 fs/crypto/fscrypt_private.h                  |   1 -
 fs/crypto/hooks.c                            |   1 -
 fs/ext4/dir.c                                | 102 +++---
 fs/ext4/ext4.h                               |  86 +++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 ++-
 fs/ext4/namei.c                              | 325 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 151 +++++----
 fs/f2fs/f2fs.h                               |  16 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/namei.c                              |   1 +
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |   8 +-
 fs/ubifs/dir.c                               |  18 +
 fs/unicode/utf8-core.c                       |  61 ++++
 include/linux/fs.h                           |  10 +
 include/linux/fscrypt.h                      |   6 +-
 include/linux/unicode.h                      |  17 +
 23 files changed, 644 insertions(+), 337 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
